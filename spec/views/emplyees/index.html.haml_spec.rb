require 'rails_helper'

RSpec.describe "emplyees/index", type: :view do
  before(:each) do
    assign(:emplyees, [
      Emplyee.create!(
        :name => "Name",
        :manager_id => 1
      ),
      Emplyee.create!(
        :name => "Name",
        :manager_id => 1
      )
    ])
  end

  it "renders a list of emplyees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
