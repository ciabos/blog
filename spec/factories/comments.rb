# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    name "MyString"
    email "MyString"
    content "MyText"
    factory :empty_comment do
      name ''
      email ''
      content ''
    end
  end
end
