tree2txt
===================

---

Instructions for using the 'tree2txt' utility from [this repository](https://github.com/duvall3/rat-pac/).

_Note: These are written for *nix systems (Mac/Linux)_

This utility includes the following files:
- [`tree2txt.sh`](https://github.com/duvall3/rat-pac/raw/collab/user/shell_scripts/tree2txt.sh) -- master shell script
- [`tree2txt.cxx`](https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/util/tree2txt.cxx) -- ROOT macro
- [`import_labeled_data.m`](https://github.com/duvall3/rat-pac/raw/collab/user/m_files/import_labeled_data.m) -- Octave/MATLAB script

---

### Installation

Place each file (or a link to it) in a directory within the relevant program's path,
or place it wherever you like and add that directory to the corresponding path.

You can view the paths for each program by running the following commands
within each program's prompt:  
- BASH/shell:  
    `echo $PATH` or, for easier readability,  
    `echo $PATH | tr ':' '\n'`  
- ROOT:  
    `gROOT->GetMacroPath()` or  
    `TString path(gROOT->GetMacroPath());`  
    `printf("%s\n", path.ReplaceAll(":","\n").Data());`  
- Octave/MATLAB:
    `path`

You can add directories to each program's path as follows:  
- During a session:  
  - BASH/shell:  
      `export PATH=$PATH:/directory/to/add`  
  - ROOT:  
      `TString path(gROOT->GetMacroPath());`  
      `path.Append(":/directory/to/add");`  
      `gROOT->SetMacroPath(path.Data());`  
  - Octave/MATLAB:  
      `addpath("/directory/to/add");`  
- Permanently (assuming default settings):  
  - BASH/shell and Octave/MATLAB: Simply add the lines given above to your `~/.bashrc` or `~/.bash_profile` and
    your `~/.octaverc`, respectively  
  - ROOT: Open your `~/.rootrc`, find the line containing `Unix.*.Root.MacroPath`, and append `:/directory/to/add`

**Example:**  
1) Place `tree2txt.sh` and `import_labeled_data.m` in `~/bin`, and place `tree2txt.cxx` in `$ROOTSYS/macros`  
2) Add the line `export PATH=$PATH:~/bin` to your `~/.bashrc` or `~/.bash_profile`  
3) Open your `~/.rootrc` (create it if necessary) and ensure that there is a line similar to the following: `Unix.*.Root.MacroPath	.:$(ROOTSYS)/macros`  
4) Add the line `addpath("~/bin");` to your `~/.octaverc` (again, create it if necessary)  

---

### Usage

Usage lines for each file are below; see the individual code files for details.  
- BASH/shell script:  
    `tree2txt.sh <INFILENAME> [TREENAME] [OUTFILENAME]`  
- ROOT macro:  
    `void tree2txt( const char* filename, const char* treename = "T", const char* outfilename = "" )`  
- Octave/MATLAB script:  
    `run import_labeled_data`  

**Example 1:**  
Suppose we have a ROOT file `datarun.root` containing a TTree named `T`,  
which we want to export to text and open for analysis in Octave.  
We would then run the following:

`user@host:~$ tree2txt datarun.root`

This will generate the file `datarun_T.txt`. Then we simply open Octave  
and run the script:

`user@host:~$ octave`  

`octave:1> run import_labeled_data`  
`Enter filename: datarun_T.txt`

Octave will then load the data and display the newly-created variables.

**Example 2:**  
Now suppose instead of the tree `T`, we want to extract  
a tree named `T_neutrons`. Furthermore, suppose we want  
the output filename to be `T_neutrons_extracted.txt`.  
Then we would run the following:

`user@host:~$ tree2txt datarun.root T_neutrons T_neutrons_extracted.txt`

This will generate the file `T_neutrons_extracted.txt`.  
We would then simply open Octave and run the `import_labaled_data`  
script the same as above, replacing `datarun_T.txt` with `T_neutrons_extracted.txt`.

---

### All Pau!   )

