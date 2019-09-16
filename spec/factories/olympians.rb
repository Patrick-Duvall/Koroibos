FactoryBot.define do
  factory :olympian do
    sequence :name do |n| "Olympian #{n}" }
    sequence :sex { |n| n % 2 == 0 ? "M" : "F"}
    sequence :age {|n| n}
    sequence :height {|n| 100 + n }
    sequence :weight { |n| 50 + n}
    sequence :team {|n| "Team #{n % 3}"}
  end
end
