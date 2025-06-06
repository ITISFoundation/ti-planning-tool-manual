## Optimal Configuration Identification

**_Summary_**

[Classic TI](/docs/background/modes.md):
_Based on the information provided during the setup step, the surrogate-modeling-based optimizer (SuMo) systematically explores the solution space to identify optimal configurations considering three key metrics:_

* _target exposure magnitude: the median of the TI modulation envelope magnitude within the target_
* _stimulation selectivity: the ratio of the mean TI exposure in the target vs. the rest of the brain_
* _collateral stimulation: the off-target brain fraction with a TI exposure above the target exposure magnitude_

_These metrics are also central to the visualization and included in the downloadable report._

_By combining Gaussian process modeling with a multi-objective genetic algorithm, the SuMo optimizer provides a diverse set of Pareto-optimal solutions. This allows users to easily navigate trade-offs like selectivity versus intensity, making informed choices with regard to conflicting TI exposure criteria._

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

#### Classic TI

The **Settings** section at the top allows you to configure essential optimization parameters:

* **_Select Species_**

   Choose the anatomical model type (human or mouse) from the drop-down menu. Each species comes with pre-configured standard electrode locations appropriate for that anatomy. Additional species options are planned for future releases.

<br>
<p align="center">
  <img width="90%" src="assets/electrode_selector/species.png">
</p>

* **_Threshold definition_**

  Define how stimulation thresholds should be calculated by selecting either the entire brain or only the target region as your reference, and specify the appropriate isopercentile level for precise threshold determination.

* **_Target tissue_**

   Specify the exact brain structure you wish to target with TI stimulation. This selection serves as the foundation for calculating and optimizing all exposure quality metrics.

After running the optimization with the SuMo engine and loading the analysis, you'll see a comprehensive view of the results. The interactive table displays all Pareto-optimal electrode configurations ranked by their performance across three key [metrics](/docs/background/electromagnetic_modeling/quantities_of_interest.md): Strength, Selectivity, and Collateral. Below this table, detailed visualization panels let you examine field distributions in both 2D and 3D views, along with comprehensive waveform analysis.

<br>
<p align="center">
  <img width="90%"  src="assets/postpro/classic_ti_three_metrics_numbered.png">
</p>

Use the intuitive weighting sliders at the top (1.) to prioritize metrics according to your research objectives. Adjust the relative importance of Strength, Selectivity, and Collateral stimulation, and the table automatically sorts configurations by the resulting composite score (displayed in the rightmost column). You can also sort by any individual metric by clicking directly on the column header (2.).

The interactive 3D scatter plot provides a visual representation of the Pareto front, allowing you to quickly understand the trade-offs between different performance metrics and identify the most promising [Pareto-optimal](/docs/background/multi_goal_optimization) solutions for your specific application.

When you've identified a promising configuration, click the Load button (3.) to examine it in detail. The system performs a targeted sweep across channel weights to prepare the visualization, making subsequent exploration more responsive. A progress indicator (4.) shows the status of this optimization process.

Once that sweep is complete, all the viewers in the lower half of the screen are updated. Now you can visually inspect the exposure scenario:

<br>
<p align="center">
  <img width="90%"  src="assets/postpro/analysis_slicer_numbers_v2_classic_ti.png">
</p>

<p align="center">
  <img width="90%"  src="assets/postpro/classic_ti_quantitative_analysis.png">
</p>

