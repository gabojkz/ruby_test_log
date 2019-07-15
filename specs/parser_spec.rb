require './parser'

filename = './webserver.log'

RSpec.describe Parser do
  describe "#app starting" do

    it "should raise an ArgumentError error if no parameters passed" do
      expect { Parser.new() }.to raise_error(ArgumentError)
    end

    it "should be a .log file" do
      expect { Parser.new('file.pdf') }.to raise_error('Wrong file extesion must be .log')
    end

    it "should load the data" do
      data = Parser.new(filename)
      count = data.records.count
      expect(count).to be > 0
    end

  end
end