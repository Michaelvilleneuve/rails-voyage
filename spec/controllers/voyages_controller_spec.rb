require 'rails_helper'

RSpec.describe VoyagesController, type: :controller do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  let(:valid_attributes) { { title: 'lol', user: @user } }
  let(:invalid_attributes) { { title: '' } }
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      voyage = Voyage.create! valid_attributes
      sign_in(@user)
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end

    it "redirects to sign in if not connected" do
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      voyage = Voyage.create! valid_attributes
      get :show, params: {id: voyage.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success if connected response" do
      sign_in(@user)
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end

    it "redirects if not connected" do
      get :new, params: {}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end
  end
  
  describe "GET #edit" do
    it "redirects if not connected" do
      voyage = Voyage.create! valid_attributes
      get :edit, params: {id: voyage.to_param}, session: valid_session
      expect(response).to redirect_to(new_user_session_path)
    end


    it "returns a success response" do
      sign_in(@user)
      voyage = Voyage.create! valid_attributes
      get :edit, params: {id: voyage.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects if not connected" do
        post :create, params: {voyage: valid_attributes}, session: valid_session
        expect(response).to redirect_to(new_user_session_path)
      end

      it "creates a new Voyage" do
        sign_in(@user)
        expect {
          post :create, params: {voyage: valid_attributes}, session: valid_session
        }.to change(Voyage, :count).by(1)
      end

      it "redirects to the created voyage" do
        sign_in(@user)
        post :create, params: {voyage: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Voyage.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        sign_in(@user)
        post :create, params: {voyage: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { title: 'lol2' } }

      it "updates the requested voyage" do
        sign_in(@user)
        voyage = Voyage.create! valid_attributes
        put :update, params: {id: voyage.to_param, voyage: new_attributes}, session: valid_session
        voyage.reload
        expect(voyage.title).to eq('lol2')
      end

      it "redirects to the voyage" do
        sign_in(@user)
        voyage = Voyage.create! valid_attributes
        put :update, params: {id: voyage.to_param, voyage: valid_attributes}, session: valid_session
        expect(response).to redirect_to(voyage)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        sign_in(@user)
        voyage = Voyage.create! valid_attributes
        put :update, params: {id: voyage.to_param, voyage: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested voyage" do
      sign_in(@user)
      voyage = Voyage.create! valid_attributes
      expect {
        delete :destroy, params: {id: voyage.to_param}, session: valid_session
      }.to change(Voyage, :count).by(-1)
    end

    it "redirects to the voyages list" do
      sign_in(@user)
      voyage = Voyage.create! valid_attributes
      delete :destroy, params: {id: voyage.to_param}, session: valid_session
      expect(response).to redirect_to(voyages_url)
    end
  end

end
