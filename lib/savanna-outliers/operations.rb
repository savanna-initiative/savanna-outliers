module Savanna
  module Outliers
    module Operations
      def get_max_outlier
        indexed_array.max[0] if max_outlier?
      end

      def get_min_outlier
        indexed_array.min[0] if min_outlier?
      end

      def get_max_outlier_index
        indexed_array.max[1] if max_outlier?
      end

      def get_min_outlier_index
        indexed_array.min[1] if min_outlier?
      end
    end
  end
end
