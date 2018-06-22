class Stack
  attr_accessor :initial_array

  def initialize
    @initial_array = []
  end

  def push(el)
    initial_array.push(el)
  end

  def pop
    initial_array.pop
  end

  def peek
    initial_array.last
  end
end

class Queue
  attr_accessor :initial_array

  def initialize
    @initial_array = []
  end

  def enqueue(el)
    initial_array.push(el)
  end

  def dequeue
    initial_array.shift
  end

  def peek
    initial_array.first
  end
end

class Map
  attr_accessor :initial_array

  def initialize
    @initial_array = []
  end

  def set(key, value)
    index_pair = initial_array.index { |pair| pair[0] == key }
    if index_pair
      initial_array[index_pair][1] = value
    else
      initial_array.push([key, value])
    end
  end

  def get(key)
    initial_array.each { |pair| return pair[1] if pair[0] == key }
    nil
  end

  def delete(key)
    initial_array.reject! { |pair| pair[0] == key }
  end

  def show
    deep_dup(initial_array)
  end

  def deep_dup(arr)
    arr.map do |el|
      if el.is_a?(Array)
        deep_dup(el)
      else
        el
      end
    end
  end
end
