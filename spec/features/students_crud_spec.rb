feature 'I manage Student CRUD', type: :feature do
  scenario 'creating, updating and destroying' do
    student = FactoryGirl.build(:student)
    visit students_path
    expect(page).to have_no_content student.name

    # Submit invalid
    click_link 'Novo Estudante'
    fill_in 'student_name', with: student.name
    submit_form
    expect(page).to have_content 'Número de registro não pode ficar em branco'

    # Create
    fill_in 'student_name', with: student.name
    fill_in 'student_register_number', with: student.register_number
    submit_form
    expect(current_path).to eq(students_path)
    expect(page).to have_content student.name.truncate(20)

    # Update
    visit edit_student_path(1)
    fill_in 'student_name', with: 'New student name'
    submit_form
    expect(page).to have_content 'New student name'

    # Destroy
    expect { click_link 'Excluir' }.to change(Student, :count).by(-1)
  end
end
