describe Classroom, type: :model do
  let(:classroom) { FactoryGirl.build(:classroom) }

  context 'with valid data' do
    it 'be valid' do
      expect(classroom.valid?).to be true
    end
  end

  context 'with invalid data' do
    it 'does not accept empty student' do
      classroom.student = nil
      expect(classroom.valid?).to be false
    end

    it 'does not accept empty course' do
      classroom.course = nil
      expect(classroom.valid?).to be false
    end

    it 'does not accept repeated classroom' do
      classroom.save
      repeated_class = FactoryGirl.build(:classroom)
      repeated_class.student = classroom.student
      repeated_class.course = classroom.course

      expect(repeated_class.valid?).to be false
    end
  end
end
