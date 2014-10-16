class Vehicle < ActiveRecord::Base
  has_many :fillups, dependent: :destroy
end
