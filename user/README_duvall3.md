# duvall3's Fork of RAT-PAC

---

## Simulation and Analysis Pipeline

### Master Shell Script: `ratrun.sh`

For a datarun named DATARUN, `user/shell_scripts/ratrun.sh` will:

- Configure run by generating `run.mac`

- Create `DATARUN.conf` using `conflog.sh`

- Run `rat`, saving logs to `DATARUN.log` and ROOT data to `DATARUN.root`

- Run `process_rat_run.sh`:

  - Awk: `DATARUN.log` --> `DATARUN_energies.rt`

  - Run `duvallAnalyzeFull`:

    - Run `rt_to_root`: `DATARUN_energies.rt` --> `DATARUN_energies_T.root`

    - Run `particleTracksToScint`: `DATARUN.root` --> `DATARUN_T.root`

    - Run `correctEnergies`: update `DATARUN_T.root`

    - Run `duvallAnalyze`:

      - Run `SEDAQ2`: create `DATARUN_results.root` and various `PNG` plots

      - Run `angularRecon`: update `DATARUN_results.root` and create some more `PNG` plots

  - Create datarun directory `DATARUN/` and move all related files to it

  - If GEOLOG exists, copy it into `DATARUN` as well


---

_NOTE: This document presupposes that a working installation of RAT-PAC and its accompanying build of ROOT are active on the machine in use. In other words, the version of ROOT used MUST be one compiled against RAT-PAC, as described in the RAT-PAC documentation [here](https://rat.readthedocs.io/en/latest/installation.html)._

