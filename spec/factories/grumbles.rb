FactoryGirl.define do
  factory :grumble do
    sequence(:body) { |n| "#{n}回目のくそったれーーーーーーー" }
    sequence(:created_at) { |n| "#{n}.days.ago" }
    user_id 1

    factory :king do
      body '私は王様になりたいでござる'
      user_id 1
      created_at 11.minutes.ago
      association :user, factory: :mikami

      after(:create) do |grumble|
        create :sad, grumble: grumble
      end
    end

    factory :post do
      body 'もうやってられねーよ！'
      user_id 2
      association :user, factory: :ayu
    end

    factory :muri do
      body '>_<'
      user_id 2
      association :user, factory: :ayu
    end
  end
end
