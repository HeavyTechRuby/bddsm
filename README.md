# BDDSM

[![Maintainability](https://api.codeclimate.com/v1/badges/ecd5d8c3932674eff519/maintainability)](https://codeclimate.com/github/HeavyTechRuby/bddsm/maintainability)

Behavior Driven Development SM

Hard Testing Framework. Multi-paradigm spec/feature/xunit-agnostic syntax support.

## Usage

Describe:

```ruby
describe "average" do
  let(:numbers) { [1, 2, 3] }

  let(:average) { numbers.average }

  it { expect(average).to eq 2 }
end
```

Execute

```bash
bddsm test/average_spec.rb
```
