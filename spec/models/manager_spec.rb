require 'rails_helper'

RSpec.describe Manager, type: :model do
  it "has an email" do
    manager = Manager.new email: "admin@example.com"
    expect(manager.email).to eq "admin@example.com"
  end
  it "has a name"  do
    manager = Manager.new first_name: "moises", last_name: 'zaragoza'
    expect(manager.name).to eq "Moises Zaragoza"
  end
end
