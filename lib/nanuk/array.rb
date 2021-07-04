class Array
  def to_ptr type
    ptr = FFI::MemoryPointer.new(type, size)
    ptr.write_array_of_type(type, "put_#{type}".to_sym, self)
    ptr
  end
end
