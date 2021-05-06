class Order 
    def order_asked(input)
        values = ['eat','need to eat','food','meal','wine','coffee','hungry','starving','show menu', 'show the menu','show me the menu','pass order','pass an order','place order','place an order','order','need to pass order','i need to order', 'want to order', 'want to eat', 'whats on the menu', 'want to drink', 'need to drink', 'whats new', 'need food', 'need some drinks', 'wanna eat', 'wanna drink', 'wanna order']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def menu_asked(input)
        values = ['menu']
        if input == values[0]
            return true
        end
        false
    end

    def get_food_order(input)
        values = ['cheeseburger','chicken', 'reuben sandwich', 'reuben', 'sandwish', 'hot dog', 'nachos', 'cobb salad', 'cobb', 'salad', 'twinkies', 'jambalaya', 'macaronni and chees', 'macaronni', 'chees', 'chips', 'cioppino', 'baked beans']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def get_drinks_order(input)
        values = ['water', 'coors light', 'coffee', 'miller lite', 'budweiser', 'modelo espacial', 'bud light', 'vodka']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def say_thank_you(input)
        values = ['thank you', 'thanks']
        if values.any? {|value| input.include? value }
            return true
        end
        false 
    end
end