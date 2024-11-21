class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:top]
    before_action :is_matching_login_user, only: [:edit, :update]

    def top
      redirect_to root_path
    end
    
    def index
        @book = Book.new
        @books = Book.all
        @user = current_user
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book=Book.find(params[:id])
        if @book.update (book_params)
          flash[:notice] = "Book was successfully updated."
          redirect_to book_path(@book.id)
        else
          render :edit
        end
    end
    
    def create
      @book = Book.new(book_params)
      @books = Book.all
      @book.user = current_user
      @book.user_id = current_user.id
      @user = current_user
      if @book.save
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        render :index
      end
    end

    def show
        @book1 = Book.find(params[:id])
        @book = Book.new
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        flash[:notice] = "Book was successfully destroyed."
        redirect_to books_path
    end

    private

    def book_params
        params.require(:book).permit(:title, :body)
    end

    def is_matching_login_user
      book = Book.find(params[:id])
      unless book.user_id == current_user.id
        redirect_to books_path
      end
    end

end
