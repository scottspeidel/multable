module FixedWidthPrinter

    def print(value,width=0)
      printf "%-#{width}s", value
    end

    def print_array(array,width=0)
      array.each do |e|
        print(e,width)
      end
      printf "\n"
    end

end
