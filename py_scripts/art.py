import random


class colors:
    PURPLE = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    RED = '\033[91m'
    BLACK = '\033[30m'
    DEFAULT = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


block = f"""
    {colors.PURPLE}████ ██{colors.DEFAULT}  {colors.BLUE}████ ██{colors.DEFAULT}  {colors.YELLOW}████ ██{colors.DEFAULT}  {colors.CYAN}████ ██{colors.DEFAULT}
    {colors.PURPLE}██ ■ ██{colors.DEFAULT}  {colors.BLUE}██ ■ ██{colors.DEFAULT}  {colors.YELLOW}██ ■ ██{colors.DEFAULT}  {colors.CYAN}██ ■ ██{colors.DEFAULT}
    {colors.PURPLE}██ ████{colors.DEFAULT}  {colors.BLUE}██ ████{colors.DEFAULT}  {colors.YELLOW}██ ████{colors.DEFAULT}  {colors.CYAN}██ ████{colors.DEFAULT}
    """

heart = f"""
{colors.RED}  ██    ██  {colors.DEFAULT} {colors.PURPLE}  ██    ██  {colors.DEFAULT} {colors.GREEN}  ██    ██  {colors.DEFAULT} {colors.CYAN}  ██    ██  {colors.DEFAULT}
{colors.RED} ████  ████ {colors.DEFAULT} {colors.PURPLE} ████  ████ {colors.DEFAULT} {colors.GREEN} ████  ████ {colors.DEFAULT} {colors.CYAN} ████  ████ {colors.DEFAULT}
{colors.RED} ██████████ {colors.DEFAULT} {colors.PURPLE} ██████████ {colors.DEFAULT} {colors.GREEN} ██████████ {colors.DEFAULT} {colors.CYAN} ██████████ {colors.DEFAULT}
{colors.RED}  ████████  {colors.DEFAULT} {colors.PURPLE}  ████████  {colors.DEFAULT} {colors.GREEN}  ████████  {colors.DEFAULT} {colors.CYAN}  ████████  {colors.DEFAULT}
{colors.RED}   ██████   {colors.DEFAULT} {colors.PURPLE}   ██████   {colors.DEFAULT} {colors.GREEN}   ██████   {colors.DEFAULT} {colors.CYAN}   ██████   {colors.DEFAULT}
{colors.RED}    ████    {colors.DEFAULT} {colors.PURPLE}    ████    {colors.DEFAULT} {colors.GREEN}    ████    {colors.DEFAULT} {colors.CYAN}    ████    {colors.DEFAULT}
{colors.RED}     ██     {colors.DEFAULT} {colors.PURPLE}     ██     {colors.DEFAULT} {colors.GREEN}     ██     {colors.DEFAULT} {colors.CYAN}     ██     {colors.DEFAULT}
        """

pacman = f"""
{colors.YELLOW}   ▄████▄ {colors.DEFAULT}   {colors.GREEN}   ▄████▄ {colors.DEFAULT}   {colors.RED}   ▄████▄ {colors.DEFAULT}   {colors.BLUE}   ▄████▄ {colors.DEFAULT}
{colors.YELLOW}  ███▄█▀  {colors.DEFAULT}   {colors.GREEN}  ███▄█▀  {colors.DEFAULT}   {colors.RED}  ███▄█▀  {colors.DEFAULT}   {colors.BLUE}  ███▄█▀  {colors.DEFAULT}
{colors.YELLOW} ▐████    {colors.DEFAULT}   {colors.GREEN} ▐████    {colors.DEFAULT}   {colors.RED} ▐████    {colors.DEFAULT}   {colors.BLUE} ▐████    {colors.DEFAULT}
{colors.YELLOW}  █████▄  {colors.DEFAULT}   {colors.GREEN}  █████▄  {colors.DEFAULT}   {colors.RED}  █████▄  {colors.DEFAULT}   {colors.BLUE}  █████▄  {colors.DEFAULT}
{colors.YELLOW}   ▀████▀ {colors.DEFAULT}   {colors.GREEN}   ▀████▀ {colors.DEFAULT}   {colors.RED}   ▀████▀ {colors.DEFAULT}   {colors.BLUE}   ▀████▀ {colors.DEFAULT}
"""

