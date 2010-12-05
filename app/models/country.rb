class Country < ActiveRecord::Base
  has_many :regions
  has_many :citizens
end
