module TopsHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      :confirm_tops
    elsif action_name == "edit"
      :top
    end
  end
end
