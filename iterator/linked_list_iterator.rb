# frozen_string_literal: true

# Iterates over a linked list
class LinkedListIterator
  def initialize(head)
    @head = head
  end

  def retrive_list
    list = []
    return list unless @head

    current_node = @head

    while current_node.next_node
      list << current_node.value
      current_node = current_node.next_node
    end
    list << current_node.value

    list
  end
end
