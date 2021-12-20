# SAW (St0rm's Animated Wallpaper)

from PIL import Image
from PIL import GifImagePlugin
import sys
import os
import time


class Wallpaper:
	def __init__(self, speed, file):
		self.speed = speed
		self.file = file
		self.frames = []
		self.out_dir = HOME+"/.saw"

	def __sort_frames(self):
		print("Sorting the frames...")
		temp = []
		for i in self.frames:
			temp.append(int(i.split("_")[0]))
		temp.sort()

		self.frames.clear()
		for i in temp:
			self.frames.append(f"{i}_{self.speed}_.png")

	def __generate_frames(self):
		if not os.path.exists(self.out_dir):
			os.mkdir(self.out_dir)
		
		print("Cleaning old frames....")
		os.system(f"rm {self.out_dir}/*")
		
		print("Generating frames......")
		try:
			gif = Image.open(os.path.join(self.file))
			for frame in range(0, gif.n_frames):
				gif.seek(frame)
				gif.save(f"{self.out_dir}/{frame}_{self.speed}_.png")
		except Exception as e:
			print("Error:", e)

		self.frames = os.listdir(self.out_dir)
		print(f"{len(self.frames)} are generated!")

	def restore(self):
		if not os.path.exists(self.out_dir):
			print("No previous cache to restore from.")
			exit()

		self.frames = os.listdir(self.out_dir)
		if not self.frames:
			self.speed = float(self.frames[0].split("_")[1])
			print("No previous cache to restore from.")
			exit()

		print(f"Loaded {len(self.frames)} frames!")

	def draw(self):
		if not self.frames:
			self.__generate_frames()
		self.__sort_frames()

		print("Animating wallpapers...")
		os.chdir(self.out_dir)
		pos = 0
		while True:
			os.system(f"feh --bg-fill {self.frames[pos]}")
			pos += 1
			if pos >= len(self.frames): pos = 0

			time.sleep(self.speed)


class SAW:
	def __init__(self, argv):
		self.argv = argv
		
	def __parse_stdin(self):
		wallpaper = Wallpaper(0.05, 0)

		for i in range(len(self.argv)):
			if self.argv[i] == "-r":		# To restore the cached frames
				wallpaper.restore()
				break
			elif self.argv[i] == "-s":		# To define the speed
				try:
					wallpaper.speed = float(self.argv[i+1])
				except Exception as e:
					print("Error:", e)
					exit()
			elif self.argv[i] == "-f":		# To define the path of the gif file
				try:
					wallpaper.file = self.argv[i+1]
				except Exception as e:
					print("Error:", e)
					exit()

		return wallpaper

	def run(self):
		wallpaper = self.__parse_stdin()
		wallpaper.draw()	
	


if __name__ == "__main__":
	if (len(sys.argv) <= 1):
		print("Usage:")
		print("      saw -s [speed] -f [filepath]")
		print("      saw -r # Restores the previous wallpaper")
		exit()

	HOME = os.environ["HOME"]

	saw = SAW(sys.argv)
	saw.run()

