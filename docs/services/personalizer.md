## Images Processing

**_Summary_**:

As the first cloud-based step for personalization, provide the data via the File Picker: either a T1-weighted MRI for an isotropic model, a zipped file containing T1, DTI, bval, and bvec files for an anisotropic model, or — when using the [Offline Personalization](/docs/services/data_privacy.md) workflow — the anonymized zip archive produced locally by `run_personalizer.bat`. After uploading, specify the electrode geometry and whether to register a detailed atlas to the brain; click Start to generate the anatomical model.

----

As the initial step for personalization, the user is asked to provide, in the File Picker, the data to work with. There are two options for the standard workflow: building an isotropic model which only requires a T1-weighted MR image, or an anisotropic model which requires a DTI with bval & bvec files on top of the T1. If the anisotropic option is desired, all four files should be zipped together. Users following the [Offline Personalization](/docs/services/data_privacy.md) workflow upload the `results.zip` archive produced by the local `run_personalizer.bat` tool instead.

<div style="width: 100%; display: flex; justify-content: center;">
<table style="border-collapse: separate; border-spacing: 5px;">
<tr>
<td style="vertical-align: top; border: 1px solid white">

- 📃 `subject_t1.nii.gz`

</td>
<td style="vertical-align: top; border: 1px solid white">

- 📂 `input_data.zip/`
  - 📃 `subject_t1.nii.gz`
  - 📃 `subject_dti.nii.gz`
  - 📃 `subject_dti.bvec`
  - 📃 `subject_dti.bval`

</td>
</tr>
</table>
</div>

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/file_picker.png">
</p>

1. **Data Instructions**
   A brief summary of what files and formates are needed, image quality recommendations and a reminder to annonymize the data before uploading.

2. **Upload Option 1**
   Select a file using the file explorer by clicking on ```Select File``` or directly drag and drop the the data to the designated area.

3. **Upload Option 2**
   If the data is already available online somewhere (eg. Google Drive or Dropbox), given that the sharing is set to public, the link can be provided.

4. **Upload Option 3**
   In case data already uploaded to TIP in a different study shall be reused, it can be selected from TIP's data explorer.

Once uploaded, the user can specify the geometry of the electrode, and if the head should be registered to the ICBM_152 atlas for cortical structures. By clicking start, the anatomical model is generated. Computational time is approximated to be ~1h, and can increase to ~2.5h if cortical atlas registration is selected. The computation is done when a tick-icon appears on the previously pushed start button. The user can go to the next step by pressing the arrow on the right.

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/personalizer.png">
</p>

The interface has the following elements:

1. **Select Electroder Radius**

   The radius of the cylindrical electrodes is selected here. This can only be changes as long as no simulations have been started in [Simulator](/docs/services/simulator.md).

2. **Select Atlas to Register**

   By defailt, the model prediction already contains a couple of targets. These are listed in the logger (4) in the image above. If these are sufficient, you can leave this setting at ```None```.
   If not, a detailed atlas can be registered to the brain. Select the according option. Since this is a multi-select list, please make sure that ```None``` is not selected together with the atlas to register, because the registration will always be skipped if ```None``` is selected.

3. **Progress Overview**

   Shows the progress of each individual step in the model generation. ```10-10``` will only be done if the [Model Inspector](/docs/services/fiducials_placement.md) step has already been completed.

4. **Logging**

   Provides some information about this step at start-up and will display information and eventual errors during runtime.

You can now click to the arrow on the right side of the browser to move to [Model Inspector](/docs/services/fiducials_placement.md).

### Fallback: Manual Electrode Placement

With TIP V4.0 and later, electrode placement on the 10-10 system is performed automatically by the Personalizer after automated fiducial detection. The step below only applies if the automated placement fails and fiducials were placed manually in the [Model Inspector](/docs/services/fiducials_placement.md).

After the fiducials were placed and exported in the Model Inspector, return to this page (Images Processing) using the left arrow and click the ```Start``` button again. This re-runs the Personalizer, which now reads the exported fiducials from the `.sab` file to automatically position electrodes on the 10-10 system. Once the placement finishes successfully, press the right arrow to return to the modeling GUI and re-import the model — it will now include the full 10-10 electrode system.

Verify the electrode placement in the viewer. If electrodes are misplaced or have an undesired orientation relative to the scalp, try re-doing the fiducial placement in the [Model Inspector](/docs/services/fiducials_placement.md).

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/fiducial_placement_3.png">
</p>

If an error occurs during electrode placement, possible causes and workarounds are:

* Verify accurate and consistent placement of fiducials according to the standard.
* Reduce electrode diameter for smaller circumference heads.
