require_relative './cli.rb'
require_relative './content.rb'
require_relative './player.rb'
require 'pry'

# Cli.new.call
content = Content.new
cli = Cli.new(content)

cli.call
