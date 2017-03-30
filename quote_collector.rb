require_relative 'multilinguist'


class QuoteCollector < Multilinguist

  def initialize
    @local_lang = 'en'
    @collection = [{quote: "Hello, World", author: "Anonymous", subject: :general}]
  end

  def collect_quote(quote, author = "Anonymous", subject = :general)
    @collection << {quote: quote.to_s, author: author, subject: subject}
  end

  def say_random
    index=rand(@collection.length)
    if (@collection[index][:author] == "Anonymous")
      self.say_in_local_language("A wise person once said: \"#{@collection[index][:quote]}\"")
    else
      self.say_in_local_language("According to #{@collection[index][:author]}: \"#{@collection[index][:quote]}\"")
    end
  end

end

qq = QuoteCollector.new
qq.say_random
