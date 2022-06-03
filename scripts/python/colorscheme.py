import sys
import os
import json

if len(sys.argv) == 1:
	print("usage: colorscheme [name of scheme]")
	print("Colorschemes: gruvbox-dark , nord , dracula , doom-one , sdark , paradise , solarized")
	exit()


# Scheme for i3blocks
config_path = os.path.expanduser("~") + "/.config/"
config = json.load(open(config_path + "colo_conf.json"))

scheme = sys.argv[1]
if scheme not in config["colorscheme"]:
	print(scheme, "is not a valid colorscheme name.")
	exit()


home_dir = os.path.expanduser("~")
#----
# Converting i3blocks
#---- 
file_path = f"{home_dir}/.config/i3blocks/config"

with open(file_path, "r") as r:
	data = r.readlines()


tokens = ["[seperator]\n", "[ethernet]\n", "[wifi]\n", "[cpu_temp]\n", "[cpu_usage]\n", "[ram]\n", "[volume]\n", "[battery]\n", "[time]\n"]
for no, line in enumerate(data):
	if line in tokens:
		color = config["colorscheme"][scheme][line]
	if "color" in line:
		data[no] = f"color={color}\n"


with open(file_path, "w") as w:
	w.writelines(data)

#----
# Converting alacritty
#----
file_path = f"{home_dir}/.config/alacritty/alacritty.yml"

with open(file_path, "r") as r:
	data = r.readlines()

for no, line in enumerate(data):
	if "colors: *" in line:
		data[no] = f"colors: *{scheme}\n"

with open(file_path, "w") as w:
	w.writelines(data)

#----
# Converting vim
#----
file_path = f"{home_dir}/.vimrc"

with open(file_path, "r") as r:
	data = r.readlines()

for no, line in enumerate(data):
	if "colorscheme " in line:
		vim = config["colorscheme"][scheme]["vim"]
		data[no] = f"colorscheme {vim}\n"
	elif "\'colorscheme\'" in line:
		lightline = config["colorscheme"][scheme]["lightline"]
		data[no] = f"	\\ \'colorscheme\': \'{lightline}\',\n"

with open(file_path, "w") as w:
	w.writelines(data)

#----
# i3
#----
file_path = f"{home_dir}/.config/i3/config"

with open(file_path, "r") as r:
	data = r.readlines()

tokens = ["set $pannel_bg", "set $border", "set $menu_nb", "set $menu_nf", "set $menu_sb", "set $menu_sf"]
for no, line in enumerate(data):
	for i in tokens:
		if i in line:
			color = config["colorscheme_i3"][scheme][i]
			data[no] = f"{i} {color}\n"

with open(file_path, "w") as w:
	w.writelines(data)


#----
# Wallpaper
#----

os.system("nitrogen --set-zoom-fill " + config["colorscheme"][scheme]["wallpaper"])

