require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
  hash = HashMap.new
  string.chars.each do |char| 
    if hash.include?(char)
      hash.delete(char)
    else 
      hash[char] = true
    end 
  end 
  hash.num_keys <= 1  
end

class HashMap 
  def num_keys 
    res = 0 
    self.each do |k,v|
      res += 1
    end
    res 
  end 
end 
