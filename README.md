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

As the second oldest extant programming language, Common Lisp has also stood the test of time.  John McCarthy noticed that Lambda Calculus already provided a syntax suitable to recursive iteration and hence the perfect syntax for a programming language.  Rather than kids copying each other, computer science was advanced when he created the first lisp language, published in 1960 in his paper, "Recurse Functions in Symbolic Expression and their Computation by Machine (Part I)".  Furthermore, the natural symbols of lambda calculus and common lisp are the same symbols used in arithmetic and algebra.  Controlling order of operations with parentheses is taught to children and thus feels natural, especially with a color coded indenting editor like emacs.  Common Lisp isn't still around because it's popular with all those eco-political factions.  Searching for it at google's summer of code dosn't yield any results.  It doens't turn up too many jobs when typing Common Lisp into the tech job search engines.  

### Therefore, the reason why Lisp is still around after 60 years, is because programmers like it!  I like it.  I find it to be the programming langauge with the least eco-political attachments, and the perfect langauge in which to develop humanitarian software.

This is where I share Common Lisp that Slacks!  

Whenever I upgrade slackware, I like to also upgrade all the third party packages available from https://www.slackbuilds.org.  With the help of the sbopkg and sqg tools from https://sbopkg.org, sbomg.lisp (short for sbo manage, or for slack builds oh my god, which ever you prefer) builds my lists of 3rd party packages available from slackbuilds.  

The following prerequisites have to be met for sbomg.lisp to work

A common lisp environment nees to be configured to use quicklisp, a tool for managing available common lisp systems.  To do so, download https://beta.quicklisp.org/quicklisp.lisp , then at cli (on slackware system of course), type clisp, and at the prompt enter (load "quicklisp.lisp") and it will prompt you for how you want to configure quicklisp--I just choose all the defaults, which creates a folder in my home folder called quicklisp, and loads the quicklisp system by default when I start clisp.

Sbopkg from https/sbopkg.org is also a needed prerequisite.  And, because sbomg.lisp runs slackpkg clean-system between builds of the various 3rd-party packages from slackbuilds, sbopkg must be added to /etc/slackpkg/blacklist so slackpkg clean-system doesn't remove it while sbomg.lisp is running.

Once quicklisp is configured, and once sbopkg is installed and added to the slackpkg blacklist, from the directory where you save sbomg.lisp excute clisp, and at the prompt enter (load "sbomg.lisp") and watch it build your third party packages.  Oh, you probably will want to edit sbomg.lisp and add the third party packages you want to build:  sbomg.lisp is divided into two sections, packages without dependencies, and packages with dependencies.  Manually add packages that don't have dependencies to the first list, and packages that do to the second.

Please fork and make improvements, as this is my first common-lisp project beyond hello-world, that actually does something useful (I used to spend too much time running slackbuild scripts manually).  If you like sbomg.lisp and want to donate to someone, donate to ponce, because there's no way this would work without sbopkg, or donate to pat, as there is no way this would work without slackware.

Beware of the pecking disorder.
-- slac.in.the.box
