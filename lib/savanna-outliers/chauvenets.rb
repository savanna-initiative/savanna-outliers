module Savanna
  module Outliers
    module Chauvenets
      def chauvenets_criterion_min
        delta = (mean - array.min).abs
        (1/standard_deviation)*Statistics3.normaldist((delta - mean)/standard_deviation)*size
      end

      def chauvenets_criterion_max
        delta = (mean - array.max).abs
        (1/standard_deviation)*Statistics3.normaldist((delta - mean)/standard_deviation)*size
      end

      def outliers_chauvenets?
        @outliers_chauvenets ||= max_outlier_chauvenets? or min_outlier_chauvenets?
      end

      def max_outlier_chauvenets?
        @max_outliers_chauvenets ||= chauvenets_criterion_max < 0.5
      end

      def min_outlier_chauvenets?
        @min_outliers_chauvenets ||= chauvenets_criterion_min < 0.5
      end
    end
  end
end
