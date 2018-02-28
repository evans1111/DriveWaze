# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
def seed_db(models, object_count)
	models_collection, *_ = models.transpose
	counts = models_collection
		.map{|model| model.count }

	tables_filled = counts
		.map{|count| count >= object_count}
		.all?
	if tables_filled
		puts "Tables are full of data: #{object_count}"
		models_collection.zip(counts).each do |m, c|
			puts "model: #{m}, count: #{c}"
		end
	end
	unless tables_filled
		puts "Creating models...#{models_collection}"
		models.each do |model, model_attrs, faker_attrs|
			object_count.times do
				data_values = faker_attrs.map do |faker_module, faker_method, args|
					faker_module.send(faker_method, *args)
				end
        obj = model.new(Hash[model_attrs.zip(data_values)])
        success = false
        until success
          begin
            success = obj.save!
          rescue ActiveRecord::RecordInvalid => err  # use the error message to set related obj
            model_name = err
              .message
              .split(' must exist')
              .first.split(' ')
              .last  # parse the message error to get the object that must exist
            attr_name = model_name.parameterize.underscore  # turn the model name into an attr
            dependency = model_name
              .singularize.classify.constantize.all.sample  # grab a random obj
            obj.send("#{attr_name}=", dependency)  # set the attr
            begin
              success = obj.save!
            rescue
              success = false
            end
          end # end of begin
        end  # end of unless sucess
        p obj
			end
		end
	end
end

object_count = 100
non_user_models = [
	[
		Spot,
		[
			:zip,
			:city,
			:street,
			:available,
      :description,
      :image,
      :price,
		],
		[
			[
				# zip
				Faker::Address,
				:zip,
				[],
			],
			[
				# city
				Faker::Address,
				:city,
				[],
			],
			[
				# street
				Faker::Address,
				:street_address,
				[],
			],
			[
				# available
				Faker::Boolean,
				:boolean,
				[],
			],
			[
				# description
				Faker::Hipster,
				:paragraph,
				[],
			],
			[
				# image
				Faker::Internet,
				:url,
				[],
			],
			[
				# price
				Faker::Commerce,
				:price,
				[],
			],
		],
	], # end of Spot
  [

      Availability,
      [
        :times,
      ],
			[
        [
          # times
          Faker::Number,
          :between,
          [0, 100, ],
        ],
      ],
  ], # end of Availability
  [

      Booking,
      [
        :in_use,
      ],
			[
        [
          # times
          Faker::Boolean,
          :boolean,
          [],
        ],
      ],
  ], # end of Availability
]

def seed_users(password, user_count)
	# users need unique emails
	# all have same password
	user_models = [
		[
			User,
			[
				:email,
        :name,
			],
			[
				[
					Faker::Internet,
					:email,
					[],
				],
				[
					Faker::Name,
					:name,
					[],
				],
			],
		],
	]

	models_collection, *_ = user_models.transpose
	counts = models_collection
		.map{|model| model.count }

	tables_filled = counts
		.map{|count| count >= user_count}
		.all?
	if tables_filled
		puts "Tables are full of data: #{user_count}"
		models_collection.zip(counts).each do |m, c|
			puts "model: #{m}, count: #{c}"
		end
	end
	unless tables_filled
		puts "Creating models...#{models_collection}"
		user_models.each do |model, model_attrs, faker_attrs|
      [:password, :password_confirmation].each do |attr|
        model_attrs << attr
      end
			user_count.times do |i|
				data_values = faker_attrs.map do |faker_module, faker_method, args|
					faker_module.send(:unique).send(faker_method)
				end
				# add password to attrs and values
        2.times do
          data_values << password
        end
				p model.create(Hash[model_attrs.zip(data_values)])
			end
		end
	end

	User.all.each do |user|
		puts "user email is '#{user.email}'"
		puts "password is '#{password}'"
	end
end

password = 'asdfasdf'
seed_users(password, 10)
seed_db(non_user_models, object_count)

puts "Running `rails db:seed` is idempotent. Running more than once will not add rows to the database past the set counts."
User.all.each do |user|
  puts "user email: #{user.email} user password: #{password}"
end
