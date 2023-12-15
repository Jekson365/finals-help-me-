class QuestionsController < ApplicationController
  before_action :check_admin?
  def new
    @question = Question.new
  end
  def create
    @question = Question.new(params.require(:question).permit(:question))
    if @question.save
      flash[:notice] = "question created"
      redirect_to questions_path
    else
      render "new",status: :unprocessable_entity
    end
  end
  def index
    @questions = Question.all
  end
  def destroy

    @question = Question.find(params[:id])
    @question.destroy

    redirect_to questions_path
  end
  def check_admin?
    unless current_user.admin?
      flash[:notice] = "you need admin`s user"
      redirect_to root_path
    end
  end
end
