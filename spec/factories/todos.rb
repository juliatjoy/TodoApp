FactoryGirl.define do
  factory :todo do
    trait :active do
      status :active
    end

    trait :unpublished do
      status :unpublished
    end
  end
end
