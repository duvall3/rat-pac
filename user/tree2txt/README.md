tree2txt
===================


Instructions for using the 'tree2txt' utility from [this repository](https://github.com/duvall3/rat-pac/).

This utility includes the following files:
- `tree2txt.sh` -- master shell script
- `tree2txt.cxx` -- ROOT macro
- `import_labeled_data.m` -- Octave/MATLAB script


### Installation

_Note: These are written for *nix systems (Mac/Linux)_

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
- Octave/MATLAB: `path`

You can add directories to each program's path as follows:
- During a session:
  - BASH/shell:  
      `export PATH=$PATH:/directory/to/add`  
  - ROOT:  
      `TString path(gROOT->GetMacroPath());`  
      `path.Append(":/directory/to/add");`  
	  `gROOT->SetMacroPath(path.Data());`
  - Octave/MATLAB: `addpath("/directory/to/add");`
- Permanently (assuming default settings):
  - BASH/shell and Octave/MATLAB: Simply add the lines given above to your `~/.bashrc` or `~/.bash_profile` and
    your `~/.octaverc`, respectively
  - ROOT: Open your `~/.rootrc`, find the line containing `Unix.*.Root.MacroPath`, and append `:/directory/to/add`

Example:  
1) Place `tree2txt.sh` and `import_labeled_data.m` in `~/bin`, and place `tree2txt.cxx` in `$ROOTSYS/macros`  
2) Add the line `export PATH=$PATH:~/bin` to your `~/.bashrc` or `~/.bash_profile`  
3) Open your `~/.rootrc` (create it if necessary) and ensure that there is a line similar to the following: `Unix.*.Root.MacroPath	.:$(ROOTSYS)/macros`  
4) Add the line `addpath("~/bin");` to your `~/.octaverc` (again, create it if necessary)  



### Usage

A typical example usage follows; see the individual code files for details.

Suppose we have a ROOT file `datarun.root` containing a TTree named "T",  
which we want to export to text and open for analysis in Octave.
We would then run the following:
s
`user@host:~$ tree2txt datarun.root`

This will generate the file `datarun_T.txt`. Then we simply open Octave  
and run the script:

`user@host:~$ octave`  
  
`octave:1> run import_labeled_data`  
`Enter filename: datarun_T.txt`

Octave will then load the data and display the newly-created variables.


