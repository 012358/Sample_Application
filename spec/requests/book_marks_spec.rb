require 'rails_helper'

RSpec.describe "BookMarks", type: :request do
  describe "GET /book_marks" do
    it "works! (now write some real specs)" do
      get book_marks_path
      expect(response).to have_http_status(200)
    end
  end
end
