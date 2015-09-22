class Fish
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  protected def move_step
    rand -1..1
  end

  def move_intention
    [@x + move_step, @y + move_step]
  end

  def move(x, y)
    @x, @y = x, y
  end

  def here?(x, y)
    (@x == x && @y == y)
  end
end



class Pike < Fish
  def initialize(x, y)
    super
  end

  def image
    'Щ'
  end
end



class Carp < Fish
  def initialize(x, y)
    super
  end

  def image
    'К'
  end
end



class Prostranstvo
  def initialize(width = 3, height = 3)
    @width, @height = width, height
  end

  protected def can_move?(x, y)
    (x >= 0 && x < @width && y >= 0 && y < @height)
  end

  protected def fooling_all
    @height.times do |y|
      @width.times do |x|
        yield x, y
      end
    end
  end

  protected def tick
    paint
    sleep 0.7
  end

  protected def location_image(_x, _y)
    '.'
  end

  protected def paint
    fooling_all do |x, y|
      puts if x == 0
      print location_image(x, y), "\s"
    end
    puts
  end


  def time_flow
    tick until collapse?
  end
end



class Ozero < Prostranstvo
  def initialize(width = 3, height = 3)
    super
    @objects = []
  end

  def add_object(object)
    (@objects << object) unless @objects.include?(object)
  end


  protected def location_image(x, y)
    space_cell_image = nil
    @objects.each do |object|
      if object.here?(x, y)
        space_cell_image = (space_cell_image ? '*' : object.image)
      end
    end
    space_cell_image || super
  end

  private def objects_motion
    @objects.each do |object|
      x, y = object.move_intention
      object.move(x, y) if can_move?(x, y)
    end
  end

  protected def tick
    objects_motion
    super
  end

  private def overcrowding?
    (@objects.size >= @width * @height)
  end


  def extinction?
    @objects.empty?
  end


  protected def collapse?
    (overcrowding? || extinction?)
  end
end


width  = 3
height = 3

ozero = Ozero.new(width, height)

ozero.add_object Pike.new(rand(width), rand(height))

ozero.add_object Pike.new(rand(width), rand(height))

ozero.add_object Carp.new(rand(width), rand(height))

ozero.add_object Carp.new(rand(width), rand(height))

ozero.time_flow
