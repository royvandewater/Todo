Factory.define :user do |u|
  u.sequence(:email)      { |n| "user#{n}@example.com" }
  u.password              "password"
  u.password_confirmation {|a| a.password}
end

Factory.define :todo_list do |t|
  t.name                  "todo list"
  t.association           :user
end
