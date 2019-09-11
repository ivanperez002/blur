class Image
  attr_accessor :image
  def initialize (image)
    @image = image
  end

  def output_image
    puts image.map(&:join)
  end

  def manhattan_1
      locations = []
      @image.each_with_index do |row, row_index|
        row.each_with_index do |pixel, pixel_index|
          if pixel == 1
            locations << [row_index, pixel_index]
          end
        end
      end

      locations.each do |row_index, pixel_index|
        @image[row_index][pixel_index - 1] = 1 if pixel_index > 0 
        @image[row_index][pixel_index + 1] = 1 if pixel_index + 1 < @image[0].length
        @image[row_index - 1][pixel_index] = 1 if row_index > 0 
        @image[row_index + 1][pixel_index] = 1 if row_index + 1 < @image[0].length
      end
  end

  def blur(num)
    if num == 1
      manhattan_1
      output_image
    elsif num == 2
      manhattan_1
      manhattan_1
      output_image
    else num == 3
      manhattan_1
      manhattan_1
      manhattan_1
      output_image
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])

image.blur(2)
