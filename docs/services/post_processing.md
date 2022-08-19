# Post Processing

## Overview

The Post Processing stage allows you to sort, visualize and analyze the optimizers results of your electrode selection. 
It is separated in two main sections. 

* **Analysis** <br/>

    In the first half of the **Analysis** section, a part of the optimizers output is presented in a sortable table.
    Different setups can be compared and sorted using the three main metrics: Strength, Selectivity and Collateral. 
    The second half is used for visualization of the fields in 2D, 3D and waveforms.

    <br>
    <p align="center">
      <img width="350" height="150" src="_media/postpro/analysis_slicer.png">
    </p>

* **Report** <br/>
    In this section, a more detailed overview over the metrics is given, both for high frequency (HF) and temporal 
    interference (TI) exposure. Cumulative histograms show the behaviour in/out of the target and line plots the 
    development of the metrics over the channel weight range.

## Analysis

Let us now have a closer look at the **Analysis** stage. In the beginning, your attention should be directed towards the 
table summarizing the optimizers results. To facilitate the search for an ideal setup, the table is sortable. The sorting 
can be done either using the scaling sliders on top (1.), where the importance of each metric can be set and the whole table
is then sorted according to the score resulting from this weighting. The score is also shown in the last column of the table.
For further detail on how this score is achieved, please refer to the more detailed explanations in the **Background** section. 
Alternatively the table can be sorted for only one quantity by clicking on the columns name (2.). 

Once a promising setup is found, you can load the corresponding fields by clicking Load (3.). The progress of the superposition
to create the E-Fields and the subsequent channel weight sweep is shown at the bottom of the table (4.).

When the calculations are finished, all the viewers in the lower half of the screen will update. Now you can visually 
inspect the scenario. A quick explanation of the different sections and elements:

1. **Main Controls** <br/>
   Here, all the setting options for the viewers are located. 
   * At the top, you have the possibility to freely change electrode positions and then update the fields. 
   * Below that, the channel weighting can be changed to load the respective fields. 
   * Next are the masking options, where you can switch between seeing the field of the whole head or in the brain only. 
      Using the regions of interest dropdown, the selected region can be marked within the field to visualize its location. 
      To reset all the highlighting, choose 'None' from the dropdown options. 
   * Field Options allows toggling between Log and dB scale and between high frequency(HF) and temporal interferance(TI)
     Additionally a fader is available to move between field and mri view.
   * The value range can be adapted
   * Finally, three sliders are used to move through the different slices of the volume in the three axis.

2. **Special Settings** <br/>
   The number of sweep steps and maximal current applied to the electrode pairs differ from the remaining settings in that
   these two don't cause an immediate update of the visualization as opposed to the others. Since these two parameters 
   influence the calculations of the fields and corresponding metrics, changes of these quantities only take effect after 
   recalculating the setup. This can be done using the ```Update Fields``` Button.
 
3. **Slice Viewers** <br/>
   Here, the individual slices of the volume are shown in each direction. 

4. **E-Field Envelope** <br/>
   These graphs show the envelope of the E-Field at the location of the crosshair from (3.) and similarly the field's 
   x, y and z components.
5. **E-Field Envelope** <br/>
   An interactive 3D model of the current setup. The electrode pair's locations are marked in yellow and blue, the target 
   in red and the iso-surface in orange. The iso-surface visualizes all voxels with value equal to the strength metric 
   reached within the target.
6. **E-Field Envelope** <br/>
   * ```Add Slicer to Report``` allows to add the six elements of the viewer to the PDF report as they are.
   * ```Export to S4L``` creates a .cache file of the TI max. modulation amplitude, which can be used in Sim4Life web.



    
    