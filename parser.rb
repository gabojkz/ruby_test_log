#!/usr/local/bin/ruby -w
load 'lib/register.rb'

log_file = ARGV[0]
# options
order = ARGV[1] || 'desc'
unique = ARGV[2] || false

class Parser

  def initialize(filename)
    raise ArgumentError, 'Usage: ruby parse.rb log_file [order=desc] [unique=false]' unless filename
    raise StandardError.new, 'Wrong file extesion must be .log' unless File.extname(filename) == '.log'

    @filename = filename
    @records = []

    loadFile()
  end
  
  def show(order, unique)
    register = Register.new(@records, order, unique)
    register.print_list()
  end

  def counter
    return @records.count
  end

  private
  def loadFile
    # read file
    File.readlines(@filename).each do |line|
      # divide each line into [ path, ip_address ]
      @records.push( line.gsub(/\s+/m, ' ').strip.split(" ") )
    end
  end
end

if $PROGRAM_NAME == __FILE__
  log = Parser.new(log_file)
  log.show(order, unique)
end


