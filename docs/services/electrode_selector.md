## Setup

**_Summary_**: 

_During the **Setup** step, an anatomical model and an electrode shape and placement are chosen, the target structure is specified, and the huge search space is narrowed down by selecting potential electrode placement regions._

----

When you start the pipeline, you will see the **Electrode Selector** interface. Here, you can interactively select the electrode candidates for each electrode pair. These candidates are then used in the **Optimizer** and **Post Processing** stages to find the optimal electrode setup to target a certain region of interest with respect to the three main metrics outlined in the [**Background**](/docs/background/background.md) chapter. 

<br>
<p align="center">
  <img width="600" height="510" src="_media/electrode_selector/setup.png">
</p>

The **_Setup_** interface has the following elements:

1. **_Select Species_** <br/>
   Depending on the TI exposure to be planned, a human or mouse model with associated standard electrode locations is selected here via the drop-down list. The list of available models will continue to expand in the near future.

<br>
<p align="center">
  <img width="300" height="144" src="_media/electrode_selector/species.png">
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
