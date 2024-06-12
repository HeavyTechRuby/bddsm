# BDDSM

[![Maintainability](https://api.codeclimate.com/v1/badges/ecd5d8c3932674eff519/maintainability)](https://codeclimate.com/github/HeavyTechRuby/bddsm/maintainability)

**B**ehavior **D**riven **D**evelopment **S**emantic **M**achine
варианты:
Behavior Driven Development Suite Maven
Behavior Driven Development Suite Maestro
Behavior Driven Development Suite Module
Behavior Driven Development Solution Master

Hard Testing Framework. Multi-paradigm spec/feature/xunit-agnostic syntax support.

## Usage

Describe:

```ruby
BDDSM.describe "average" do
  let(:numbers) { [1, 2, 3] }

  let(:average) { numbers.average }

  it { expect(average).to eq 2 }
end
```

Execute

```bash
bddsm test/average_spec.rb
```
