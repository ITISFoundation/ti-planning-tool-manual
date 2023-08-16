# Release Notes

### TIP V2.0
_Release Date: 17.08.2023_ 

TIP V2.0 brings a range of new functionalities and improvements to the Temporal Interference Planning Tool (TIP).

_New Key Features_
- Library of highly detailed anatomical head models, complete with precomputed field exposures, enabling inter-subject variability assessment
- Mouse model to facilitate TI research involving rodents
- Two new modes complementing the classic TI model: multichannel TI and phase-modulation TI
- Expanded list of brain stimulation targets
- Flexibilized optimization goal functons
- Optimized utilization of cloud-computing and parallelization, delivering an interactive user experience for efficient exploration of large stimulation parameter spaces

Many smaller feature have also been added, e.g., to improve the presented information content and usability.

### TIP V1.0
_Release Date: 01.09.2022_ 

TIP V1.0 is the first public release of the Temporal Interference Planning Tool (TIP). The tool empowers individual researchers that might not be modeling experts and supports neuroscientists and brain stimulation experts in the design of optimized electrode placement and exposure conditions for targeted Temporal Interference Stimulation (TIS). 

_Features_

- Accessible fully online
- Based on o<sup>2</sup>S<sup>2</sup>PARC technology
- Based on libraries of precomputed fields
- TI planning setup
   - one anatomical model - [MIDA](https://itis.swiss/virtual-population/regional-human-models/mida-model/)
   - circular shape electrode with a fixed area
   - interactive electrode pair placement
   - selection of the target structure
- Fully automatic, exhaustive search of the considered electrode placement configuration space
- Three key metrics: target exposure magnitude, stimulation selectivity, and collateral stimulation
- Possibility to sort the list of TI configurations 
- Study of the resulting exposure can be studied and if desired, the configuration (electrode locations, current magnitudes) can be interactively refined. 
- Visualization of TI and high-frequency exposure distributions on top of medical image data
- Visualization of the fields in 2D and 3D
- Report generation
- Exporting fields in .cache
- Interactive exposure analysis in Sim4Life:web

