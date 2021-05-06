class Greeting 
    def check_greetings(input)
        values = ['morning','raven','evening','hey','hy','hi','hello','how do you do', 'howdy']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def check_greetings_answer(input)
        values = ['how are','great and you','good and you','what about','what about you', 'and you',]
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def check_bad_news(input)
        values = ['not good','bad','not okay','not well', 'not really',]
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def check_affirmation(input)
        values = ['good', 'well','ok', 'cool','fine', 'great', 'okay', 'hum', 'wonderful', 'exactly', 'absolutly', 'sure']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def ask_for_name(input)
        matcher = /(?=.*(what is|who|are|your))(?=.*(name|called|call|you)).*/
        if input.downcase.match(matcher)
            return true
        end
        false
    end

    def got_name(input)
        values = ['my name', "i'm", 'i am',"i'm called", 'im called', 'call', 'feel free to call', 'is my name']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def check_rejection(input)
        values = ['nothing','anything','any', 'no thanks','no', 'sorry', "no thank you", "i can't", "don't want", 'dont want', 'can\'t', 'nop', 'absolutly no', 'not really', 'no really']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end

    def receive_greetings(input)
        values = ['how are you', "are you okay", "are you cool", 'how are you', 'how are you doing', 'are you okay', 'are you fine', 'how is it', "what's up", 'whats up', 'how do you do']
        if values.any? {|value| input.include? value }
            return true
        end
        false
    end
end