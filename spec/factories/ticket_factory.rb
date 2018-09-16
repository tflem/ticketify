FactoryBot.define do
  factory :ticket do
    name { "Example ticket" }
    description { "An example ticket description" }
    user
  end
end

