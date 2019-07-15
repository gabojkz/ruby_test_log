#!/usr/local/bin/ruby -w
load 'lib/register.rb'


log_file = ARGV[0]
order = ARGV[1] || 'desc'
unique = ARGV[2] || false

abort("Usage: parse.rb log_file [order=desc] [unique=false]") unless filename
