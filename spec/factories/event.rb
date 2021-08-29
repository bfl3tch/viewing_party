FactoryBot.define do
  factory :event do
    title { Faker::Movie.title  }
    duration { Faker::Number.between(from: 115, to: 215) }
    day { Faker::Date.between(from: Date.today, to: 7.days.from_now) }
    start_time { Time.now.to_s }
  end
end
