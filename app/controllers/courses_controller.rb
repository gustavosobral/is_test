class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'Cursos', :courses_path

  # GET /courses
  def index
    @courses = Course.order(updated_at: :desc).all
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    add_breadcrumb 'Novo'
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    add_breadcrumb 'Editar'
  end

  # POST /courses
  def create
    add_breadcrumb 'Novo'
    @course = Course.create(course_params)
    respond_with @course
  end

  # PATCH/PUT /courses/1
  def update
    add_breadcrumb 'Editar'
    @course.update(course_params)
    respond_with @course
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    respond_with @course
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:name, :description, :status)
    end
end
