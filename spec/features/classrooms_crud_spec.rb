feature 'I manage Classroom CRUD', type: :feature do
  scenario 'creating, updating and destroying' do
    classroom = FactoryGirl.build(:classroom)
    student = FactoryGirl.create(:student)

    visit classrooms_path
    expect(page).to have_no_content classroom.student.name

    # Create
    click_link 'Nova Matrícula'
    select classroom.student.name, from: 'classroom_student_id'
    select classroom.course.name, from: 'classroom_course_id'
    submit_form
    expect(current_path).to eq(classrooms_path)
    expect(page).to have_content classroom.student.name.truncate(20)

    # Update
    expect(page).to have_no_content student.name
    visit edit_classroom_path(1)
    select student.name, from: 'classroom_student_id'
    submit_form
    expect(page).to have_content student.name.truncate(20)

    # Destroy
    expect { click_link 'Excluir' }.to change(Classroom, :count).by(-1)
  end
end
