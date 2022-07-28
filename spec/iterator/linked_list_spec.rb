# frozen_string_literal: true

require File.expand_path('../../iterator/linked_list', __dir__)

describe 'LinkedList - Iterator' do
  subject do
    linked_list = LinkedList.new
    (1..10).each { |n| linked_list.add_element(n) }
    linked_list
  end

  it 'the tail of the linked list is the last value added' do
    expect(subject.locate_tail.value).to eq 10
  end

  it 'the iterator returns an array of all of the elements
    in the linked list in the order they were added' do
    expect(subject.iterator.retrive_list).to eq (1..10).to_a
  end
end
