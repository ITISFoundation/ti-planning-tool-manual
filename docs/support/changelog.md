## TIP V4.0 (4.0.0)

- [x] Implemented automated personalization with neural network-based fiducial point detection
- [x] Introduced SuMo optimizer replacing the previous sweeper
- [x] Streamlined user workflow by eliminating electrode selector and sweep steps
- [x] Enhanced parallel processing for up to 50% faster optimization runs
- [x] Improved visualization for Pareto-optimal solutions

## Custom waveform (2.0.17)

- [x] Fix electrode selector issue
- [x] Add custom phase modulation shapes to pm TI (as .txt or .csv file)

## Mask speedup (2.0.16)

- [x] Implemented a new mask generation algorithm, model loading in mc and pm TI speed-up

## Fieldloading implemented (2.0.15)

- [x] Implement a loading button for mc and pm TI modes to choose a model first before loading the field libraries.

## Shm and version (2.0.13)


## Adding debugging messages (2.0.13)

- Adding directories
- Bind species
- Ti current

- [x] 5th column in table "Current Fraction"


## fixed workers for pmTI mode. (2.0.12)

  - [x] The reference level for TI and HF distributions should be the peak of the (or the defined isopercentile) and reported in V/m, not in dB **MS**
  - [x] in graphs: envelope & RMS curves; fewer periods/samples? **MS**
  - [x] report template to be modified for mTI **MS**
  - [x] Reference peak = 28.17 dB. What does that mean? Can I then choose 'Range max' up to this value? or up to 0 (dBc)?


## Patch TIP 2.0.11 (2.0.11)



Fix es ii



Electrode Selector: new targets and less electrodes



## Error messages for missing input file or results and removed... (2.0.11)

Error messages for missing input file or results and removed FILE_IO.METRICTABLE. Only kept FILE_IO.OPTIMIZER_RESULT
- [x] Classic TI, make sure there is an input file **MS**
- [x] Button says "Run mTI" **MS**
- [x] Add indicators/progress-bars for the ``Run`` action **MS**
- [x] no (smooth) progress indicator. After hitting 'Run mTi' I wondered if it was computing or crashed. Coming back after 90m it had indeed computed (but the 'loading fields' bar was still all grey) **MS**
- [x] adding a progress bar. As the calculation takes long, it is impossible for the user to know if there is some calculation in progress or nothing is being done. **MS**
- [x] Remove 'optimization threshold' as we do not do optimization **MS**
- [x] Remove current sweep if we do not do a current sweep **MS**
- [x] Add information about electrode shape and size **MS**
- [x] the plots of the TI and HF metrics against weights show [V/m] negative values for both metrics **MS**


All models loadable now.



## New species fields (2.0.10)



More fixes



## Ti pp fb 08 09 (2.0.9)

- [x] make dots blue
- [x] Add an image of the electrode system, to facilitate the choice of the electrode
   - Missing: bind it to species selection
- [x] 'species' selector should be before the 'target' selector


## Fix qa (2.0.8)

- [x] Fix quantitative analysis tables
- [x] Copy cache files also to the output_1 folder


## Ti pp 28 07 feedback ii (2.0.7)

- [x] Hide the «Notebook initialized with ipy backend»
- [x] Range Min and Range Max dB, 2 decimals
- [x] Avoid duplicated tables due to "Log" press
- [x] Channel Weight A/B, 2 decimals


## Fix assets (2.0.6)

Some assets were missing on biobackup


## Bump version ii (2.0.5)



Tip v2 issuesfix



Fix legacy osparc integration

Some special love for the legacy integration into osparc


## Ti pp 28 07 fb ii (2.0.4)



## TI PostPro: 28.07 feedback I (2.0.3)



related to https://git.speag.com/oSparc/ti-solutions/-/issues/22


ES: extend species

Adds spices and bumps version.

related to https://git.speag.com/oSparc/ti-solutions/-/issues/22


## nii file was missing in biobackup (2.0.2)

