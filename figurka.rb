class  Figure
	attr_accessor :color
end

class Rectangle < Figure
attr_accessor :width
attr_accessor :height
	def sqr
	x = @width * @height
end
end

class Circle < Figure
	attr_accessor :radius
	attr_accessor :p
	def sqr
	x = @radius * @p
end
end

rectangle1 = Rectangle.new
rectangle1.color = 'цвет-красный'
rectangle1.width = 10
rectangle1.height = 20

circle1 = Circle.new
circle1.color = 'цвет-зеленый'
circle1.radius = 50 * 50
circle1.p = 3.14

puts "Прямоугольник: #{rectangle1.color},площадь #{rectangle1.sqr}кв.см."
puts "Окружность:#{circle1.color},площадь #{circle1.sqr}кв.см."