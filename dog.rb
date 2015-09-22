require 'byebug'

class Dog
  def inirialize
  	@color = 'brown'
  end

  def color=(x)
  	if x == 'brown' || x == 'black'
  	  @color = x
  	else
  	  raise 'Error color!!!'
  	end
  end
end
# byebug
# dog = Dog.new
# dog.color = 'red'