REFERENCE-MATCHING SYSTEM for Angular Reconstruction (ReMStAR)
---------------------------------------------------------------

> ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~

> Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
> 
>     This program is free software: you can redistribute it and/or modify
>     it under the terms of the GNU General Public License as published by
>     the Free Software Foundation, either version 3 of the License, or
>     (at your option) any later version.
> 
>     This program is distributed in the hope that it will be useful,
>     but WITHOUT ANY WARRANTY; without even the implied warranty of
>     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>     GNU General Public License for more details.
> 
>     You should have received a copy of the GNU General Public License
>     along with this program.  If not, see <http://www.gnu.org/licenses/>.


---


## General

This is a test implementation of ReMStAR, which is a procedure for reconstructing the incident direction of an electron-antineutrino undergoing inverse beta decay (IBD) in a scintillation detector -- though the method itself is applicable to a much broader range of problems in statistical analysis.

The current version aims to reconstruct the azimuthal angle *only*, given the assumption that the neutrino source (namely, a fission reactor) is located on the detector's horizon.
This assumption is valid for all immediately-plausible deployment scenarios.

---

## Test-System Parameters

### Detector 0

General-purpose detector archetype

- *Azimuthal Periodicity:* **n * (2π/6)**, or Every 60°
- *References Needed:* **φ =  0°--30°**
- *Nominal Angular Width:* **σ = 50°**
- *Reference Sample Size:* **N = 100 000**

---

## Bookkeeping

### Filename Structure: `phi --> %2dDEG_ref.root`

### File Contents

- `TMap params` discribing how the distribution was generated
- `TTree T` --> `TBranch phi` containing the actual data, distributed according to the Gaussian described in `params`
- `TH1F h_phi` showing the distribution of `phi` along with a Gaussian fit
- `TCanvas c_genref` containing `h_phi`



