require 'spec_helper'

describe "Authentication" do

	subject { page }

  describe "sign in page" do
  	before {visit signin_path}

	  describe "with an invalid entry" do
	  	before {click_button "Sign In"}
	  	it { should have_title('Sign In')}
	  end

	  describe "with a valid entry" do
	  	let(:user) { FactoryGirl.create(:user)}
	  	before do
	  		fill_in "Email", with: user.email.upcase
	  		fill_in "Password", with: user.password
	  		click_button 'Sign In'
	  	end

	  	it { should have_title(user.name)}
	  	it { should have_link('Sign out')}

	  	describe "followed by sign out" do
	  		before { click_link "Sign out" }
	  		it { should have_link("Sign in")}
	  	end
	  end

	end
end


