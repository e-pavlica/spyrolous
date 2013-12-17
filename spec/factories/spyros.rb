# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spyro do
    path "MyText"
    fill "MyString"
    stroke "MyString"
    layer nil
  end
end
