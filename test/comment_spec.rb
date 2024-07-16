BDDSM.describe 'Test case with description' do
  it 'Description example 1' do
    expect(1).to eq 2
  end

  it('Description example 2') { expect(1).to eq 3 }
end
