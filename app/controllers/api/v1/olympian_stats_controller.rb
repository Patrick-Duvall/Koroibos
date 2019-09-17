class Api::V1::OlympianStatsController < ApplicationController
  def index
    retval = {olympian_stats: {
      total_competing_olympians: Olympian.count,
      average_age: Olympian.average(:age),
      average_weight: {
        unit: "kg",
        male_olympians: Olympian.male_average_weight,
        female_olympians: Olympian.female_average_weight,
      }
      }
    }
    render json: retval
  end
end

# {
#     "olympian_stats": {
#       "total_competing_olympians": 3120
#       "average_weight:" {
#         "unit": "kg",
#         "male_olympians": 75.4,
#         "female_olympians": 70.2
#       }
#       "average_age:" 26.2
#     }
#   }
