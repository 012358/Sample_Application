require 'rails_helper'

RSpec.describe "emplyees/edit", type: :view do
  before(:each) do
    @emplyee = assign(:emplyee, Emplyee.create!(
      :name => "MyString",
      :manager_id => 1
    ))
  end

  it "renders the edit emplyee form" do
    render

    assert_select "form[action=?][method=?]", emplyee_path(@emplyee), "post" do

      assert_select "input#emplyee_name[name=?]", "emplyee[name]"

      assert_select "input#emplyee_manager_id[name=?]", "emplyee[manager_id]"
    end
  end
end
