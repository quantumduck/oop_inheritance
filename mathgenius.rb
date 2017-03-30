require_relative 'multilinguist' 


class MathGenius < Multilinguist

  def report_total(numbers)
    if (numbers.class == Array)
      total = 0
      numbers.each do |num|
        total += num.to_i
      end
      self.say_in_local_language("The total is #{total}")
    else
      return nil
    end
  end
end

me = MathGenius.new
puts me.report_total([23,45,676,34,5778,4,23,5465]) # The total is 12048
me.travel_to("India")
puts me.report_total([6,3,6,68,455,4,467,57,4,534]) # है को कुल 1604
me.travel_to("Italy")
puts me.report_total([324,245,6,343647,686545]) # È Il totale 1030767
