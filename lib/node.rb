class Node
  attr_accessor :nxt, :val
  def initialize(val = nil, nxt = nil)
    @val = val
    @nxt = nxt
  end
end
