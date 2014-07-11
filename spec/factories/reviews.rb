# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    rating 1
    summary "Fucking sucked."
    body "Today was the worst. I had to take out the trash."

    factory :empty_review do
      rating 3
      summary nil
      body nil
    end
  end
end
