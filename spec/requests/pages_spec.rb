require 'spec_helper'

describe "Pages" do

	describe "Home page" do
	  
	  it "should have the content 'Wider Angle'" do
	  	visit '/pages/home'
	  	expect(page).to have_content('Wider Angle')
	  end

	  it "should have the title 'Wider Angle'" do
	  	visit '/pages/home'
	  	expect(page).to have_title('Home')
	  end

	end

	describe "About page" do
	  
	  it "should have the content 'About Wider Angle'" do
	  	visit '/pages/about'
	  	expect(page).to have_content('About Wider Angle')
	  end

	  it "should have the content 'About Wider Angle'" do
	  	visit '/pages/about'
	  	expect(page).to have_title('About')
	  end

	end
end