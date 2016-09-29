feature 'I visit home page', type: :feature do
  scenario 'clicking on the entities links' do
    visit root_path

    # Visit students page
    expect(page).to have_link 'Ver estudantes'
    click_link 'Ver estudantes'
    expect(current_path).to eq(students_path)

    # Back to home
    expect(page).to have_link 'iS Teste'
    click_link 'iS Teste'
    expect(current_path).to eq(root_path)

    # Visit courses page
    expect(page).to have_link 'Ver cursos'
    click_link 'Ver cursos'
    expect(current_path).to eq(courses_path)
    click_link 'iS Teste'

    # Visit classrooms page
    expect(page).to have_link 'Ver matrículas'
    click_link 'Ver matrículas'
    expect(current_path).to eq(classrooms_path)
  end
end
