class AnswersController < ApplicationController
  def index
    question = Question.find(params[:question_id])
    redirect_to question_path(question)
  end

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question
    if @answer.save
      flash[:notice] = 'Answer was successfully created.'
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(" & ")
      render :new
    end
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    @question = Question.find(params[:question_id])
    @answer.question = @question
    if @answer.update_attributes(answer_params)
      flash[:notice] = 'Answer was successfully updated.'
      redirect_to question_path(@question)
    else
      flash[:notice] = @answer.errors.full_messages.join(" & ")
      render :edit
    end
  end

  def destroy
    binding.pry
    @answer = Answer.
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end
