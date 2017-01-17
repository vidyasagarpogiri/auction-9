module ItemHelper
  def editable(current_user, item, controller = nil)
    controller != "home" && current_user && current_user.id == item.user_id
  end
end
