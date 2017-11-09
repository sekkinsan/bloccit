FactoryGirl.define do
    pw = RandomData.random_sentence
    #declare the name of the factory :user
    factory :user do
        name RandomData.random_name
    #each User that factory builds will have unique email address using sequence
        sequence(:email){|n| "user#{n}@factory.com" }
        password pw
        password_confirmation pw
        role :member
    end
end
