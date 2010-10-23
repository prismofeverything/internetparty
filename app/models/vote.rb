class Vote < ActiveRecord::Base
  belongs_to :citizen
  belongs_to :target, :polymorphic => true
end
