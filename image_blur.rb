class Image
  attr_accessor :image
  def initialize (image)
    @image = image
  end

  def output_image
    puts @image.map(&:join)
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image



