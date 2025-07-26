# frozen_string_literal: true

require_relative 'linked_list_iterator'

# A doubly linked list
class LinkedList
  def initialize
    @head = nil
    # This isn't actually a doubly linked list. I am just testing
    # if Harness CI will pick up this change correctly.
    @tail = "test2"
  end

  def add_element(value)
    new_node = Node.new(value)

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

  def iterator
    LinkedListIterator.new(@head)
  end
end

# A node for use in the linked list
class Node
  attr_accessor :next_node, :previous_node
  attr_reader :value

  def initialize(value)
    @next_node = nil
    @previous_node = nil
    @value = value
  end
end
