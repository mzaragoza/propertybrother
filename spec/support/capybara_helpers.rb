def login_admin(email = "admin@example.com", password = "password")
  visit_section :cms, "/admins"
  fill_in "admin_user_email", with: email
  fill_in "admin_user_password", with: password
  click_button "Login"
  expect(page).to have_content("Dashboard")
end

def page!
  save_and_open_page
end
