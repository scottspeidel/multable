require_relative 'fixed_width_printer'

class Multable
include FixedWidthPrinter

  def initialize(arr_of_n)
    if arr_of_n.empty?
      @table = [] if arr_of_n.empty?
      return
    end
    @dimension = arr_of_n.length + 1
    @table = Array.new(@dimension){Array.new(@dimension)}
    create_column_factors(arr_of_n)
    copy_column_factors_to_row_factors
    fill_in_table
  end

  def to_a
    @table
  end

  def print_table
    width = largest_number_width + 2
    @table.each do |row|
      print_array(row, width)
    end
  end

  private

  def largest_number_width
    return 0 if @table.empty?
    largest_number = @table[@dimension - 1][@dimension - 1]
    Integer(Math.log10(largest_number)) + 1
  end

  def fill_in_table
    (@dimension - 1).downto(1) do |y|
      (y).downto(1) do |x|
        multiply_factors_and_store(x,y)
      end
    end
  end

  def multiply_factors_and_store(x,y)
    @table[x][y] = @table[x][0] * @table[0][y]
    mirror(x,y) if x != y
  end


  def create_column_factors(arr_of_n)
    @table[0] = [nil] + arr_of_n
  end

  def copy_column_factors_to_row_factors
    (1..@dimension-1).each do |x|
      y = 0
      mirror(y,x)
    end
  end

  def mirror(x,y)
    @table[y][x] = @table[x][y]
  end

end
