# Compiler and flags
CPP = g++ 
CPPFLAGS = -O3 -Wall -std=c++17

# Executable name
TARGET = task2

# Object files (derived from source files)
OBJS = $(SRCS:.cpp=.o)

# Source files
SRCS = layupsequence.cpp

all: $(TARGET)

# Rule to build the executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

# Rule to build object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(TARGET) $(OBJS)
