module HomeHelper
  def formatted_address(item)
    "#{item.address} #{item.city}, #{item.state} #{item.zip}"
  end

  def delivery_option(item)
    if item.delivery
      'Delivery available'
    else
      'Pick up required'
    end
  end
end
