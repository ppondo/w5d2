FactoryBot.define do
  factory :post do
    user_id { 1 }
    sub_id { 1 }
    title { "MyString" }
    url { "MyString" }
    content { "MyText" }
  end
end
