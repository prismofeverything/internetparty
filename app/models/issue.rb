class Issue < ActiveRecord::Base
  belongs_to :constituency
  has_many :statements, :as => :target
  has_many :votes, :as => :target
end
