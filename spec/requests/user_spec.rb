require 'spec_helper'

describe User do

before { @user = User.new(name: "Example User", email: "user@example.com") }
subject { @user }

it { should respond_to(:name)}
it { should respond_to(:email)}

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
end




