import os

print("Welcome to the SOS installer!")

os.system("sudo pacman -Sy")

#----
# Installing pacman and AUR packages
#----

print("##############################")
print("# INSTALLING PACMAN PACKAGES #")
print("##############################")

cmd = "sudo pacman -S - < packages/pacman-pkg.txt"
os.system(cmd)


print("##############################")
print("# INSTALLING  AUR   PACKAGES #")
print("##############################")

cmd = "yay -S - < packages/aur-pkg.txt"
os.system(cmd)

"""
#----
# Installing bumblebee status
#----
print("###############################")
print("# INSTALLING BUMBLEBEE-STATUS #")
print("###############################")

cmd = "git clone git://github.com/tobi-wan-kenobi/bumblebee-status.git"
os.system(cmd)
os.system("cp -a bumblebee-status/ ~/.config/")
"""

#----
# Replacing bashrc and vimrc
#----

selection = input("Do yo want to replace your bashrc and vimrc? (y/n)")
if selection.lower() == "y":
    print("##############################")
    print("# REPLACING BASHRC AND VIMRC #")
    print("##############################")
    
    cmd = "cp -r rc_files/ ~"
    os.system(cmd)
else: 
    print("#######################################")
    print("# SKIPPING REPLACING BASHRC AND VIMRC #")
    print("#######################################")

#----
# Installing plugin manager for vim
#----

selection = input("Do you want to install plug.vim? (y/n)")
if selection.lower() == "y":
    print("#######################")
    print("# INSTALLING PLUG.VIM #")
    print("#######################")

    cmd = "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    os.system(cmd)


#----
# Replacing config files
#----

selection = input("Do you want to replace your config files with new configs? (y/n)")
if selection.lower() == "y": 
    print("##########################")
    print("# REPLACING CONFIG FILES #")
    print("##########################")

    cmd = "cp -r configs/* ~/.config"
    os.system(cmd)
else:
    print("##############################")
    print("# SKIPPING REPLACING Configs #")
    print("##############################")


#----
# Copying the i3blocks script to bins folder
#----
cmd = "sudo cp -r scripts/i3blocks/* /usr/bin"
os.system(cmd)

print("Thank you for installing...")

