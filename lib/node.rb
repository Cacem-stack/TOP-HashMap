class Node
  attr_accessor :key, :nxt, :val
  def initialize(key, val, nxt = nil)
    @key = key
    @val = val
    @nxt = nxt
  end
end
