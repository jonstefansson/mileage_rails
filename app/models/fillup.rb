class Fillup < ActiveRecord::Base
  belongs_to :vehicle
  validates :odometer, :fill_date, :gallons, presence: true

  attr_reader :mpg

  def calculate_mpg(previous_fillup=nil)
    @mpg = (odometer - previous_fillup.odometer) / gallons if previous_fillup
  end

end
