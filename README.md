# BDDSM

[![Maintainability](https://api.codeclimate.com/v1/badges/ecd5d8c3932674eff519/maintainability)](https://codeclimate.com/github/HeavyTechRuby/bddsm/maintainability)
[![Hits-of-Code](https://hitsofcode.com/github/HeavyTechRuby/bddsm?branch=main)](https://hitsofcode.com/github/HeavyTechRuby/bddsm/view?branch=main)

**B**ehavior **D**riven **D**evelopment **S**emantic **M**achine

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
