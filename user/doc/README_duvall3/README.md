# duvall3's Fork of RAT-PAC

---

Copyright (C) 2015 Mark J. Duvall

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

**A copy of the GPL is provided at `rat-pac/user/doc/README_duvall3/gpl-3.0.txt`**

---

## Simulation and Analysis Pipeline
**NOTE: See *pipeline.pdf* in `user/doc/README_duvall3/` for a graphical representation.**

---

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

  - If GEOLOG exists, copy it into `DATARUN/` as well


---

_NOTE: This document assumes that a working installation of RAT-PAC and its accompanying build of ROOT are active on the machine in use. In other words, the version of ROOT used MUST be one compiled against RAT-PAC, as described in the RAT-PAC documentation [here](https://rat.readthedocs.io/en/latest/installation.html)._

