# frozen_string_literal: true

# A doubly linked list
class LinkedList
  def initialize
    @head = nil
  end

  def add_element(val)
    if @head
      locate_tail.next = Node.new(val)
    else
      @head = Node.new(val)
    end
  end

  def locate_tail
    node = @head

    return node unless node.next

    while (node = node.next)
      return node unless node.next
    end
  end
end

# A node for use in the linked list
class Node
  attr_accessor :n_node, :p_node
  attr_reader :value

  def initialize(val)
    @n_node = nil
    @p_node = nil
    @val = val
  end
end
