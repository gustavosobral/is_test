feature 'I manage Courses CRUD', type: :feature do
  scenario 'creating, updating and destroying' do
    course = FactoryGirl.build(:course)
    visit courses_path
    expect(page).to have_no_content course.name

    # Submit invalid
    click_link 'Novo Curso'
    fill_in 'course_name', with: course.name
    submit_form
    expect(page).to have_content 'Descrição não pode ficar em branco'

    # Create
    fill_in 'course_name', with: course.name
    fill_in 'course_description', with: course.description
    submit_form
    expect(current_path).to eq(courses_path)
    expect(page).to have_content course.name

    # Update
    visit edit_course_path(1)
    fill_in 'course_name', with: 'New course name'
    submit_form
    expect(page).to have_content 'New course name'

    # Destroy
    expect { click_link 'Excluir' }.to change(Course, :count).by(-1)
  end
end
