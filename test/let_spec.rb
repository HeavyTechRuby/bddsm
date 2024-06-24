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

  # spec for let with block inside block
  # checks if let block executes only once
  def with_calls_counted
    @calls_count ||= 0
    @calls_count += 1

    [yield, @calls_count]
  end

  let(:five) { with_calls_counted { one + 1 } }

  it do
    expect(five[0]).to eq 2
    expect(five[1]).to eq 1
  end
end
