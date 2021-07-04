cmake_minimum_required(VERSION 3.20)
project(nanuk-ruby)

cmake_policy(SET CMP0015 NEW)

# include and compile the C++ nanuk submodule
include_directories(nanuk/src)
add_subdirectory(nanuk/src)

# compile own wrapper library around it
add_library(nanuk-ruby SHARED
    nanuk-ruby.cpp
)

# and link them together
target_link_libraries(nanuk-ruby nanuk)

install(
    TARGETS nanuk-ruby
    DESTINATION 
)