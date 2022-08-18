# frozen_string_literal: true

require 'rspec'

Dir.glob('abstract_factory/*.rb') do |file|
  require_relative "../../#{file}"
end

describe 'Abstract Factory Example' do
  let(:microcontroller_factory) { PiMicrocontrollerFactory.new }
  let(:processor_factory) { PiProcessorFactory.new }

  let(:no_wireless_chip_response) { 'I can\'t. I have no way to do that.' }
  let(:no_headers_response) { 'You\'ll need to solder on headers.' }
  let(:affirmative_response) { 'Okay!' }

  let(:factory_methods) do
    %w[
      create_base_model_pi
      create_pi_with_wireless_chip
      create_pi_with_headers
      create_pi_with_wireless_chip_and_headers
    ]
  end

  let(:board_methods) do
    %w[
      name
      connect_to_network
      plug_into_breadboard
    ]
  end
  describe AbstractPiFactory do
    it 'all factories should respond to the same methods' do
      factory_methods.each do |method_name|
        expect(microcontroller_factory.respond_to?(method_name)).to eq true
        expect(processor_factory.respond_to?(method_name)).to eq true
      end
    end
  end

  describe PiMicrocontrollerFactory do
    subject { microcontroller_factory }

    it { expect(subject.create_base_model_pi).to be_an_instance_of(PiPico) }

    it { expect(subject.create_pi_with_wireless_chip).to be_an_instance_of(PiPicoW) }

    it { expect(subject.create_pi_with_headers).to be_an_instance_of(PiPicoH) }

    it { expect(subject.create_pi_with_wireless_chip_and_headers).to be_an_instance_of(PiPicoHW) }
  end

  describe PiProcessorFactory do
    subject { processor_factory }

    it { expect(subject.create_base_model_pi).to be_an_instance_of(PiZero) }

    it { expect(subject.create_pi_with_wireless_chip).to be_an_instance_of(PiZeroW) }

    it { expect(subject.create_pi_with_headers).to be_an_instance_of(PiZeroH) }

    it { expect(subject.create_pi_with_wireless_chip_and_headers).to be_an_instance_of(PiZeroHW) }
  end

  shared_examples 'raspberry_pi_board' do
    it 'responds to all board methods' do
      board_methods.each do |method_name|
        expect(subject.respond_to?(method_name)).to eq true
      end
    end
  end

  describe 'Pi Pico Product Line' do
    context PiPico do
      subject { PiPico.new }

      it { expect(subject.name).to eq 'Raspberry Pi Pico' }

      it { expect(subject.connect_to_network).to eq no_wireless_chip_response }

      it { expect(subject.plug_into_breadboard).to eq no_headers_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiPicoW do
      subject { PiPicoW.new }

      it { expect(subject.name).to eq 'Raspberry Pi Pico W' }

      it { expect(subject.connect_to_network).to eq affirmative_response }

      it { expect(subject.plug_into_breadboard).to eq no_headers_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiPicoH do
      subject { PiPicoH.new }

      it { expect(subject.name).to eq 'Raspberry Pi Pico H' }

      it { expect(subject.connect_to_network).to eq no_wireless_chip_response }

      it { expect(subject.plug_into_breadboard).to eq affirmative_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiPicoHW do
      subject { PiPicoHW.new }

      it { expect(subject.name).to eq 'Raspberry Pi Pico HW' }

      it { expect(subject.connect_to_network).to eq affirmative_response }

      it { expect(subject.plug_into_breadboard).to eq affirmative_response }

      it_behaves_like 'raspberry_pi_board'
    end
  end

  describe 'Pi Zero Product Line' do
    context PiZero do
      subject { PiZero.new }

      it { expect(subject.name).to eq 'Raspberry Pi Zero' }

      it { expect(subject.connect_to_network).to eq no_wireless_chip_response }

      it { expect(subject.plug_into_breadboard).to eq no_headers_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiZeroW do
      subject { PiZeroW.new }

      it { expect(subject.name).to eq 'Raspberry Pi Zero W' }

      it { expect(subject.connect_to_network).to eq affirmative_response }

      it { expect(subject.plug_into_breadboard).to eq no_headers_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiZeroH do
      subject { PiZeroH.new }

      it { expect(subject.name).to eq 'Raspberry Pi Zero H' }

      it { expect(subject.connect_to_network).to eq no_wireless_chip_response }

      it { expect(subject.plug_into_breadboard).to eq affirmative_response }

      it_behaves_like 'raspberry_pi_board'
    end

    context PiZeroHW do
      subject { PiZeroHW.new }

      it { expect(subject.name).to eq 'Raspberry Pi Zero HW' }

      it { expect(subject.connect_to_network).to eq affirmative_response }

      it { expect(subject.plug_into_breadboard).to eq affirmative_response }

      it_behaves_like 'raspberry_pi_board'
    end
  end
end
