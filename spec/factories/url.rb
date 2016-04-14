FactoryGirl.define do
  factory :url do
    original_url { Faker::Internet.url}
  end
end
