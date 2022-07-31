# frozen_string_literal: true

# The invoker of commands to a trainee
class Trainer
  attr_writer :issue_sit, :issue_spin, :issue_give_paw

  def issue_sit
    @issue_sit.perform_trick
  end

  def issue_spin
    @issue_spin.perform_trick
  end

  def issue_give_paw
    @issue_give_paw.perform_trick
  end
end

# It's me, Matt the Cat Wrangler.
class Matt < Trainer; end
