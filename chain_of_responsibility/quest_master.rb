# frozen_string_literal: true

# An ancient wizard who beckons adventurers to embark on a journey to slay a dragon
class QuestMaster
  def initialize(dragon)
    @dragon = dragon
  end

  def issue_quest(_adventurer)
    puts ''
  end
end
