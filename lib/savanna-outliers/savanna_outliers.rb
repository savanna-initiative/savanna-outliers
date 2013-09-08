require 'savanna-outliers/core'

module Savanna
  module Outliers
    self.extend Savanna::Outliers

    def any_outliers?(dataset, type = :all, method = :grubbs)
      values = dataset.is_a?(Hash) ? dataset.values : dataset
      m = type == :all ? "outliers?" : "#{type}_outlier?"
      Core.new(values, method).send(m)
    end

    def get_outliers(dataset, type = :all, method = :grubbs)
      self.send("get_#{type}_outliers_from_#{dataset.class.to_s.downcase}", dataset, method)
    end

    def remove_outliers(dataset, type = :all, method = :grubbs)
      self.send("remove_#{type}_outliers_from_#{dataset.class.to_s.downcase}", dataset, method)
    end

    private

    def get_max_outliers_from_array(array, method)
      input_array = array.clone; outliers = []
      outliers << input_array.delete_at(Core.new(input_array, method).get_max_outlier_index) while Core.new(input_array, method).max_outlier?
      outliers
    end

    def get_min_outliers_from_array(array, method)
      input_array = array.clone; outliers = []
      outliers << input_array.delete_at(Core.new(input_array, method).get_min_outlier_index) while Core.new(input_array, method).min_outlier?
      outliers
    end

    def get_all_outliers_from_array(array, method)
      get_max_outliers_from_array(array, method) + get_min_outliers_from_array(array, method)
    end

    def get_max_outliers_from_hash(hash, method)
      keys_array = hash.keys; input_array = hash.values
      output_keys = []; output_values = []
      while Core.new(input_array, method).max_outlier?
        index = Core.new(input_array, method).get_max_outlier_index
        output_values << input_array.delete_at(index)
        output_keys << keys_array.delete_at(index)
      end
      build_hash(output_keys, output_values)
    end

    def get_min_outliers_from_hash(hash, method)
      keys_array = hash.keys; input_array = hash.values
      output_keys = []; output_values = []
      while Core.new(input_array, method).min_outlier?
        index = Core.new(input_array, method).get_min_outlier_index
        output_values << input_array.delete_at(index)
        output_keys << keys_array.delete_at(index)
      end
      build_hash(output_keys, output_values)
    end

    def get_all_outliers_from_hash(hash, method)
      get_max_outliers_from_hash(hash, method).merge(get_min_outliers_from_hash(hash, method))
    end

    def remove_max_outliers_from_array(array, method)
      input_array = array.clone
      input_array.delete_at(Core.new(input_array, method).get_max_outlier_index) while Core.new(input_array, method).max_outlier?
      input_array
    end

    def remove_min_outliers_from_array(array, method)
      input_array = array.clone
      input_array.delete_at(Core.new(input_array, method).get_min_outlier_index) while Core.new(input_array, method).min_outlier?
      input_array
    end

    def remove_all_outliers_from_array(array, method)
      array - get_all_outliers_from_array(array, method)
    end

    def remove_max_outliers_from_hash(hash, method)
      keys_array = hash.keys; input_array = hash.values
      while Core.new(input_array, method).max_outlier?
        index = Core.new(input_array, method).get_max_outlier_index
        input_array.delete_at(index)
        keys_array.delete_at(index)
      end
      build_hash(keys_array, input_array)
    end

    def remove_min_outliers_from_hash(hash, method)
      keys_array = hash.keys; input_array = hash.values
      while Core.new(input_array, method).min_outlier?
        index = Core.new(input_array, method).get_min_outlier_index
        input_array.delete_at(index)
        keys_array.delete_at(index)
      end
      build_hash(keys_array, input_array)
    end

    def remove_all_outliers_from_hash(hash, method)
      get_all_outliers_from_hash(hash, method).keys.each do |key|
        hash.tap { |hs| hs.delete(key) }
      end
      hash
    end

    def build_hash(keys, values)
      output_hash = {}
      keys.each_index{|i| output_hash[keys[i]] = values[i]}
      output_hash
    end
  end
end
