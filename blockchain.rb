require 'digest'

class Block
  attr_reader :index, :previous_hash, :timestamp, :data, :hash

  def initialize(index, previous_hash, timestamp, data)
    @index = index
    @previous_hash = previous_hash
    @timestamp = timestamp
    @data = data
    @hash = self.hash_block
  end

  def to_string
    <<-END
Index: #{@index}
Previous hash: #{@previous_hash}
Timestamp: #{@timestamp}
Data: #{@data}
END
  end

  def hash_block
    Digest::SHA256.hexdigest self.to_string
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

  def add_block(name)
    index = @chain[-1].index + 1
    previous_hash = @chain[-1].hash
    timestamp = Time.now
    data = "#{name} voted for Hermione Granger"
    block = Block.new(index, previous_hash, timestamp, data)
    @chain.push(block)
  end

  def verify(block)
    @chain[block.index].hash_block == 
      @chain[block.index+1].previous_hash &&
      @chain[block.index].hash ==
      @chain[block.index+1].previous_hash
  end
end