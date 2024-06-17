BDDSM.describe 'Test case' do
  it do
    expect(1).to eq 1
    expect(1).to eq 2
  end
  it { boom }
  it { expect(1).to not_eq 1 }
  it { expect(1).to eq 1 }
  it { expect(1).to eq 1 }
  it { expect(1).to eq 1 }
  it { expect(1).to eq 7 }
end