1. **Main Controls**

   This comprehensive control panel provides all visualization settings:
   * **_Configuration_**: Adjust electrode positions freely and update the field visualization by clicking the ```Reload Field``` button.
   * **_Channel Current A/B_**: Fine-tune the relative contribution of each channel using the intuitive slider control.
   * **_Performance Metrics_**: Customize the metrics calculation by selecting the appropriate **_volume_** and **_isopercentile level_**.
   * **_Masking Options_**: Focus on specific anatomical areas by toggling between whole head and brain-only views.
     Use the **_Region of Interest_** dropdown to highlight specific brain regions for detailed analysis.
     Select **_None_** to return to the default view without highlighting.
   * **_Plot Options_**: Switch between **_Log_** and dB scales, or toggle between high frequency (**_HF_**) and temporal interference (**_TI_**) field visualizations.
     Adjust the balance between field visualization and underlying MRI data using the **_Field vs MRI_** opacity slider.
   * **_Value Range_**: Fine-tune the visualization range by modifying **_Range Min_** and **_Range Max_** values for enhanced detail in areas of interest.
   * **_Slice Navigation_**: Position the orthogonal slice planes precisely using the **_Slice X_**, **_Slice Y_**, and **_Slice Z_** sliders.

2. **Advanced Parameter**

   Unlike other controls that update the visualization instantly, this parameters require additional computation when changed:
   * **_Sweep Step_**: Controls the resolution of the channel current ratio sweep, with higher values providing more detailed analysis.

   After adjusting these parameters, click the ```Reload Field``` button to recalculate the field distributions and update all visualizations.

3. **Slice Viewers**

   The three orthogonal slice views display field distributions overlaid on the original MRI data. Interactive crosshairs indicate the intersections between slice planes, providing spatial context.
   Navigate through the volume easily by either:
   * Using the dedicated sliders (**_Slice X_**, **_Slice Y_**, and **_Slice Z_**)
   * Directly clicking on any location within a slice view (which automatically repositions all crosshairs)

4. **E-Field Envelope**

   These graphs show the transient E-Field at the location of the crosshair in slice views (3.). The absolute field magnitude and the x, y, and z components are displayed. The plots show both the high-frequency transient E-field, as well as the low-frequency TI envelope.

5. **Iso-Surface View**

   An interactive 3D model of the current setup: The electrode pair locations are shown in yellow and blue, the target in red, and the iso-surface in orange. The iso-surface visualizes all voxels with value equal to the strength metric reached within the target.

6. **Export Buttons**

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

#### Multichannel TI and Phase-Modulation TI

For the non-classic TI modes, the settings are similar, except for the fact that instead of using an automatic optimization, the user defines the setup of interest manually.

Multichannel TI:

<p align="center">
  <img width="90%"  src="assets/postpro/multichannel_ti_settings.png">
</p>

<p align="center">
  <img width="90%"  src="assets/postpro/multichannel_ti_visual_analysis.png">
</p>

<p align="center">
  <img width="90%"  src="assets/postpro/multichannel_ti_quantitative_analysis.png">
</p>

####

Phase-Modulation TI:

<p align="center">
  <img width="90%"  src="assets/postpro/phase_modulation_ti_settings.png">
</p>

<p align="center">
  <img width="90%"  src="assets/postpro/phase_modulation_ti_visual_analysis.png">
</p>

<p align="center">
  <img width="90%"  src="assets/postpro/phase_modulation_ti_quantitative_analysis.png">
</p>

### Report

In the **Report** section, a more detailed and quantitative exposure overview is provided for both high frequency (HF) and temporal interference (TI) fields (compared to the visual one in the **Analysis** section). A brief explanation of the different parts is as follows:

1. **Remarks**

   This field can be used to add notes, provide meta-information, and comment. Everything written in this field will be included in the PDF report if this tab is added to the Report by pressing the ```Add Metrics to Report``` button.

2. **Settings**

   Toggle between Log and dB scale and choose the channel weighting.

3. **General Information**

   The electrode locations, applied currents, and primary metrics for the selected exposure configuration are summarized.

4. **Cumulative Histograms**

   Cumulative histograms of the HF and TI fields within and outside the target region. Plots for other regions of interest can be added using the dropdown menu.

5. **Metrics Plots**

   The three principal metrics are plotted as a function of the distribution of the total current to the two channels, for both HF and TI.

6. **Export Buttons**

   * ```Add Metrics to Report``` allows adding all the information from the **Report** section to the PDF report.
   * ```Export Report``` permits the creation and downloading of the PDF report, provided that views, metrics, or curves have been added.
