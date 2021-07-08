FactoryBot.define do
  factory :order do
    association :user, factory: :user
  end
end