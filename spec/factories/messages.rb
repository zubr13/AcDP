# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :message do
		association :author, factory: :user
		association :conversation
		body { "MyText #{Time.now}" }

		trait :with_subscriptions do
		    after(:create) do |message|
		        FactoryGirl.create_list(:subscription, 3, conversation: message.conversation)
		    end
		end
	end
end
