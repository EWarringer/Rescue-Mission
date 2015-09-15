class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params['id'])
  end

  def new
    @question = Question.new
  end

  def create
    # binding.pry
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :details)
  end
end
