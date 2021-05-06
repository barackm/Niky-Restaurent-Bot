require_relative "./Order.rb"

class Suggestions < Order
    def food_drinks_suggestion_accepted(input)
        values = ['yes please','no problem','okay thanks','fine thanks','yeah please','yeah','yeah thats good',]
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end
end