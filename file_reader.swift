/* Opens up its own source code and prints it to the
   console. Shows how file input can be done in swift
*/

#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
    import Darwin
#else
    import Glibc
#endif

let stream = fopen("code-tmp.swift", "r")

var s = ""
while (true) {
    let c = fgetc(stream)
    if c == -1 {
        break
    }
    s = String(Character(UnicodeScalar(UInt32(c))))
    print(s, terminator:"")
    
}

