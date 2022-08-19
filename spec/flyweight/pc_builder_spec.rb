# frozen_string_literal: true

require 'rspec'

Dir.glob('flyweight/*.rb') do |file|
  require_relative "../../#{file}"
end

describe PCStore do
end
