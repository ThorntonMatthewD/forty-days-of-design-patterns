# frozen_string_literal: true

# A doubly linked list
class LinkedList
  def initialize
    @head = nil
  end

  def add_element(val)
    new_node = Node.new(val)

    if @head
      tail = locate_tail
      tail.next_node = new_node
      new_node.previous_node = tail
    else
      @head = new_node
    end
  end

  def locate_tail
    node = @head

    return node unless node.next_node

    while (node = node.next_node)
      return node unless node.next_node
    end
  end
end

# A node for use in the linked list
class Node
  attr_accessor :next_node, :previous_node
  attr_reader :value

  def initialize(val)
    @next_node = nil
    @previous_node = nil
    @val = val
  end
end
