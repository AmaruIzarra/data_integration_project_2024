# -*- coding: utf-8 -*-
"""
Created on Sat Jun 22 17:58:00 2024

@author: amaru
"""
import pandas as pd
import numpy as np
from scipy.spatial import distance_matrix

"""
This program intakes a set of coordinates and for each coordinate outputs the
distance to the nearest neighbour
"""
# path to file with coordinates
path_to_file = "C:/Users/amaru/my_git_repo/Atoms_code_2024/data_integration_project_2024/Mapping_File.xlsx"

# number of coordinates
num_of_coords = 17


def closest_point_distances(points):
    """
    Calculate the distance to the closest point for every point in a scatter graph of coordinates.
    
    Parameters:
    points (np.array): An array of shape (n, 2) where n is the number of points and each point has 2 coordinates (x, y).
    
    Returns:
    np.array: An array of length n where each element is the distance to the closest point for the corresponding point in the input array.
    """
    # Calculate the pairwise distance matrix
    dist_matrix = distance_matrix(points, points)
    
    # Set the diagonal to infinity to ignore zero distance to itself
    np.fill_diagonal(dist_matrix, np.inf)
    
    # Find the minimum distance for each point
    min_distances = np.min(dist_matrix, axis=1)
    
    return min_distances


# user code
if __name__ == "__main__":
    df = pd.read_excel(path_to_file, usecols = "B, C")

    x = df["Easting"].tolist()
    y = df["Northing"].tolist()
    
    points = np.empty([num_of_coords, 2])
    i = 0
    while i < num_of_coords:
        
        points[i][0], points[i][1] = x[i], y[i]
        i += 1
        
    distances = closest_point_distances(points)
    average_smallest_distance = np.mean(distances)
    
    print(distances)
    print(average_smallest_distance)