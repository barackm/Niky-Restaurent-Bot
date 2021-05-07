class Greeting
  def check_greetings(input)
    values = %w[morning raven evening hey hy hi hello]
    return true if values.any? { |value| input.include? value }

    false
  end

  def check_greetings_answer(input)
    values = ['great and you', 'good and you', 'what about', 'what about you', 'and you']
    return true if values.any? { |value| input.include? value }

    false
  end

  def check_bad_news(input)
    values = ['not good', 'im not good', 'im not good', 'bad', 'not okay', 'not well', 'im not well', 'im not well',
              'not really']
    return true if values.any? { |value| input.include? value }

    false
  end

  def check_affirmation(input)
    values = %w[good well ok cool fine great okay hum wonderful exactly absolutly
                sure alright]
    return true if values.any? { |value| input.include? value }

    false
  end

  def ask_for_name(input)
    values = ['what is your name', 'who are you', 'your name', 'called', 'what are you', 'surname']
    return true if values.any? { |value| input.include? value }

    false
  end

  def ask_for_place(input)
    values = ['where are you', 'where', 'are you here', 'are you there', 'you are there', 'can i see you',
              'want to see', 'need to see you', 'must see you', 'wanna see you']
    return true if values.any? { |value| input.include? value }

    false
  end

  def got_name(input)
    values = ['my name', "i'm", 'i am', "i'm called", 'im called', 'call', 'feel free to call', 'is my name']
    return true if values.any? { |value| input.include? value }

    false
  end

  def check_rejection(input)
    values = ['nothing', 'anything', 'any', 'no thanks', 'no', 'sorry', 'no thank you', "i can't", "don't want",
              'dont want', 'can\'t', 'nop', 'absolutly no', 'not really', 'no really']
    return true if values.any? { |value| input.include? value }

    false
  end

  def receive_greetings(input)
    values = ['how are you', 'are you good', 'are you okay', 'are you cool', 'how are you', 'how are you doing', 'are you okay',
              'are you fine', 'how is it', 'whats up', 'whats up', 'how do you do', 'howdy']
    return true if values.any? { |value| input.include? value }

    false
  end

  def get_my_creator(input)
    values = ['who created', 'creates', 'made', 'who is your creator', 'author', 'created', 'who created you',
              'creator', 'create', 'when were you', 'your creator']
    return true if values.any? { |value| input.include? value }

    false
  end

  def say_bye(input)
    values = ['bye', 'goodbye', 'see you', 'ciao', 'adios', 'bye bye']
    return true if values.any? { |value| input.include? value }

    false
  end

  def receive_compliments(input)
    values = ['i love you', 'i appreciate you', 'i appreciate', 'i like you', 'happy to talk']
    return true if values.any? { |value| input.include? value }

    false
  end
end
