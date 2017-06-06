require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "#new" do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Idea instance variable' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do
    context 'with valid attributes' do

      def valid_request
        post :create, params: {
          idea: FactoryGirl.attributes_for(:idea)
        }
      end

      it 'creates a new idea in the database' do
        expect {valid_request}.to change {Idea.count}.by(1)
      end

      it 'redirects to the idea show page' do
        valid_request
        expect(response).to redirect_to(Idea.last)
      end
    end

    context 'with invalid attributes' do
      def invalid_request
        post :create, params: {
          idea: FactoryGirl.attributes_for(:idea, title: nil)
        }
      end

      it 'does not create a record in the database' do
        expect {invalid_request}.to change {Idea.count}.by(0)
      end

      it "sets a flash message" do
        invalid_request
        expect(flash[:alert]).to include('Problem creating idea')
      end
    end
  end
end
