require 'descriptive_statistics/safe'
require 'statistics3'
require 'savanna-outliers/general_parameters'
require 'savanna-outliers/grubbs'
require 'savanna-outliers/chauvenets'
require 'savanna-outliers/operations'

module Savanna
  module Outliers
    class Core
      include Savanna::Outliers::GeneralParameters
      include Savanna::Outliers::Grubbs
      include Savanna::Outliers::Chauvenets
      include Savanna::Outliers::Operations
      attr_reader :array
      attr_accessor :method
      def initialize(input_array, method = :grubbs)
        @array = input_array.extend(DescriptiveStatistics)
        @method = method
      end

      def outliers?
        case
          when method == :grubbs then outliers_grubbs?
          when method == :chauvenets then outliers_chauvenets?
        end
      end

      def max_outlier?
        case
          when method == :grubbs then max_outlier_grubbs?
          when method == :chauvenets then max_outlier_chauvenets?
        end
      end

      def min_outlier?
        case
          when method == :grubbs then min_outlier_grubbs?
          when method == :chauvenets then min_outlier_chauvenets?
        end
      end

      private

      def indexed_array
        @indexed_array ||= array.each_with_index
      end
    end
  end
end
