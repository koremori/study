module Exercise
  module Arrays
    class << self
      def replace(array)
        max = max_value(array)
        array.map { |num| num.positive? ? max : num }
      end

      def search(array, query)
        mid = array.size / 2
        return -1 if array.empty?

        case query <=> array[mid]
        when -1
          search(array.take(mid), query)
        when 0
          mid
        when 1
          subs = search(array.drop(mid + 1), query)
          subs == -1 ? -1 : (mid + 1) + subs
        end
      end

      private

      def max_value(array)
        array.inject { |num1, num2| num1 > num2 ? num1 : num2 }
      end
    end
  end
end
