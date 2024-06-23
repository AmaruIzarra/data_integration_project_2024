# -*- coding: utf-8 -*-
"""
Created on Sat Jun 22 14:17:31 2024

@author: amaru
"""
from functools import cmp_to_key
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math

"""
This program was created to find the convex hull of a set of coordinates. It 
implements the Graham Scan Algorithm which has a worst case time complexity 
of O(n log(n)) where n is the number of coordinates. 
"""
# path to file with coordinates
path_to_file = "C:/Users/amaru/my_git_repo/Atoms_code_2024/data_integration_project_2024/Mapping_File.xlsx"

# number of coordinates
num_of_coords = 17


# This class stores the x and y coordinates of points
class Point:
    
    def __init__(self, x = None, y = None):
        self.x = x
        self.y = y
        
# a global variable to determine first point and sort all remaining points with
# reference to it.
p0 = Point(0, 0)

# helper function that finds next to top in a stack
def nextToTop(S):
    
    return S[-2]

# helper function that finds thesquare of distance between two points
def sq_dist(p1, p2):
    
    return((p1.x - p2.x)**2 + (p1.y - p2.y)**2)

#helper function to find orientation of ordered triplet (p (previous), 
# c (current), n (next)). The return value is dependent on the following:
# the cross-product of the connecting vectorr is used to determine orientation
# if cross-product is positve then n is clockwise from c with respect to p,
# if cross-product is negative then n is counter-clockwise from c with respect to p, 
# 0 if p, c, n are collinear
# 1 if orientation is clockwise
# 2 if orientation is counter-clockwise
def orientation(p, c, n):
    
    cross_product = ((n.x - c.x)*(c.y - p.y) - (c.x - p.x)*(n.y - c.y))
    
    if cross_product == 0:
            return 0 # collinear
    elif cross_product > 0:
            return 1 # clock wise
    else: 
        return 2 # counter-clock wise

# a helper function for cmp_to_key function to sort an array of points with
# respect to the first point
def compare(p1, p2):
    
    # Find orientation
    orient = orientation(p0, p1, p2)
    
    if orient == 0:
        if sq_dist(p0, p2) >= sq_dist(p0, p1):
            return -1
        else:
            return 1
    
    else:
        if orient == 2:
            return -1
        else:
            return 1
 
# helepr function that calculates the polar angle between point p1 and reference point p0 """
def polar_angle(p0, p1):
    y_span = p1.y - p0.y
    x_span = p1.x - p0.x
    return math.atan2(y_span, x_span)


# Helper function that sorts points by polar angle with respect to the point with the lowest y-coordinate
def sort_points(points, p0):

    # Sort the points based on polar angle with respect to p0
    sorted_points = sorted(points, key=lambda p: (polar_angle(p0, p), sq_dist(p0, p)))
    
    return sorted_points
    
            

def convexHull(points, n):
    
    #find the bottom-most point
    min_y = points[0].y
    min = 0
    for i in range(1, n):
        y = points[i].y
        # print(min_y, y)
        
        if ((y < min_y) or (min_y == y and points[i].x < points[min].x)):
            min_y = points[i].y
            min = i

    #place the bottom-most point at first position
    points[0], points[min] = points[min], points[0]
    
    #sort n-1 points with respect to the first point.
    #a point p1 comes before p2 in sorted output if p2 has a larger polar 
    #angle (in counterclockwise direction) than p1
    p0 = points[0]
    
    points = sort_points(points, p0)
    
    for point in points:
        print("(", point.x, "," , point.y, ")")
    
    #if two or more points make the same angle with p0, remove all but one that
    #is farthest from p0. 
    m = 1 # Initializing size of modified array
    
    for i in range(1,n):
        
        # keep removing i while angle of i and i + 1 is the same with respect
        # to p0
        while((i < n - 1) and (orientation(p0, points[i], points[i+1]) == 0)):
            i += 1
        
        points[m] = points[i]
        m += 1 #update size of modified array

    #check if modified array of points has less than 3 points, becuase then
    #convex hull is not possible
    if m < 3:
        return
    
    #create an empty stack and push first three points to it.
    S = []
    S.append(points[0])
    S.append(points[1])
    S.append(points[2])
    
    #process the remaining n-3 points
    for i in range(3,m):
        
        # print(i)
        #print(orientation(nextToTop(S), S[-1], points[i]))
        #print(points[i].x, points[i].y)
        
        # Keep removing top while the angle formed by points next-to-top, top
        # and points[i] makes a non-left turn
        while ((len(S) > 1) and (orientation(nextToTop(S), S[-1], points[i]) != 2)):
            S.pop()
        S.append(points[i])
    
    # Now stack has the output points,
    # print contents of stack
    convex_hull_x = []
    convex_hull_y = []
    while S:
        p = S[-1]
        convex_hull_x.append(p.x)
        convex_hull_y.append(p.y)
        S.pop()
         
    return convex_hull_x, convex_hull_y
    
    #now stack has the output points, print contents of stack
    
# plotter function
def plot_convex_hull(all_x, all_y, convex_x, convex_y):
        
    plt.scatter(all_x, all_y, marker=".")
    plt.plot(convex_x, convex_y, marker='.', mfc='r', mec='r', ms=6, ls='--', c='b', lw=2, label= "Convex Hull Polygon")
    plt.plot([convex_x[0],convex_x[-1]], [convex_y[0],convex_y[-1]], marker='.', mfc='r', mec='r', ms=6, ls='--', c='b', lw=2)
    plt.plot()
    plt.legend()
    plt.xlabel("Easting (m)")
    plt.ylabel("Northing (10^6 m)")
    plt.show

# user code
if __name__ == "__main__":
    
    df = pd.read_excel(path_to_file, usecols = "B, C")

    x = df["Easting"].tolist()
    y = df["Northing"].tolist()
       
    i = 0
    points = []
    
    while i < num_of_coords:
        
        points.append(Point(x[i], y[i]))
        
        i += 1
    
    convex_x, convex_y = convexHull(points, num_of_coords)
    
    convex_coords = []
    i = 0
    while i < len(convex_x):
        
        convex_coords.append((convex_x[i], convex_y[i]))
        i+=1
        
    print(convex_coords)
    
    plot_convex_hull(x, y, convex_x, convex_y)
    
        

