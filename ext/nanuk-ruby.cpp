/*
 * binding boilerplate for Ruby C FFI
 */

#include "nanuk.hpp"

using namespace std;
using namespace nanuk;

Nanuk* construct_from_array(unsigned* arr, size_t size) {
    vector<unsigned> topology(arr, arr + size);
    return new Nanuk(topology);
}

Nanuk* construct_from_file(char* path) {
    ifstream is(path);
    return new Nanuk(is);
}

void inspect(Nanuk* n) {
    n->inspect();
}

void save_into_file(Nanuk* n, char* path) {
    ofstream os(path);
    *n >> os;
}

void learning_params(Nanuk* n, size_t epochs, Scalar epsilon) {
    n->learning_params(epochs, epsilon);
}

void learn(Nanuk* n, char* path, Callback callback, unsigned header_lines) {
    ifstream is(path);
    n->learn(is, callback, header_lines);
}

const unsigned* topology(Nanuk* n, size_t* size) {
    auto buff = n->topology();
    unsigned* arr = new unsigned[buff.size()];
    
    // copy buffer into array
    *size = buff.size();
    copy(buff.begin(), buff.end(), arr);
    return arr;
}

const Scalar* eval(Nanuk* n, Scalar* arr) {
    Tensor1D input(arr, arr + n->topology().front());
    auto buff = (*n)(input); // evaluate
    Scalar* out = new Scalar[buff.size()];

    // copy buffer into out array
    // size is stored as cache
    copy(buff.begin(), buff.end(), out);
    return out;
}