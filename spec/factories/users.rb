FactoryGirl.define do
  factory :user, class: User do
    email 'test1@user.com'
    password 'test1@user.com'
    provider 'github'
    uid '1231123'
  end

  factory :user2, class: User do
    email 'test2@user.com'
    password 'test2@user.com'
    provider 'github'
    uid '1231125'
  end
end
