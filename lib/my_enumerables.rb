module Enumerable
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    i = 0
    for key in self
      yield key, i
      i += 1
    end
  end

  def my_select
    new_array = []
    i = 0
    for item in self
      state = yield self[i]
      new_array.push(item) if state == true
      i += 1
    end
    new_array
  end

  def my_all?
    i = 0
    if block_given?
      for item in self
        state = yield self[i]
        i += 1 if state == true
      end
      if i == self.length
        return true
      else
        return false
      end
    else
      for item in self
        i += 1 if item[i] == item[-1]
        if i == self.length
          return true
        else
          return false
        end
      end
    end
  end

  def my_any?
    i = 0
    if block_given?
      for item in self
        state = yield self[i]
        i += 1 if state == true
      end
      if i >= 1
        return true
      else
        return false
      end
    else
      for item in self
        i += 1 if item[i] == true
      end
      if i >= 1
        return true
      else
        return false
      end
    end
  end

  def my_none?
    i = 0
    if block_given?
      for item in self
        state = yield self[i]
        i += 1 if state == true
      end
      if i == 0
        return true
      else
        return false
      end
    else
      for item in self
        i += 1 if item[i] == true
      end
      if i == 0
        return true
      else
        return false
      end
    end
  end

  def my_count
    i = 0
    count = 0
    if block_given?
      for item in self
        state = yield self[i]
        count += 1 if state == true
        i += 1
      end
      return count
    else
      for item in self
        count += 1
      end
      return count
    end
  end

  def my_map
    arr = []
    i = 0
    for item in self
      arr.push(yield self[i])
      i += 1
    end
    return arr
  end
  
  def my_inject(start_value)
    init = start_value
    my_each { |el| init = (yield init, el) }
    init
  end

  def bottles(n)
    if n <= 0
      puts "No more bottles of beer on the wall"
    else
      puts "#{n} bottles of beer on the wall"
      botlles(n - 1)
    end
  end

  def fibonnaci(f)
    if f == 0
      return 0
    elsif f == 1
      return 1
    else
      return fibbonaci(f-1) + fibbonaci(f-2)
    end
  end
    
      
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
end
