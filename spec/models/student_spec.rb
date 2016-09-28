describe Student do
  let(:student) { FactoryGirl.build(:student) }

  context 'with valid data' do
    it 'be valid' do
      expect(student.valid?).to be true
    end
  end

  context 'with invalid data' do
    it 'does not accept empty name' do
      student.name = ''
      expect(student.valid?).to be false
      expect(student.errors.messages[:name].join).to match('não pode ficar em branco')
    end

    it 'does not accept empty register_number' do
      student.register_number = ''
      expect(student.valid?).to be false
      expect(student.errors.messages[:register_number].join).to match('não pode ficar em branco')
    end

    it 'does not accept too long name' do
      student.name = 'a' * 46
      expect(student.valid?).to be false
      expect(student.errors.messages[:name].join).to match('é muito longo (máximo: 45 caracteres)')
    end

    it 'does not accept too long register_number' do
      student.register_number = 'a' * 46
      expect(student.valid?).to be false
      expect(student.errors.messages[:register_number].join).to match('é muito longo (máximo: 45 caracteres)')
    end
  end
end
