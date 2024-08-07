require 'faker'
FactoryBot.define do
    factory :user_notification do
      action { Faker::Lorem.word }
      user_id { Faker::Number.between(from: 1, to: 1000) }
      user_email { Faker::Internet.email }
      task_id { Faker::Number.between(from: 1, to: 1000) }
      task_title { Faker::Lorem.sentence }
      task_description { Faker::Lorem.paragraph }
    end
  end