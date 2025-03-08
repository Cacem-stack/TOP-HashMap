require_relative "list.rb"

#raise IndexError if index.negative? || index >= @buckets.length

INITCAP = 16

class HashMap
  def initialize()
    @loadFactor = 0.75
    @capacity = INITCAP
    @length = 0
  end

  def expand?()
    puts @loadFactor
    puts @capacity
    puts (@loadFactor * @capacity)
    puts @length
    @length > (@loadFactor * @capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end
end

@testy = HashMap.new

def testy()
  @testy
end
