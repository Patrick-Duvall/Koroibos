FactoryBot.define do
  factory :olympian do
    sequence :name {|n| "Olympian #{n}" }
    sequence :sex { |n| n % 2 == 0 ? "M" : "F"}
    sequence :age {|n| 10 + n}
    sequence :height {|n| 100 + n }
    sequence :weight { |n| 50 + n}
    sequence :team {|n| "Team #{n % 3}"}
  end
end
