require 'rails_helper'

RSpec.describe "book_marks/edit", type: :view do
  before(:each) do
    @book_mark = assign(:book_mark, BookMark.create!(
      :title => "MyString",
      :url => "MyString"
    ))
  end

  it "renders the edit book_mark form" do
    render

    assert_select "form[action=?][method=?]", book_mark_path(@book_mark), "post" do

      assert_select "input#book_mark_title[name=?]", "book_mark[title]"

      assert_select "input#book_mark_url[name=?]", "book_mark[url]"
    end
  end
end
