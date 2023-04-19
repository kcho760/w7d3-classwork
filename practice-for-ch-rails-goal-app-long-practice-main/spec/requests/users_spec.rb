require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
      it "brings up the form to create a user" do
      allow(subject).to receive(:logged_in?).and_return(false)
    
      get :new 
      expect(response).to render_template(:new)
      end
  end

  describe "POST #create" do
    before :each do
        create(:user)
        allow(subject).to receive(:current_user).and_return(User.last)
    end
    let(:valid_params) {User.new(username:'merve', password: 'password')}
    let(:invalid_params) {User.new(username:'', password: 'passrd')}

    context "with valid params" do
      it "creates the user" do
        post :create params: valid_params
        expect(User.last.username.to eq("merve"))
      end
      it "redirects to user show page" do
        post :create params: valid_params
        expect(response).to redirect_to(user_url(User.last.id))
      end
    end

    context "with invalid params" do
      before :each do
          post :create params: valid_params
      end

      it "renders new template" do
          expect(response).to have_http_status(422)
          expect(response).to render_template(:new)
      end

      it "add errors to flash" do
        expect(flash[:errors]).to be_present
      end
    end

  end

end
