# Nanuk for Ruby

FFI wrapper for Nanuk, a deep learning library written in C++

## Demo

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
