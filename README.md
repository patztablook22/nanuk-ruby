# Nanuk for Ruby

FFI wrapper for Nanuk, a deep learning library written in C++

## Demo

```ruby
require 'nanuk'

n = Nanuk.new [4, 3, 2, 1]  # 4 input neurons, 2 hidden layers, 1 output neuron
n.learning_params(
  1000,  # epochs
  0.4    # learning rate [epsilon]
)

# train model
n.learn("data.csv") do |epoch, cost|
  puts "Epoch #{epoch}: #{cost}"
end

# apply model
p n.eval([ ... ])
```


## Installation

This repo depends on the [native C++ nanuk library](https://github.com/patztablook22/nanuk/), mounted as a submodule at `ext/nanuk`; to include it, write:

```bash
git submodule init
git submodule update
```

Then, run:
```
rake install
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
