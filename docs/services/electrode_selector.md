## Setup

**_Note: Starting with TIP V4.0, the electrode selector step has been eliminated as part of the streamlined workflow. The information below applies to TIP V3.0 and earlier versions. In TIP V4.0, users simply select Species, threshold, and Target tissue, then click "Run Optimization" to initiate the SuMo optimizer._**

**_Summary_**:

_During the **Setup** step, an anatomical model and an electrode shape and placement are chosen, the target structure is specified, and the huge search space is narrowed down by selecting potential electrode placement regions._

----

When you start the pipeline in the [classic TI mode](/docs/background/modes.md), you will see the **Electrode Selector** interface. Here, you can interactively select the model, target region and electrode candidates for each electrode pair. These candidates are then used in the **Optimizer** and **Post Processing** stages to find the optimal electrode setup to target a certain region of interest with respect to the three main metrics outlined in the [**Background**](/docs/background/background.md) chapter.

If you are using the personalized classic TI mode, the model selection will be extended by the simulated models that have been completed in the [**EM Simulator**](/docs/services/simulator.md). In the model dropdown you will see ```Human - Personalized isotropic```, ```Human - Personalized anisotropic``` or both. The targets list is automatically adapted depending if you chose to register an additional atlas in [**Images Processing**](/docs/services/personalizer.md).

<br>
<p align="center">
  <img width="90%" src="assets/electrode_selector/electrode_selector.png">
</p>

The **_Setup_** interface has the following elements:

1. **_Select Species_** <br/>
   Depending on the TI exposure to be planned, a human or mouse model with associated standard electrode locations is selected here via the drop-down list. The list of available models will continue to expand in the near future.

<br>
<p align="center">
  <img width="90%" src="assets/electrode_selector/species.png">
</p>

1. **_Select Target Structure_** <br/>
   The brain structure that should be targeted by TI is specified here via the drop-down list. All the exposure quality metrics will be calculated according to the selected structure. 

2. **_Select Electrode Shape_and Dimension** <br/>
   The shape of the electrode is selected here via the drop-down lists. Currently the circular shape with an area of 3cm<sup>2</sup> is available only.

3. **_Electrode Pair Candidates_** <br/>
   Electrode position candidates are interactively selected here. Click ```+``` button next to _Start selecting_ under each _Pair_ and then click on the location in the diagram to add. The selected electrode pair locations will be highlighted with the same color (Blue for _Pair 1_ and Yellow for _Pair 2_). Click the icon next to candidate electrode under _Pair_ list to unselect it. E*n* + and E*n* - correspond to candidate locations for the two electrodes that make up the *n*-th pair. All permutations of the candidates locations are then evaluated as part of the optimization process.

4. **Finish set up** <br/>
   Once you are finished with the setup, you can press this button. This will relay all the required information to the next step for the evaluation.

 If settings are changed after submitting, the ```Finish set up``` button turns orange to indicate that the optimization results are outdated. Settings can then be resubmitted and the **Optimizer** is executed once more to update the pipeline, and the button color reverts to the standard color.

You can now click to the arrow on the right side of the browser to move to [**_Optimal Configuration Identification_**](/docs/services/post_processing.md).

<p align="center">
   <img src="assets/quickguide/electrode_selector.gif" width="900" height="578" />
</p>
