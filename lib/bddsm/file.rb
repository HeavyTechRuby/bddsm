module BDDSM
  class File
    def initialize(path)
      @path = path
    end

    def run
      require @path
    end
  end
end
