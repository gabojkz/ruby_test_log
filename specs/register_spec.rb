#register_spec.rb
require './lib/register'
require './parser'

filename = './webserver.log'

RSpec.describe Register do
  describe "#lib class" do

    before(:each) do
      data = Parser.new(filename)
      @register = Register.new(data.records)
      @register.print_list()
    end

    it "should laod the data into a hash" do
      is_hash = @register.list.is_a?(Hash)
      expect {is_hash.should be_true }
    end

    it "should have default order as desc" do
      expect(@register.order).to match("desc")   
      expect(@register.pages[0][1]).to match(90)
    end

    it "should have order asc" do
      @register.order = 'asc'
      @register.print_list()
      expect(@register.order).to match("asc")   
      expect(@register.pages[0][1]).to match(78)
    end

    it "should have return unique values" do
      @register.unique = true
      @register.print_list()
      expect(@register.pages[0][1]).to match(23)
    end
  end
end
