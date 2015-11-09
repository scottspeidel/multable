require_relative '../lib/fixed_width_printer'

describe FixedWidthPrinter do

  class TestPrinter
    include FixedWidthPrinter
  end

  context "#print" do

    it "Should print out nothing for nil" do
      expect {TestPrinter.new.print(nil)}.to output('').to_stdout
    end

    it "Should print out ' ' two spaces when given nil,2 " do
      expect {TestPrinter.new.print(nil,2)}.to output('  ').to_stdout
    end

    it "Should print out '1 ' when given 1,2" do
      expect {TestPrinter.new.print(1,2)}.to output('1 ').to_stdout
    end

  end

  context "#print_array" do

    it "Should print out '  1 2 3\n' for [nil,1,2,3]" do
      expect {TestPrinter.new.print_array([nil,1,2,3],2)}.to output("  1 2 3 \n").to_stdout
    end

  end
end
