require_relative 'multilinguist'


class QuoteCollector < Multilinguist

  # attr_accessor :collection

  def initialize
    super
    @collection = [{quote: "Hello, World!", author: "Anonymous", subject: :general}]
  end

  def collect_quote(quote, author = "Anonymous", subject = :general)
    @collection << {quote: quote.to_s, author: author, subject: subject}
  end

  def say_random
    index=rand(@collection.length)
    if (@collection[index][:author] == "Anonymous")
      self.say_in_local_language("A wise person once said: \"#{@collection[index][:quote]}\"")
    else
      self.say_in_local_language("#{@collection[index][:author]} once said: \"#{@collection[index][:quote]}\"")
    end
  end

end

qq = QuoteCollector.new
puts qq.say_random
qq.collect_quote("I love Lasagna!", "Garfield", :food)
puts qq.say_random
qq.travel_to("India")
puts qq.say_random
qq.travel_to("India")
puts qq.say_random