knight = f"""
{colors.RED}    ▄█████▄  {colors.DEFAULT}   {colors.PURPLE}▄█████▄  {colors.DEFAULT}   {colors.CYAN}▄█████▄  {colors.DEFAULT}   {colors.BLUE}▄█████▄  {colors.DEFAULT}
{colors.RED}    █▄▄ ▄▄█  {colors.DEFAULT}   {colors.PURPLE}█▄▄ ▄▄█  {colors.DEFAULT}   {colors.CYAN}█▄▄ ▄▄█  {colors.DEFAULT}   {colors.BLUE}█▄▄ ▄▄█  {colors.DEFAULT}
{colors.RED}    ███ ███  {colors.DEFAULT}   {colors.PURPLE}███ ███  {colors.DEFAULT}   {colors.CYAN}███ ███  {colors.DEFAULT}   {colors.BLUE}███ ███  {colors.DEFAULT}
{colors.RED}    ▀██ ██▀  {colors.DEFAULT}   {colors.PURPLE}▀██ ██▀  {colors.DEFAULT}   {colors.CYAN}▀██ ██▀  {colors.DEFAULT}   {colors.BLUE}▀██ ██▀  {colors.DEFAULT}
{colors.RED}      ▀ ▀    {colors.DEFAULT}   {colors.PURPLE}  ▀ ▀    {colors.DEFAULT}   {colors.CYAN}  ▀ ▀    {colors.DEFAULT}   {colors.BLUE}  ▀ ▀    {colors.DEFAULT}
"""

alien = f"""
{colors.RED}    ▀▄   ▄▀    {colors.DEFAULT} {colors.GREEN}    ▀▄   ▄▀    {colors.DEFAULT} {colors.YELLOW}    ▀▄   ▄▀    {colors.DEFAULT} {colors.BLUE}    ▀▄   ▄▀    {colors.DEFAULT}
{colors.RED}   ▄█▀███▀█▄   {colors.DEFAULT} {colors.GREEN}   ▄█▀███▀█▄   {colors.DEFAULT} {colors.YELLOW}   ▄█▀███▀█▄   {colors.DEFAULT} {colors.BLUE}   ▄█▀███▀█▄   {colors.DEFAULT}
{colors.RED}  █▀███████▀█  {colors.DEFAULT} {colors.GREEN}  █▀███████▀█  {colors.DEFAULT} {colors.YELLOW}  █▀███████▀█  {colors.DEFAULT} {colors.BLUE}  █▀███████▀█  {colors.DEFAULT}
{colors.RED}  █ █▀▀▀▀▀█ █  {colors.DEFAULT} {colors.GREEN}  █ █▀▀▀▀▀█ █  {colors.DEFAULT} {colors.YELLOW}  █ █▀▀▀▀▀█ █  {colors.DEFAULT} {colors.BLUE}  █ █▀▀▀▀▀█ █  {colors.DEFAULT}
{colors.RED}     ▀▀ ▀▀     {colors.DEFAULT} {colors.GREEN}     ▀▀ ▀▀     {colors.DEFAULT} {colors.YELLOW}     ▀▀ ▀▀     {colors.DEFAULT} {colors.BLUE}     ▀▀ ▀▀     {colors.DEFAULT}
"""

hacker_man = f"""
{colors.RED}     █ ▄▀█  █▀▄ █    {colors.DEFAULT}   {colors.DEFAULT}     █ ▄▀█ {colors.BLACK} █▀▄ █    {colors.DEFAULT}   {colors.PURPLE}     █ ▄▀█  █▀▄ █    {colors.DEFAULT}
{colors.RED}    ▐▌          ▐▌   {colors.DEFAULT}   {colors.DEFAULT}    ▐▌     {colors.BLACK}     ▐▌   {colors.DEFAULT}   {colors.PURPLE}    ▐▌          ▐▌   {colors.DEFAULT}
{colors.RED}    █▌▀▄  ▄▄  ▄▀▐█   {colors.DEFAULT}   {colors.DEFAULT}    █▌▀▄  ▄{colors.BLACK}▄  ▄▀▐█   {colors.DEFAULT}   {colors.PURPLE}    █▌▀▄  ▄▄  ▄▀▐█   {colors.DEFAULT}
{colors.RED}   ▐██  ▀▀  ▀▀  ██▌  {colors.DEFAULT}   {colors.DEFAULT}   ▐██  ▀▀ {colors.BLACK} ▀▀  ██▌  {colors.DEFAULT}   {colors.PURPLE}   ▐██  ▀▀  ▀▀  ██▌  {colors.DEFAULT}
{colors.RED}  ▄████▄  ▐▌  ▄████▄ {colors.DEFAULT}   {colors.DEFAULT}  ▄████▄  ▐{colors.BLACK}▌  ▄████▄ {colors.DEFAULT}   {colors.PURPLE}  ▄████▄  ▐▌  ▄████▄ {colors.DEFAULT}
"""

terminal = f"""
{colors.DEFAULT} _____                   _             _ 
{colors.DEFAULT}|_   _|                 (_)           | |
{colors.DEFAULT}  | | ___ _ __ _ __ ___  _ _ __   __ _| |
{colors.DEFAULT}  | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
{colors.DEFAULT}  | |  __/ |  | | | | | | | | | | (_| | |
{colors.DEFAULT}  \_/\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
                                        
"""

patterns = [block, pacman, knight, alien, hacker_man, terminal]
print(random.choice(patterns))
