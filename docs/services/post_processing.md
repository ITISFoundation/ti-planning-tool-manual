## Optimal Configuration Identification

**_Summary_**

[Classic TI](/docs/background/modes.md):
_Based on the information provided during the setup step, a fully automatic, exhaustive search of the considered electrode placement configuration space is performed in which three key metrics are considered_
* _target exposure magnitude: the median of the TI modulation envelope magnitude within the target_
* _stimulation selectivity: the ratio of the mean TI exposure in the target vs. the rest of the brain_
* _collateral stimulation: the off-target brain fraction with a TI exposure above the target exposure magnitude_

_These metrics are also central to the visualization and included in the downloadable report._

_By dynamically weighting the often conflicting performance metrics, a sorted list of TI configurations is obtained (this list is always headed by a Pareto-optimal configuration). Using such multi-goal optimization techniques empowers users to make informed choices with regard to conflicting TI exposure criteria._

_Starting from a thus optimized, or from a user-defined TIS configuration, the resulting exposure can be studied and if desired, the configuration (electrode locations, current magnitudes) can be interactively refined. For that purpose, TI and high-frequency exposure distributions are dynamically visualized on top of medical image data, and key exposure metrics as well as plots are shown._

_Once promising exposure conditions have been identified, the associated visualizations and metrics can be added to an automatically generated, downloadable report._

[Multi-channel and phase-modulation TI](/docs/background/modes.md): For multi-channel and phase-modulation TI, the offered functionality is slightly different. Additional or alternative settings are presented, reflecting the obvious differences in relevant stimulation parameters (e.g., targeted modulation shape, number of channels and channel frequencies). Also the definition of the Quantities-of-Interest necessarily differs (see [here](/docs/background/electromagnetic_modeling/quantities_of_interest)). Finally, the vast parameter space of multi-channel and phase-modulation TI currently prohibits systematic optimization, such that only user-specified configurations can be analyzed.

----
<!--
xxx review the below xxx

* **Analysis** <br/>

    In the first half of the **Analysis** section, information from the **Optimizer** regarding the performance of different electrode configurations is presented in a sortable table (only applies to planning for [classic TI](/docs/background/modes.md)).
    Different setups can be compared and sorted using the three main [metrics](/docs/background/electromagnetic_modeling/quantities_of_interest.md): Strength, Selectivity, and Collateral. A 3D scatter plots also visually presents configurations near the [Pareto Front](/docs/background/multi_goal_optimization) to illustrate the trade-offs.
    The second half is used for visualization of the fields in 2D and 3D, as well as the visualization of waveforms.

    <br>

    <p align="center">
      <img width="90%" src="assets/postpro/classic_ti_three_metrics_numbered.png">
    </p>

* **Report** <br/>
    In this section, a more detailed and quantitative exposure overview is provided for both high frequency (HF) and temporal interference (TI) fields. Cumulative histograms show the on- and off-target exposure and line plots the dependence of the key metrics on the relative channel weight.

-->

### Analysis

<!-- Let us now have a closer look at the **Analysis** section. -->

In the first half of the **Analysis** section, information from the **Optimizer** regarding the performance of different electrode configurations is presented in a sortable table. Different setups can be compared and sorted using the three main [metrics](/docs/background/electromagnetic_modeling/quantities_of_interest.md): Strength, Selectivity, and Collateral. The second half is used for visualization of the fields in 2D and 3D, as well as the visualization of waveforms.

In the beginning, your attention should be directed toward the table summarizing the results of the optimizer. To facilitate the search for an ideal setup, the table is sortable. 

<br>
<p align="center">
  <img width="90%"  src="assets/postpro/analysis_table_nums.png">
</p>

The sorting can be done using the scaling sliders on top (1.), where the weight (importance) of each metric can be set. The table is then sorted according to the score resulting from this weighting. The score is also shown in the last table column. For additional information regarding these metrics, check the [**Background**](/docs/background/background.md) section. Alternatively, the table can be sorted according to a single metric by clicking on the column name (2.). 

Once a promising setup has been identified, you can load the corresponding fields and data by clicking Load (3.). A sweep over channel weights is performed to render subsequent exporation more interactive and responsive. The progress of the sweep is shown below the table (4.).

Once that sweep is complete, all the viewers in the lower half of the screen are updated. Now you can visually inspect the exposure scenario:

