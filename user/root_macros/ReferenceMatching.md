Reference-Matching User's Guide
======================================

~ Mark J. Duvall ~ [mjduvall at hawaii dot edu](mailto:mjduvall@hawaii.edu) ~ 05/2023 ~  

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
- Your reference set, collected test runs, and current test run are located in the directories `$REFDATA`, `$TESTDIR`, and `$TESTDATA`, respectively. For example:  
  -- `REFDATA=$DETECTOR/REF`  
  -- `TESTDIR=$REFDATA/TEST_RUNS`  
  -- `TESTDATA=$TESTDIR/TestRun0`  
  -- *Note: Placing `$TESTDATA` inside `$REFDATA` is recommended*  
- You are using a cluster or large server with at least 64 cores. If not, you will need to adjust the arguments of `angle_multibatch.sh` (run `angle_multibatch -h` for details).

**Summary**

1. [Run your reference simulation set](#runref)			-- `angle_multibatch.sh`  
2. [Extract the reference distributions](#exref)		-- `extractRef.cxx`  
3. [Run your test simulation set](#runtest)			-- `angle_multibatch.sh`  
4. [Extract the test distributions](#extest)			-- `extractTest.cxx`  
5. [Run the reference-matching algorithm](#algo)		-- `compareRef.cxx`
6. [Process the results](#process)				-- `KSSummary.cxx`
7. [Combine with other results](#multi) *[Optional]*		-- `TKSMultiRes`

---

## Details

### 1: Run Reference Set {#runref}
- Run your reference simulation set in `$DETECTOR`.  
- Create a directory for the reference data, and move the output there.  

***Example:***
```sh
cd $DETECTOR
angle_multibatch.sh ReferenceRun0 30 10000 50
# wait for runs to finish
mkdir -p REF
mv -t REF/ ReferenceRun0*
cd REF
REFDATA=$PWD
```

### 2: Extract Reference Distributions {#exref}
- Navigate to `$REFDATA` and open `ROOT`.  
- Execute the macro `extractRef.cxx` on the batch run's name prefix.  

***Example:***
```sh
cd $REFDATA
root
```
```cpp
extractRef("ReferenceRun0");
```

### 3: Run Test Set {#runtest}
- Run your test simulation set in `$DETECTOR`.  
- Create a directory for the test data, and move the output there.  

***Example:***
```sh
cd $DETECTOR
angle_multibatch.sh TestRun0 30 1000 50
mkdir -p REF/TEST_RUNS
mkdir TestRun0
mv -t TestRun0/ TestRun0??*
mv -t REF/TEST_RUNS/ TestRun0/
cd REF/TEST_RUNS
TESTDIR=$PWD
cd TestRun0
TESTDATA=$PWD
```

### 4: Extract Test Distributions {#extest}
- Navigate to `$TESTDATA` and open `ROOT`.  
- Execute the macro `extractTest.cxx` on the batch run's name prefix.  

***Example:***
```sh
cd $TESTDATA
root
```
```cpp
extractTest("TestRun0");
```

### 5: Execute Comparisons {#algo}
- ***This is where the magic happens!***
- Navigate to `$REFDATA` and run `ref_compare.sh` on *the relative path to* `$TESTDATA`.  
- This will use TRefMatch to examine each of the extracted test distributions and find its best statistical match in the reference set.
- The `ref_compare.sh` script can also accept arguments to run on an individual file, to use the Anderson-Darling test instead of Kolmogorov-Smirnov, and to look for a variable other than "phi"; its full parameters and default values are as follows:  
  `ref_compare.sh <FILE|DIRECTORY> [ANDERSON_TF=false] [VARNAME=phi]`

***Example:***
```sh
cd $REFDATA
ref_compare.sh TEST_RUNS/TestRun0
```

### 6: Compile Results Summary {#process}
- Navigate to `$TESTDATA`.  
- Open `ROOT` and run the macro `KSSummary.cxx`; the default parameters should work, so you can run it without arguments. This macro creates the following output files:  
  - `KSSummary.root`: a *ROOT* file containing the full results matrix and related plots;  
  - `KSSummary.png`: an exported *PNG* of the plots from the *ROOT* file;  
  - `KSSummary.txt`: a nicely-formatted *ASCII* view of the results matrix, with column labels included.  
- *[Optional]* If you don't have a graphical connection to the server or cluster, copy the `KSSummary` output files *(.root, .png,* and *.txt)* to your system (via, *e.g.,* `scp`).  
- Open the results and get ready to publish!  

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
REMOTE_HOST="mtc-b"	# for example
scp $REMOTE_HOST:$TESTDATA/KSSummary.{root,png,txt} .
```

### 7. Combine Results with Other Test Runs *[Optional]* {#multi}
If you have completed multiple test runs, you can combine their results to analyze the detector's performance over the aggregate dataset using `TKSMultiRes` as follows:  
- Navigate to `$TESTDIR`.  
- Open `ROOT`.  
- Create a TKSMultiRes object.  
- If desired, adjust settings (most commonly using the `SetRibbon()` method to turn the ribbon plot on [default] or off).  
- Call the `Run()` method.  
- If desired, save output using the `Save()` method.  

***Example:***
```sh
cd $TESTDIR
root
```
```cpp
TKSMultiRes M;
//M.SetRibbon(kFALSE); // deactivate ribbon plot if desired
M.Run();
M.Save();
```

---

## All Pau!

### That's it! Feel free to contact me using the address at the top of this page. Enjoy!

*-~- Last Updated 06/19/2023 -~-*
