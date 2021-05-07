# rubocop:disable Layout/LineLength
require_relative './order'

class Suggestions < Order
  attr_reader :order_suggestions

  def initialize
    super
    @order_suggestions = ["Wonderfull, I would suggest you to take Reuben sandwich with a bit of Hot dog 🌭, then a Vodka 😋😋😋.\n\n✅ If you don't like my suggestion then you can try to visit our menu again hopefully you will find something great😋 by just typing 👉 menu.",
                          "Fantastic, I would suggest you to take Cobb Salad along with Modelo Espacial🍾 😋😋😋.\n\n✅ If you don't like my suggestion then you can try to visit our menu again hopefully you will find something great😋 by just typing 👉 menu.",
                          "Okay let's see what we have😋😋😋, you can taste our new dish Macaronni and chees... it's just a wonder😋❤️ and you can add a Bud light🍾 😋😋😋.\n\n✅ If you don't like my suggestion then you can try to visit our menu again hopefully you will find something great😋 by just typing 👉 menu."].sample
  end

  def food_drinks_suggestion_accepted(input)
    values = ['yes', 'yes please', 'no problem', 'okay thanks', 'fine thanks', 'yeah please', 'yeah',
              'yeah thats good']
    return true if values.any? { |value| input.include? value }

    false
  end

  def suggest_order(input)
    values = ['can you suggest', 'suggest', 'suggestion', 'need suggestion', 'need a suggestion', 'suggest me',
              'go ahead', 'idea']
    return true if values.any? { |value| input.include? value }

    false 
  end
end
# rubocop:enable Layout/LineLength
