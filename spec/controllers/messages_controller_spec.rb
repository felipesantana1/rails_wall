require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  describe "GET #messages" do
    it "returns http success" do
      get :messages
      expect(response).to have_http_status(:success)
    end
  end

end
