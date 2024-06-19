module BDDSM
  class Failure
    attr_reader :error

    def initialize(error, location:)
      @error = error
      @location = location
    end

    def location = @location.join('#')
  end
end
