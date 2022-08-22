# frozen_string_literal: true

require 'rspec'

Dir.glob('flyweight/*.rb') do |file|
  require_relative "../../#{file}"
end

describe PCStore do
  let(:sick_gaming_rigs) do
    [{ name: 'The N00b Pwn3r', price: 900_100, silicon_lottery_rank: 1 },
     { name: 'The Filthy Casual', price: 50_000, silicon_lottery_rank: 45 },
     { name: 'A Literal Potato', price: 1000, silicon_lottery_rank: 999 }]
  end

  let(:gamer_mart) { PCStore.new }

  def generate_pc_stock
    sick_gaming_rigs.each { |pc| gamer_mart.order_pc(pc) }
  end

  describe '#num_pcs_in_stock' do
    it do
      expect(gamer_mart.num_pcs_in_stock).to eq 0

      generate_pc_stock

      expect(gamer_mart.num_pcs_in_stock).to eq 3
    end

    it 'adding another of the same PC increases store stock, but not available builds in PCBuilder' do
      expect(gamer_mart.num_pcs_in_stock).to eq 0
      expect(gamer_mart.pc_supplier.num_pcs_builds_available).to eq 0

      generate_pc_stock

      expect(gamer_mart.num_pcs_in_stock).to eq 3
      expect(gamer_mart.pc_supplier.num_pcs_builds_available).to eq 3

      # Order another PC of the same type as another
      gamer_mart.order_pc(sick_gaming_rigs.last)

      expect(gamer_mart.num_pcs_in_stock).to eq 4
      expect(gamer_mart.pc_supplier.num_pcs_builds_available).to eq 3
    end
  end

  describe 'benchmark PCs' do
    context 'with a singular test bench' do
      let(:test_bench) { GamingPC.new({ name: 'Test Bench', price: 0, silicon_lottery_rank: rank }) }
      let(:rank) { 100 }

      it 'Test bench finds all prime numbers between 1-10000 in 60 seconds' do
        result = test_bench.calculate_prime_numbers

        expect(result).to eq 'Test Bench revs up, and finds 1230 primenumbers between 1 and 10000 in 60.0 seconds.'
      end
    end

    context 'with Gamer Mart\'s offerings' do
      before { generate_pc_stock }

      it 'the rigs perform as advertised' do
        pcs_in_stock = gamer_mart.view_pcs_stock

        results = pcs_in_stock.map(&:calculate_prime_numbers)

        expect(results).to match_array(
          [
            'A Literal Potato revs up, and finds 1230 primenumbers between 1 and 10000 in 599.4 seconds.',
            'The Filthy Casual revs up, and finds 1230 primenumbers between 1 and 10000 in 27.0 seconds.',
            'The N00b Pwn3r revs up, and finds 1230 primenumbers between 1 and 10000 in 0.6 seconds.'
          ]
        )
      end
    end
  end
end
