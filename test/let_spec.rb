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
  # this class is needed to share class variable between expect examples insibe it block
  # rubocop:disable  Style/ClassVars
  class Count
    @@calls_count ||= 0

    class << self
      def calls_count
        @@calls_count
      end
    end

    def with_calls_counted
      @@calls_count += 1

      yield
    end
  end
  # rubocop:enable  Style/ClassVars

  let(:five) { Count.new.with_calls_counted { one + 1 } }

  it do
    expect(five).to eq 2
    expect(Count.calls_count).to eq 1
  end
end
