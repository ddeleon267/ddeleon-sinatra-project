class RoutineProduct < ActiveRecord::Base
  belongs_to :routine
  belongs_to :product
end
