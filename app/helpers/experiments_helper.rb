module ExperimentsHelper

  def exisiting_experiments?(exp)
    current_user.experiments.include?(exp)
  end

end
