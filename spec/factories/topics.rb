#factory fo topics that generates a topic with a random name and description
FactoryGirl.define do
    factory :topic do
        name RandomData.random_name
        description RandomData.random_description
    end
end
