## Planning Steps

Starting from TIP v3.0, personalized optimizations are available. The personalized flavor allows the use of magnetic resonance and/or diffusion tensor images of choice, to obtain results tailored to an individual. Note that the precomputed flavors that were available in V2.0 are still supported.

The planning process is described below for both approaches. Should the user proceed with the precomputed path, steps 1 to 5 can be disregarded and step 6 is considered the first step.

Personalized flavor only steps:
- **Step 1 - Images processing**: The so-called personalizer, either uses a T1-weighted MR image for isotropic simulations only, or a T1 in combination with DTI data to enable simulations with anisotropic conductivity in the white matter of the brain as well. Based on this data, a tissue model is generated using our AI model and anisotropic conductivity is extracted if DTI was provided.
- **Step 2 - Fiducials placement**: In this step, users can inspect the quality of the predicted tissue model and then proceed to place the fiducials' points: Nz, Iz, RPA and LPA.
- **Step 3 - Automatic electrode placement**: Based on the fiducials, the standardized 10-10 electrode system is placed on the head model and electrode templates are placed at each location. The placement of all electrode models on the head can be investigated to ensure proper positioning.
- **Step 4 - EM Simulations**: Isotropic or anisotropic simulations are automatically generated and solved. Once the the results are available, all necessary files for the optimization are exported.

Global Steps:
- **Step 5 - Setup**: In a first step, the relevant species, stimulation target, and potential electrode locations (currently required to narrow down the huge exposure configuration search space) are selected.
- **Step 6 - Optimal Configuration Identification**: Based on extensive sweeping/optimization, a series of highly performing exposure parameters are proposed for the user to interactively explore, using predefined quantification metrics and visualizations. Identified conditions-of-interest can be documented and added to a report.
- **Step 7 - Exposure Analysis**: Finally, and optionally, exposure conditions-of-interest can be visualized and analyzed freely, using the web-version of the Sim4Life (ZMT Zurich MedTech AG, Zurich, Switzerland) computational life sciences platform.

Please refer to [Quick Start Guide](/docs/plan/start.md) section for more details. 

The principal computational steps are i) the electromagnetic modeling and ii) the exploration of the exposure condition space, for which additional background is provided in the next sections.