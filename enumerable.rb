# frozen_string_literal: true

module Enumerable
  def my_each
    count = 0

    while count < self.length
      yield(self[count])
      count += 1
    end
  end

  def my_each_with_index
    count = 0

    while count < self.length
      yield(self[count], count)
      count += 1
    end
  end

  def my_select
    truthy_elements = []

    my_each do |el|
      truthy_elements.push(el) if yield(el)
    end

    truthy_elements
  end

  def my_all?(&block)
    truthy_elements = my_select(&block)
    return true if truthy_elements.length == self.length

    false
  end

  def my_any?
    my_each do |el|
      return true if yield(el)
    end

    false
  end

  def my_none?
    my_each do |el|
      return false if yield(el)
    end

    true
  end

  def my_count(&block)
    my_select(&block).length
  end

  def my_map
    new_arr = []

    my_each do |el|
      new_arr.push(yield(el))
    end

    new_arr
  end

  def my_inject(&block)
    accumulator = self[0]

    my_each_with_index do |el, index|
      next if index.zero?

      accumulator = block.call(accumulator, el)
    end

    accumulator
  end
end
