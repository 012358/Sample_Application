require 'rails_helper'

RSpec.describe "book_marks/new", type: :view do
  before(:each) do
    assign(:book_mark, BookMark.new(
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders new book_mark form" do
    render

    assert_select "form[action=?][method=?]", book_marks_path, "post" do

      assert_select "input#book_mark_title[name=?]", "book_mark[title]"

      assert_select "input#book_mark_url[name=?]", "book_mark[url]"
    end
  end
end
