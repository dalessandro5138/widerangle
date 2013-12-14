Feature: Signing in
	
	Scenario: Unsuccessful Signin
		Given a user visits the signin path
		When they submit invalid signin information
		Then they should still be on the sign in page

	Scenario: Successful Signin
		Given a user visits the signin path
			And the user has an account
		When they submit valid signin information
		Then they should see their profile page
			And they should see a signout link