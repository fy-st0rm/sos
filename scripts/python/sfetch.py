#-- Imports
import platform
import os
import random

# Colors for terminal
class colors:
    PURPLE = '\033[35m'
    BLUE = '\033[34m'
    CYAN = '\033[36m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    RED = '\033[31m'
    DEFAULT = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

#-- Settings
border = colors.CYAN
info_name = colors.BLUE
info = colors.YELLOW
logo_color = random.choice([colors.PURPLE, colors.BLUE, colors.CYAN, colors.GREEN, colors.RED, colors.YELLOW])

#-- Info holders
infos = {}

#logo = [
#"░██████╗░█████╗░░██████╗",
#"██╔════╝██╔══██╗██╔════╝",
#"╚█████╗░██║░░██║╚█████╗░",
#"░╚═══██╗██║░░██║░╚═══██╗",
#"██████╔╝╚█████╔╝██████╔╝",
#"╚═════╝░░╚════╝░╚═════╝░"
#]

"""logo = [
"╋╋╋┏━━━┓   ",
"╋╋╋┃┏━┓┃   ",
"┏━━┫┃┃┃┣━━┓",
"┃━━┫┃┃┃┃━━┫",
"┣━━┃┗━┛┣━━┃",
"┗━━┻━━━┻━━┛"
]
"""
"""
logo = [
"               +              ",
"               #              ",
"              ###             ",
"             #####            ",
"             ######           ",
"            ; #####;          ",
"           +##.#####          ",
"          +##########         ",
"         #############;       ",
"        ###############+      ",
"       #######   #######      ",
"     .######;     ;####;`.    ",
"    .#######;     ;#####.     ",
"    #########.   .########`   ",
"   ######'           '######  ",
"  ;####                 ####; ",
"  ##'                     '## ",
" #'                         `#"
]
"""
"""logo = [
"||||||||| ||||",
"||||||||| ||||",
"||||      ||||",
"|||| |||| ||||",
"|||| |||| ||||",
"|||| |||| ||||",
"|||| |||| ||||"
]"""

logo = [
"          _   _           ",
"         .-_; ;_-.        ",
"        / /     \\ \\       ",
"       | |       | |      ",
"        \\ \\.---./ /       ",
"    .-\"~   .---.   ~\"-.   ",
"  ,`.-~/ .'`---`'. \\~-.`, ",
"  '`   | | \\(_)/ | |   `' ",
"  ,    \\  \\ | | /  /    , ",
"  ;`'.,_\\  `-'-'  /_,.'`; ",
"   '-._  _.-'^'-._  _.-'  ",
"       ``         ``      "
]

logo = [
""
""
""
""
""
""
""
""
""
""
""
""
]

logo = [
"	⠀⠀⠀⠀⠀ ＿＿	    	",
"　　　　　／＞　　フ	",
"　　　　　| 　_　 _| 	",
"　 　　　／` ミ＿xノ	",
"　　 　 /　　　 　 |	",
"　　　 /　 ヽ　　 ﾉ	",
"　 　 │　　|　|　|	",
"　／￣|　　 |　|　|	",
"　| (￣ヽ＿_ヽ_)__)	",
"  ＼二つ	        "
]

#-- Collecting system information
infos.update({"User": platform.node()})
infos.update({"Os": platform.system() + "  "})
infos.update({"Kernel": platform.release()})
infos.update({"Machine": platform.machine()})
infos.update({"DE": os.environ.get("DESKTOP_SESSION")})
infos.update({"Term": os.environ.get("TERM")})
infos.update({"Uptime": os.popen("uptime -p").read()[:-1]})

#-- Generating the length of the box
longest_name = len("machine")
longest_info = len(infos["User"])
longest_line = len(" ") + longest_name + len(": ") + len(infos["User"]) + len(" ")

for i in infos:
    new_line = len(" ") + longest_name + len(": ") + len(infos[i]) + len(" ")
    new_info = len(infos[i])

    if new_line > longest_line: longest_line = new_line
    if new_info > longest_info: longest_info = new_info

#-- Creating the horizontal line of the box
top    = border + "╭" + "─" * longest_line + "╮" + colors.DEFAULT
bottom = border + "╰" + "─" * longest_line + "╯" + colors.DEFAULT


#-- Checking if the logo is bigger or the box
if len(infos) + 2 > len(logo):
    gap = len(infos) + 2 - len(logo)
    first_to_draw = "box"
    offset = 0
else:
    gap = len(logo) - (len(infos) + 2)
    first_to_draw = "logo"
    offset = gap + 1

#-- Drawing the top part of the fetch according to the order
if first_to_draw == "box":
    # If box needs to be drawn at first
    print(" " * len(logo[0]) + " " + top)

    keys = []
    for j, i in enumerate(infos, 1):
        if j >= gap:
            break
        format = info_name + i + colors.DEFAULT + " " * (longest_name - len(i)) + ": " + info + infos[i] + colors.DEFAULT + " " * (longest_info - len(infos[i]))
        print(" " * len(logo[0]) + " " + border + "│" + colors.DEFAULT, format, border + "│" + colors.DEFAULT)
        keys.append(i)

    for j in range(gap-1):
        infos.pop(keys[j])
else:
    # If logo needs to be drawn at first
    for i in range(gap):
        print(logo_color + logo[i] + colors.DEFAULT)
    print(logo_color + logo[gap] + " " + top)


for i in infos:
    #-- Drawing the rest of the part including logo
    format = info_name + i + colors.DEFAULT + " " * (longest_name - len(i)) + ": " + info + infos[i] + colors.DEFAULT + " " * (longest_info - len(infos[i]))
    print(logo_color + logo[offset] + " " + colors.DEFAULT, end="")
    offset += 1
    print(border + "│" + colors.DEFAULT, format, border + "│" + colors.DEFAULT)

#-- Rendering the last part
print(logo_color + logo[-1] + colors.DEFAULT + " " + bottom)

# print(" " * len(logo[0]) + " ", end="  ")
# print(colors.PURPLE + "" + colors.BLUE + " " + colors.CYAN + " " + colors.GREEN + " " + colors.YELLOW + " " + colors.RED + " ")


