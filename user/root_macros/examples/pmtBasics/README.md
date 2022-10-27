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

# pmtBasics

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

`PMTBASICS` is a simple `ROOT` program demonstrating how to read PMT-hit data from a `RAT-PAC` output file.  
*Note: It is currently split into two macros (<mark class="str">`pmtBasics.cxx`</mark> and <mark class="str">`drawCentroid.cxx`</mark>) due to an unknown graphics error.*

## USAGE

### Preparation (Input)
This macro is designed to extract information that `RAT-PAC` generates for sensitive-detector volumes.
The key steps to activate this feature are as follows:  
1. Ensure that your experiment's <mark class="str">`.geo`</mark> file contains <mark class="const">`sensitive_detector`</mark> volumes (see <mark class="var">`$RATROOT/data/cylinder/`</mark> for an example).  
2. Ensure that the *simple-daq* and *centroid-fitter* event processors are included in your event loop. You can do this by including the following lines in your `RAT-PAC` macro after <mark class="command">`/run/initialize`</mark> and before <mark class="command">`rat/proclast`</mark>:  
```sh
/rat/proc simpledaq
/rat/proc fitcentroid
```
For convenience, a sample datafile is included here as <mark class="str">`example.root`</mark>.

### Running
To use `pmtBasics`, simply open `ROOT` (in this directory) and run the following two lines:
```cpp
.L ./pmtBasics.cxx
pmtBasics("example.root");
```

### Output
The macro will create an output file called <mark class="str">`example_pmtBasics.root`</mark>.
If it fails to run properly, you can still examine the intended output by opening the file <mark class="str">`example_pmtBasics_default.root`</mark>.
It should contain the following:  
- a TTree called <mark class="const">`T_qt`</mark> containing the extracted data  
- two TCanvases, <mark class="const">`c_qt, c_r`</mark>  
- four histograms (three TH1F and one TH3F), <mark class="const">`ht, hq, hc, hr`</mark>  
See the comments in <mark class="str">`pmtBasics.cxx`</mark> and <mark class="str">`drawCentroid.cxx`</mark> for details on the histograms and TTree branches.


## FURTHER DETAILS
Beyond the comments in these macros, you can find more general information in [the `RAT-PAC` documentation](https://rat.readthedocs.io/en/latest/).
For specific information on the <mark>`EV`</mark> structure that `RAT-PAC` uses to store data about triggered-PMT events, see <mark class="var">`$RATROOT/src/ds/`</mark>, especially the files <mark class="str">`EV.hh`</mark> and <mark class="str">`MCPMT.hh`</mark>.

---

*Last updated 10/26/2022*
