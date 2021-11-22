module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        avg_rating(filter_films(array, 'country', 'rating_kinopoisk'))
      end

      def chars_count(films, threshold)
        find_chars(filter_rating(films, threshold))
      end

      private

      def filter_films(array, *key)
        array.select { |film| !film[key.first].nil? && film[key.first].split(',').size >= 2 && film[key.last].to_f.positive? }
      end

      def avg_rating(array)
        array.inject(0.0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / array.size.to_f
      end

      def filter_rating(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
      end

      def find_chars(films)
        films.inject(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
