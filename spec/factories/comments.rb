FactoryGirl.define do
  factory :comment do
    body "MyText"
    user_id 1
    grumble_id 1

    factory :sad do
      body 'comment'
      association :grumble, factory: :king
    end
  end
end
