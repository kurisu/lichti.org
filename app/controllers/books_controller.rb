class BooksController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :destroy, :update]
  before_action :set_book, only: [:show, :edit, :update, :destroy, :cover]
  after_action :verify_authorized, except: [:cover]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    authorize Book
  end

  # GET /books/1
  # GET /books/1.json
  def show
    authorize @book
  end

  def cover
    @book = Book.find(params[:id])
    send_data Base64.decode64(@book.cover), :type => 'image/png',:disposition => 'inline'
  end

  # GET /books/new
  def new
    @book = Book.new
    authorize @book
  end

  # GET /books/1/edit
  def edit
    authorize @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    authorize @book

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    authorize @book

    respond_to do |format|
      if @book.update(book_params) && save_cover
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def save_cover
    if book_params[:cover]
      cover = book_params[:cover].read
      @book.update_attributes(:cover => Base64.encode64(cover))
    else
      true
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    authorize @book
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :subtitle, :author, :isbn, :description, :cover, :purchase_url)
    end
end
