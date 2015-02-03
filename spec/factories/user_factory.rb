FactoryGirl.define do

  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    approved true
    confirmed_at Time.now
    role :user
  end

  factory :admin, class: User do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    approved true
    confirmed_at Time.now
    role :admin
  end
end