module Savanna
  module Outliers
    module GeneralParameters
      def size
        @size ||= array.size
      end

      def mean
        @mean ||= array.mean
      end

      def set_mean(m)
        @mean = m
      end

      def set_standard_deviation(sd)
        @standard_deviation = sd
      end

      def standard_deviation
        @standard_deviation ||= array.standard_deviation
      end
    end
  end
end
