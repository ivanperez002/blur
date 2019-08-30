class Image
  attr_accessor :image
  def initialize (image)
    @image = image
    @image2 = image
  end

  def output_image
    puts @image.map(&:join)
  end

  def find_one
    locations = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        if pixel == 1
          locations << [row_index, pixel_index]
        end
      end
    end

    locations.each do |row_index, pixel_index|
      @image2[row_index][pixel_index - 1] = 1 if pixel_index > 0 
      @image2[row_index][pixel_index + 1] = 1 if pixel_index + 1 < @image2[0].length
      @image2[row_index - 1][pixel_index] = 1 if row_index > 0 
      @image2[row_index + 1][pixel_index] = 1 if row_index + 1 < @image2[0].length
    end
    puts @image2.map(&:join)
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 1, 0, 0]
])

image.find_one
