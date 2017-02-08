class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    out = 0
    self.each_with_index do |el, idx|
      out += (el * (idx+1)).hash
    end
    out.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    out = 0
    self.keys.sort.each do |key|
      out += key.hash + self[key].hash
    end
    out
  end
end
