import matplotlib.pyplot as plt

def parse_file(file_path):
    """
    Reads a file line by line and parses each line.

    Parameters:
        file_path (str): Path to the input file.

    Returns:
        list: A list of dictionaries containing parsed key-value pairs for each line.
    """
    parsed_lines = []
    
    # Open the file and read it line by line
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()  # Remove leading/trailing whitespace
            if not line:  # Skip empty lines
                continue
            # Parse the line (e.g., split by ',' and '=')
            try:
                parsed_data = {}
                for segment in line.split(','):
                    key, value = segment.split('=')  # Split only at the first ':'
                    parsed_data[key.strip()] = value.strip()
                parsed_lines.append(parsed_data)
            except ValueError:
                print(f"Skipping malformed line: {line}")
    
    return parsed_lines



def extract_and_plot(data, key_x, key_y):
    """
    Extracts data for the given keys and plots a graph.

    Parameters:
        data (list): Parsed data as a list of dictionaries.
        key_x (str): Key for the x-axis.
        key_y (str): Key for the y-axis.
    """
    x_values = []
    y_values = []

    for entry in data:
        if key_x in entry and key_y in entry:
            try:
                x_values.append(int(entry[key_x]))  # Convert to float for numerical data
                y_values.append(float(entry[key_y]))
            except ValueError:
                print(f"Skipping non-numerical values: {entry}")
    
    # Plot the data
    plt.figure(figsize=(9, 9))
    plt.plot(x_values, y_values, marker='o', label=f'{key_x} vs Runtime')
    plt.xscale('log')
    plt.yscale('log')
    plt.xlabel(xlabel=f'Input N')
    plt.ylabel(ylabel=f'{key_y} (\u00B5s)')
    plt.title(f'Plot of Algorithm Runtime {key_x} vs {key_y}')
    plt.legend()
    # Annotate each point with its exact values
    for i, j in zip(x_values, y_values):
        plt.annotate(f'({i}, {j}\u00B5s)', (i, j), textcoords="offset points", xytext=(0,10), ha='center')
    plt.grid(True)
    plt.savefig('Algorithm-Runtime-plot.png', dpi=100)


# Example usage
file_path = 'output.txt'  # Replace with the path to your file
parsed_data = parse_file(file_path)
extract_and_plot(parsed_data, 'N', 'Time Taken')