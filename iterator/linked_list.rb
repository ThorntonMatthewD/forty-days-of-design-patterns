# frozen_string_literal: true

# A doubly linked list
class LinkedList
  def initialize
    @head = nil
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
