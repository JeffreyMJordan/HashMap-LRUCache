require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if num_buckets <= @count 
      resize! 
    end 
    self[num] << num 
    @count += 1 
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1 
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    idx = num.hash % @store.length
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2 ){ []}
    @store.each do |bucket| 
      bucket.each do |item| 
        new_store[item % new_store.length] << item
      end 
    end 
    @store = new_store
  end
end
