require 'spec_helper'

describe "User pages" do
	
	subject {page}

	describe "Profile page" do
		let(:user) { FactoryGirl.create(:user)}
		before {visit user_path(user)}

		it {should have_content(user.name)}
		it {should have_title(user.name)}
	end

	describe "Signup page" do
		before {visit signup_path}
		it {should have_content('Sign up')}
		it {should have_title('Sign up')}

		let(:submit) {"Create my account"}

		describe "with invalid information" do
			it "should not create a user" do
				expect {click_button submit}.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Someones Name"
				fill_in "Email", with: "someone@something.com"
				fill_in "Password", with: "password"
				fill_in "Password confirmation", with: "password"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end