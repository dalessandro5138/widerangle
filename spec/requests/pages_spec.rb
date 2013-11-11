require 'spec_helper'

describe "Pages" do

let(:base_title) {"Wider Angle"}
subject { page }

	describe "Home page" do
	 	before { visit root_path }
	  it { should have_content("#{base_title}")}
	  it { should have_title("#{base_title}")}
	end

	describe "About page" do
  	before { visit about_path }
  	it { should have_title("#{base_title} | About")}
  	it { should have_content("What is Wider Angle?")}
  end

end