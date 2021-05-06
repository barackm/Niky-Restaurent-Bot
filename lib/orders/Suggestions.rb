require_relative "./Order.rb"

class Suggestions < Order
    def food_drinks_suggestion_accepted(input)
        values = ['yes','yes please','no problem','okay thanks','fine thanks','yeah please','yeah','yeah thats good',]
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def suggest_order(input)
        values = ['can you suggest','suggest','suggestion','need suggestion','need a suggestion','suggest me','go ahead','idea']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end
end