<style type="text/css">
  mark {
    color: white;
    background-color: #1D2127;
  }
  mark.pad {
    width: 60em;
    white-space: pre-wrap;
    padding-left: 2em;
    display: inline-block;
  }
  mark.command {
    color: #33EE33;
  }
  mark.var {
    color: #ffa657;
  }
  mark.const {
    color: #79c0ff;
  }
  mark.str {
    color: #c53bcf;
  }
</style>

# mcBasics

---

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

---

## OVERVIEW

`MCBASICS` is a simple `ROOT` program demonstrating how to read Monte-Carlo from a `RAT-PAC` output file.  

## USAGE

### Preparation (Input)
Any `RAT-PAC` output file with events in it should work.
For convenience, a sample datafile is included here as <mark class="str">`example.root`</mark>.

### Running
To use `mcBasics`, simply open `ROOT` (in this directory) and run the following two lines:
```cpp
.L ./mcBasics.cxx
mcBasics("example.root");
```

### Output
The macro will create an output file called <mark class="str">`example_mcBasics.root`</mark>.
If it fails to run properly, you can still examine the intended output by opening the file <mark class="str">`example_mcBasics_default.root`</mark>.
It should contain the following:  
- a TTree called <mark class="const">`T_mc`</mark> containing the extracted data  
- a TCanvas, <mark class="const">`c_mc`</mark>  
- four histograms (three TH1F and one TH3F), <mark class="const">`ht, hq, hc, hr`</mark>  <!--FIXME-->
See the comments in <mark class="str">`mcBasics.cxx`</mark> for details on the histograms and TTree branches.


## FURTHER DETAILS
Beyond the comments in these macros, you can find more general information in [the `RAT-PAC` documentation](https://rat.readthedocs.io/en/latest/).
For specific information on the <mark>`MC`</mark> structure that `RAT-PAC` uses to store MC-Truth data, see <mark class="var">`$RATROOT/src/ds/`</mark>, especially the following <mark class="str">`.hh`</mark> files: <mark class="str">`MC, MCSummary, MCParticle, MCTrack, MCTrackStep`</mark>.

---

*Last updated 11/01/2022*
