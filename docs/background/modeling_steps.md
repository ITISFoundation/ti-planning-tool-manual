## Planning Steps

The personalized TI plans allow the use of magnetic resonance (MR) and/or diffusion tensor imaging (DTI) data to obtain results tailored to an individual. Note that the precomputed flavors are also supported — users on a precomputed path can start directly from the Classic TI workflow step.

The planning process is described below for both approaches. See [Workflows](/docs/plan/workflows.md) for a full overview of all available plan types.

Personalized Workflow Steps:

- **[Offline Personalization](/docs/services/data_privacy.md)** *(optional)*: For privacy-sensitive workflows, users can run the full personalization pipeline locally using `run_personalizer.bat` (requires Sim4Life 9.4+). Raw MRI is anonymized on-device and only the segmented head model is uploaded to TIP.
- **[File Picker](/docs/services/file_picker.md)**: Upload a T1-weighted MR image for isotropic simulations, a zipped T1+DTI package for anisotropic simulations, or the anonymized zip archive from the Offline Personalization step.
- **[Personalizer](/docs/services/personalizer.md)**: An AI model generates a tissue model from the uploaded data and extracts anisotropic conductivity if DTI was provided. The neural network also automatically identifies and places anatomical landmarks for the EEG 10-10 system, eliminating the need for manual fiducial placement.
- **[Model Inspector](/docs/services/fiducials_placement.md)**: Users can inspect the generated head model and, if needed, manually place or correct fiducial points. If manual fiducial placement is required, the Personalizer must be re-run afterward to position the electrodes on the 10-10 system (see the fallback section in [Personalizer](/docs/services/personalizer.md)).
- **[Simulator](/docs/services/simulator.md)**: Isotropic or anisotropic EM simulations are automatically generated and solved on AWS. Once results are available, all necessary files for optimization are exported.

All Plan Types:

- **[Classic TI](/docs/services/post_processing.md)**: Users select the species, stimulation threshold, and target tissue, then run the surrogate-modeling-based (SuMo) optimizer. A diverse set of Pareto-optimal solutions is provided; users can interactively explore trade-offs like selectivity versus intensity. As of TIP V5.0, optimization completes in 5–10 minutes. Identified configurations can be documented and added to a report.
- **[Exposure Analysis](/docs/services/s4l_post_processing.md)**: Optionally, users can freely visualize and analyze exposure conditions using the full Sim4Life workbench (Modeling, Simulation, and Analysis sections), with ready-to-use template projects available for all precomputed models (TIP V5.0+).

Please refer to [Quick Start Guide](/docs/plan/start.md) section for more details.

The principal computational steps are:

1. Electromagnetic modeling
2. Exploration of the exposure condition space

Additional background on these steps is provided in the following sections.
