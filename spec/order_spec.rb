require 'rspec'
require_relative '../lib/orders/order'

RSpec.describe Order do
  let(:order) { Order.new }
  describe '#order_asked' do
    let(:values) { ['eat', 'need to eat', 'food', 'meal', 'wine', 'coffee', 'hungry', 'starving'] }
    context 'When recieved a message asking for order' do
      it 'returns true' do
        result = order.order_asked(values[1])
        expect(result).to be true
      end
    end

    context 'When not asking for order' do
      it 'returns false' do
        result = order.order_asked('nothing')
        expect(result).to be false
      end
    end
  end

  describe '#menu_asked' do
    let(:values) { ['menu', 'show me the menu', 'show menu', 'whats on the menu'] }
    context 'When recieved a message asking for the menu' do
      it 'returns true' do
        result = order.menu_asked('I need to see your menu')
        expect(result).to be true
      end
    end

    context 'When not asking for the menu' do
      it 'returns false' do
        result = order.menu_asked('hello dude')
        expect(result).to be false
      end
    end
  end

  describe '#get_food_order' do
    context 'When recieved a message asking for food' do
      it 'returns true' do
        result = order.get_food_order('I want cheeseburger')
        expect(result).to be true
      end
    end

    context 'When not asking for order' do
      it 'returns false' do
        result = order.get_food_order('I want to dance')
        expect(result).to be false
      end
    end
  end

  describe '#get_drinks_order' do
    context 'When recieved a message asking for some drinks' do
      it 'returns true' do
        result = order.get_drinks_order('I want to take vodka')
        expect(result).to be true
      end
    end

    context 'When not asking for some thing to drink' do
      it 'returns false' do
        result = order.get_drinks_order('how are you today?')
        expect(result).to be false
      end
    end
  end

  describe '#help_asked' do
    context 'When recieved a message asking for help' do
      it 'returns true' do
        result = order.help_asked('I need a help from you man')
        expect(result).to be true
      end
    end

    context 'When not asking for help' do
      it 'returns false' do
        result = order.help_asked('bye bye')
        expect(result).to be false
      end
    end
  end

  describe '#say_thank_you' do
    context 'When recieved a message saying thank you' do
      it 'returns true' do
        result = order.say_thank_you('I thank you very much')
        expect(result).to be true
      end
    end

    context 'When not saying thank you' do
      it 'returns false' do
        result = order.say_thank_you('bye bye')
        expect(result).to be false
      end
    end
  end
end
