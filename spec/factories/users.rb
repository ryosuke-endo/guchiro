FactoryGirl.define do
  factory :user do
    password 'password'
    password_confirmation 'password'
    factory :mikami do
      email 'testtest@yahoo.co.jp'
    end

    factory :ayu do
      email 'testtest2@gmail.co.jp'
    end
  end
end
