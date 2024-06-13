BDDSM.describe 'BDDSM::Describe.let' do # rubocop:disable Metrics/BlockLength
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

  # checks if let block executes only once
  module Count # rubocop:disable Lint/ConstantDefinitionInBlock
    module_function

    @instance_count ||= 0

    def instance_count
      @instance_count
    end

    def test(counter)
      @instance_count += 1
      counter + 1
    end
  end

  # test module class variables works
  it do
    Count.test(2)
    Count.test(3)
    expect(Count.instance_count).to eq 2
  end

  let(:count) { Count.test(4) }

  it { expect(count).to eq 5 }
  it { expect(Count.instance_count).to eq 1 }
  it { expect(count).to eq 5 }
  it { expect(Count.instance_count).to eq 1 }
end
