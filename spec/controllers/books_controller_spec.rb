require 'rails_helper'

RSpec.describe BooksController, :type => :controller do

  before(:each) do
    user = FactoryGirl.create(:admin)
    sign_in user
  end

  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        title: 'Amazing Book X',
        subtitle: '',
        author: 'Amazing Author Y',
        isbn: '',
        description: '',
        purchase_url: ''
    }
  }

  let(:invalid_attributes) {
    {
        title: '',
        subtitle: '',
        isbn: '',
        description: '',
        purchase_url: ''
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all books as @books" do
      book = create(:book)
      get :index, {}, valid_session
      expect(assigns(:books)).to eq([book])
    end
  end

  describe "GET show" do
    it "assigns the requested book as @book" do
      book = create(:book)
      get :show, {:id => book.to_param}, valid_session
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "GET cover" do
    it "sends cover image data for the requested book" do
      book = create(:book_with_cover)
      get :cover, {:id => book.to_param}, valid_session
      assert_response :success
    end
  end

  describe "GET new" do
    it "assigns a new book as @book" do
      get :new, {}, valid_session
      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "GET edit" do
    it "assigns the requested book as @book" do
      book = create(:book)
      get :edit, {:id => book.to_param}, valid_session
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Book" do
        expect {
          post :create, {:book => valid_attributes}, valid_session
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, {:book => valid_attributes}, valid_session
        expect(assigns(:book)).to be_a(Book)
        expect(assigns(:book)).to be_persisted
      end

      it "redirects to the created book" do
        post :create, {:book => valid_attributes}, valid_session
        expect(response).to redirect_to(Book.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        post :create, {:book => invalid_attributes}, valid_session
        expect(assigns(:book)).to be_a_new(Book)
      end

      it "re-renders the 'new' template" do
        post :create, {:book => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested book" do
        book = create(:book)
        put :update, {:id => book.to_param, :book => new_attributes}, valid_session
        book.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested book as @book" do
        book = create(:book)
        put :update, {:id => book.to_param, :book => valid_attributes}, valid_session
        expect(assigns(:book)).to eq(book)
      end

      it "redirects to the book" do
        book = create(:book)
        put :update, {:id => book.to_param, :book => valid_attributes}, valid_session
        expect(response).to redirect_to(book)
      end
    end

    describe "with invalid params" do
      it "assigns the book as @book" do
        book = create(:book)
        put :update, {:id => book.to_param, :book => invalid_attributes}, valid_session
        expect(assigns(:book)).to eq(book)
      end

      it "re-renders the 'edit' template" do
        book = create(:book)
        put :update, {:id => book.to_param, :book => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book" do
      book = create(:book)
      expect {
        delete :destroy, {:id => book.to_param}, valid_session
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = create(:book)
      delete :destroy, {:id => book.to_param}, valid_session
      expect(response).to redirect_to(books_url)
    end
  end

end
