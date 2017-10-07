class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Question saved"
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question"
      render:new
    end
  end

  def edit
  end
end
