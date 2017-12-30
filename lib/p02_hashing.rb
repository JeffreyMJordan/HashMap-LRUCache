class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    res = 0
    self.dup.each_with_index do |item, idx| 
      res += (item.hash * idx.hash)
    end 
    res 
  end
end

class String
  def hash
    self.chars.map{|char| char.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    res = 0 
    self.each do |k, v| 
      res += (k.hash/v.hash)
    end 
    res 
  end
end
