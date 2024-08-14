module Enumerable
  def my_each_with_index
    i = 0
    for item in self
      yield(item, i)
      i += 1
    end
    
  end

  def my_select
    arr = []
    for item in self
      arr << item if yield(item)
    end
    arr
  end

  def my_all?
    condition = true
    for item in self
     condition = false if yield(item) == false
    end
    condition
  end
  
  def my_any?
    condition = false
    for item in self
      condition = true if yield(item) == true
    end
    condition
  end
 
  def my_none?
    condition = true
    for item in self
      condition = false if yield(item) == true
    end
    condition
    
  end
  
  def my_count
    count = 0
    if block_given?
    for item in self
      count += 1 if yield(item)
    end
  else
    count = self.length
  end
      count
  end

  def my_map
    arr = []
    for item in self
      arr << yield(item)
    end
    arr
  end

  def my_inject(initial = nil)
    if initial.nil?
      result = self[0]
      for item in self[1..-1]
        result = yield(result, item)
      end
    else
      result = initial
      for item in self
        result = yield(result, item)
      end
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  
  def my_each
    self.each do |element|
      yield(element)
    end
  end
end
