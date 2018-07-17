#!/usr/bin/env ruby
require_relative 'blockchain'

blockchain = Blockchain.new

# People to register to vote
names = %w[Lucy Eli Daniel Sean]
# Set a variable to be the previous block
first = blockchain.chain[0]

# Add registrants to blockchain
names.each { |name| blockchain.add_block(name) }

# Print the chain
blockchain.chain.map do |block|
puts "#{block.to_string}Hash: #{block.hash}\n\n"
end

# Assert that the data hasn't been tampered with
puts "Verify that Lucy registered: #{blockchain.verify(blockchain.chain[1])}"