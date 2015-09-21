require 'rails_helper'

RSpec.describe "emplyees/new", type: :view do
  before(:each) do
    assign(:emplyee, Emplyee.new(
      :name => "MyString",
      :manager_id => 1
    ))
  end

  it "renders new emplyee form" do
    render

    assert_select "form[action=?][method=?]", emplyees_path, "post" do

      assert_select "input#emplyee_name[name=?]", "emplyee[name]"

      assert_select "input#emplyee_manager_id[name=?]", "emplyee[manager_id]"
    end
  end
end
