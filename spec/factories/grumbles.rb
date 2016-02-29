FactoryGirl.define do
  factory :grumble do
    sequence(:body) { |n| "#{n}回目のくそったれーーーーーーー" }
    sequence(:created_at) { |n| "#{n}.days.ago" }

    factory :post do
      body 'もうやってられねーよ！'
    end
  end
end
