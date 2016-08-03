DESCRIPTION 
-----------
This is a simple script to lookup your timetable from the terminal. The `subjects []` in `timetable.rb` must be changed accordingly.

USING THE TOOL (STARTERS)
-------------------------
- [x] `git@github.com:athityakumar/timetable.git`
- [x]  `cd timetable` 
- [x]  `ruby timetable.rb` or `ruby timetable.rb All` or `ruby timetable.rb Monday`

USING THE TOOL (ADVANCED)
-------------------------
- [x] Type the following commands on a terminal -
  - [x] `git@github.com:athityakumar/timetable.git`
  - [x]  `cd timetable` 
  - [x]  `ruby timetable.rb` or `ruby timetable.rb All` or `ruby timetable.rb Monday`
- [x] For `bin/` :
  - [x] `cd ~/../../bin/`
  - [x] `sudo vim timetable`
  - [x] Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) - 
  <pre>cd ~/timetable;
  <br>if [ $# = 0 ];
  <br>then
  <br>    ruby timetable.rb;
  <br>else
  <br>   ruby timetable.rb $1;
  <br>fi
  </pre>
- [x] For `etc/bash_completion.d` :
  - [x] `cd ~/../../etc/bash_completion.d`
  - [x] `sudo vim timetable`
  - [x] Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) -
  <pre>_timetable()
  <br>{
  <br>    local cur prev opts
  <br>    COMPREPLY=()
  <br>    cur="${COMP_WORDS[COMP_CWORD]}"
  <br>    prev="${COMP_WORDS[COMP_CWORD-1]}"
  <br>    opts="Monday Tuesday Wednesday Thursday Friday All"
  <br>    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
  <br>    return 0
  <br>}
  <br>complete -F _timetable timetable
  </pre>
- [x] Now, open a new terminal and type `timet` and press `Tab`. Auto-completes, eh? Even better, try pressing `Tab` after timetable to choose into a day easily.

CONTRIBUTION
------------
The work flow is the same as that of any other repository. 
<br> (1) Fork / clone the repository.
<br> (2) Create a new branch , say `my-changes` and make your changes in this branch.
<br> (3) Commit your changes and send a Pull request (PR) to this repository.
<br> Active contributors would be rewarded with the tag of "Collabrators"
<br> Bug fixes , Issues , Issue solutions , Optimizations & Enhancements are always welcome.

LICENSE
-------
The MIT License - [Athitya Kumar](http://github.com/athityakumar) - All Rights Reserved.
