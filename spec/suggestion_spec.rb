require 'rspec'
require_relative '../lib/orders/suggestions'

RSpec.describe Suggestions do
  describe '#initialize' do
    context 'When initialized' do
      it 'Creates a order_suggestions variable' do
        suggestion = Suggestions.new
        expect(suggestion.order_suggestions).not_to be nil
      end
    end
  end

  describe '#suggest_order' do
    context 'When the user accepted to be suggested' do
      it 'returns true' do
        suggestion = Suggestions.new
        expect(suggestion.suggest_order('suggest')).to be true
      end
    end

    context 'When the user didn\'t accepted to be suggested' do
      it 'returns false' do
        suggestion = Suggestions.new
        expect(suggestion.suggest_order('no thanks')).to be false
      end
    end
  end

  describe '#food_drinks_suggestion_accepted' do
    context 'When the user accepted to be suggested' do
      it 'returns true' do
        suggestion = Suggestions.new
        expect(suggestion.food_drinks_suggestion_accepted('yes please')).to be true
      end
    end

    context 'When the user didn\'t accepted to be suggested' do
      it 'returns false' do
        suggestion = Suggestions.new
        expect(suggestion.food_drinks_suggestion_accepted('no thanks')).to be false
      end
    end
  end
end
