require 'rails_helper'

RSpec.describe "emplyees/show", type: :view do
  before(:each) do
    @emplyee = assign(:emplyee, Emplyee.create!(
      :name => "Name",
      :manager_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
