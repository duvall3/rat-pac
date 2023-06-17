ROOT MACROS AND CLASSES
===================

Instructions for using the (most useful) macros and classes in
  *github --> duvall3 --> rat-pac --> branch collab --> user --> [root_macros](https://github.com/duvall3/rat-pac/blob/collab/user/root_macros)*.

---

### Installation

_Note: These are written for *nix systems (Mac/Linux)_

1. After git-cloning this repository (or downloading the individual files),
  run the `macro_paths.sh` script located in this directory
  and follow the instructions it provides.
2. If you are using the `rootlogon.C` provided in this directory,
  then everything should now be ready.
  If you are using your own `rootlogon.C` elsewhere, simply append the contents
  of this directory's version to yours. 

---

### Usage

Open ROOT and run `.x duvall3Include.cxx` to load the macros and classes.  
For further information:  
1. If you're currently only viewing the file `README.md`, then start with the rest of this documentation, located at `doc` > `html` > [`index.html`](index.html);  
2. For documentation on the reference-matching algorithm, see the [Reference-Matching User's Guide](md_ReferenceMatching.html).  
3. If you don't find what you need, see the comments in the individual files; and finally,  
4. If you still need assisstance after that, feel free to contact me at [duvall3 dot git at gmail dot com](mailto:duvall3.git@gmail.com).

---

### Credits

For full info on authorship, license, etc., see credits.dox.

To cite this software, use the following BibTeX entry:

```bib
@misc{Duvall:2022,
      author = {Duvall, Mark},
      license = {GPL-3.0+},
      title = {{Tools for Reactor-Antineutrino Studies in RAT-PAC}},
      url = {https://github.com/duvall3/rat-pac},
      note = {v1.2.0 / RAT v6c50cc3},
      year = {2022}
}
```

---

*Updated 10/2022*
