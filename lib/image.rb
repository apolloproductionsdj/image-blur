class Image

  def initialize(image_data)
    @image_data = image_data
  end

  def output_image
    @image_data.each do |row|
      puts row.join
    end
  end
=begin
  def blur!(blur_depth=1)
    blur_depth.times do
      blur_coords!
    end
  end
=end 

  #private

    def blur_coords!
      blur_coords = []
      @image_data.each_with_index do |row, row_i|
        # row == [0, 1, 0, 0] row_i == 1
        row.each_with_index do |value, value_i|
          # value == 1, value_i == 1
          blur_coords << [row_i, value_i] if value == 1
           # blur_coords == [[1,1],[2,3]]
        end
      end

      blur_coords.each do |coord|
        # coord == [1,1]; and then coord [2,3]
        x = coord[0]
        y = coord[1]
        @image_data[x][y + 1] = 1 if y + 1 <= @image_data[x].length - 1
        # y is the inner array. It moves to the right 1 since we are adding 1 to it 
        @image_data[x][y - 1] = 1 if y - 1 >= 0
        # y is the inner array. It moves to the left 1 since we are subtracting 1 from it
        @image_data[x + 1][y] = 1 if x + 1 <= @image_data.length - 1
        # x is the name of the row in the array. We go down 1 since we are adding 1 to it
        @image_data[x - 1][y] = 1 if x - 1 >= 0
        # x is the name of the row in the array. We go up 1 since we are subtracting 1 to it
      end
    end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
])
image.blur_coords!
image.output_image
