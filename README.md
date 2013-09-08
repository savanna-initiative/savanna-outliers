### [Savanna Outliers: Plug & Play Anomaly Detection](https://github.com/savanna-initiative/savanna-outliers.git)

This package allows to detect outliers using Grubb's test and Chauvanet's criterion.

#### Installation

```
gem install savanna-outliers
```

#### Usage

```ruby
require 'savanna-outliers'

##
# Get max outliers from array

some_array = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
Savanna::Outliers.get_outliers(some_array, :max, :grubbs) # => [5000, 1100, 1000]

##
# Get min outliers from array

some_array = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 12, 10, -1100, 9, -5000]
Savanna::Outliers.get_outliers(some_array, :min, :grubbs) # => [-5000, -1100, -1000]

##
# Get all outliers from array

some_array = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 1000, 12, 10, 9]
Savanna::Outliers.get_outliers(some_array, :all, :grubbs) # => [1000, -1000]

##
# Get max outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
Savanna::Outliers.get_outliers(some_hash, :max, :grubbs) # => {n: 5000, l: 1100, i: 1000}

##
# Get min outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 12, k: 10, l: -1100, m: 9, n: -5000}
Savanna::Outliers.get_outliers(some_hash, :min, :grubbs) # => {n: -5000, l: -1100, i: -1000}

##
# Get all outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 1000, k: 12, l: 10, m: 9}
Savanna::Outliers.get_outliers(some_hash, :all, :grubbs) # => {j: 1000, i: -1000}

##
# Remove max outliers from array
some_array = [10, 12, 8, 11, 9, 13, 12, 10, 1000, 12, 10, 1100, 9, 5000]
Savanna::Outliers.remove_outliers(some_array, :max, :grubbs) # => [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]

##
# Remove min outliers from array
some_array = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 12, 10, -1100, 9, -5000]
Savanna::Outliers.remove_outliers(some_array, :min, :grubbs) # => [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]

##
# Remove all outliers from array
some_array = [10, 12, 8, 11, 9, 13, 12, 10, -1000, 1000, 12, 10, 9]
Savanna::Outliers.remove_outliers(some_array, :all, :grubbs) # => [10, 12, 8, 11, 9, 13, 12, 10, 12, 10, 9]

##
# Remove max outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: 1000, j: 12, k: 10, l: 1100, m: 9, n: 5000}
Savanna::Outliers.remove_outliers(some_hash, :max, :grubbs) # => {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}

##
# Remove min outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 12, k: 10, l: -1100, m: 9, n: -5000}
Savanna::Outliers.remove_outliers(some_hash, :min, :grubbs) # => {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, j: 12, k: 10, m: 9}

##
# Remove all outliers from hash
some_hash = {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, i: -1000, j: 1000, k: 12, l: 10, m: 9}
Savanna::Outliers.remove_outliers(some_hash, :all, :grubbs) # => {a: 10, b: 12, c: 8, d: 11, e: 9, f: 13, g: 12, h: 10, k: 12, l: 10, m: 9}

```

### License

The MIT License

Copyright (c) 2013 Max Makarochkin

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
