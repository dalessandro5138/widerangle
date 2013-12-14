
Given /^a user visits the signin path$/ do
	visit signin_path
end

When /^they submit invalid signin information$/ do
	click_button "Sign In"
end

When /^they submit valid signin information$/ do
	fill_in "Email", with: @user.email
	fill_in "Password", with: @user.password
	click_button "Sign In"
end

Then /^they should still be on the sign in page$/ do
	expect(page).to have_title("Sign In")
end

#Then /^the user has an account$/ do
#	@user = FactoryGirl.create(:user)
#end

Then /^they should see a signout link$/ do
	expect(page).to have_link("Sign out")
end

Then /^they should see their profile page$/ do
	expect(page).to have_title(@user.name)
end


