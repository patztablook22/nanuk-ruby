# cmake's sufficient for now

$dir = __dir__

cmake_present = system('which cmake > /dev/null 2>&1')
abort "please install cmake" unless cmake_present

system("
    cmake -S '#$dir' -B '#$dir' -DCMAKE_INSTALL_PREFIX='#$dir'
")