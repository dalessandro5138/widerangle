require 'spec_helper'

describe User do

before { @user = User.new(name: "Example User", email: "user@example.com",
													password: "password", password_confirmation: "password") }
subject { @user }

it {should respond_to(:name)}
it {should respond_to(:email)}
it {should respond_to(:password_digest)}
it {should respond_to(:password)}
it {should respond_to(:password_confirmation)}
it {should respond_to(:authenticate)}
it {should be_valid }

	describe "when name is not present" do
		before { @user.name = ""}
		it {should_not be_valid}
	end

	describe "when name is longer than 30 characters" do
		before { @user.name = "a" * 31 }
		it {should_not be_valid}
	end

	describe "When email is not valid" do
		before { @user.email = "user.example.com"}
		it {should_not be_valid}
	end

	describe "when duplicate email is used" do
		before { 
			dup_email = @user.dup
			dup_email.email = @user.email.upcase
			dup_email.save }
		it { should_not be_valid}
	end

	describe "when password is blank" do
		before { 
			@user = User.new(name: "Example User", email: "User@example.com",
												password: " ", password_confirmation: " ")}
		it { should_not be_valid}
	end

	describe "when passwords don't match" do
		before { @user.password_confirmation = "mismatch"}
		it { should_not be_valid}
	end

	describe "with a password that is too short" do
		before { @user.password = "a" * 5}
		it { should_not be_valid}
	end

	describe "return value of authentication" do
		before { @user.save }
		let(:found_user) { User.find_by(email: @user.email)}

		describe "with a valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end

		describe "with an invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("Invalid")}
			it {should_not eq user_for_invalid_password}
			specify { expect(user_for_invalid_password).to be_false }
		end
	end
end




