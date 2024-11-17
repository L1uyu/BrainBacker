cmake --build build

# Check operating system and run appropriate executable
if [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "win"* ]]; then
    # Windows
    ./build/Debug/Baker.exe
else
    # Linux or other Unix-like systems
    ./build/Baker
fi