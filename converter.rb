$:.unshift File.expand_path('lib', __dir__)

require 'file_parser'

FileParser.read_input_file('input.txt')
