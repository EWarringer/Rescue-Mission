class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params['id'])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    # binding.pry
    @question = Question.new(question_params)

    if @question.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to @question
    else
      flash[:notice] = @question.errors.full_messages.join(" & ")
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :details)
  end
end
