class Constituency < ActiveRecord::Base
  has_many :issues
  has_many :candidates
  has_many :memberships
  has_many :citizens, :through => :memberships
  has_many :statements, :as => :target
end
