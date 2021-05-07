# rubocop:disable Layout/LineLength

class Order
  def order_asked(input)
    values = ['eat', 'need to eat', 'food', 'meal', 'wine', 'coffee', 'hungry', 'starving',
              'pass order', 'pass an order', 'place order', 'place an order', 'order', 'need to pass order', 'i need to order', 'want to order', 'want to eat', 'want to drink', 'need to drink', 'whats new', 'need food', 'need some drinks', 'wanna eat', 'wanna drink', 'wanna order']
    return true if values.any? { |value| input.include? value }

    false
  end

  def menu_asked(input)
    values = ['menu', 'show me the menu', 'show menu', 'whats on the menu']
    return true if values.any? { |value| input.include? value }

    false
  end

  def get_food_order(input)
    values = ['cheeseburger', 'chicken', 'reuben sandwich', 'reuben', 'sandwish', 'hot dog', 'nachos', 'cobb salad',
              'cobb', 'salad', 'twinkies', 'jambalaya', 'macaronni and chees', 'macaronni', 'chees', 'chips', 'cioppino', 'baked beans', 'beans']
    return true if values.any? { |value| input.include? value }

    false
  end

  def get_drinks_order(input)
    values = ['water', 'coors light', 'coffee', 'miller lite', 'budweiser', 'modelo espacial', 'bud light', 'vodka', 'beer']
    return true if values.any? { |value| input.include? value }

    false
  end

  def help_asked(input)
    values = ['help', 'need help', 'assistance']
    return true if values.any? { |value| input.include? value }

    false
  end

  def say_thank_you(input)
    values = ['thank you', 'thanks']
    return true if values.any? { |value| input.include? value }

    false 
  end
end

# rubocop:enable Layout/LineLength
