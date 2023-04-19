FactoryBot.define do 
    factory :test_user do 
        username { |n| Faker::Movies::BackToTheFuture.character }
        password { |p| "password"}
    end
end