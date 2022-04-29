class QuestionsController < ApplicationController
  before_action :set_question, only: %i[update show destroy edit hide]

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to question_path(@question), notice: 'Новый вопрос создан!'
    else
      flash.now[:alert] = 'Неправильно заполнено поле "Текст вопроса"'

      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Вопрос изменён!'
    else
      flash.now[:alert] = 'Неправильно заполнено поле "Текст вопроса"'

      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path, notice: 'Вопрос удалён!'
  end

  def show
  end

  def index
    @questions = Question.all
    @question = Question.new
  end

  def new
    @question = Question.new
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
