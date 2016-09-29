class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'Estudantes', :students_path

  # GET /students
  def index
    @students = Student.order(updated_at: :desc).all
  end

  # GET /students/1
  def show
  end

  # GET /students/new
  def new
    add_breadcrumb 'Novo'
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    add_breadcrumb 'Editar'
  end

  # POST /students
  def create
    add_breadcrumb 'Novo'
    @student = Student.create(student_params)
    respond_with @student
  end

  # PATCH/PUT /students/1
  def update
    add_breadcrumb 'Editar'
    @student.update(student_params)
    respond_with @student
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    respond_with @student
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:name, :register_number, :status)
    end
end
