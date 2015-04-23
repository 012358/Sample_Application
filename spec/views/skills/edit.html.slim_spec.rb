require 'rails_helper'

RSpec.describe "skills/edit", type: :view do
  before(:each) do
    @skill = assign(:skill, Skill.create!(
      :name => "MyString",
      :skill_type_id => 1
    ))
  end

  it "renders the edit skill form" do
    render

    assert_select "form[action=?][method=?]", skill_path(@skill), "post" do

      assert_select "input#skill_name[name=?]", "skill[name]"

      assert_select "input#skill_skill_type_id[name=?]", "skill[skill_type_id]"
    end
  end
end
