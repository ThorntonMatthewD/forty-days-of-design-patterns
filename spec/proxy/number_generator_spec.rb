# frozen_string_literal: true

require 'rspec'

Dir.glob('proxy/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'NumberGenerator - Interface' do
  subject { NumberGenerator.new }

  it 'interfance cannot directly provide a number' do
    expect { subject.provide_number(5) }.to raise_exception(NotImplementedError)
  end
end

describe 'ProxyNumberGenerator - Proxy' do
  let(:larger_number_generator) { RandomNumberGenerator.new }

  subject { ProxyNumberGenerator.new(larger_number_generator) }

  it 'ProxyNumberGenerator handles the request if the requested ceiling is 100 or less' do
    expect(larger_number_generator).to_not receive(:provide_number)

    subject.provide_number(99)
  end

  it 'RandomNumberGenerator handles the request if the requested ceiling is greater than 100' do
    expect(larger_number_generator).to receive(:provide_number)

    subject.provide_number(9999)
  end

  it 'RandomNumberGenerator can be called directly' do
    expect { larger_number_generator.provide_number(9999) }.to_not raise_exception
  end
end
