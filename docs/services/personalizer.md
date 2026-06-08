## Images Processing

**_Summary_**:

As the first cloud-based step for personalization, provide the data via the File Picker: either a T1-weighted MRI for an isotropic model, a zipped file containing T1, DTI, bval, and bvec files for an anisotropic model, or — when using the [Offline Personalization](/docs/services/data_privacy.md) workflow — the anonymized zip archive produced locally by `run_personalizer.bat`. After uploading, specify the electrode geometry and whether to register a detailed atlas to the brain; click Start to generate the anatomical model. See [Data Quality Requirements](/docs/plan/data_quality_requirements.md) for input file specifications.

----



Once uploaded, the user can specify the geometry of the electrode, and if the head should be registered to the ICBM_152 atlas for cortical structures. By clicking start, the anatomical model is generated. Computational time is approximated to be ~1h, and can increase to ~2.5h if cortical atlas registration is selected. The computation is done when a tick-icon appears on the previously pushed start button. The user can go to the next step by pressing the arrow on the right.

<br>
<p align="center">
  <img width="90%" src="/assets/quickguide/personalizer.png">
</p>

The interface has the following elements:

1. **Select Electrode Radius**

   The radius of the cylindrical electrodes is selected here. This can only be changed as long as no simulations have been started in [Simulator](/docs/services/simulator.md).

2. **Select Atlas to Register**

   By default, the model prediction already contains a couple of targets. These are listed in the logger (4) in the image above. If these are sufficient, you can leave this setting at ```None```.
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
  <img width="90%" src="/assets/quickguide/fiducial_placement_3.png">
</p>

If an error occurs during electrode placement, possible causes and workarounds are:

* Verify accurate and consistent placement of fiducials according to the standard.
* Reduce electrode diameter for smaller circumference heads.
