from PIL import Image
from PIL import GifImagePlugin

import sys
import os
import time

import platform

build = platform.system()
if build == "Windows":
	import ctypes
	

if len(sys.argv) != 3:
	print("wallpaper.py [speed] [path to gif]")
	exit(1)

# Getting user input
speed = float(sys.argv[1])
gif_file = sys.argv[2]

# Creating a temp folder to store frames
if not os.path.exists(".temp"):
	os.mkdir(".temp")

# Opening gif file
gif = Image.open(os.path.join(gif_file))

# Generating and saving the frames
os.chdir(".temp")

# Deleting previous images
cache_frames = os.listdir()
for i in cache_frames:
	os.remove(i)

for frame in range(0,gif.n_frames):
	gif.seek(frame)
	gif.save(f"{frame}.png")

# Displaying the frames
frames = os.listdir()
pos = 0
while True:	
	if build == "Linux":
		os.system(f"feh --bg-fill {frames[pos]}")
	elif build == "Windows":
		SPI_SETDESKWALLPAPER = 20 
		ctypes.windll.user32.SystemParametersInfoA(SPI_SETDESKWALLPAPER, 0, frames[pos] , 0)

	pos += 1
	if pos >= len(frames): pos = 0
	
	time.sleep(speed)

