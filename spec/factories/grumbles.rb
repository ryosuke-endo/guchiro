FactoryGirl.define do
  factory :grumble do
    sequence(:body) { |n| "#{n}回目のくそったれーーーーーーー" }
    sequence(:created_at) { |n| "#{n}.days.ago" }

    factory :king do
      body '私は王様になりたいでござる'
      user_id 1
      created_at 11.minutes.ago
      association :user, factory: :mikami
    end

    factory :queen do
      body '私は王様になりたいでござる'
      user_id 1
      created_at 12.minutes.ago
      association :user, factory: :mikami

      after(:create) do |grumble|
        create :sad, grumble: grumble
      end
    end

    factory :post do
      body 'もうやってられねーよ！'
      user_id 2
      created_at 14.minutes.ago
      association :user, factory: :ayu
    end

    factory :muritag do
      body '#愚痴 #仕事 >_<'
      user_id 2
      created_at 20.minutes.ago
      association :user, factory: :ayu
    end

    factory :tsukareta do
      body '疲れたわん'
      user_id 2
      created_at 1.minutes.ago
    end
  end
end
