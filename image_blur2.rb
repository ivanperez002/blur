class Image
  attr_accessor :image
  def initialize (image)
    @image = image
  end

  def output_image
    puts @image.map(&:join)
  end

  def find_one
    locations = []
    
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        if pixel == 1
          @image[row_index][pixel_index - 1] = 2 if pixel_index > 0 && @image[row_index][pixel_index - 1] == 0
          @image[row_index][pixel_index + 1] = 2 if pixel_index + 1 < row.length && @image[row_index][pixel_index + 1] == 0
          @image[row_index - 1][pixel_index] = 2 if row_index > 0  && @image[row_index - 1][pixel_index] == 0
          @image[row_index + 1][pixel_index] = 2 if row_index + 1 < row.length && @image[row_index + 1][pixel_index] == 0
        end
      end
    end

    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        if pixel >= 1
          @image[row_index][pixel_index] = 1
        end
      end
    end
    puts @image.map(&:join)
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
])

image.find_one


