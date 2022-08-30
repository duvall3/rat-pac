GEANT4 Utils for RAT-PAC | TRATGeoConverter
=============================================

` ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ `

> Part of [*Tools for Reactor-Antineutrino Studies in RAT-PAC*](github.com/duvall3/rat-pac/)

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


# Description

This class is designed to convert experiment geometries from RAT-PAC to GEANT4.
- It is developed for ROOT v5 and may not work in ROOT6.
- It operates on the ROOT files that RAT-PAC generates as its default type of output.

It is currently quite basic. As of this writing, the following are *not* yet implemented:
- volumes types other than `box` / `G4Box`
- volume rotations
- volume repetitions -- each item gets its own entry


# Usage

## Basic Usage

The most basic usage is to simply create an instance of TRATGeoConverter using your desired input filename and then call the *::Convert()* method, as illustrated below:

### Example Using Datafile `RAToutput.root`

```cpp
TRATGeoConverter gc("RAToutput.root");
gc.Convert();
```

## Advanced Usage

The only other features currently available are the querying and setting of the input and output filenames.
See the methods listed in the header file `TRATGeoConverter.h` for more information.
Beyond that, users are quite welcome to modify the source file `TRATGeoConverter.cxx` as they see fit (in accordance with the above license).
Other features will be documented here if and when they are added.


---


` ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ `



