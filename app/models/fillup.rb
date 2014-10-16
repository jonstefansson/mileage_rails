class Fillup < ActiveRecord::Base
  belongs_to :vehicle
  validates :odometer, :fill_date, :gallons, presence: true

end
