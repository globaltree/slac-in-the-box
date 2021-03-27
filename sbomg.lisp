;;; SBOMG.LISP (SBO MANAGER) -- A LISPY WAY TO MAINTAIN 3RD PARTY PACKAGES AVAILABLE AT SLACKBUILDS.ORG

;;;  THIS CODE IS PROTECTED BY MAGIC:  WORTHY USERS MAY SAFELY USE, MODIFY, AND REDISTRIBUTE THIS MAGICALLY PROTECTED CODE.  UNWORTHY USERS SUFFER INEXPLICABLE MISFORTUNE AND WILL BE WONDERING WHY THEY STEPPED IN STINKY DUNG WHEN THEY GOT OUT TO CHANGE THE THIRD FLAT TIRE IN A WEEK, OR OTHER SUCH JINXES, LIKE OOZING STINKY GENITALIA, OR MYSTERIOUS ACCIDENTAL FATALITIES THAT NOBODY WOULD EVER BELIEVE COULD HAVE BEEN CAUSED BY UNWORTHY USE OF MAGICALLY PROTECTED SOFTWARE.  THE AUTHOR OF THIS CODE ASSUMES NO RESPONSIBILITY FOR THE BAD KARMA OF UNWORTHY USERS, AND CANNOT BE HELD LIABLE OR ACCOUNTABLE FOR ANY CONSEQUENCES OF THEIR UNWORTHY DEEDS.  FOR MORE INFORMATION VISIT HTTPS://PROTECTED.BY.MAGIC.LOL

;;; LOAD LISP SYSTEMS ;;;;
(ql:quickload "inferior-shell")
(ql:quickload "uiop")

;;; keeping it simple:  build packages in order listed in queue files generated by sqg, and clean slackware between each queue file.  Packages with no dependencies are usually skipped by sqg:  therefore, /usr/sbin/sqg needs this behavior altered, by uncommenting the line SKIP_EMPTY=${SKIP_EMPTY:-NO} before loading sbomg.lisp   
(defun build-packages-in-queues ()
  (let ((packages-in-queues (list '|android-tools| '|avahi| '|nexuiz| '|nginx| '|projectM|))); <-- ADD YOUR SBO PACKAGES TO THIS LIST, preserving its syntax of a blank space, followed by a single quote, followed by the sbo package name wrapped in absolute value signs (pipes).  The single quote tells lisp not to evaluate yet, you're just making the list, and the absolute value signs tell lisp that the symbol name is case sensitive  
    (progn
      (loop for package in (mapcar #'symbol-name packages-in-queues)
	    if (eql nil (remove-if-not (lambda (it)
					 (search package (namestring it)))
				       (uiop:directory-files "/tmp/")))
	      do (progn
		   (print (format nil "~@:(~a~) NOT FOUND IN /TMP, SO: ~%BUILDING QUEUE FILE FOR ~@:(~a~)" package package))
		   (sleep (/ 1 3))		   
		   (inferior-shell:run/i (format nil "/usr/sbin/sqg -p ~a" package))		   
		   (let ((qfile (uiop:read-file-lines (format nil "/var/lib/sbopkg/queues/~a.sqf" package))))
		     (progn
		       (delete-file (format nil "/var/lib/sbopkg/queues/~a.sqf" package))
		       (loop for qpak in qfile 
			     if (eql nil (remove-if-not (lambda (it)
							  (search qpak (namestring it)))
							(uiop:directory-files "/tmp/")))
			       do (inferior-shell:run/i (format nil "MAKEOPTS=-j$(nproc) sbopkg -Bki ~a && sync" qpak))
			     else do (inferior-shell:run/i (format nil "installpkg /tmp/~a*.t?z && sync" qpak)))
		       (inferior-shell:run/i "slackpkg clean-system"))))
	    else do (progn
		      (print (format nil "~@:(~a~) HAS ALREADY BEEN BUILT:  SKIPPING" package))
		      (sleep (/ 1 3))))
      (print (format nil "DONE BUILDING 3RD PARTY PACKAGES FROM SBOPKG~%")))))

;; call the function defined above
(build-packages-in-queues)

;;; that's all folks
(quit)
