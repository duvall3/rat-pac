README -- RAT-PAC Experiment Template
========================================

> ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2024 ~

This is a very simple set of recommendations for using
  the experiment template in [my RAT-PAC repository](https://github.com/duvall3/rat-pac)
  (specifically, in branch `collab` under `data/template/`).

---

<h2 id="essen">Essentials</h2>

<h3 id="parti">I. Directory and File Operations</h3>

First, in order to preserve the template, you'll want to copy it
  into a new directory named for your new experiment.
Since I'm assuming your experiment's name is some clever,
  overly-elaborate acronym, let's use the name "CLEVER" as an example.
```bash
cd $RATROOT/data/
cp -r template/ clever
```

Next, you'll want to change the filenames in the new directory
  to reflect your experiment's name.
If the `rename` tool is available, use it as follows;
  otherwise, simply change each name manually using `mv`.
```bash
rename 's/template/clever/g' ./*
```

Finally, you'll need to update the two lines in `init.mac`
  that tell RAT-PAC where to look for the experiment's files.
Using your favorite text editor, open `init.mac`, find the 
  lines containing `rat/db/set DETECTOR`, and change them
  to the following:
```bash
/rat/db/set DETECTOR experiment "clever"
/rat/db/set DETECTOR geo_file "clever/clever.geo"
```

<h3 id="partii">II. Experiment Definition</h3>

*Note: For an automated alternative, see [Usage](#usage) below under [Automated Geometry Generation](#autogen).*

At this moment, your experiment will only have the `world` and `cave`
  volumes defined.
Using your favorite (or least favorite, I'm not your boss) text editor,
  open `clever.geo`.
Using the existing volumes as a template, define a new volume
  at the center of `cave` -- i.e., with mother volume `"cave"`
  and position either omitted or set to `[0.0, 0.0, 0.0]`.
For the material, use a scintillator; I recommend either
  `"gd_scintillator"` or `"ej254_015li6"`, since these can be used
  without any additional setup.

<h3 id="partiii">III. Datarun Setup</h3>

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

<h3 id="partiv">IV. Basic Run</h3>

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

<h2 id="autogen">Automated Geometry Generation</h2>

<h3 id="over">Overview</h3>

If you'd like to simulate a more sophisticated geometry
  without typing out every volume entry by hand,
  I know of two readily-available options:

1. The various `Factory` classes located in `$RATROOT/src/geo/`. I will freely admit that I do not know how to use these, but you can find some information by searching the RAT documentation for `pmtarray`, and I believe there are some examples in the experiments defined in the official RAT repository (e.g., WATCHMAN).
2. The handful of BASH `geogen` scripts located in `$RATROOT/user/shell_scripts/` in this repository. I wrote these, so I can help with them.

Of the latter, the most generally-useful option is
  `geogen_general-segmented.sh`, so that is the one I will discuss here. 
The others are slightly less user-friendly; but they all work
  essentially the same way, so try them out if you're feeling adventurous.
And as always, this repo is open-source, so you're invited to modify
  and adapt them yourself.

The general function of all the `geogen` scripts is as follows:

1. Confirm the existence of a "base" geometry file (named, e.g., `clever_base.geo`), which is assumed to contain entries for the `world` and `cave` volumes.
2. Prompt the user for the parameters for an array of detector volumes and generate the array accordingly. (This gets written to, e.g., `clever_cell-array.geo`).
3. Combine the "base" and "cell-array" files into a final experiment-definition file (e.g., `clever.geo`).

In short: `base_file + generated_array_file --> experiment_geo_file`.

<h3 id="usage">Usage: Experiment Definition -- Alternate</h3>

This will replace [Part II](#partii) of the procedure under [Essentials](#essen) above.
For simplicity, I'll continue to use the name "CLEVER" for our
  example experiment, but you're welcome to create a new one
  for this if you prefer.

We should be in our experiment directory:
```bash
cd $RATROOT/data/clever
```

First, we actually need to clear the current experiment definition, because the script will (or at least should) refuse to overwrite
  an existing geometry.
It never hurts to back things up before deleting,
  so do the following if you've put any work into the current version:
```bash
mkdir geo_bak
cp -t geo_bak/ *.geo
```

Then we can use the script's `reset` command to get a clean slate:
```bash
geogen_general-segmented.sh reset
```

Finally, simply run the script:
```bash
geogen_general-segmented.sh
```
Follow the prompts (hit `<Enter>` or `<Return>` to accept default values),
  and the script should take care of the rest!

If everything works properly, you should now be able to resume the "Essentials" procedure at [Part III](#partiii) above.

Contact me if you have any questions, and may your simulations always be plausible!

---

All pau!   )

`~` MJD
