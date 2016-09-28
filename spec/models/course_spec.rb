describe Course do
  let(:course) { FactoryGirl.build(:course) }

  context 'with valid data' do
    it 'be valid' do
      expect(course.valid?).to be true
    end
  end

  context 'with invalid data' do
    it 'does not accept empty name' do
      course.name = ''
      expect(course.valid?).to be false
      expect(course.errors.messages[:name].join).to match('não pode ficar em branco')
    end

    it 'does not accept empty description' do
      course.description = ''
      expect(course.valid?).to be false
      expect(course.errors.messages[:description].join).to match('não pode ficar em branco')
    end

    it 'does not accept too long name' do
      course.name = 'a' * 46
      expect(course.valid?).to be false
      expect(course.errors.messages[:name].join).to match('é muito longo (máximo: 45 caracteres)')
    end

    it 'does not accept too long description' do
      course.description = 'a' * 46
      expect(course.valid?).to be false
      expect(course.errors.messages[:description].join).to match('é muito longo (máximo: 45 caracteres)')
    end
  end
end
