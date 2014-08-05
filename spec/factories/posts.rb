FactoryGirl.define do
  factory :post do
    title "MyTitle"
    body "MyText"
    
    factory :empty_post do
      title ''
      body ''
    end
    factory :post_with_no_category_id do
      title 'aaa'
      body 'aaa'
      category_id ''
    end
     
  end
end