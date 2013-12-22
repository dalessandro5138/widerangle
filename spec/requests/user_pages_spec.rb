require 'spec_helper'

describe "User pages" do

	let(:submit) {"Create my account"}
	subject {page}

	describe "index" do
		let(:user) {FactoryGirl.create(:user)}
		before(:each) do
			sign_in user
			visit users_path
		end

		it { should have_title('All Users')}
		it { should have_content('All Users')}

		describe "pagination" do
			before(:all) {30.times { FactoryGirl.create(:user)}}
			after(:all) 	{User.delete_all}

			it { should have_selector('div.pagination')}

			it "should list each user" do
				User.paginate(page: 1).each do |user|
					expect(page).to have_selector('li', text: user.name)
				end
			end
		end

		describe "delete links" do
			it { should_not have_link('destroy')}

			describe "as an admin user" do
				let(:admin) {FactoryGirl.create(:admin)}
				before do
					sign_in admin
					visit users_path
				end

				it { should have_link('destroy', href: user_path(User.first))}
				it "should be able to delete another user" do
					expect do
						click_link('destroy', match: :first)
					end.to change(User, :count).by(-1)
				end
				it { should_not have_link('destroy', href: user_path(admin)) }
			end
		end
	end

	describe "Signup page" do
		before {visit signup_path}
		it {should have_content('Sign up')}
		it {should have_title('Sign up')}

		

		describe "with invalid information" do
			it "should not create a user" do
				expect {click_button submit}.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", with: "Valid name"
				fill_in "Email", with: "valid@example.com"
				fill_in "Password", with: "password"
				fill_in "Password confirmation", with: "password"
			end

			it "should create a user" do
				expect { click_button submit}.to change(User, :count).by(1)
			end
		end
	end

	describe "Profile page" do
		let(:user) { FactoryGirl.create(:user)}
		before {visit user_path(user)}
		it {should have_content(user.name)}
		it {should have_title(user.name)}
	end

	describe "edit" do
		let(:user) { FactoryGirl.create(:user)}
		before { sign_in user}
		before {visit edit_user_path(user)}

		describe "page" do
			it { should have_content("Edit user")}
		end

		describe "with invalid information" do
			before { click_button submit }
			it { should have_content("Edit user")}
		end

		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_email) { "new@email.com" }
			before do
				fill_in "Name", with: new_name
				fill_in "Email", with: new_email
				fill_in "Password", with: user.password
				fill_in "Password confirmation", with: user.password
				click_button submit
			end

			it {should have_title(new_name)}
			it {should have_link('Sign out', href: signout_path)}
			specify { expect(user.reload.name).to eq new_name}
			specify { expect(user.reload.email).to eq new_email}
		end
	end
end