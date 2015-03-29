FactoryGirl.define do  factory :comment do
    body "MyText"
user nil
  end

  factory :questions do

    sequence(:title) { |n| "QuestionTitle#{n}" }
    sequence(:body) { |n| "QuestionBody#{n}" }
    user nil
  end

  factory :user do

  end
end