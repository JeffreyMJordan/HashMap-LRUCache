class MaxIntSet

  attr_accessor :max

  def initialize(max)
    @max = max 
    @store = Array.new(max){false}
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else 
      raise 'Out of bounds'
    end 
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)

    (@store[num] == false) && (num>0)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    idx = num % @store.length
    @store[idx]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
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
    idx = num % @store.length
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
