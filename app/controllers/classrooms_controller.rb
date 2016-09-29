class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:edit, :update, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.order(:student_id).all
  end

   # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  def create
    @classroom = Classroom.create(classroom_params)
    respond_with @classroom
  end

  # PATCH/PUT /classrooms/1
  def update
    @classroom.update(classroom_params)
    respond_with @classroom
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    respond_with @classroom
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      params.require(:classroom).permit(:student_id, :course_id)
    end
end
