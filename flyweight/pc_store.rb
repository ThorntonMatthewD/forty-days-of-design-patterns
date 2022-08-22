# frozen_string_literal: true

require_relative 'pc_builder'

# The computer store. The place where everything you actually want is never in stock.
class PCStore
  # Just allowing accessing to the PCBuilder object for testing
  attr_reader :pc_supplier

  def initialize
    @pc_supplier = PCBuilder.new

    @pc_stock = []
  end

  def order_pc(rig_specs)
    @pc_stock << @pc_supplier.get_pc(rig_specs)
  end

  def view_pcs_stock
    @pc_stock
  end

  def num_pcs_in_stock
    @pc_stock.size
  end
end
