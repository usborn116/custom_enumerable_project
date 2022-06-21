module Enumerable
  # Your code goes here
  def my_each_with_index
    return enumerable unless block_given?
    i = 0
    for el in self
      yield el, i
      i +=1
    end
  end

  def my_select
    return enumerable unless block_given?
    results = []
    my_each { |el| results.push(el) if yield el }
    return results
  end

  def my_all?
    return enumerable unless block_given?
    result = false
    numbers = []
    my_each { |el| numbers.push(el) if yield el }
    numbers.length == self.length ? true : false
  end

  def my_any?
    return enumerable unless block_given?
    result = false
    numbers = []
    my_each { |el| numbers.push(el) if yield el }
    numbers.length > 0 ? true : false
  end

  def my_none?
    return enumerable unless block_given?
    result = false
    numbers = []
    my_each { |el| numbers.push(el) if yield el }
    numbers.length == 0 ? true : false
  end

  def my_count
    return self.length unless block_given?
    result = false
    numbers = []
    my_each { |el| numbers.push(el) if yield el }
    return numbers.length
  end

  def my_map
    return enumerable unless block_given?
    result = false
    numbers = []
    my_each do |el|
      el2 = yield el
      numbers.push(el2)
    end
    return numbers
  end

  def my_inject(iv)
    return enumerable unless block_given?
    for el in self
      iv = yield el, iv
    end
    return iv
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return array unless block_given?
    for el in self
      yield el
    end
  end
end
