## File Picker

**_Summary_**:

As the first cloud-based step for personalization, provide the data via the File Picker: either a T1-weighted MRI for an isotropic model, a zipped file containing T1, DTI, bval, and bvec files for an anisotropic model, or — when using the [Offline Personalization](/docs/services/data_privacy.md) workflow — the anonymized zip archive produced locally by `run_personalizer.bat`. See [Data Quality Requirements](/docs/plan/data_quality_requirements.md) for input file specifications.

----

As the initial step for personalization, the user is asked to provide, in the File Picker, the data to work with. There are two options for the standard workflow: building an isotropic model, which requires a T1-weighted MR image, or an anisotropic model, which requires a DTI with bval and bvec files in addition to the T1. For the anisotropic option, zip these four files together. For an isotropic model, upload the T1 image by itself when no custom targets are needed. If you include custom targets, zip the T1 image together with the matching NIfTI label field and tissue list files. Custom target files can also be included in the anisotropic input ZIP. Users following the [Offline Personalization](/docs/services/data_privacy.md) workflow upload the `results.zip` archive produced by the local `run_personalizer.bat` tool instead.

<div class="file-option-grid">
  <div class="file-option-card">
    <p class="card-title">Isotropic</p>
    <ul>
      <li>📃 <code>subject_t1.nii.gz</code></li>
      <li><strong>Optional custom target (include in ZIP with T1):</strong></li>
      <li class="indent">📃 <code>Targets_Custom.nii.gz</code></li>
      <li class="indent">📃 <code>Targets_Custom.txt</code></li>
    </ul>
  </div>
  <div class="file-option-card">
    <p class="card-title">Anisotropic</p>
    <ul>
      <li>📂 <code>input_data.zip/</code></li>
      <li class="indent">📃 <code>subject_t1.nii.gz</code></li>
      <li class="indent">📃 <code>subject_dti.nii.gz</code></li>
      <li class="indent">📃 <code>subject_dti.bvec</code></li>
      <li class="indent">📃 <code>subject_dti.bval</code></li>
      <li class="indent"><strong>Optional custom target:</strong></li>
      <li class="indent">📃 <code>Targets_Custom.nii.gz</code></li>
      <li class="indent">📃 <code>Targets_Custom.txt</code></li>
    </ul>
  </div>
  <div class="file-option-card">
    <p class="card-title">Offline Personalization</p>
    <ul>
      <li>📂 <code>results.zip/</code></li>
      <li class="indent">📃 <code>subject.smash</code></li>
      <li class="indent">📃 <code>subject_t1.nii.gz</code></li>
      <li class="indent">📃 <code>subject_t1_resampled.nii.gz</code></li>
      <li class="indent">📃 <code>subject.sab</code></li>
      <li class="indent">📃 <code>subject.sat</code></li>
      <li class="indent">📃 <code>targets_list.yaml</code></li>
      <li class="indent">📃 <code>tensor_s4l.nii.gz</code></li>
      <li class="indent">📃 <code>labelfield_subject.nii.gz</code></li>
      <li class="indent">📃 <code>labelfield_subject.txt</code></li>
    </ul>
  </div>
</div>

<br>
<p align="center">
  <img width="90%" src="/assets/quickguide/file_picker.png">
</p>

1. **Data Instructions**
   A brief summary of what files and formats are needed, image quality recommendations and a reminder to anonymize the data before uploading.

2. **Upload Option 1**
   Select a file using the file explorer by clicking on ```Select File``` or directly drag and drop the data to the designated area.

3. **Upload Option 2**
   If the data is already available online somewhere (eg. Google Drive or Dropbox), given that the sharing is set to public, the link can be provided.

4. **Upload Option 3**
   In case data already uploaded to TIP in a different study shall be reused, it can be selected from TIP's data explorer.