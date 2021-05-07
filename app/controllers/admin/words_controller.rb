class Admin::WordsController < ApplicationController
  before_action

  def new
    @word = current_category.words.build
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success]="Saved successfully!"
      redirect_to admin_words_url
    else
      flash[:danger]="Invalid content. Try again"
      render 'new'
    end
  end

  private
    def current_category
      @category = Category.find(params[:category_id])
    end

    def word_id
      @category = Word.find(params[:id])
    end

    def word_params
      params.require(:word).permit(:title)
    end
end
