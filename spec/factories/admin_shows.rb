# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_show, :class => 'Admin::Show' do
    date "2014-05-28"
    city "MyString"
    state "MyString"
    link "MyString"
  end
end
