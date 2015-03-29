class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def new
    @question = Question.new
  end

  def show
    @comment = Comment.new
    @question = Question.find(params[:id])
    @comments = @question.comments.order('created_at DESC')
  end

  def create
    if current_user
      @question = Question.new(question_params)
      # prevent logged out users from creating question
      if @question.save
        redirect_to @question
      else
        render 'new'
      end
    else
      redirect_to(root_path, notice: "Please Sign in with your andela email address")
    end
  end

  def index
    @questions = Question.all
  end

  def edit
    (@question.user_id === current_user.id) ?
        @question = Question.find(params[:id]) :
        respond_to do |format|
          format.html { render file: "#{Rails.root}/public/403.html", status: 403, layout: false }
        end
  end

  def update
    if @question.user_id === current_user.id
      @question = Question.find(params[:id])
      if @question.update(article_params)
        redirect_to @question
      else
        render 'edit'
      end
    else
      respond_to do |format|
        format.html { render file: "#{Rails.root}/public/403.html", status: 403, layout: false }
      end
    end
  end

  def destroy
    if @question.user_id === current_user.id
      @question = Question.find(params[:id])
      @question.destroy
    end

    redirect_to questions_path
  end

  private
  def set_question
    @question = Question.find(params[:id])
  end
  def question_params
    params.require(:question).permit(:title, :body)
  end
end