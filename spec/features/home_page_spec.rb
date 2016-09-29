feature 'I visit home page', type: :feature do
  scenario 'clicking on the entities links' do
    visit root_path

    expect(page).to have_link 'Ver estudantes'
    click_link 'Estudantes'
    expect(current_path).to eq(students_path)

    expect(page).to have_link 'iS Teste'
    click_link 'iS Teste'
    expect(current_path).to eq(root_path)

    expect(page).to have_link 'Ver cursos'
    click_link 'Cursos'
    expect(current_path).to eq(courses_path)
  end
end
