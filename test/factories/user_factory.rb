Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.sequence :login do |n|
  "user#{n}"
end

Factory.define :user do |user|
  user.login                 { Factory.next :login }
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
end