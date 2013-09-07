require 'descriptive_statistics/safe'
require 'statistics2'

module Savanna
  class Outliers
    attr_reader :array

    def initialize(input_array)
      @array = input_array.extend(DescriptiveStatistics)
    end

    ##
    # Core Methods

    def outliers?(method = :grubbs)
      case
        when method == :grubbs then outliers_grubbs?
        when method == :chauvenets then outliers_chauvenets?
      end
    end

    def max_outlier?(method = :grubbs)
      case
        when method == :grubbs then max_outlier_grubbs?
        when method == :chauvenets then max_outlier_chauvenets?
      end
    end

    def min_outlier?(method = :grubbs)
      case
        when method == :grubbs then min_outlier_grubbs?
        when method == :chauvenets then min_outlier_chauvenets?
      end
    end

    ##
    # General Parameters

    def size
      @size ||= array.size
    end

    def mean
      @mean ||= array.mean
    end

    def standard_deviation
      @standard_deviation ||= array.standard_deviation
    end

    ##
    # Grubbs Test

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
      t = Statistics2.ptdist(n-2,alpha/(2*n))**2
      b = Math.sqrt( t/(n-2+t) )
      a*b
    end

    def grubbs_one_sided_test(n = size, alpha = 0.05)
      a = (n - 1)/Math.sqrt(n)
      t = Statistics2.ptdist(n-2,alpha/n)**2
      b = Math.sqrt( t/(n-2+t) )
      a*b
    end

    def outliers_grubbs?
      grubbs_test_statistic > grubbs_two_sided_test
    end

    def max_outlier_grubbs?
      grubbs_test_statistic_maximum > grubbs_one_sided_test
    end

    def min_outlier_grubbs?
      grubbs_test_statistic_minimum > grubbs_one_sided_test
    end

    ##
    # Chauvenet's criterion

    def chauvenets_criterion_min
      delta = (mean - array.min).abs
      (1/standard_deviation)*Statistics2.normaldist((delta - mean)/standard_deviation)*size
    end

    def chauvenets_criterion_max
      delta = (mean - array.max).abs
      (1/standard_deviation)*Statistics2.normaldist((delta - mean)/standard_deviation)*size
    end

    def outliers_chauvenets?
      max_outlier_chauvenets? or min_outlier_chauvenets?
    end

    def max_outlier_chauvenets?
      chauvenets_criterion_max < 0.5
    end

    def min_outlier_chauvenets?
      chauvenets_criterion_min < 0.5
    end
  end
end
