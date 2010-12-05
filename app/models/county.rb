class County < ActiveRecord::Base
  belongs_to :region
  has_many :citizens
end
