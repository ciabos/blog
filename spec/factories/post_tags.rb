# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_tag do
    tag nil
    post nil
  end
end
