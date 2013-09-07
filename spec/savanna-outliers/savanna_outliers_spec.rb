require 'spec_helper'

describe 'Savanna Outliers' do
  before(:all) do
    @simple_example = Savanna::Outliers.new([1,2,3,4,5,100,200,300])
    @min_outlier_example = Savanna::Outliers.new([-30,20,25,19,21,22,23,18])
    @max_outlier_example = Savanna::Outliers.new([100,20,25,19,21,22,23,18])
    @min_max_outlier_example = Savanna::Outliers.new([100,20,25,19,21,22,23,18,1])
  end

  it 'should return array' do
    @simple_example.array.should == [1,2,3,4,5,100,200,300]
  end

  it 'should return size' do
    @simple_example.size.should == 8
  end

  it 'should return mean' do
    @simple_example.mean.should == 76.875
  end

  it 'should return standard deviation' do
    @simple_example.standard_deviation.should == 107.68987591691246
  end

  it 'should calculate grubbs test statistic' do
    @simple_example.grubbs_test_statistic.should == 2.0719217855924628
  end

  it 'should calculate grubbs test statistic for maximum' do
    @simple_example.grubbs_test_statistic_maximum.should == 2.0719217855924628
  end

  it 'should calculate grubbs test statistic for minimum' do
    @simple_example.grubbs_test_statistic_minimum.should == 0.7045694811510503
  end

  it 'should calculate grubbs two sided test' do
    @simple_example.grubbs_two_sided_test(3,0.05).should == 1.1543048503229865
    @simple_example.grubbs_two_sided_test(10).should == 2.289952254608721
  end

  it 'should calculate grubbs one sided test' do
    @simple_example.grubbs_one_sided_test(3,0.05).should == 1.1531180570049688
    @simple_example.grubbs_one_sided_test(10).should == 2.176061415982935
  end

  it 'should identify outliers existance with grubbs' do
    @min_max_outlier_example.outliers_grubbs?.should == true
    @min_max_outlier_example.outliers?(:grubbs).should == true
  end

  it 'should identify min outlier existance with grubbs' do
    @min_outlier_example.min_outlier_grubbs?.should == true
    @min_outlier_example.min_outlier?(:grubbs).should == true
  end

  it 'should identify max outlier existance with grubbs' do
    @max_outlier_example.max_outlier_grubbs?.should == true
    @max_outlier_example.max_outlier?(:grubbs).should == true
  end

  it 'should identify outliers existance with chauvenets' do
    @min_max_outlier_example.outliers_chauvenets?.should == true
    @min_max_outlier_example.outliers?(:chauvenets).should == true
  end

  it 'should identify min outlier existance with chauvenets' do
    @min_outlier_example.min_outlier_chauvenets?.should == true
    @min_outlier_example.min_outlier?(:chauvenets).should == true
  end

  it 'should identify max outlier existance with chauvenets' do
    @max_outlier_example.max_outlier_chauvenets?.should == true
    @max_outlier_example.max_outlier?(:chauvenets).should == true
  end
end
