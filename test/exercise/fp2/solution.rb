module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        execute_block(self, block)
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, item| acc << block.call(item) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, item| item.nil? ? acc : acc << item }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil, &block)
        diminish(self, acc, block)
      end

      private

      def execute_block(collection, block)
        return if collection.empty?

        first, *rest = collection
        block.call(first)
        execute_block(rest, block)
      end

      def diminish(collection, acc, block)
        return acc if collection.empty?

        first, *rest = collection
        acc = acc.nil? ? first : block.call(acc, first)
        diminish(rest, acc, block)
      end
    end
  end
end