There was no nii file in biobackup tiny. I just copied the one from production and bump the version to deploy a new one


## bump version (2.0.1)



boot modes renamed



Tip v2 phasemod

testing to see differences


## V2 (2.0.0)

Version 2.0.0

I guess this is a first candidate to setup the new pipeline


corrected the voila templates for different modes.



## Fix shm_size (1.1.4)

- shared memory size in docker container should be set to 6 GB
- Add missing plot style file via `pyproject.toml`


## Fix boot script (1.1.2)



## Update to recent Simphony (1.1.1)



Copy Mouse files from biobackup



Newest version of postpro supporting TI and mTI to create build for meeting. Still Buggy

ported percentile setting and reload button from other branch to main. need to update optimizer to take it into account


set WORKDIR



## Voila_mti and more species (1.1.0)

- ES: Added more humans
- PP: Support Voila_mti boot mode


Activate the mouse



Electrode Selector: add models-library



pip install SQLAlchemy==1.4.46



Electrode Selector: SQLAlchemy<2



## Left, Right and all together (1.0.59)



## Patch all (1.0.58)



Feature/extend targets list



## Extend targets list (1.0.57)

- [x] Extend Electrode Selector's list with 3 more targets (Insula left, Insula right and Retrosplenial Cortex)
- [x] Updated sab file (MIDA_Anisotropy_1010_V2.sab) added to ```\\biobackup\osparc\data\osparc-ti-solutions\MIDA_10_10\Production```


## Third output (1.0.56)



## Max 6 electrodes (1.0.55)



push .csv table to output 3 as requested by Antonino



Synchronize with simphony:master-9711

- Update requirements for optimizer and field_evaluator and switch base image


## No download link (1.0.54)



## Fix donwload link 2 (1.0.53)



## Fix report link in voila mode (1.0.52)



Id2widget 2



Id2widget 2



Id2widget 2



e2e: Id to Widgets



refactored slice viewer to work with image instead of a list. fixed slice...

refactored slice viewer to work with image instead of a list. fixed slice indicators going in wrong direction.


## download link... (1.0.51)



## Electrode Selector persistency (1.0.50)



fixed unexplainable erors.



## fix test ref data (1.0.49)



## bugfix (1.0.48)



optimizer improvements

- print log info message at each iteration
- specify scratch_folder (in optimizer service) as /home/smu/scratch. By default, it was /tmp. This is unfortunately(!) where the outputs are expected to be found (and zipped, and uploaded....).


## Bugifx patch (1.0.47)



Esras feedback (first half + all report)

All feedback for report implemented, formatting can be improved.
first part of gui feedback implemented. Since the log is now relative to the peak value ( such that the range is always max 0)
some tests will fail according to Sylvain and in the 3D isosurfaces i observe some strange behavior. I will have a closer look at this
when I implement the next changes.


## Esra's feedback: Odei's share (1.0.46)

- 3 accordions (expanded)
- default values
- tabs renaming
- buttons renaming
- remarks placeholder
- "Add to Report" renaming
- tight triple figure
- weights default to 0.5 and synced


## cleanup output (1.0.45)

- optimizer only produces the results.csv table and the json input file
- changed debug level to INFO, maybe that helps a bit


## add simple header (1.0.44)



header in, no fancy



report now working again. header missing.



## Use hard limits for resources in both s4l based services (1.0.43)



## lin and log metrics (1.0.42)

- field_evalutor:postpro_routine now produces both linear and log metrics (it was previously only giving the linear metrics in its results)
- no changes in optimizer routine (it was always providing all metrics)
- changes made in ti_gui:
  - metrics obtained from postpro_routine() now stored as a Dict[MetricsNames, List[Metrics]], so that everything is accessible
  - tried to make everything work (i.e. selecting the correct metric based on context: lin vs log, ti vs hf)  => PLEASE CHECK!!

TODO: update reference test results for postpro_routine()


Just a bit of refactoring



## new sab file (1.0.41)

