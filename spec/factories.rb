FactoryGirl.define do
	factory :user do
		name									"Dan"
		email									"dan@wa.com"
		password							"password"
		password_confirmation	"password"
	end
end