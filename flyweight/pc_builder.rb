# frozen_string_literal: true

require_relative 'gaming_pc'

# A builder of gaming PCs.
class PCBuilder
  def initialize
    @pc_builds = {}
  end

  def get_pc(rig_specs)
    return @pc_builds[rig_specs] if @pc_builds.key?(rig_specs)

    @pc_builds[rig_specs] = build_pc(rig_specs)
    @pc_builds[rig_specs]
  end

  def num_pcs_builds_available
    @pc_builds.size
  end

  private

  def build_pc(rig_specs)
    GamingPC.new(rig_specs)
  end
end
