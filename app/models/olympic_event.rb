class OlympicEvent < ApplicationRecord
  belongs_to :olympian
  belongs_to :event
end
