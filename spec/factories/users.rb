# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::BossaNova.artist }
    password_digest 'MyPassword1234567890azazaza'
  end
end
