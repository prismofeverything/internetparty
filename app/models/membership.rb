class Membership < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :constituency
end
