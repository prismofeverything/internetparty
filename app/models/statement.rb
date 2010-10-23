class Statement < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :target, :polymorphic => true
  has_many :votes, :as => :target
end
