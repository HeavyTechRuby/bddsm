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

  # checks if let block executes only once
  class Count
    @@instance_count ||= 0

    class << self
      def instance_count
        @@instance_count
      end

      def instance_count=(count)
        @@instance_count = count
      end
    end

    def increment(counter)
      @@instance_count += 1
      counter + 1
    end
  end

  # test class variables works and 2 inctance
  it do
    Count.new.increment(2)
    Count.new.increment(3)
    expect(Count.instance_count).to eq 2
  end

  Count.instance_count = 0
  let(:count) { Count.new.increment(4) }

  it { expect(count).to eq 5 }
  it { expect(Count.instance_count).to eq 1 }
  it { expect(count).to eq 5 }
  it { expect(Count.instance_count).to eq 1 }
end
