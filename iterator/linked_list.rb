# frozen_string_literal: true

# A doubly linked list
class LinkedList
  def initialize
    @head = nil
  end

  def add_element(val)
    if @head
      tail = locate_tail

      new_node = Node.new(val)
      new_node.p_node = tail

      tail.n_node = new_node
    else
      @head = Node.new(val)
    end
  end

  def locate_tail
    node = @head

    return node unless node.n_node

    while (node = node.n_node)
      return node unless node.n_node
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
