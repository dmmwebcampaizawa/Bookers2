class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    if
      #並び替え
      params[:sort_update]
      @books = Book.all.order(updated_at: :desc) 
    elsif 
      #並び替え
      params[:star_count]
      @books = Book.all.order(star: :desc)
    else
      #並び替え
      @books = Book.all
    end
      @book = Book.new
      @user = current_user
    
    
  end

  def show
    @book = Book.find(params[:id])
    @book_ = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
    redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
   def search_category
     @book=Book.new
     @books = Book.search(params[:keyword])
     @keyword = params[:keyword]
   end


  private

  def book_params
     params.require(:book).permit(:title, :body, :star, :category)
  end
end