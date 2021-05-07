require 'rspec'
require_relative '../lib/greetings/greeting'

RSpec.describe Greeting do
  let(:greet) { Greeting.new }
  describe '#check_greetings' do
    let(:values) { ['hello there', 'good morning man', 'good evening Raven', 'hi', 'hey'] }
    context 'When got greetings from the user' do
      it 'returns true' do
        result = greet.check_greetings(values[0])
        expect(result).to be true
      end
    end

    context 'When got defferents messages not regarding greetings' do
      it 'returns false' do
        result = greet.check_greetings('I want to place an order, would you please help me?')
        expect(result).to be false
      end
    end
  end

  describe '#check_greetings_answer' do
    let(:values) { ['great and you', 'good and you', 'what about', 'what about you', 'and you'] }
    context 'When got greeting answer from the user' do
      it 'returns true' do
        result = greet.check_greetings_answer(values[0])
        expect(result).to be true
      end
    end

    context 'When got defferents messages not regarding greeting answer' do
      it 'returns false' do
        result = greet.check_greetings_answer('I need to eat.')
        expect(result).to be false
      end
    end
  end

  describe '#check_bad_news' do
    let(:values) { ['not good', 'im not good', 'im not good'] }
    context 'When got bad information from the user' do
      it 'returns true' do
        result = greet.check_bad_news(values[0])
        expect(result).to be true
      end
    end

    context 'When got other than a bad information' do
      it 'returns false' do
        result = greet.check_bad_news('I am very well thanks.')
        expect(result).to be false
      end
    end
  end

  describe '#check_affirmation' do
    let(:values) { %w[good well ok cool fine great okay] }
    context 'When got an affirmation message from the user' do
      it 'returns true' do
        result = greet.check_affirmation(values[0])
        expect(result).to be true
      end
    end

    context 'When got a different message from a affirmation one' do
      it 'returns false' do
        result = greet.check_affirmation('No')
        expect(result).to be false
      end
    end
  end

  describe '#ask_for_name' do
    let(:values) { ['what is your name', 'who are you', 'your name', 'called', 'what are you', 'surname'] }
    context 'When asked for name' do
      it 'returns true' do
        result = greet.ask_for_name(values[3])
        expect(result).to be true
      end
    end

    context 'When other messages than asking for the name' do
      it 'returns false' do
        result = greet.ask_for_name('Good morning')
        expect(result).to be false
      end
    end
  end

  describe '#receive_compliments' do
    let(:values) { ['i love you', 'i appreciate you', 'i appreciate', 'i like you', 'happy to talk'] }
    context 'When received compliments' do
      it 'returns true' do
        result = greet.receive_compliments(values[2])
        expect(result).to be true
      end
    end

    context 'When received other than compliments' do
      it 'returns false' do
        result = greet.receive_compliments('I hate you')
        expect(result).to be false
      end
    end
  end

  describe '#get_my_creator' do
    let(:values) { ['who created', 'creates', 'made', 'who is your creator', 'created', 'who created you'] }
    context 'When recieved messages about the author or creator' do
      it 'returns true' do
        result = greet.get_my_creator(values[4])
        expect(result).to be true
      end
    end

    context 'When received other than creator informations' do
      it 'returns false' do
        result = greet.get_my_creator('I hate you')
        expect(result).to be false
      end
    end
  end

  describe '#check_rejection' do
    let(:values) { ['nothing', 'anything', 'any', 'no thanks', 'no', 'sorry'] }
    context 'When recieved rejection messages' do
      it 'returns true' do
        result = greet.check_rejection(values[4])
        expect(result).to be true
      end
    end

    context 'When received other rejection informations' do
      it 'returns false' do
        result = greet.check_rejection('I hate you')
        expect(result).to be false
      end
    end
  end
end
