DESCRIPTION 
-----------
This is a simple script to lookup your timetable from the terminal. The `subjects []` in `timetable.rb` must be changed accordingly.

USING THE TOOL 
--------------
- [ ] Type the following commands on a terminal -
  - [ ] `git@github.com:athityakumar/timetable.git`
  - [ ]  `cd timetable` 
  - [ ]  `ruby timetable.rb` or `ruby timetable.rb All` or `ruby timetable.rb Monday`
- [ ] Even better way of usage would be, to include in `bin/` and `etc/bash_completion.d` folders.
  - [ ] For `bin/` :
    - [ ] (1.1) `cd ~/../../bin/`
    - [ ] (1.2) `sudo vim timetable`
    - [ ] (1.3) Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) - 
    <pre>cd ~/timetable;
    - [ ]if [ $# = 0 ];
    - [ ]then
    - [ ]    ruby timetable.rb;
    - [ ]else
    - [ ]   ruby timetable.rb $1;
    - [ ]fi
    </pre>
  - [ ] For `etc/bash_completion.d` :
    - [ ] (2.1) `cd ~/../../etc/bash_completion.d`
    - [ ] (2.2) `sudo vim timetable`
    - [ ] (2.3) Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) -
    <pre>_timetable()
    - [ ]{
    - [ ]    local cur prev opts
    - [ ]    COMPREPLY=()
    - [ ]    cur="${COMP_WORDS[COMP_CWORD]}"
    - [ ]    prev="${COMP_WORDS[COMP_CWORD-1]}"
    - [ ]    opts="Monday Tuesday Wednesday Thursday Friday All"
    - [ ]    COMPREPLY=( $(compgen -W "$opts" -- $cur) )
    - [ ]    return 0
    - [ ]}
    - [ ]complete -F _timetable timetable
    </pre>
- [ ] Now, open a new terminal and type `timet` and press `Tab`. Auto-completes, eh? Even better, try pressing `Tab` after timetable to choose into a day easily.

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