<br>
<p align="center">
  <img width="90%"  src="assets/postpro/analysis_slicer_numbers.png">
</p>

1. **Main Controls** <br/>
   Here, all the setting options for the viewers are located. 
   * At the top, you can freely change electrode positions (**_Configuration_**) and then update the fields by clicking the ```Reload Field``` button. 
   * Below that, the channel weighting (**_Channel Weight A/B_**) can be changed via the slide bar. 
   * Next are the **_Masking Options_**, where you can switch between seeing the field in the whole head or only in the brain. 
      Using the **_Region of Interest_** dropdown list, one or multiple regions can be selected, which are then highlighted in the visualizations. 
      To reset the highlighting, choose **_None_** in the dropdown list. 
   * **_Plot Options_** permit to toggle between **_Log_** and dB scales and between high frequency(**_HF_**) and temporal interference (TI) field visualization.
     Additionally, a slide bar is available to adapt the opacity of the field display on top of the medical image data in the Slice Views (**_Field vs MRI_**).
   * The value range of the field views in each slice can be adapted by editing **_Range Min_** and **_Range Max_** data fields.
   * Finally, three sliders (**_Slice X_**, **_Slice Y_**, and **_Slice Z_**) are available to change the three slice locations of the Slice Views.

2. **Special Settings** <br/>
   The number of sweep steps (**_Sweep Step_**) and the maximal current applied (**_Max Current [mA]_**) to the electrode pairs differ from the other settings in that they don't trigger an immediate visualization update, since changing them requires re-calculations of the fields and metrics. Viewer updates can instead be triggered using the ```Reload Field``` Button.
 
3. **Slice Viewers** <br/>
   Here, the three orthogonal slice field views are shown. They are overlayed on the image data from which the anatomical model was created. Crosshairs on the view indicate the intersections with the other two slices.

4. **E-Field Envelope** <br/>
   These graphs show the transient E-Field at the location of the crosshair in slice views (3.). The absolute field magnitude and the x, y, and z components are displayed. The plots show both the high-frequency transient E-field, as well as the low-frequency TI envelope.

5. **Iso-Surface View** <br/>
   An interactive 3D model of the current setup: The electrode pair locations are shown in yellow and blue, the target in red, and the iso-surface in orange. The iso-surface visualizes all voxels with value equal to the strength metric reached within the target.

6. **Export Buttons** <br/>
   * ```Add to Report``` allows addition of the six viewing elements to the PDF report (according to the currently selected slicing positions and viewing angle).
   * ```Export to S4L``` creates a .cache file of the TI maximum modulation amplitude, which can then be explored in [Step 3: Exposure Analysis](/docs/services/s4l_post_processing.md).

Metrics table:
<p align="center">
  <img width="90%"  src="assets/quickguide/postpro_gui_1.gif">
</p>

Slice Viewers:
<p align="center">
  <img width="90%"  src="assets/quickguide/postpro_gui_2.gif">
</p>

Reporting:
<p align="center">
  <img width="90%"  src="assets/quickguide/postpro_gui_3.gif">
</p>

### Report

In the **Report** section, a more detailed and quantitative exposure overview is provided for both high frequency (HF) and temporal interference (TI) fields (compared to the visual one in the **Analysis** section). A brief explanation of the different parts is as follows:

1. **Remarks** <br/>
   This field can be used to add notes, provide meta-information, and comment. Everything written in this field will be included in the PDF report if this tab is added to the Report by pressing the ```Add Metrics to Report``` button.

2. **Settings** <br/>
   Toggle between Log and dB scale and choose the channel weighting.
 
3. **General Information** <br/>
   The electrode locations, applied currents, and primary metrics for the selected exposure configuration are summarized. 

4. **Cumulative Histograms** <br/>
   Cumulative histograms of the HF and TI fields within and outside the target region. Plots for other regions of interest can be added using the dropdown menu.

5. **Metrics Plots** <br/>
   The three principal metrics are plotted as a function of the distribution of the total current to the two channels, for both HF and TI.

6. **Export Buttons** <br/>
   * ```Add Metrics to Report``` allows adding all the information from the **Report** section to the PDF report.
   * ```Export Report``` permits the creation and downloading of the PDF report, provided that views, metrics, or curves have been added.
