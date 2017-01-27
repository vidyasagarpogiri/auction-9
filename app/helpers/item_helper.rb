module ItemHelper
  def editable(current_user, item, controller = nil)
    controller != "home" && current_user && current_user.id == item.user_id ||
      admin?
  end

  def deletable(item)
    !item.archived
  end

  def unarchivable(item)
    admin? && item.archived
  end
end
