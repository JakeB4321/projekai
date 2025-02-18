import pandas as pd
import os

# Retrieve all CSV files in the directory
# directory = ("YOUR DIRECTORY HERE")
file_list = [file for file in os.listdir(directory) if file.endswith(".csv")]

dataframes = []

for file in file_list:
    file_path = os.path.join(directory, file)
    
    df = pd.read_csv(file_path)


    dynamic_column = df.columns[-1] # Get the last column of the dataframe
    new_column_name = os.path.splitext(file)[0] # Get the filename without the extension
    df = df.rename(columns={dynamic_column: new_column_name}) # Rename column as needed
    df = df.drop(columns=['Code'])
    dataframes.append(df)


combined_df = dataframes[0] 
for df in dataframes[1:]:
    combined_df = pd.merge(combined_df, df, on=['Entity', 'Year'], how='outer') # Merge the dataframes on the 'Date' column

output_file = os.path.join(directory, "combined_data.csv")
combined_df.to_csv(output_file, index=False) # Save the combined dataframe to a CSV file

print(f"Combined data saved to {output_file}")
