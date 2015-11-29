#from github.com/gdbinit/Gdbinit
set confirm off
set verbose off
set history filename ~/.gdb_history
set history save
set height 0
set width 0

set output-radix 0x10
set input-radix 0x10

set auto-load safe-path /
set disassembly-flavor intel

source ~/dotfiles/gdb_scripts/gdbinit.py
