# GEASY
## Installation
- To move files to proper directory, run INSTALL.sh
- Then add "source ~/TerminalScripts/GEASY.sh" to ~/.bashrc 

## How to Use
**When in directory to compile, type "Geasy". If the nessacary files are not present, GEASY will import them.**
* If compiling for windows from linux, use "Geasy -w".
* For all flags, add them to "libPrefixes"(array) in the proper conf file.
* For all Library Directories(-L), add them to "libs"(array) in the proper conf file.
* For all Included Directories(-I), add them to "Include"(array) in the proper conf file.
* For all files to compile, add them to "file"(String) in the proper conf file.

## Answers
- Will the dlls be imported
  - No, you will have to import them in yourself
- Why mingw and not cmake
  - Because I like to use g++....Thats it
- Why isn't "Geasy -w" working
  - Geasy -w, only compiles for amd64 Windows systems.You must install x86_64-w64-mingw32-g++ to your system

