FactoryGirl.define do
	factory :user do
		name									"Dan"
		email									"dan@was.com"
		password							"password"
		password_confirmation	"password"
	end
end