datastructure of .sab file (provided by Antonino) has changed a bit.
- new targets folder
- new brain entities

-> adapted code
-> adapted test data


## TIPP: Fix Load Fields: ES: update tissues (1.0.40)



## Fix imports (1.0.39)



## Maiz/ti solutions pp fix paths (1.0.38)



adapted some paths and settings to make the gui kind of run again.



## adding support for "the last electrode" (1.0.37)

- only had to remove an error message printout in the log, the rest of the code was already doing the job
- added a test
- added some utility code to export E fields as cache files


project_folder for FieldEvaluator



Change tags

Change CI tags for runner


Improve report

Antonino's requests for electrode candidates and a complete table to be included in the report are implemented. 
References can be added to be shown at the bottom but citing within the text is not working properly yet. Not sure
if it is needed at all anyway.


PostPro: brand report



## bump service versions (1.0.36)

bumping versions of both optimizer and postpro services


Implement feedback



## Report: style plots (1.0.35)

Post Pro:
- [x] Report: style plots

Electrode Selector:
- [x] 4 target tissues removed


Implement feedback



Electrode Selector: Feedback & Cosmetics

![image](/uploads/41ffe350688294c3ea43801ac95e2f95/image.png)


adding tests, using common data, and some refactoring too

- optimizer and ti_gui now both use field_evaluator, with minimal code overlap (can still be improved a bit)
- the same data is used by all kernels and mounted in both optimizer and postpro services
- data exists in "Tiny" or "Production" versions
- added tests for field_evaluator, optimizer
- "blank" tests for ti_gui (should be populated at some point...)
- pydantic BaseModel used in many (but not all) places


## Some changes (1.0.34)

Electrode Selector:
- More feedback on the submit button
- Electrodes renamed: "Pair A - 1" -> "E1+"....
- patch version to 1.0.9

PostPro:
- biobackup data path updated
- Electrodes renamed: "Pair A - 1" -> "E1+"....
- patch version to 1.0.34


## Fix path 33 (1.0.33)



## patch version 32 (1.0.32)



## patch version 1.0.31 (1.0.31)



Update report

most of logic in place, styling needed


minor change to correct superposition principle.

Since the impedance table is based on Ampèrs, instead of multiplying with 1 and -1 we need to use 0.001 and -0.001 to get 
E-Fields that are normalized to 1mA.


Changes after new fork

Adapt to new workflow


## Merge all repos into one (1.0.30)

- Move `msteiner:ti_gui` to `kernels/ti_gui`
- Move `msteiner:field_evaluator` to `kernels/field_evaluator`


## patch version 29 (1.0.29)



## Mayavi in (1.0.28)



## patch 1.0.27 (1.0.27)



## Patch version 26 (1.0.26)



## Patch version 25 (1.0.25)



## Version patch 24 (1.0.24)

Don't sync workspace


Make it work



## version-patch-23 (1.0.23)



## version-patch-22 (1.0.22)



## version-patch-21 (1.0.21)



## version-patch 20 (1.0.20)



## patch-version 19 (1.0.19)



## patch-version-18 (1.0.18)



## Clone in workspace (1.0.17)



## Start non voila (1.0.16)



## patch-version (1.0.15)



## patch-version 14 (1.0.14)



## version-patch 13 (1.0.13)



## version patch (1.0.12)



## Increase limits (1.0.11)



## All inputs files (1.0.10)



## Z43 styling (1.0.9)



## Z43 styling (1.0.8)



## Z43 styling (1.0.7)



## Feature/dark theme (1.0.6)



## more inputs/outputs (1.0.5)



## Feat/test 11 (1.0.4)



## Simplify entrypoint voila (1.0.3)



## Long startup time (1.0.2)

Maybe avoid long startup time due to some incompatibility and add some documentation


Feature/renaming pairs

- [x] Groups -> Pairs
- [x] Colored shapes
![image](/uploads/6d19d56310cdff81e884e47d27d9d718/image.png)


