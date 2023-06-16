Reference-Matching User's Guide
======================================

` ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2023 ~ `

---

## Description

This is a user's guide for the set of software within *Tools for Reactor-Neutrino Studies in RAT-PAC* ([github.com/duvall3/rat-pac](github.com/duvall3/rat-pac)) that implements our algorithm for matching experimental datasets to reference distributions.
See [user/root_macros/doc/html/index.html](index.html) in this repository for more information on the entire toolset.

---

## Procedure

**Parameters**

These instructions will make the following assumptions:  
- You have already completed the *Installation* instructions given on [the main page](index.html).  
- This repository is located in the directory `$RATDIR` -- often simply `$HOME/rat-pac`, for example.  
- Your `RAT-PAC` experiment is located in the directory `$DETECTOR` -- for example, `DETECTOR=$RATDIR/some_experiment`  
- Your reference and test dataruns are located in the directories `$REFDATA` and `$TESTDATA`, respectively. For example:  
  -- `REFDATA=$DETECTOR/REF`  
  -- `TESTDATA=$REFDATA/TEST`  
  -- *Note: Placing `$TESTDATA` directly inside `$REFDATA` is recommended*  
- You are using a cluster or large server with at least 64 cores. If not, you will need to adjust the arguments of `angle_multibatch.sh` (run it without arguments for details).

**Summary**

1. [Run your reference simulation set](#runref)			-- `angle_multibatch.sh`  
2. [Extract the reference distributions](#exref)		-- `extractRef.cxx`  
3. [Run your test simulation set](#runtest)			-- `angle_multibatch.sh`  
4. [Extract the test distributions](#extest)			-- `extractTest.cxx`  
5. [Generate the comparison commands](#gencomp)			-- `ref_compare.sh`  
6. [Execute the comparison commands](#excomp)			-- ***shell***  
7. [Process the results](#procres)				-- `KSSummary.cxx`

---

## Details

<h2 id="runref">1: Run Reference Set</h2>
- Run your reference simulation set in `$DETECTOR`.<br>
- Create a directory for the reference data, and move the output there.<br>

***Example:***
```sh
cd $DETECTOR
angle_multibatch.sh ReferenceRun0 30 10000 50
# wait for runs to finish
mkdir REF
mv -t REF/ ReferenceRun0*
cd REF
REFDATA=$PWD
```

<h2 id="exref">2: Extract Reference Distributions</h2>
- Navigate to `$REFDATA`, open `ROOT`, and execute the macro `extractRef.cxx`<br>

***Example:***
```sh
cd $REFDATA
root
```
```cpp
extractRef("ReferenceRun0");
```

<h2 id="runtest">3: Run Test Set</h2>
- Run your test simulation set in `$DETECTOR`.<br>
- Create a directory for the test data, and move the output there.<br>

***Example:***
```sh
cd $DETECTOR
angle_multibatch.sh TestRun0 30 1000 50
mkdir TEST
mv -t TEST/ TestRun0*
mv -t REF/ TEST/
cd REF/TEST
TESTDATA=$PWD
```

<h2 id="extest">4: Extract Test Distributions</h2>
- Navigate to `$TESTDATA` and open `ROOT`.<br>
- Loop the macro `extractTest.cxx` over the subdirectories.<br>

***Example:***
```sh
cd $TESTDATA
for DIR in TestRun0*/; do
  ROOTCMD="root -q -l -b 'extractTest.cxx(\"$DIR\", kTRUE)'"
  eval $ROOTCMD
done
```

<h2 id="gencomp">5: Generate Comparison Commands</h2>
- Navigate to `$REFDATA` and run `ref_compare.sh` on `$TESTDATA`.<br>
- This will create a file called `ref_compare.txt` in `$TESTDATA`.<br>
- *Note: Use the **relative** path for `$TESTDATA` in the arguments to `ref_compare.sh`.*<br>

***Example:***
```sh
cd $REFDATA
ref_compare.sh TEST
```

<h2 id="excomp">6: Execute Comparison Commands</h2>
- *Note: This part of the procedure is a rough placeholder hack while an improved solution is under development.*<br>
- Open the file `$TESTDATA/ref_compare.txt` in a GUI text editor. *Note: This may require you to transfer the file to your local system (via, e.g., `scp`) if the remote server is not GUI-capable.*<br>
- Select all, then copy, then close the editor.<br>
- Navigate back to `$REFDATA` if you are not still there.<br>
- Paste the copied text into the terminal.<br>

<h2 id="procres">7: Compile Summary</h2>
- Navigate to `$TESTDATA`.<br>
- Open `ROOT` and run the macro `KSSummary.cxx`; the default parameters should work, so you can run it without arguments.<br>
- Copy the output files `KSSummary.root` and `KSSummary.png` to your system (via, *e.g.,* `scp`).<br>
- Open the results and get ready to publish!<br>

***Example:***
```sh
cd $TESTDATA
root
```
```cpp
KSSummary();
.q
```
```sh
# on your local machine, in whatever output directory you like:
scp mtc-b:$TESTDATA/KSSummary.root .
scp mtc-b:$TESTDATA/KSSummary.png .
```

---

## All Pau!   )

*-~- Last Updated 05/20/2023 -~-*
