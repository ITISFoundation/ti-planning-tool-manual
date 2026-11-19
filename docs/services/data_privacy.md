<script setup>
import { withBase } from 'vitepress'
</script>

## Offline Personalization

**_Summary_**:

TIP V5.0 introduces an optional offline personalization workflow for users with data privacy requirements. A personalizer pipeline, available as part of [Sim4Life](https://sim4life.swiss/), is run locally to generate an anonymized, segmented head model from a T1 MRI scan. The tool deforms facial features beyond recognition while fully preserving the internal tissue structures relevant for TI simulation planning. Only the anonymized, segmented output is uploaded to the cloud for electromagnetic simulation.

----

### Motivation

In the standard TIP workflow, magnetic resonance (MR) images are uploaded directly to the cloud for processing, including automatic segmentation from MR images and personalization of the head model. Some users and institutions have concerns about uploading identifiable medical images to remote servers. To address this, TIP V5.0 provides a **local anonymization workflow** that ensures no personally identifiable anatomical features leave the user's local environment.

### How It Works

The anonymization workflow consists of two stages:

#### 1. Local Preprocessing (on your machine)

The local personalizer pipeline (`run_personalizer.bat`) generates an anonymized, personalized head model with electrode placement from a T1 MRI scan using Sim4Life.

**Prerequisites**
- [Sim4Life](https://sim4life.swiss/) **version 9.4 or 10.0**, installed on Windows.
- A T1 MRI scan in NIfTI format (`.nii.gz`). The filename must contain `t1`.
- The `personalizer` Python package is automatically installed into Sim4Life's bundled Python environment.
- Atlas data (~37 MB) is downloaded automatically to `%USERPROFILE%\.personalizer` on first run.

**Input files**

Place your input files in the project's input directory:

```
project_root\
└── inputs\
    ├── input_1\
    │   └── subject_t1.nii.gz       (required — T1 MRI scan)
    ├── input_2\
    │   └── fiducials.sab            (optional — electrode positions)
    └── input_3\
        └── sim_settings.json        (optional — simulation settings)
```

**Running the tool**

Open a Command Prompt and run the batch file. Paths containing spaces must be enclosed in double quotes:

```bat
run_personalizer.bat --project-root C:\data\subj01 --electrode-radius 7.0
```

#### Required Arguments

You must provide the project location:

| Argument              | Description                                                |
| --------------------- | ---------------------------------------------------------- |
| `--project-root PATH` | Project root directory (contains `inputs/` and `outputs/`) |

And **at least one** of:

| Argument                | Description                                 |
| ----------------------- | ------------------------------------------- |
| `--electrode-radius MM` | Electrode radius in mm (e.g. `7.0`)         |
| `--electrode-type TYPE` | Preset type: `ROUND_1_6CM2` or `ROUND_3CM2` |



#### Optional Arguments

**General**


| Argument                  | Default                | Description                  |
| ------------------------- | ---------------------- | ---------------------------- |
| `--sim4life PATH`         | _(auto-detected)_      | Sim4Life installation directory (if omitted, compatible versions are searched) |
| `--atlas NAME`            | _(none)_               | Brain atlas to register (e.g. `ICBM_152`) |
| `--no-electrodes`        | off                     | Skip electrode placement |
| `--electrodes-only`      | off                     | Replace the EEG electrodes in the existing workspace model without regenerating it or running the atlas/DTI stages |


**DTI**
| Argument                  | Default                | Description                  |
| ------------------------- | ---------------------- | ---------------------------- |
| `--dti`                  | off                     | Process DTI/DWI data for anisotropic conductivity |
| `--register-dti`         | off                     | Register DTI to MRI before conductivity extraction (safe only for minor translations with **no rotation** — if rotation is involved, register the MRI to the DTI yourself) |
| `--denoise-dti`          | off                     | Denoise DTI data before conductivity extraction |
| `--max-bval INT`         | _(none)_                | Exclude DTI shells above this b-value threshold (e.g. `1000`) |
| `--dti-model MODEL`      | `auto`                  | Diffusion model for conductivity extraction: `auto`, `dti`, or `dki` |
| `--bvec-frame FRAME`     | `fsl`                   | Coordinate frame of the b-vectors in the `.bvec` file: `fsl` or `world` |


#### DTI Model Selection (--dti-model MODEL)

- `auto` selects DKI when the input contains at least two non-zero b-value shells; otherwise it selects DTI.
- `dti` fits a second-order diffusion tensor assuming Gaussian diffusion. It is best suited to low-to-moderate diffusion weighting; estimates can become biased when non-Gaussian diffusion is significant at higher b-values.
- `dki` accounts for non-Gaussian diffusion by jointly estimating diffusion and kurtosis tensors. It requires multi-shell data with at least three b-value levels including b=0.

When `dti` is selected for data containing a shell at or above b=1500, the pipeline emits a warning. Use `dki` for suitable multi-shell data, or use `--max-bval` to restrict fitting to lower shells.

#### B-vector Frame (--bvec-frame FRAME)

The `.bvec` file does not encode its coordinate frame. The default, `fsl`, means
the vectors are in voxel axes, as written by `dcm2niix` (with x negated for
right-handed affines); they are rotated into the world frame before fitting.
Use `world` when the vectors are already in the scanner/world frame, for example
when derived directly from DICOM or supplied as an MRtrix table. Select the
frame from the data's provenance; it cannot be detected from the vector values.


#### What it does

- The tool **deforms facial features** (face, ears, etc.) beyond recognition, removing identifying characteristics from the image.
- Crucially, internal tissue structures relevant for TI planning are **not degraded** by this process.
- It **automatically segments** the different tissues in the image and generates a personalized head model with electrode placement.

#### Output

The pipeline produces the following files in the project's `outputs/` directory:

| Folder              | Contents                            |
| ------------------- | ----------------------------------- |
| `outputs/output_1/` | SMASH file (`.smash`) — head model  |
| `outputs/output_2/` | SAB file (`.sab`) — head model      |
| `outputs/output_3/` | T1 image (`.nii.gz`) — processed T1 |
| `outputs/output_4/` | Diffusion Tensor (`.nii.gz`) — DTI in S4L convention |
| `outputs/output_5/` | JSON config — target coordinates    |
| `outputs/output_6/` | SAT file (`.sat`) — head model      |
| `outputs/output_7/` | T1 image resampled (`.nii.gz`) — processed T1 |
| `outputs/output_8/` | Label field (`.nii.gz`) — tissue labels    |
| `outputs/output_9/` | Tissue list (`.txt`) — tissue names |

All output files are bundled into a zip archive (`results.zip`) along with a `personalizer_args.json` file that records the exact parameters used.

> **Tip**: To inspect the anonymized head model locally, open Sim4Life, go to **File > Open...**, and select the `.smash` file from the outputs.

#### 2. Cloud Simulation (AWS)

- Upload the output zip directly to the TIP platform.
- The platform runs **66 ohmic quasi-static electromagnetic simulations** on the AWS cloud using the anonymized personalized head model.
- These 66 basis simulations can be **recombined at the postprocessing stage** to reproduce the TI fields for any electrode montage — there is no need to rerun simulations when exploring different configurations.

### Cost

Running the cloud simulations for a personalized head model costs approximately **$60 per model**. This cost is at the charge of the user and is managed through the [Billing Center](/docs/platform_introduction/billing_center.md).

### Key Benefits

- **Privacy**: Identifiable facial features never leave your local machine. Only the anonymized, segmented head model is uploaded.
- **Accuracy**: Internal tissue geometry is fully preserved — simulation quality is not compromised.
- **Flexibility**: The 66 precomputed basis simulations allow postprocessing exploration of any electrode montage without additional simulation cost.
- **Integration**: The personalizer pipeline is bundled with [Sim4Life](https://sim4life.swiss/) (version 9.4+) and installs its dependencies automatically on first run.

### Requirements

- A local installation of [Sim4Life](https://sim4life.swiss/) on Windows.
- Supported S4L versions: **9.4 / 10.0**
- The offline personalizer batch file: <a :href="withBase('/assets/offline_personalizer_batch/run_personalizer.bat')" download="run_personalizer.bat">Download</a>.
- A T1-weighted MRI scan in `.nii.gz` format meeting the [data quality requirements](/docs/plan/data_quality_requirements.md).
- A TIP account with sufficient credits for cloud simulation (see [Billing Center](/docs/platform_introduction/billing_center.md)).
