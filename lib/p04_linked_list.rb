
class Node
  attr_accessor :key, :val, :next, :prev

  include Enumerable

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.to_s==@tail.to_s
  end

  def get(key)
    curr = @head 
    until curr == @tail || curr.key == key 
      curr = curr.next
    end 
    if curr != @tail 
      return curr.val
    end 
  end

  def include?(key)
    curr = @head 
    until curr == @tail || curr.key == key 
      curr = curr.next
    end 
    if curr != @tail 
      return true
    end
    false
  end

  def append(key, val)
    curr = @tail.prev
    curr.next = Node.new(key, val)
    curr.next.prev = curr
    curr.next.next = @tail 
    @tail.prev = curr.next
    curr.next
  end

  def update(key, val)
    curr = @head 
    until curr == @tail || curr.key == key 
      curr = curr.next
    end 
    if curr != @tail 
      curr.val = val
    end 
    
  end

  def remove(key)
    curr = @head 
    until curr == @tail || curr.key == key 
      curr = curr.next
    end 
    if curr != @tail 
      curr.remove
    end 
  end

  def each
    curr = @head.next 
    until curr==@tail 
      yield curr
      curr = curr.next
    end 
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
