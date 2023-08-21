# frozen_string_literal: true

# a flat plank class
class Plank
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end

# a bulky plank class
class Plank3D < Plank
  attr_reader :thickness

  def initialize(width, height, thickness)
    super(width, height)
    @thickness = thickness
  end

  def volume
    @width * @height * @thickness
  end
end
