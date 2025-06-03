## Planning Steps

The personalized TI plans allow the use of magnetic resonance (MR) and/or diffusion tensor imaging (DTI) data to obtain results tailored to an individual. Note that the precomputed flavors available in V2.0 are still supported.

The planning process is described below for both approaches. If users choose the precomputed path, they can disregard steps 1 to 4 and consider step 5 as the starting point.

Personalized Flavor Steps:

- **Step 1 - Image processing**: The "personalizer" uses either a T1-weighted MR image for isotropic simulations or a combination of T1 and DTI data to enable simulations with anisotropic conductivity in the brain's white matter. Based on this data, our AI model generates a tissue model and extracts anisotropic conductivity if DTI was provided. The neural network also automatically identifies and places anatomical landmarks for the EEG 10-10 system, eliminating the need for manual fiducial point placement.
- **Step 2 - Automatic electrode placement**: Based on the automatically identified fiducials, the standardized 10-10 electrode system is placed on the head model, with electrode templates positioned at each location. Users can investigate the placement of all electrode models on the head to ensure proper positioning.
- **Step 3 - EM Simulations**: Isotropic or anisotropic simulations are automatically generated and solved. Once the results are available, all necessary files for optimization are exported.

Global Steps:

- **Step 4 - Setup and Optimization**: In this step, users select the relevant species, stimulation threshold and target tissue, then click "Run Optimization" to initiate the surrogate-modeling-based (SuMo) optimizer.
- **Step 5 - Optimal Configuration Identification**: Using the optimizer, a diverse set of Pareto-optimal solutions is provided. Users can interactively explore these using predefined quantification metrics and visualizations, easily navigating trade-offs like selectivity versus intensity. Identified conditions of interest can be documented and added to a report.
- **Step 6 - Exposure Analysis**: Finally, and optionally, users can freely visualize and analyze exposure conditions of interest using the web version of the Sim4Life computational life sciences platform (ZMT Zurich MedTech AG, Zurich, Switzerland).

Please refer to [Quick Start Guide](/docs/plan/start.md) section for more details.

The principal computational steps are:

1. Electromagnetic modeling
2. Exploration of the exposure condition space

Additional background on these steps is provided in the following sections.
