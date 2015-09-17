class AnswersController < ApplicationController
  def index
    question = Question.find(params[:question_id])
    redirect_to question_path(question)
  end

  def create
    @answer = Answer.new(answer_params)
    # binding.pry
    if @answer.save
      flash[:notice] = 'Answer was successfully created.'
      redirect_to "/questions"
    else
      flash[:notice] = @answer.errors.full_messages.join(" & ")
      render action: 'new'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
