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
end
