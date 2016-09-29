class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:edit, :update, :destroy]
  add_breadcrumb 'Matrículas', :classrooms_path

  # GET /classrooms
  def index
    @classrooms = Classroom.order(:student_id).all
  end

   # GET /classrooms/new
  def new
    add_breadcrumb 'Nova'
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
    add_breadcrumb 'Editar'
  end

  # POST /classrooms
  def create
    add_breadcrumb 'Nova'
    @classroom = Classroom.create(classroom_params)
    respond_with @classroom
  end

  # PATCH/PUT /classrooms/1
  def update
    add_breadcrumb 'Editar'
    @classroom.update(classroom_params)
    respond_with @classroom
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    respond_with @classroom
  end

  private
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end
end
