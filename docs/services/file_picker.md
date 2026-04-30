## File Picker

**_Summary_**:

As the first cloud-based step for personalization, provide the data via the File Picker: either a T1-weighted MRI for an isotropic model, a zipped file containing T1, DTI, bval, and bvec files for an anisotropic model, or — when using the [Offline Personalization](/docs/services/data_privacy.md) workflow — the anonymized zip archive produced locally by `run_personalizer.bat`. See [Data Quality Requirements](/docs/plan/data_quality_requirements.md) for input file specifications.

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
<td style="vertical-align: top; border: 1px solid white">

- 📂 `input_data.zip/`
  - 📃 `subject.smash`
  - 📃 `subject_t1.nii.gz`
  - 📃 `subject.sab`
  - 📃 `subject.sat`
  - 📃 `targets_list.yaml`
  - 📃 `tensor_s4l.nii.gz`

</td>
</tr>
</table>
</div>

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/file_picker.png">
</p>

1. **Data Instructions**
   A brief summary of what files and formats are needed, image quality recommendations and a reminder to anonymize the data before uploading.

2. **Upload Option 1**
   Select a file using the file explorer by clicking on ```Select File``` or directly drag and drop the data to the designated area.

3. **Upload Option 2**
   If the data is already available online somewhere (eg. Google Drive or Dropbox), given that the sharing is set to public, the link can be provided.

4. **Upload Option 3**
   In case data already uploaded to TIP in a different study shall be reused, it can be selected from TIP's data explorer.