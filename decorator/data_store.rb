# frozen_string_literal: true

# A place to park your bytes
class DataStore
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def retrieve_data
    raise NotImplementedError
  end
end

# An electro-mechanical data storage device
class HardDrive < DataStore
  def retrieve_data
    @data
  end
end

# Don't copy that floppy!!
class FloppyDisk < DataStore
  def retrieve_data
    @data
  end
end
