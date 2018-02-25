require 'rails_helper'


RSpec.describe TodosController do
  let(:todo) { create(:todo) }
  let(:email) { 'test_user1@example.com' }
  let(:password) { 'password' }

  let!(:user) { create(:user, email: email, password: password) }



  describe "POST 'create'" do
    it "creates a todo when user signed in" do
      sign_in(user)
      expect_any_instance_of(Todo).to receive(:save)
      post :create, params: { todo: todo.attributes }
    end
  end

  describe "GET 'show'" do
    it 'should todo when user signed in' do
      sign_in(user)
      get :show, params: { id: todo.id }
      expect(response.status).to eq(200)
    end
  end

  describe "GET 'index'" do
    it 'show all todos when user signed in' do
      sign_in(user)
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      sign_in(user)
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET 'active_todos'" do
    it 'show all active todos when user signed in' do
      sign_in(user)
      get :active_todos
      expect(response.status).to eq(200)
    end

    it "renders the active todo template" do
      sign_in(user)
      get :active_todos
      expect(response).to render_template("active_todos")
    end
  end

  describe "GET 'completed_todos'" do
    it 'show all active todos when user signed in' do
      sign_in(user)
      get :completed_todos
      expect(response.status).to eq(200)
    end

    it "renders the active todo template" do
      sign_in(user)
      get :completed_todos
      expect(response).to render_template("completed_todos")
    end
  end

  describe "PUT 'update'" do
    it 'Updates todo when signed in' do
      sign_in(user)
      expect_any_instance_of(Todo).to receive(:update).with({ "title" => "Update title" })
      put :update, params: { id: todo.id, todo: { title: 'Update title'} }
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE #destroy" do
    it "deletes todo when user signed in" do
      sign_in(user)
      delete :destroy, params: { id: todo.id }
      expect(response.status).to eq(302)
    end
  end
end

