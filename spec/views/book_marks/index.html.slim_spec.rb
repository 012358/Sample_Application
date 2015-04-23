require 'rails_helper'

RSpec.describe "book_marks/index", type: :view do
  before(:each) do
    assign(:book_marks, [
      BookMark.create!(
        :title => "Title",
        :url => "Url"
      ),
      BookMark.create!(
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of book_marks" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
