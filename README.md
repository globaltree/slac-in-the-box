### Howdy Globe:  This repository is where I share Common Lisp that Slacks! 👋
<!--
**slac-in-the-box/slac-in-the-box** is a ✨ _special_ ✨ repository because its `README.md` (this file) appears on your GitHub profile.
Here are some ideas to get you started:
- 🔭 I’m currently working on ...
- 🌱 I’m currently learning ...
- 👯 I’m looking to collaborate on ...
- 🤔 I’m looking for help with ...
- 💬 Ask me about ...
- 📫 How to reach me: ...
- 😄 Pronouns: ...
- ⚡ Fun fact: ...
-->
My first common lisp applicaton to share is called sbomg.lisp (sbo manager).  Whenever I upgrade slackware, I like to also upgrade all the third party packages available from https://www.slackbuilds.org.  sbomg.lisp does this and is a huge timesaver.  

The following prerequisites have to be met for sbomg.lisp to work

Default Slackware ships with clisp, so I'm just using that.

However, clisp has to be configured for quicklisp, common lisp's package manager for popular common lisp systems.  To do so, download https://beta.quicklisp.org/quicklisp.lisp , then at cli (on a slackware system of course), type clisp, and at the lisp prompt enter (load "quicklisp.lisp") and it will prompt you for how you want to configure quicklisp--I just choose all the defaults, which creates a folder in my home folder called quicklisp, and which loads the quicklisp system by default when I start clisp.  

Sbopkg from https://sbopkg.org is also a needed prerequisite.  And, because sbomg.lisp runs "slackpkg clean-system" between builds of the various 3rd-party packages from slackbuilds, sbopkg must be added to /etc/slackpkg/blacklist so clean-system doesn't remove it while sbomg.lisp is running.

Sbopkg comes with a bash script, Slackbuild Queue Generator, installed to /usr/sbin/sqg, which by default, skips creating queue files for packages that do not have any dependencies.  This behavior needs to be changed by editing sqg, and uncommenting the line:  SKIP_EMPTY=${SKIP_EMPTY:-NO}, because sbomg.lisp feeds the list of sbo packages to sqg and then processes the resultant queue files, and so needs queue files for single packages too. 

Once quicklisp is configured, once sbopkg is installed and added to the slackpkg blacklist, and once sqg has been modified to not skip empty queues, then, the system is prepared to build packages with sbomg.lisp.   At the cli in the directory where you saved sbomg.lisp excute clisp, and then at the lisp prompt enter (load "sbomg.lisp")--type the parentheses too of course--and watch it build your third party packages!  Oh, you probably will want to edit sbomg.lisp and add the third party packages you want to build.

Please fork and make improvements, as this is my first common-lisp project beyond hello-world, and I'm sure it could be improved.

-- slac.in.the.box
