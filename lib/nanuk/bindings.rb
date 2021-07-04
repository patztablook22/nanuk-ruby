class Nanuk
  # callback function for progress
  callback :progress, [:uint32, :double], :void

  # a set of ELF symbols follows
  # they aren't particularly legible because the C++ compiler is retarded

  attach_function :_Z20construct_from_arrayPjm, [:pointer, :size_t], :pointer
  attach_function :_Z19construct_from_filePc, [:string], :pointer
  attach_function :_Z7inspectPN5nanuk5NanukE, [:pointer], :void
  attach_function :_Z15learning_paramsPN5nanuk5NanukEmd, [:pointer, :size_t, :double], :void
  attach_function :_Z5learnPN5nanuk5NanukEPcPFvjdEj, [:pointer, :string, :progress, :uint32], :void
  attach_function :_Z8topologyPN5nanuk5NanukEPm, [:pointer, :pointer], :pointer
  attach_function :_Z14save_into_filePN5nanuk5NanukEPc, [:pointer, :string], :void
  attach_function :_Z4evalPN5nanuk5NanukEPd, [:pointer, :pointer], :pointer

  # renaming the methods above, format :cxx_desired_name
  def self.mk to, from
    to = "cxx_#{to}".to_sym
    alias_method to, from
    remove_method from
  end

  mk :construct_from_array, :_Z20construct_from_arrayPjm
  mk :construct_from_file, :_Z19construct_from_filePc
  mk :inspect, :_Z7inspectPN5nanuk5NanukE
  mk :learning_params, :_Z15learning_paramsPN5nanuk5NanukEmd
  mk :learn, :_Z5learnPN5nanuk5NanukEPcPFvjdEj
  mk :topology, :_Z8topologyPN5nanuk5NanukEPm
  mk :save_into_file, :_Z14save_into_filePN5nanuk5NanukEPc
  mk :eval, :_Z4evalPN5nanuk5NanukEPd
end
