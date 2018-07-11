require 'digest'

class Block
  attr_reader :index, :previous_hash, :timestamp, :data

  def initialize(index, previous_hash, timestamp, data)
    @index = index
    @previous_hash = previous_hash
    @timestamp = timestamp
    @data = data
    @hash = self.hash_block
  end

  def hash_block
    Digest::SHA256.hexdigest self.to_s
  end
end

class Blockchain < Array
  attr_reader :chain

  def initialize
    @chain = [self.first_block]
  end

  def first_block
    return Block.new(0, "0", Time.now, "Hello blockchain!")
  end

  def add_block(previous_block, name)
    index = previous_block.index + 1
    hash = previous_block.hash
    timestamp = Time.now
    data = "#{name} has registered to vote in Washington!"
    block = Block.new(index, hash, timestamp, data)
    @chain.push(block)
  end
end