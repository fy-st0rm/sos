import os

print("Welcome to the SOS installer!")

os.system("sudo pacman -Syu")

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

#----
# Copying the custom py_scripts binary to /usr/bin
#----

selection = input("Do you want to copy python scripts binary to /usr/bin? (y/n)")
if selection.lower() == "y":
    print("##########################################")
    print("# COPYING THE SCRIPTS BINARY TO /usr/bin #")
    print("##########################################")
    
    cmd = "sudo cp py_scripts/bin/* /usr/bin"
    os.system(cmd)
else:
    print("###############$###################################")
    print("# SKIPPING COPYING THE SCRIPTS BINARY TO /usr/bin #")
    print("###################################################")
    

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
    print("#######################################")
    print("# SKIPPING REPLACING BASHRC AND VIMRC #")
    print("#######################################")


print("Thank you for installing...")

