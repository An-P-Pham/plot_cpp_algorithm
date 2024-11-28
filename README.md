## STEPS

# Make sure you have Docker installed in your enviornment
https://docs.docker.com/get-started/get-docker/

# Obtain source code
```console
git clone https://github.com/An-P-Pham/plot_cpp_algorithm.git
```

# Build the docker image
```console
cd plot_cpp_algorithm
sudo docker build -t plot_cpp_algorithm .
```

# Run the docker image
```console
sudo docker run plot_cpp_algorithm
```

# Copy over the results of the container running
```console
sudo docker cp $(docker ps -l -q):/app/output.txt ./new_output.txt
sudo docker cp $(docker ps -l -q):/app/Algorithm-Runtime-plot.png ./New-Algo-Plot.png
```
