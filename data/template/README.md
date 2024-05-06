README -- RAT-PAC Experiment Template
========================================

> ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2024 ~

This is a very simple set of recommendations for using
  the experiment template in [my RAT-PAC repository](https://github.com/duvall3/rat-pac)
  (specifically, in branch `collab` under `data/template/`).

---

## Essentials

### Directory and File Operations

First, in order to preserve the template, you'll want to copy it
  into a new directory named for your new experiment.
Since I'm assuming your experiment's name is some clever,
  overly-elaborate acronym, let's use the name "ACRO" as an example.
```bash
cd $RATROOT/data/
cp -r template/ acro
```

Next, you'll want to change the filenames in the new directory
  to reflect your experiment's name.
If the `rename` tool is available, use it as follows;
  otherwise, simply change each name manually using `mv`.
```bash
rename 's/template/acro/g' ./*
```

Finally, you'll need to update the two lines in `init.mac`
  that tell RAT-PAC where to look for the experiment's files.
Using your favorite text editor, open `init.mac`, find the 
  lines containing `rat/db/set DETECTOR`, and change them
  to the following:
```bash
/rat/db/set DETECTOR experiment "acro"
/rat/db/set DETECTOR geo_file "acro/acro.geo"
```

### Experiment Definition

At this moment, your experiment will only have the `world` and `cave`
  volumes defined.
Using your favorite (or least favorite, I'm not your boss) text editor,
  open `acro.geo`.
Using the existing volumes as a template, define a new volume
  at the center of `cave` -- i.e., with mother volume `"cave"`
  and position either omitted or set to `[0.0, 0.0, 0.0]`.
For the material, use a scintillator; I recommend either
  `"gd_scintillator"` or `"ej254_015li6"`, since these can be used
  without any additional setup.

### Datarun Setup

Next, we need to set parameters for the datarun -- namely,
  1) the name of the output file,
  2) which event generator(s) to use, and
  3) how many events to run.
Let's call this run `test0` and run 16 events using the generator
  defined in `gen/erica.mac`.
Edit `setup.mac` and `run.mac` so that they contain the following lines:
```bash
# in setup.mac:
/control/execute gen/erica.mac

# in run.mac:
/rat/procset file "test0.root"
# ...
/run/beamOn 16
```

### Basic Run

Okay, everything should be ready now!
Run RAT-PAC using the following command:
```bash
rat -l test0.log run.mac
```

If it runs successfully, you should be able to
  view the RAT-PAC log using `less test0.log`
  and the actual results using `root test0.root`.

Enjoy!

---

All pau!   )

`~` MJD
