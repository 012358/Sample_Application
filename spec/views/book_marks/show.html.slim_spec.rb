require 'rails_helper'

RSpec.describe "book_marks/show", type: :view do
  before(:each) do
    @book_mark = assign(:book_mark, BookMark.create!(
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Url/)
  end
end
