class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to user_path(@question.user), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Неправильно заполнено поле "Текст вопроса"'

      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос изменён!'
    else
      flash.now[:alert] = 'Неправильно заполнено поле "Текст вопроса"'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Вопрос удалён!'
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.toggle!(:hidden)

    redirect_to question_path(@question)
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
