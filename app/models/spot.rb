class Spot < ApplicationRecord
  belongs_to :user
  has_many :availabilties
  paginates_per 5

  def filter_by_zipcode

  end
end
