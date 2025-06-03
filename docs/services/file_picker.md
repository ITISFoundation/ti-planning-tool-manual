## Preparing Your Data

This preparatory step is crucial for smooth operation of the pipeline. If you choose to follow the personalized pipeline, you have the prepare your data according to our acceptable formatting and setting.

### MRI Data Quality Requirements for Optimal Modeling

To ensure the highest quality of the head models, please adhere to the following guidelines:

1. **File Format**

   - Ensure your MRI data is in the NIfTI file format (`.nii.gz`).
   - Only a T1 weighted scan is needed. **Please make sure the file name contains "t1" somewhere.**

2. **Data Integrity**

   - The MRI scans should be free from artifacts and implants.
   - Presence of tumors, stroke lesions, or similar conditions may result in a low-quality model.

3. **Device Specifications**

   - Training data included images from 1.5 and 3 Tesla MRI devices manufactured by Siemens, Philips, and GE HealthCare.

4. **Field-of-View Requirements**

   - The field-of-view should cover the complete width of the head.
   - Vertically, the scan should extend from the top of the head to at least the mid-neck.

5. **Avoid High Deformations**

   - Avoid high deformations around the ear region (e.g., due to headphones) as this can make the placement of fiducials difficult.

<br>
<p align="center">
  <img width="60%" src="assets/quickguide/TIP_v3_files-MRI.png">
</p>

### DWI Data Quality Requirements

Providing DTI data is only necessary, if you would like to use anisotropic conductivity in the white matter of the brain as described in [**Dielectric Tissue and Material Properties**](/docs/material_methods/dielectric_properties.md). Please follow these points to make sure that the model generation and simulations function correctly.

1. **File Format**

   - Ensure your DWI data includes the following files:
     - NIfTI file format (`.nii.gz`)
     - Gradient values file (`.bval`)
     - Gradient directions file (`.bvec`)

2. **Co-Registration**

   - Ensure that the MRI and DTI scans are co-registered.

3. **Field-of-View Requirements**

   - The field of view needs to include the whole brain.

<br>
<p align="center">
  <img width="60%" src="assets/quickguide/TIP_v3_files-DTI.png">
</p>

### Q: What to do if your DTI data contains PA / AP acquisitions?

**A:** AP / PA refer to the polarity of the phase encoding direction of the acquired sequences. AP / PA volumes are acquired to offer a way to correct the distortions that typically appear in EPI sequences, so they are used at the preprocessing stage, prior to fitting your (e.g. DTI) model.

So, you do not fit your local model into them separately; they are used at the preprocessing stage in order to get a single DWI volume where the relevant distortions have been corrected to the extent that is possible.

DIPY by itself does not offer a method to correct such distortions, so you will need to use third-party tools for that purpose. One very well-known and widely used tool is **FSL**. You can read more about how to use the tools FSL offers for this purpose [here](https://www.fmrib.ox.ac.uk/primers/intro_primer/ExBox20/IntroBox20.html).

There are a few packages out there that perform dMRI data preprocessing steps in a principled way, calling the required FSL methods under the hood and transparently to the user. You can find a comparison of such packages [here](https://qsiprep.readthedocs.io/en/latest/comparisons.html).

*Source*: [dipy discussions](https://github.com/dipy/dipy/discussions/3289)
