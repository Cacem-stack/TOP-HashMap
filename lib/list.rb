require_relative "node.rb"

class LinkedList

  def initialize()
    @head = nil
  end

  def istail?(node)
    return true if node.nxt == nil
    return false
  end

  def tail()
    node = @head
    while node.nxt != nil
      node = node.nxt
    end
    return node
  end

  def is_empty?()
    return @head == nil
  end

  def append(key, value)
    return @head = Node.new(key, value) if is_empty?
    node = @head
    while node.nxt != nil
    node = node.nxt
    end
    node.nxt = Node.new(key, value)
  end

  def prepend(key, value)
    return @head = Node.new(key, value) if is_empty?
    node = Node.new(key, value)
    node.nxt = @head
    @head = node
  end

  def size()
    return 0 if is_empty?
    index = 1
    node = @head
    while node.nxt != nil
      node = node.nxt
      index += 1
    end
    return index
  end

  def head()
    @head
  end

  def at(index)
    return nil if is_empty?
    node = @head
    i = 0
    while node.nxt != nil
      #puts("index: #{index} i: #{i}")
      return node if index == i
      node = node.nxt
      i += 1
    end
    return node if index == i
    return nil
  end

  def pop()
    return nil if is_empty?
    @head = nil if size == 1
    node = @head
    while node.nxt.nxt != nil
      node = node.nxt
    end
    node.nxt = nil
  end

  def contains?(key, value)
    iterate {|node| return true if node.val == value}
    return false
  end

  def iterate()
    return nil if is_empty?
    node = @head
    index = 0
    while node != nil
      #yield({node => node, index => index })
      yield(node, index)
      node = node.nxt
      index += 1
    end
  end

  def find(key)
    return nil if is_empty?
    iterate { |node, index| return index if node.key == key }
    return nil
  end

  def to_s()
    iterate { |node|
      print("(#{node.key}) -> ") if istail?(node) == false
      print("(#{node.key}) -> (nil)\n\n") if istail?(node) == true
    }
  end

  #def ind kex(n)
  #  iterate {|node, index| return index n.val == node.val}
  #end

  def insert_at(key, value, i)
    iterate { |node, index|
      if i == index
        prevnode = at(i-1)
        nextnode = at(i)
        newnode = Node.new(key, value)
        prevnode.nxt = newnode
        newnode.nxt = nextnode
      end

    }
  end

  def remove_at(i)
    iterate { |node, index|
      if @head.nxt == nil
         @head = nil
      elsif i == index
        prev = at(i-1)
        cur = at(i)
        prev.nxt = cur.nxt
      end
    }
  end
end
