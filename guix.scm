(use-modules
 ;;; These are my commonly needed modules; remove unneeded ones.
 (guix packages)
 ((guix licenses) #:prefix license:)
 (guix download)
 (guix build-system gnu)
 (gnu packages)
 (gnu packages autotools)
 (gnu packages pkg-config)
 (gnu packages texinfo)
 (gnu packages java)
 (guix gexp))

(package
  (name "java-cdr255")
  (version "0.0.1")
  (source (local-file (string-append "./"
                                     name
                                     "-"
                                     version
                                     ".tar.bz2")))
  (build-system gnu-build-system)
  (arguments
   `(#:tests? #f
     #:phases
     (modify-phases
      %standard-phases
      ;; This allows the paths for guile and java to be embedded in the scripts
      ;; in bin/
      (add-before
       'patch-usr-bin-file 'remove-script-env-flags
       (lambda* (#:key inputs #:allow-other-keys)
         (substitute*
          (find-files "./bin")
          (("#!/usr/bin/env -S guile \\\\\\\\")
           "#!/usr/bin/env guile \\")
          (("\"java")
           (string-append "\"" (search-input-file inputs "/bin/java"))))))
      ;; Java and Guile programs don't need to be stripped.
      (delete 'strip))))
  (native-inputs (list autoconf automake pkg-config texinfo
                       `(,openjdk17 "jdk")))
  (synopsis "A java user library")
  (description
   (string-append
    "A library of useful everyday procedures for Java, to avoid repeated
work."))
  (home-page
   "https://github.com/yewscion/java-cdr255")
  (license license:agpl3+))

      ;;;; Here is an example of one way to patch a script that references an
      ;;;; installed jarfile to work with the store.
      ;; (add-after
      ;;  'install 'subjars
      ;;  (lambda* (#:key outputs #:allow-other-keys)
      ;;    (let* ((out (assoc-ref outputs "out"))
      ;;           (bin (string-append out "/bin"))
      ;;           (share (string-append out "/share")))
      ;;      (substitute*
      ;;       (string-append bin
      ;;                      "/script")
      ;;       (("/usr/local/share/java/java-cdr255.jar")
      ;;        (string-append share
      ;;                       "/java/java-cdr255.jar"))))))

;; Local Variables:
;; mode: scheme
;; End:
