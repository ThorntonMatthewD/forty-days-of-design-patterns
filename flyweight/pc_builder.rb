# frozen_string_literal: true

require_relative 'gaming_pc'

# The computer store. The place where everything you actually want is never in stock.
class PCStore
  def initialize(initial_pc_shipment)
    @pc_stock = {}
    initial_pc_shipment.each do |specs|
      @pc_stock[get_key(specs)] = GamingPC.new(state)
    end
  end
end
