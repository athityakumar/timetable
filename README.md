DESCRIPTION 
-----------
This is a simple script to lookup your timetable from the terminal. The `subjects []` in `timetable.rb` must be changed accordingly.

USING THE TOOL 
--------------
(0) Type the following commands on a terminal -
<br> (0.1) `git@github.com:athityakumar/timetable.git`
<br> (0.2) `cd timetable` 
<br> (0.3) `ruby timetable.rb` or `ruby timetable.rb All` or `ruby timetable.rb Monday`
<br><br>Even better way of usage would be, to include in `bin/` and `etc/bash_completion.d` folders.
<br> (1) For `bin/` :
<br> (1.1) `cd ~/../../bin/`
<br> (1.2) `sudo vim timetable`
<br> (1.3) Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) - 
<pre>cd ~/timetable;
<br>if [ $# = 0 ];
<br>then
<br>    ruby timetable.rb;
<br>else
<br>   ruby timetable.rb $1;
<br>fi
</pre>
<br><br> (2) For including `etc/bash_completion.d` :
<br> (2.1) `cd ~/../../etc/bash_completion.d`
<br> (2.2) `sudo vim timetable`
<br> (2.3) Copy paste this into vim editor (`Ctrl + Shift + V`) and save it (`Esc + : + q`) -
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
<br><br> Now, open a new terminal and type `timet` and press `Tab`. Auto-completes, eh? Even better, try pressing `Tab` after timetable to choose into a day easily.

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