## Fix X11 configuration (1.0.1)



Dedicated TI Planning Tool Postprocessor Service

Based on `jupyter-smash`


Electrode Groups and Submit button to the left side

![image](/uploads/09ed0d93c846f22e4368afb5321a0c37/image.png)


address memory leak



WIP: Submit w/ state

- [x] Submit with state, if selection changes, make Submit button orange
- [x] Select Brain structure -> Select Target Structure
- [x] Multipick


copy input file to output folder



Feature: renaming and styling



minor



Change resource requirements

- The optimizer would use defaults (2 GB, 1 CPU). New: 24 GB RAM, 8 CPUs
- Fix problem with logging


taking into account the "sim_db" parameter from the input file



Electrode selector review

- [x] Remove database entry
- [x] Reshuffle steps
- [x] Make electrodes easier to pick
- [x] Add feedback to the submit button
- [x] Tissue List coming from MIDA

![image](/uploads/cb6a0f6a9d63b5d02ac603fcad9a8de3/image.png)


Update service to latest kernel

- Upgrade to new cli
- fix some issues in the entrypoint script
- Upgrade to a newer version of simphony-master
- Switch to Prod db
- Add a regression test on the Prod database

Closes https://git.speag.com/oSparc/ti-solutions/-/issues/14


some more cleanup



Delete the old signing keys until we have a new base image

Bloody nvidia corp.


cleanup

Getting things ready before refactoring further:
- only cosmetic changes
- ran "black" and "isort" everywhere
- added pre-commit hooks
- add bump2version


cleanup outputs

mostly cosmetic changes


cleanup outputs

only cosmetic changes


Electrodes II

- [x] 4 groups
- [x] Place human's ears correctly
- [x] Mouse

![image](/uploads/3237a876acab60280be8b274d94b22df/image.png)


Refactor optimizer kernel

- Refactors kernel
- Refcators opttmizer-service
- Moves optimizer CI to gaia16
- Uses smb access instead of data docker images


Upgrade requirements

Such that the frontend MR goes in


New tissue list for electrode selector



Wankel

Bad merge


Wankel

Fix mockup data and add smash to output


Wankel: New data format for histograms

Dump both histograms (total and target)


Wankel: New workflow

Refactor output generation


Electrode Selector: Back to 10-10



Wankel: Epsiode 1

First trial for reintegration


Feature/electrode selector

Typo fixed


Fix access rights

- Fix access rights
- Add two more input parameters
- use zip instead of tar


Standalone optimizer

- refactor the repo structure
- optimizer is now a kernel package that gets installed into the image
- read the input.json


MaG goes picky



Select SimDB in ElectrodeSelector



Electrode selector. Feature requests

- [x] Showing 10-20 system (less electrodes)
- [x] Electrode group colored to make more clear what electrode goes in which group

![image](/uploads/ff3d37cc3d01d58e1485ac8086542cd4/image.png)


Feature/electrode selector



Electrode selector

Cranial Nerves out


Electrode selector

Tissues list updated


Electrode selector

- Updated input-retriever.py
- absolute path for input/output dirs


Feature/electrode selector

- production uses build as base image:
  - no need to reinstall express
  - RUN calls merged


Electrode selector

Fixes and writing and pushing output file


Import original code



set reverse-proxy to point to port 4000



Feature/electrode selector

with healthcheck?


Electrode selector

reinstalling express...


Feature/electrode selector



Electrode selector

Permission changed


Feature/electrode selector



Feature/electrode selector

More INPUT_FOLDER/OUTPUT_FOLDER removed


Electrode selector

removed all INPUT_FOLDER and OUTPUT_FOLDER checks in enypoint.sh


Electrode selector

No need to mount INPUT_FOLDER and OUTPUT_FOLDER


Electrode selector

With one input


Electrode selector

delete-image-from-registry-portus.bash path fixed


Electrode selector

missing variables


Electrode Selector

Fix deployment


Electrode selector

Some GUI improvements


Import original code
