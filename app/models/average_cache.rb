class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Owner"
  belongs_to :rateable, :polymorphic => true
end
