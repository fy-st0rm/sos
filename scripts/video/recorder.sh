read -p "Filename: " file_name

ffmpeg -f x11grab -s $(xdpyinfo | awk '/dimensions:/ { print $2 }') -i :0.0 ~/Videos/ffmpeg/$file_name.mpeg
