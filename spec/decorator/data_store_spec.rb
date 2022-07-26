# frozen_string_literal: true

require 'rspec'

require File.expand_path('../../decorator/converters', __dir__)

describe 'DataStore - Decorator' do
  let(:binary_data) do
    [0b01001001, 0b00100000, 0b01101000, 0b01100001, 0b01110110, 0b01100101, 0b00100000,
     0b01101110, 0b01101111, 0b00100000, 0b01101001, 0b01100100, 0b01100101, 0b01100001,
     0b00100000, 0b01110111, 0b01101000, 0b01100001, 0b01110100, 0b00100000, 0b01001001,
     0b00100000, 0b01100001, 0b01101101, 0b00100000, 0b01100100, 0b01101111, 0b01101001,
     0b01101110, 0b01100111]
  end

  let(:hexadecimal_data) do
    %w[49 20 68 61 76 65
       20 6e 6f 20 69 64
       65 61 20 77 68 61
       74 20 49 20 61 6d
       20 64 6f 69 6e 67]
  end

  let(:ascii_data) { 'I have no idea what I am doing' }

  shared_examples 'retrieves data from storage properly' do
    it 'retrieves the binary data' do
      expect(subject.retrieve_data.difference(binary_data).any?).to eq false
    end

    it 'retrieves the data as ASCII characters whenever decorated by HumanReadableStorage' do
      decorator = HumanReadableStorage.new(subject)

      expect(decorator.retrieve_data).to eq ascii_data
    end

    it 'retrieves the data in hex whenever decorated by HexadecimalStorage' do
      decorator = HexadecimalStorage.new(subject)

      expect(decorator.retrieve_data.difference(hexadecimal_data).any?).to eq false
    end
  end

  context HardDrive do
    subject { HardDrive.new(binary_data) }

    it_behaves_like 'retrieves data from storage properly'
  end

  context FloppyDisk do
    subject { FloppyDisk.new(binary_data) }

    it_behaves_like 'retrieves data from storage properly'
  end
end
