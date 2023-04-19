FactoryBot.define do 
    factory :user do 
        username { |n| Faker::Movies::BackToTheFuture.character }
        password { |p| "password"}
    end
end