module ExperimentsHelper

  def existing_experiments?(exp)
    current_user.experiments.include?(exp)
  end

end
