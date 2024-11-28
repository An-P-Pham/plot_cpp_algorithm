## STEPS

# Obtain source code
git clone https://github.com/An-P-Pham/plot_cpp_algorithm.git

# Build the docker image
sudo docker build -t plot_cpp_algorithm .

# Run the docker image
sudo docker run plot_cpp_algorithm

# Copy over the results of the container running
sudo docker cp $(docker ps -l -q):/app/output.txt ./new_output.txt
sudo docker cp $(docker ps -l -q):/app/Algorithm-Runtime-plot.png ./New-Algo-Plot.png