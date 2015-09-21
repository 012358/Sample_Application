require 'rails_helper'

RSpec.describe "Emplyees", type: :request do
  describe "GET /emplyees" do
    it "works! (now write some real specs)" do
      get emplyees_path
      expect(response).to have_http_status(200)
    end
  end
end
