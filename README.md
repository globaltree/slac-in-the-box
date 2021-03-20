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
Here's the situation:  there are too many programming languages -- please stop making them and learn Common Lisp! Why are there so many programming languages?  Greedy Money Grubbing Glory:  each new programming language serves some faction's economic and political agenda.  It has something to do with millions of young programmers, with fresh degrees in computer science, but without wisdom or guidance, following each other -- and they keep making new programming languages just to feel powerful, but without actually advancing computer science.    

I'm a slacker -- that is, a user of Slackware Linux, a distribution that has stood the test of time.  It has been said, that when one learns slackware one learns linux.  It is also said that slackware is for advanced users; however, IMHO, due to its clear documentation that actually works when one follows it to the tee, Slackware is just as much for users who want to advance in their understanding of gnu linux.  

As the second oldest extant programming language, Common Lisp has also stood the test of time.  Instead of syntax created at the arbitrary whim of young programmers, John McCarthy noticed that Lambda Calculus already provided a syntax suitable to recursive iteration and hence the perfect syntax for a programming language.  Computer science was advanced when he created the first lisp language, published in 1960 in his paper, "Recurse Functions in Symbolic Expression and their Computation by Machine (Part I)".  Furthermore, the natural symbols of lambda calculus and common lisp are the same symbols used in arithmetic and algebra.  Controlling order of operations with parentheses is taught to children and thus feels natural, especially with a color coded indenting editor like emacs.  

Common Lisp is not popular with all those eco-political factions:  searching for it at google's summer of code dosn't yield any sponsors; nor does common lisp turn up too many jobs when typed into the tech job search engines.  Why hasn't common lisp died like so many others?  

### The reason why Lisp is still around after 60 years, is because programmers like it!  I like it.  Hacking in the REPL is a fun way to program.  

Common Lisp has the least eco-political attachments, making it the perfect langauge in which to develop humanitarian software.

The slac-in-the-box repository is where I share Common Lisp that Slacks!  

My first common lisp applicaton to share is called sbomg.lisp (sbo manager).  Whenever I upgrade slackware, I like to also upgrade all the third party packages available from https://www.slackbuilds.org.  sbomg.lisp does this and is a huge timesaver.  

The following prerequisites have to be met for sbomg.lisp to work

Default Slackware ships with clisp, so I'm just using that.

However, clisp has to be configured for quicklisp, common lisp's package manager for popular common lisp systems.  To do so, download https://beta.quicklisp.org/quicklisp.lisp , then at cli (on a slackware system of course), type clisp, and at the prompt enter (load "quicklisp.lisp") and it will prompt you for how you want to configure quicklisp--I just choose all the defaults, which creates a folder in my home folder called quicklisp, and loads the quicklisp system by default when I start clisp.  

Sbopkg from https://sbopkg.org is also a needed prerequisite.  And, because sbomg.lisp runs "slackpkg clean-system" between builds of the various 3rd-party packages from slackbuilds, sbopkg must be added to /etc/slackpkg/blacklist so clean-system doesn't remove it while sbomg.lisp is running.

Once quicklisp is configured, and once sbopkg is installed and added to the slackpkg blacklist, at the cli in the directory where you saved sbomg.lisp excute clisp, and then at the lisp prompt enter (load "sbomg.lisp"), and watch it build your third party packages!  Oh, you probably will want to edit sbomg.lisp and add the third party packages you want to build:  sbomg.lisp is divided into two sections, packages without dependencies, and packages with dependencies.  Manually add packages that don't have dependencies to the first list, and packages that do to the second.

Please fork and make improvements, as this is my first common-lisp project beyond hello-world, that actually does something useful (I used to spend too much time running slackbuild scripts manually).  If you like sbomg.lisp and want to donate to someone, donate to ponce, because there's no way this would work without sbopkg, or donate to pat, as there is no way this would work without slackware.

Beware of victims of the pecking disorder:  they're everywhere, and don't understand that its a disorder. 

-- slac.in.the.box
