module ApplicationHelper
  def back_path
    request.referer.present? ? request.referer : browse_path
  end
end
