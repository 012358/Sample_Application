class BookMarksController < ApplicationController
  before_action :set_book_mark, only: [:show, :edit, :update, :destroy]

  def index
    @book_marks = BookMark.all
    respond_with(@book_marks)
  end

  def show
    respond_with(@book_mark)
  end

  def new
    @book_mark = BookMark.new
    respond_with(@book_mark)
  end

  def edit
  end

  def create
    @book_mark = BookMark.new(book_mark_params)
    @book_mark.save
    respond_with(@book_mark)
  end

  def update
    @book_mark.update(book_mark_params)
    respond_with(@book_mark)
  end

  def destroy
    @book_mark.destroy
    respond_with(@book_mark)
  end

  private
    def set_book_mark
      @book_mark = BookMark.find(params[:id])
    end

    def book_mark_params
      params.require(:book_mark).permit(:title, :url)
    end
end
