# frozen_string_literal: true

require 'data_store'

# Alters the behavior of how data is read from storage.
class StorageDecorator < DataStore
  attr_accessor :data_store

  def initialize(data_store)
    @data_store = data_store
    super
  end

  def retrieve_data
    @data_store.retrieve_data
  end
end

# Converts the binary in our data store into an ASCII string
class HumanReadableStorage < StorageDecorator
  def retrieve_data
    @data_store.retrieve_data.pack('*c')
  end
end

# Converts the binary in our data store to hex
class HexadecimalStorage < StorageDecorator
  def retrieve_data
    @data_store.retrieve_data..map do |d|
      d.to_s.to_i(2).to_s(16)
    end
  end
end
