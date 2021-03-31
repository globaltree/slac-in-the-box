sbomg.lisp (slackbuilds.org (sbo) manager) changelog:


# <span class="timestamp-wrapper"><span class="timestamp">&lt;2021-03-30 Tue&gt;</span></span>

-   added a shebang (#!/usr/bin/sbcl &#x2013;script), so sbopkg.lisp can now
    be made executable and called from linux cli.
-   added parsing list of packages given as command-line arguments:
    script first checks if any command line arguments were given, and if
    so, processes the list from cli instead of the list from the script;
    so a master list of all third party packages can be customized in
    sbomg.lisp; but if only a few packages are needed, a list of
    packages can be given to the script on the cli.
-   For example:  ./sbomg.lisp MasterPDFEditor nginx vlc

