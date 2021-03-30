*SBOMG.LISP (SLACKBUILDS.ORG (SBO) MANAGER)*


Purpose
=======

  Whenever I upgrade slackware, I like to also upgrade all the third
  party packages available from
  <https://www.slackbuilds.org>. sbomg.lisp does this and is a huge
  timesaver.


Preparing a Slackware System to use sbopkg.lisp
===============================================

  sbomg.lisp relies upon sbopkg, sbcl, quicklisp, and slackpkg.


sbopkg
~~~~~~

downloading
-----------

  wget
  <https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz>


installing
----------

  installpkg sbopkg-0.38.1-noarch-1_wsr.tgz


Configure to use current repository
-----------------------------------

  edit /etc/sbopkg/sbopkg.conf, updating the following lines to read
  like: REPO_BRANCH=${REPO_BRANCH:-current}
  REPO_NAME=${REPO_NAME:-SBo-git}


Configure sqg
-------------

  sbopkg also ships with slackbuilds queue generator (sqg) which by
  default will skip creating single package queue files for packages
  that do not have any dependencies; since sbompg.lisp parses the
  directory of queue files, it needs single package queue files present,
  so /usr/sbin/sqg must be edited: simply uncomment this line:
  SKIP_EMPTY=${SKIP_EMPTY:-NO}


sbcl
~~~~

install
-------

  now that we have sbopkg installed and configured, sbcl can be
  installed with one command: sbopkg -i sbcl


configure
---------

  edit your shell's run config file to export (or manually export) the
  environmental variable SBCL_HOME=/usr/lib64/sbcl ; or you could make a
  file in /etc/profile.d to set this system wide.


quicklisp
~~~~~~~~~

  sbcl needs to make use of quicklisp.  quicklisp violates the slackware
  way: it creates a folder in your home folder called ~/quicklisp, where
  it saves popularly shared common-lisp libaries for sbomg.lisp or other
  lisp applications to call upon on the fly.  All quicklisp changes
  occur in the ~/quicklisp folder, so uninstallation is as simple as
  deleting that folder.  A slackware purist would create a snapshot of a
  clean quicklisp folder, and then add one quicklisp library, and create
  a slackware package that could be installed or removed with
  slackware's pkgtools.  I've been skipping this because I know all the
  modifications occur in ~/quicklisp.  But since lisp libaries don't
  change that often, creating slackware packages out quicklisp libaries
  would be trivial, and is on the todo list.


downloading
-----------

  wget <https://beta.quicklisp.org/quicklisp.lisp>


installing and configuring
--------------------------

  sbcl --load quicklisp.org (this will prompt you for how you want to
  customize quicklisp: I just select the default, which puts the
  quicklisp folder in your home folder, and I confirm that I want sbcl
  to autoload quicklisp on startup.)


slackpkg
~~~~~~~~

  - slackpkg is used to clean the system between queues, so that each
    build is on a clean stock full install of slackware


/etc/slackpkg/blacklist
-----------------------

  when it's cleaning the system, it will remove sbcl and sbopkg, when
  sbomg.lisp is in the middle of relying upon them: therefore both sbcl
  and sbopkg must be added to /etc/slackpkg/blacklist


/etc/slackpkg/slackpkg.conf
---------------------------

  slackpkg also will prompt for confirmations, holding up batch
  processing of the queues. The changed lines to
  /etc/slackpkg/slackpkg.conf read as follows (without bullets or
  dashes):
  - DIALOG=off
  - BATCH=on
  - DEFAULT_ANSWER=y


/etc/slackpkg/mirrors
---------------------

  of course your nearest slackware mirror for current should be
  uncommented


configure
---------

  usually sbomg.lisp is run on freshly updated slackware system:
  - slackpkg update gpg
  - slackpkg update
  - slackpkg install-new
  - slackpkg upgrade-all
  depending on how your respond, .new configuration files could
  overwrite important configuration files, such as sshd_config--I like
  to respond with P, so it prompts me for what to do with each new
  config file.  if the kernel got updated, you might need to rebuild
  your initrd, update your bootloader, and reboot.  Then slackware is
  ready to run sbomg.lisp!


sbompg.lisp
===========

download
~~~~~~~~

  git clone <https://github.com/globaltree/slac-in-the-box.git>


configure
~~~~~~~~~

  cd slac-in-the-box chmod +x sbomg.lisp


instructions
~~~~~~~~~~~~

for small ists of packages to build
-----------------------------------

  ./sbopkg.lisp pkg1 pkg2 pkg3 ... (package names are case sensitive)


for large lists of packages
---------------------------

  - edit sbopkg.lisp
  - find the line that ends with the comment: "<-- THIS IS THE LINE TO
    CUSTOMIZE" and then customize it
  - be sure to preserve the syntax of single quote, followed by the
    package name wrapped in absolute value (pipe) signs, like the
    following: '|pkg1| '|pKg2| '|PKG3| ...  the single quote tells lisp
    not to evaluate the expression, that your just making a list, and
    the absolute value signs tells lisp that the lisp is case sensative.


  Please fork and make improvements, as this is my first common-lisp
  project beyond hello-world, and I'm sure it could be improved.

  -- slac.in.the.box
