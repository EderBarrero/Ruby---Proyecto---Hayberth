require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let!(:client) { create(:client) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: client.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:client) }

      it 'creates a new Client' do
        expect do
          post :create, params: { client: valid_attributes }, format: :json
        end.to change(Client, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Name' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        expect(client.name).to eq('Updated Name')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested client' do
      expect do
        delete :destroy, params: { id: client.to_param }, format: :json
      end.to change(Client, :count).by(-1)
    end
  end
end
