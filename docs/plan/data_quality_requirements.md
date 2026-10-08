## Data Quality Requirements

This preparatory step is crucial for smooth operation of the pipeline. If you choose to follow the [personalized pipeline](/docs/plan/workflows.md), you need to prepare your data according to our acceptable formatting and setting.

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
   - Vertically, the scan should extend from the top of the head to ideally the mid-neck, but at least below the lowest point of the brain.

5. **Avoid High Deformations**

   - Avoid high deformations around the ear region (e.g., due to headphones) as this can make the placement of fiducials difficult.

<br>
<p align="center">
  <img width="60%" src="/assets/quickguide/TIP_v3_files-MRI.png">
</p>

### DWI Data Quality Requirements

Providing DTI data is only necessary, if you would like to use anisotropic conductivity in the white matter of the brain as described in [**Dielectric Tissue and Material Properties**](/docs/material_methods/dielectric_properties.md). **Make sure the file name of the nifti DOES NOT contains "t1" anywhere. Otherwise it will be confused with the T1 image.** Please follow these points to make sure that the model generation and simulations function correctly.

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
  <img width="60%" src="/assets/quickguide/TIP_v3_files-DTI.png">
</p>

### Q: What to do if your DTI data contains PA / AP acquisitions?

**A:** AP / PA refer to the polarity of the phase encoding direction of the acquired sequences. AP / PA volumes are acquired to offer a way to correct the distortions that typically appear in EPI sequences, so they are used at the preprocessing stage, prior to fitting your (e.g. DTI) model.

So, you do not fit your local model into them separately; they are used at the preprocessing stage in order to get a single DWI volume where the relevant distortions have been corrected to the extent that is possible.

DIPY by itself does not offer a method to correct such distortions, so you will need to use third-party tools for that purpose. One very well-known and widely used tool is **FSL**. You can read more about how to use the tools FSL offers for this purpose [here](https://www.fmrib.ox.ac.uk/primers/intro_primer/ExBox20/IntroBox20.html).

There are a few packages out there that perform dMRI data preprocessing steps in a principled way, calling the required FSL methods under the hood and transparently to the user. You can find a comparison of such packages [here](https://qsiprep.readthedocs.io/en/latest/comparisons.html).

*Source*: [dipy discussions](https://github.com/dipy/dipy/discussions/3289)

### Custom Target Masks Requirements

As of TIP v5.4 it is possible to add custom regions of interest (ROI), which can be used as optimization targets. **Make sure the file name of the nifti DOES NOT contains "t1" anywhere. Otherwise it will be confused with the T1 image.**

1. **File Format**

   - Ensure your Custom Targets data pair includes:
     - A label field in NIfTI format (`.nii.gz`)
     - A tissue list (`.txt`)
   - Ensure that the label field integer value corresponds to the correct tissue list row index

2. **File Naming**

   - The NIfTI file and tissue list must have the same name, excluding their extensions.
   - The name must begin with `Targets_`
   - Use underscores instead of white spaces

3. **Co-Registration**

   - Ensure that the masks are registered to the T1 scan.

If you would like to add targets that overlap (eg. masks of the entire ROI and its subregions), several labelfield-tissue list file pairs may be added. Like this the overlapping masks are separated into different groups and can be used in the optimization process independantly. 

**Tissue List Convention**

The first row of the text file indicates the tissue list version, which can be set to `V7`. The second row indicates the number of tissues in the list as `N<x>` where `<x>` is the number of tissues. The following rows contain the different tissues. Each row is a combination of an RGBA color code followed by the tissue name. **Please use underscores instead of white spaces in the tissue name.** Here is an example of a tissue list with one entry:

```text
V7
N1
C1.000000 0.000000 1.000000 1.000000 anterior_thalamus_combined
```

Background is automatically set to integer value `0` and does not need to be included in the list. `anterior_thalamus_combined` has integer value `1` in the label field Nifti, which is shown below:

<br>
<p align="center">
  <img width="60%" src="/assets/quickguide/TIP_v5_4_files-Custom_Mask.png">
</p>