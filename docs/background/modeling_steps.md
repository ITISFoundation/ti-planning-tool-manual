## Planning Steps

Starting from TIP v3.0, personalized optimizations are available. The personalized flavor allows the use of magnetic resonance (MR) and/or diffusion tensor imaging (DTI) data to obtain results tailored to an individual. Note that the precomputed flavors available in V2.0 are still supported.

The planning process is described below for both approaches. If users choose the precomputed path, they can disregard steps 1 to 4 and consider step 5 as the starting point.

Personalized Flavor Steps:
- **Step 1 - Image processing**: The "personalizer" uses either a T1-weighted MR image for isotropic simulations or a combination of T1 and DTI data to enable simulations with anisotropic conductivity in the brain's white matter. Based on this data, our AI model generates a tissue model and extracts anisotropic conductivity if DTI was provided.
- **Step 2 - Fiducials placement**: Users can inspect the quality of the predicted tissue model and then proceed to place the fiducial points: Nasion (Nz), Inion (Iz), Right Preauricular (RPA), and Left Preauricular (LPA).
- **Step 3 - Automatic electrode placement**: Based on the fiducials, the standardized 10-10 electrode system is placed on the head model, with electrode templates positioned at each location. Users can investigate the placement of all electrode models on the head to ensure proper positioning.
- **Step 4 - EM Simulations**: Isotropic or anisotropic simulations are automatically generated and solved. Once the results are available, all necessary files for optimization are exported.

Global Steps:
- **Step 5 - Setup**: In this step, users select the relevant species, stimulation target, and potential electrode locations (currently required to narrow down the extensive exposure configuration search space).
- **Step 6 - Optimal Configuration Identification**: Through extensive sweeping and optimization, a series of high-performing exposure parameters are proposed. Users can interactively explore these using predefined quantification metrics and visualizations. Identified conditions of interest can be documented and added to a report.
- **Step 7 - Exposure Analysis**: Finally, and optionally, users can freely visualize and analyze exposure conditions of interest using the web version of the Sim4Life computational life sciences platform (ZMT Zurich MedTech AG, Zurich, Switzerland).

Please refer to [Quick Start Guide](/docs/plan/start.md) section for more details. 

The principal computational steps are:
1. Electromagnetic modeling
2. Exploration of the exposure condition space

Additional background on these steps is provided in the following sections.
