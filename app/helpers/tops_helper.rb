module TopsHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      :confirm_tops
    elsif action_name == "edit"
      [:confirm, @top]
    end
  end

  def return_new_or_edit
    unless @top.id?
      :tops
    else
      :top
    end
  end

  def confirm_from_method
    @top.id ? "patch" : "post"
  end
end
