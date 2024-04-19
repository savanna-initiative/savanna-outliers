module Savanna
  module Outliers
    module Grubbs
      def grubbs_test_statistic
        array.map{|el| (el - mean).abs}.max/standard_deviation
      end

      def grubbs_test_statistic_maximum
        (array.max - mean)/standard_deviation
      end

      def grubbs_test_statistic_minimum
        (mean - array.min)/standard_deviation
      end

      def grubbs_two_sided_test(n = size, alpha = 0.05)
        a = (n - 1)/Math.sqrt(n)
        t = Statistics3.ptdist(n-2,alpha/(2*n))**2
        b = Math.sqrt( t/(n-2+t) )
        a*b
      end

      def grubbs_one_sided_test(n = size, alpha = 0.05)
        a = (n - 1)/Math.sqrt(n)
        t = Statistics3.ptdist(n-2,alpha/n)**2
        b = Math.sqrt( t/(n-2+t) )
        a*b
      end

      def outliers_grubbs?
        @outliers_grubbs ||= grubbs_test_statistic > grubbs_two_sided_test
      end

      def max_outlier_grubbs?
        @max_outliers_grubbs ||= grubbs_test_statistic_maximum > grubbs_one_sided_test
      end

      def min_outlier_grubbs?
        @min_outliers_grubbs ||= grubbs_test_statistic_minimum > grubbs_one_sided_test
      end
    end
  end
end
