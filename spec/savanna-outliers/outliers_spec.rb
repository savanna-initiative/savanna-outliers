require 'spec_helper'

describe 'Savanna Outliers' do

  it 'should identify any outliers existance' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
    Savanna::Outliers.outliers?(array_one, :all, :grubbs).should == true
    Savanna::Outliers.outliers?(hash_one, :all, :grubbs).should == true
  end

  it 'should identify max outliers existance' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
    Savanna::Outliers.outliers?(array_one, :max, :grubbs).should == true
    Savanna::Outliers.outliers?(hash_one, :max, :grubbs).should == true
    Savanna::Outliers.outliers?(array_one, :max).should == true
    Savanna::Outliers.outliers?(hash_one, :max).should == true
  end

  it 'should identify min outliers existance' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 12, 10, -1100, 9, -5000]
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 12, k: 10, l: -1100, m: 9, n: -5000}
    Savanna::Outliers.outliers?(array_one, :min, :grubbs).should == true
    Savanna::Outliers.outliers?(hash_one, :min, :grubbs).should == true
    Savanna::Outliers.outliers?(array_one, :min).should == true
    Savanna::Outliers.outliers?(hash_one, :min).should == true
  end

  it 'should return max outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
    array_two = [20, 30, 100, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15, 90]
    Savanna::Outliers.get_outliers(array_one, :max, :grubbs).should == [5000, 1100, 1000]
    Savanna::Outliers.get_outliers(array_two, :max, :grubbs).should == [100, 90]
    Savanna::Outliers.get_outliers(array_one, :max).should == [5000, 1100, 1000]
    Savanna::Outliers.get_outliers(array_two, :max).should == [100, 90]
  end

  it 'should return min outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 12, 10, -1100, 9, -5000]
    array_two = [20, 30, -100, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15, -90]
    Savanna::Outliers.get_outliers(array_one, :min, :grubbs).should == [-5000, -1100, -1000]
    Savanna::Outliers.get_outliers(array_two, :min, :grubbs).should == [-100, -90]
    Savanna::Outliers.get_outliers(array_one, :min).should == [-5000, -1100, -1000]
    Savanna::Outliers.get_outliers(array_two, :min).should == [-100, -90]
  end

  it 'should return all outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 1000, 12, 10, 9]
    array_two = [20, 30, -100, 140, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
    Savanna::Outliers.get_outliers(array_one, :all, :grubbs).should == [1000, -1000]
    Savanna::Outliers.get_outliers(array_two, :all, :grubbs).should == [140, -100]
    Savanna::Outliers.get_outliers(array_one, :all).should == [1000, -1000]
    Savanna::Outliers.get_outliers(array_two, :all).should == [140, -100]
  end


  it 'should return max outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
    hash_two = {a: 20, b: 30, c: 100, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15, o: 90}
    Savanna::Outliers.get_outliers(hash_one, :max, :grubbs).should == {n: 5000, l: 1100, i: 1000}
    Savanna::Outliers.get_outliers(hash_two, :max, :grubbs).should == {c: 100, o: 90}
    Savanna::Outliers.get_outliers(hash_one, :max).should == {n: 5000, l: 1100, i: 1000}
    Savanna::Outliers.get_outliers(hash_two, :max).should == {c: 100, o: 90}
  end

  it 'should return min outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 12, k: 10, l: -1100, m: 9, n: -5000}
    hash_two = {a: 20, b: 30, c: -100, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15, o: -90}
    Savanna::Outliers.get_outliers(hash_one, :min, :grubbs).should == {n: -5000, l: -1100, i: -1000}
    Savanna::Outliers.get_outliers(hash_two, :min, :grubbs).should == {c: -100, o: -90}
    Savanna::Outliers.get_outliers(hash_one, :min).should == {n: -5000, l: -1100, i: -1000}
    Savanna::Outliers.get_outliers(hash_two, :min).should == {c: -100, o: -90}
  end

  it 'should return all outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 1000, k: 12, l: 10, m: 9}
    hash_two = {a: 20, b: 30, c: -100, d: 140, e: 10, f: 15, g: 10, h: 12, i: 13, j: 5, k: 25, l: 40, m: 35, n: 22, o: 15}
    Savanna::Outliers.get_outliers(hash_one, :all, :grubbs).should == {j: 1000, i: -1000}
    Savanna::Outliers.get_outliers(hash_two, :all, :grubbs).should == {d: 140, c: -100}
    Savanna::Outliers.get_outliers(hash_one, :all).should == {j: 1000, i: -1000}
    Savanna::Outliers.get_outliers(hash_two, :all).should == {d: 140, c: -100}
  end

###############################

  it 'should remove max outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
    array_two = [20, 30, 100, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15, 90]
    Savanna::Outliers.remove_outliers(array_one, :max, :grubbs).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :max, :grubbs).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
    Savanna::Outliers.remove_outliers(array_one, :max).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :max).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
  end

  it 'should remove min outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 12, 10, -1100, 9, -5000]
    array_two = [20, 30, -100, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15, -90]
    Savanna::Outliers.remove_outliers(array_one, :min, :grubbs).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :min, :grubbs).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
    Savanna::Outliers.remove_outliers(array_one, :min).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :min).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
  end

  it 'should remove all outliers from array' do
    array_one = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 1000, 12, 10, 9]
    array_two = [20, 30, -100, 140, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
    Savanna::Outliers.remove_outliers(array_one, :all, :grubbs).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :all, :grubbs).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
    Savanna::Outliers.remove_outliers(array_one, :all).should == [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]
    Savanna::Outliers.remove_outliers(array_two, :all).should == [20, 30, 10, 15, 10, 12, 13, 5, 25, 40, 35, 22, 15]
  end


  it 'should remove max outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
    hash_two = {a: 20, b: 30, c: 100, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15, o: 90}
    Savanna::Outliers.remove_outliers(hash_one, :max, :grubbs).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :max, :grubbs).should == {a: 20, b: 30, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15}
    Savanna::Outliers.remove_outliers(hash_one, :max).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :max).should == {a: 20, b: 30, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15}
  end

  it 'should remove min outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 12, k: 10, l: -1100, m: 9, n: -5000}
    hash_two = {a: 20, b: 30, c: -100, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15, o: -90}
    Savanna::Outliers.remove_outliers(hash_one, :min, :grubbs).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :min, :grubbs).should == {a: 20, b: 30, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15}
    Savanna::Outliers.remove_outliers(hash_one, :min).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :min).should == {a: 20, b: 30, d: 10, e: 15, f: 10, g: 12, h: 13, i: 5, j: 25, k: 40, l: 35, m: 22, n: 15}
  end

  it 'should remove all outliers from hash' do
    hash_one = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 1000, k: 12, l: 10, m: 9}
    hash_two = {a: 20, b: 30, c: -100, d: 140, e: 10, f: 15, g: 10, h: 12, i: 13, j: 5, k: 25, l: 40, m: 35, n: 22, o: 15}
    Savanna::Outliers.remove_outliers(hash_one, :all, :grubbs).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, k: 12, l: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :all, :grubbs).should == {a: 20, b: 30, e: 10, f: 15, g: 10, h: 12, i: 13, j: 5, k: 25, l: 40, m: 35, n: 22, o: 15}
    Savanna::Outliers.remove_outliers(hash_one, :all).should == {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, k: 12, l: 10, m: 9}
    Savanna::Outliers.remove_outliers(hash_two, :all).should == {a: 20, b: 30, e: 10, f: 15, g: 10, h: 12, i: 13, j: 5, k: 25, l: 40, m: 35, n: 22, o: 15}
  end
end
