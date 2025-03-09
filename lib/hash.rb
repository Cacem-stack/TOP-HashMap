require_relative "list.rb"

#raise IndexError if index.negative? || index >= @buckets.length

INITCAP = 16

class HashMap

  attr_accessor :capacity, :loadFactor, :array, :length

  def initialize()
    @loadFactor = 0.75
    @capacity = INITCAP
    @array = []
    @length = 0
  end

  def expand?()
    answer = @length > (@loadFactor * @capacity)
    #puts "length: #{@arlen} factor: #{(@loadFactor * @capacity)}"
    #puts "expand?: #{answer}"
    return answer
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    i = hash((key)) % @capacity

    if @array[i] == nil
      @array[i] = LinkedList.new
      @array[i].append(key, value)
      @length += 1
      growCapacity if expand?
    elsif @array[i].at(@array[i].find(key))&.key == key
      @array[i].remove_at(@array[i].find(key))
      @array[i].append(key, value)
    else
      @array[i].append(key, value)
      @length += 1
      growCapacity if expand?
    end
  end

  def remove(key)
      i = hash((key)) % @capacity
    if  @array[i].at(@array[i].find(key))&.key == key
      @array[i].remove_at(@array[i].find(key))
      @length -= 1
    else
      nil
    end
  end

  def get(key)
    i = hash((key)) % @capacity
    return @array[i].at(@array[i].find(key))&.val
  end

  def has?(key)
    i = hash((key)) % @capacity
    return @array[i].at(@array[i].find(key))&.key == key
  end

  def clear
    @capacity = INITCAP
    @array = []
    @length = 0
  end

  def entries
    hash = {}
    @array.each { |elem|
      if elem != nil
        elem.iterate { |node|
          hash[node.key] = node.val
        }
      else
        nil
      end
    }
      return hash.to_a
  end

  def values
    arr = []
    @array.each { |elem|
      if elem != nil
        elem.iterate { |node|
          arr << node.val
        }
      else
        nil
      end
    }
    puts arr
  end

  def keys
    arr = []
    @array.each { |elem|
      if elem != nil
        elem.iterate { |node|
          arr << node.key
        }
      else
        nil
      end
    }
    puts arr
  end

  def growCapacity()
    oldarr = @array
    @capacity = @capacity * 2
    @length = 0
    @array = []
    oldarr.each { |elem|
      if elem != nil
        elem.iterate { |node|
          set(node.key, node.val)
        }
      else
        nil
      end
    }
  end

end
