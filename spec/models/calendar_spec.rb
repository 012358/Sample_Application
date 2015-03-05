require 'rails_helper'
# Pass condition in condition
RSpec.describe Calendar do
  # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # ######### If Color is Red, then pass
  it "Valid With Color" do
    calendar = Calendar.new(
                           color: 'Red',
                           name: 'Calendar Test'
    )
    expect(calendar.color).to eq 'Red'
  end
  # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  # ######### If name is not blank, then pass
  it "is invalid without a name" do
    calendar = Calendar.new(name: nil)
    calendar.valid?
    expect(calendar.errors[:name]).to include("can't be blank")
    # expect(calendar.errors[:name]).not_to include("can't be blank")
  end
  # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  #   If Duplicate Email, then fail
  it "is a already exist" do

    Calendar.create(
                           color: 'Red',
                           name: 'Calendar-1'
    )

    calendar = Calendar.new(
                color: 'Yellow',
                name: 'Calendar-1'
    )

    # expect(calendar.name).not_to eq 'Calendar-1'
    calendar.should_not be_valid


  end

  # ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


end