#!/bin/bash 

# Step 1: Clean previous builds
echo "Cleaning previous builds..."
make clean

# Step 2: Compile the C++ program
echo "Compiling the C++ program..."
make

# Check if the compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed."
    exit 1
fi

# Run our main C++ Algorithm
echo "Compilation successful."
echo "Running C++ executable..."
./task2 | tee output.txt

# Check if we have python virtual enviornment & install dependency
venv_name="env" 
if [ ! -d "$venv_name" ]; then
  echo "Python virtual environment does not exist."
  echo "Creating Virtual Python Enviornment..."
  python3 -m venv "$venv_name"
  source env/bin/activate
  pip install -r requirements.txt > /dev/null 2>&1
fi

# Step 3: Run the Python script
echo "Running the Python script to plot data..."
source env/bin/activate
python3 plotRuntime.py