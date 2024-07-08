## Electrode Placement

**_Summary_**: 

_During the **Setup** step, an anatomical model and an electrode shape and placement are chosen, the target structure is specified, and the huge search space is narrowed down by selecting potential electrode placement regions._

----

Once exported, the user can click on the left arrow to go back to the page seen in [**Images Processing**](/docs/services/personalizer.md) and click on the ```Start``` button to automatically position electrodes on a 10-10 system according to the fiducials. After the placment finished successfully, users can press the arrow on the right to return to modelling GUI. Once re-importing the model again, the head model will contain the 10-10 system with it and you can move on to the EM simulation. Here the user is expected to view the head model and the placed electrodes. If the electrodes are misplaced, or present an undesired orientation with respect to the scalp try to re-do fiducials' placement.

It is important to note that if the fiducial were misplaced, or the imported head model is not proportional to the chosen electrode geometry, an error will occur. A workaround to this issue could be to:

*  Verify accurate and consistent placement of fiducials according to the standard.
*  Reduce electrode diameter for smaller circumference heads.


<br>
<p align="center">
  <img width="90%" src="assets/electrode_selector/setup.png">
</p>

The **_Setup_** interface has the following elements:

1. **_Select Species_** <br/>
   Depending on the TI exposure to be planned, a human or mouse model with associated standard electrode locations is selected here via the drop-down list. The list of available models will continue to expand in the near future.

<br>
<p align="center">
  <img width="90%" src="assets/electrode_selector/species.png">
</p>

2. **_Select Target Structure_** <br/>
   The brain structure that should be targeted by TI is specified here via the drop-down list. All the exposure quality metrics will be calculated according to the selected structure. 

3. **_Select Electrode Shape_** <br/>
   The shape of the electrode is selected here via the drop-down list. Currently the circular shape is available only.
   
4. **_Select Electrode Dimensions_** <br/>
   The dimension of the electrode is set here via the drop-down list. Currently the area of 3cm<sup>2</sup> is available only.
   
5. **_Electrode Pair Candidates_** <br/>
   Electrode position candidates are interactively selected here. Click ```+``` button next to _Start selecting_ under each _Pair_ and then click on the location in the diagram to add. The selected electrode pair locations will be highlighted with the same color (Blue for _Pair 1_ and Yellow for _Pair 2_). Click the icon next to candidate electrode under _Pair_ list to unselect it. E*n* + and E*n* - correspond to candidate locations for the two electrodes that make up the *n*-th pair. All permutations of the candidates locations are then evaluated as part of the optimization process.


Once you are finished with the setup, you can press ```Finish set up```. This will relay all the required information to the **Optimizer** for the evaluation. If settings are changed after submitting, the ```Finish set up``` button turns orange to indicate that the optimization results are outdated. Settings can then be resubmitted and the **Optimizer** is executed once more to update the pipeline, and the button color reverts to the standard color.

You can now click to the arrow on the right side of the browser to move to [**_Optimal Configuration Identification_**](/docs/services/post_processing.md).

<p align="center">
   <img src="assets/quickguide/electrode_selector.gif" width="740" height="578" />
</p>