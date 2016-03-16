FactoryGirl.define do
  factory :user do
    password 'password'
    password_confirmation 'password'

    factory :mikami do
      id 1
      email 'testtest@yahoo.co.jp'
      admin true

      after(:create) do |user|
        create :king, user: user
      end
    end

    factory :ayu do
      id 2
      email 'testtest2@gmail.co.jp'
    end
  end
end
