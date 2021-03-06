FactoryGirl.define do
  sequence(:email) { |n| "person#{n}@example.com" }

  factory :authorization do
    provider 'google'
    uid 'https://www.google.com/accounts/o8/id?id=fakeuid'
    email # Uses email sequence

    trait :admin do
      uid 'https://www.google.com/accounts/o8/id?id=adminuid'
    end

    # used in the Spinach tests
    factory :admin_authorization, traits: [:admin]
  end

  factory :user do
    name 'John Smith'
    email # Uses email sequence

    trait :admin do
      admin true
      after :build do |factory, _|
        factory.authorizations << FactoryGirl.build(:admin_authorization)
      end
    end

    factory :admin, traits: [:admin]
  end

  factory :question do
    association :last_active_user, factory: :user
    title 'How do I aaaaa'
    body 'What is the best way'
    last_active_at DateTime.current
    tag_list 'example-tag, multiple'
    user
  end

  factory :answer do
    association :last_active_user, factory: :user
    body 'answer on how to do it'
    last_active_at DateTime.current
    question
    user
  end

  factory :tag do
    name 'example-tag'
  end

  factory :upvote, class: Vote do
    association :post, factory: :question
    user
    vote_type 'upvote'
  end

  factory :downvote, class: Vote do
    association :post, factory: :question
    user
    vote_type 'downvote'
  end

  factory :comment do
    association :post, factory: :question
    user
    body 'This is an example comment'
  end

  factory :timeline_event do
    trait :with_question do
      association :post, factory: :question
    end

    trait :with_answer do
      association :post, factory: :answer
    end
  end
end
