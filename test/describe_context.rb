BDDSM.describe 'Test case with context' do
  context 'Context example 1' do
    it 'First it in Context example 1' do
      expect(1).to eq 1
    end

    it('Second it in Context example 1') { expect(1).to eq 1 }
  end
end

BDDSM.describe 'Test case with nested context' do
  context 'Context example 1' do
    it 'First it in Context example 1' do
      expect(1).to eq 1
    end

    context 'Nested Context example 1' do
      it 'First it in nested Context example 1' do
        expect(1).to eq 1
      end
    end
  end
end
