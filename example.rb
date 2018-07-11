#!/usr/bin/env ruby
require_relative 'blockchain'

blockchain = Blockchain.new

# People to register to vote
names = %w[Lucy Eli Daniel Sean]
# Set a variable to be the previous block
previous_block = blockchain.chain[0]

names.each do |name|
  chain = blockchain.add_block(previous_block, name)
  data_list = blockchain.chain.map { |block| block.data }
  puts "Blockchain: #{data_list.join("\n")}\n\n"
end