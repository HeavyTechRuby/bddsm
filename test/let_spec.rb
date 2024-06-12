BDDSM.describe 'BDDSM::Describe.let' do
  # let should define variable accessible from 'it'
  let(:a) { 1 }
  it { expect(a).to eq 1 }

  # let variable should be accessible from another let
  let(:one) { 1 }
  let(:two) { one + one }
  it { expect(two).to eq 2 }

  # let variable should be overriden
  let(:three) { 3 }
  let(:three) { 4 }
  it { expect(three).to eq 4 }
end
