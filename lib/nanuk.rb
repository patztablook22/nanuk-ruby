require 'ffi' # an utter pain in the ass.

class Nanuk
  extend FFI::Library
  ffi_lib File.expand_path(
    # GIT_HOME/ext/libnanuk-ruby.so
    "#{__dir__}/../ext/libnanuk-ruby.so"
  )

  @pointer
  @topology

  attr_reader :topology

  def initialize obj
    @pointer = case obj
               when Array;   cxx_construct_from_array(obj.to_ptr(:int), obj.size)
               when String;  cxx_construct_from_file(obj)
               else;         raise ArgumentError
               end

    # topology seems profitable to store as cache in ruby
    update_topology
  end

  def inspect
    # cxx_inspect(@pointer)
    # ...would call cxx Nanuk::inspect directly
    # using cache is wiser:

    buff = String.new
    topology.each_with_index do |neurons, layer|
      buff << "layer #{layer}: "
      buff << "#{neurons} neuron/s\n"
    end
    buff
  end

  def learning_params epochs, epsilon
    cxx_learning_params(@pointer, epochs, epsilon)
  end

  def learn path, header_lines = 1, &callback
    cxx_learn(@pointer, path, callback, header_lines)
  end

  def eval obj
    return self.eval [*obj] unless obj.class == Array
    ptr  = cxx_eval(@pointer, obj.to_ptr(:double))
    buff = ptr.read_array_of_double(topology.last)
  end

  def save path
    cxx_save_into_file(@pointer, path)
  end

  private

  def update_topology
    # call the cxx function and translate it into the Array class
    layers    = FFI::MemoryPointer.new(:uint32)
    neurons   = cxx_topology(@pointer, layers)
    @topology = neurons.read_array_of_uint32(layers.read(:uint32))
  end
end

Dir["#{__dir__}/nanuk/**/*.rb"].each do |rb|
  require_relative rb
end

