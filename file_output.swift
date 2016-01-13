/* Writes a "Hello world" program in Swift to a new
   file and executes it. Shows how to do file output
   in Swift and how to execute other Swift programs.
*/

#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
    import Darwin
#else
    import Glibc
#endif

system("touch a.swift")
let stream = fopen("a.swift", "r+")
let program = "print(\"hello world\")"

fwrite(program,1,program.characters.count,stream)
fclose(stream)

system("swift a.swift")
system("cat a.swift")
