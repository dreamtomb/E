			README of Spatial Outlier Detection
				S. Shekhar & P. Zhang
				University of Minnesota
				
Objective:
	Better understand concepts and methods for spatial outlier detection
	comparing to traditional ones.
Requirement:
	Matlab
		
Data:
data.txt is an example dataset for spatial outlier detection illustration.
It's a 30 x 2 matrix: first column is the spatial coordinates, and second
column is the attribute value at the location. Each row is an instance.

Procedure:
Open matlab, then type the script name for the spatial outlier detection
demo.

The running script for spatial outlier detection is named Outlier_Demo.m
In this script, the data were loaded into workspace. Then users have
several sub-scripts to play with. It will calculate different outliers,
and generate the figures used in the spatial outlier subsection in 
the spatial data mining book chapter[SDM03].

(1)Show raw data 
run Show_Data.m (remove % before Show_Data in the Outlier_Demo script)
or type Show_Data in command line
Output: Generate the Figure 3.4(a) in [SDM03]

(2)Show histogram for the attribute in data
run Show_Hist.m (remove % before Show_Hist in the Outlier_Demo script)
or type Show_Hist in command line
Output: Generate the Figure 3.4 (b) in [SDM03]

(2)Global outlier detection
run Outlier_Global.m (remove % before Outlier_Global in the Outlier_Demo script)
or type Outlier_Global in command line
Output: Generate a figure to show that G, the max value in the data, is the global outlier

(3)Outlier detection using Scatter Plot 
run Outlier_Scatter.m (remove % before Outlier_Scatter in the Outlier_Demo script)
or type Outlier_Scatter in command line
Output: Generate the Figure 3.6(a) in [SDM03]

(4)Outlier detection using Variogram
run Outlier_Variogram.m (remove % before Outlier_Variogram in the Outlier_Demo script)
or type Outlier_Variogram in command line
Output: Generate the Figure 3.5(a) in [SDM03]

(5)Outlier detection using Spatial test [GeoInfo03]
run Outlier_Test.m (remove % before Outlier_Test in the Outlier_Demo script)
or type Outlier_Test in command line
Output: Generate the Figure 3.6(b) in [SDM03]

References:

[SDM03] Shashi Shekhar, Pusheng Zhang, Yan Huang, and Ranga Raju Vatsavai, "Spatial Data 
Mining", as a book chapter to appear in "Data Mining: Next Generation Challenges and 
Future Directions", Hillol Kargupta and Anupam Joshi(editors), AAAI/MIT Press, 2003

[GeoInfo03] Shashi Shekhar, Chang-Tien Lu, and Pusheng Zhang, A Unified Approach 
to Detecting Spatial Outliers, GeoInformatica, An International Journal on 
Advances of Computer Science for Geographic Information Systems, Volume 7, 
Issue 2, 139-166, Kluwer Academic Publishers, June 2003, 