require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  attr_reader :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    idx = key.hash % num_buckets
    @store[idx].include?(key)
  end

  def set(key, val)
    if num_buckets <= @count 
      resize!
    end 
    idx = key.hash % num_buckets
    if @store[idx].include?(key)
      @store[idx].update(key, val)
    else 
      @store[idx].append(key, val)
      @count += 1 
    end 
    
  end

  def get(key)
    idx = key.hash % num_buckets
    @store[idx].get(key)
  end

  def delete(key)
    idx = key.hash % num_buckets
    @store[idx].remove(key)
    @count -= 1
  end

  def each
    @store.each do |lis|       
      lis.each do |item| 
        yield(item.key, item.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length*2) { LinkedList.new }
    @store.each do |list|
      list.each do |item|
        idx = item.key.hash % new_store.length
        new_store[idx].append(item.key, item.val )
      end
    end
    @store = new_store
  end

  def bucket(key)
    
  end

end
