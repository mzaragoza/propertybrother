require 'spec_helper'
require 'rails_helper'

describe "managers", :type => :feature do
  let(:admin) { FactoryGirl.create(:admin_useri, email: 'admin@test.com') }

  it "logs in a manager" do
#    visit new_manager_session_path
#    fill_in "manager_email", with: 'admin@test.com'
#    fill_in "manager_password", with: 'password'
#    click_button "Login"
#    expect(page).to have_content("Dashboard")
  end

end
