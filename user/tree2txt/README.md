tree2txt
===================

Instructions for using the `tree2txt` utility from [duvall3's fork of RAT-PAC on GitHub](https://github.com/duvall3/rat-pac/).

This utility includes the following code files:
- [`tree2txt.sh`](https://github.com/duvall3/rat-pac/raw/collab/user/shell_scripts/tree2txt.sh) -- master shell script
- [`tree2txt.cxx`](https://github.com/duvall3/rat-pac/raw/collab/user/root_macros/util/tree2txt.cxx) -- ROOT macro
- [`import_labeled_data.m`](https://github.com/duvall3/rat-pac/raw/collab/user/m_files/import_labeled_data.m) -- Octave/MATLAB script

---

```text
Copyright (C) 2022 Mark J. Duvall

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

---

## Installation

_Note: These are written for *nix systems (Mac/Linux)_

### Automatic

Download and run the shell-script installer: [`tree2txt_Installer.sh`](https://github.com/duvall3/rat-pac/raw/collab/user/tree2txt/tree2txt_Installer.sh)

### Manual

Place each file (or a link to it) in a directory within the relevant program's path,
or place it wherever you like and add that directory to the corresponding path.

You can view the paths for each program by running the following commands
within each program's prompt:  
- BASH/shell:  
    ```sh
    echo $PATH # or, for easier readability,  
    echo $PATH | tr ':' '\n'  
    ```
- ROOT:  
    ```cpp
    gROOT->GetMacroPath() // Note: DO omit the semicolon here. Or, use:  
    TString path(gROOT->GetMacroPath());  
    printf("%s\n", path.ReplaceAll(":","\n").Data());  
    ```
- Octave/MATLAB:
    ```matlab
    path
    ```

You can add directories to each program's path as follows,  
replacing `directory/to/add` with your desired directory:  
- During a session:  
  - BASH/shell:  
      ```sh
      export PATH=$PATH:/directory/to/add  
      ```
  - ROOT:  
      ```cpp
      TString path(gROOT->GetMacroPath());  
      path.Append(":/directory/to/add");  
      gROOT->SetMacroPath(path.Data());  
      ```
  - Octave/MATLAB:  
      ```matlab
      addpath("/directory/to/add");  
      ```
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

## Usage

Usage lines for each file are below; see the individual code files for details.  
- BASH/shell script:  
    ```sh
    tree2txt.sh <INFILENAME> [TREENAME] [OUTFILENAME]  
    ```
- ROOT macro:  
    ```cpp
    void tree2txt( const char* filename, const char* treename = "T", const char* outfilename = "" )  
    ```
- Octave/MATLAB script:  
    ```matlab
    run import_labeled_data  
    ```

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

## All Pau!   )

