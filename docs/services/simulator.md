## EM Simulations

**_Summary_**: 

_During the **Setup** step, an anatomical model and an electrode shape and placement are chosen, the target structure is specified, and the huge search space is narrowed down by selecting potential electrode placement regions._

----

In this step, the generation of the field library, as described in the chapter [**_Electromagnetic Modeling_**](/docs/background/electromagnetic_modeling.md), is computed. Given that DTI data was provided, the user can use the drop-down to select which type of simulation they would like to run first, isotropic or anisotropic. Afterwards the computation can be initialized by hitting the ```Setup``` button. A pop-up will appear with the information about the estimated cost of this action which can be accepted using the ```Confirm``` button. Since TIP v3.0 runs on AWS servers and creating the field library is a rather computationally intense step, this part is a premium feature which needs credits to be executed. For instructions on how to acquire credits, please refer to chapter \textit{Quick-Start-Guide/Platform overview/Billing Center}

Once all the preparations are finished, the logging console will show the information that the window can be closed. Since the simulations will run for approximately 2.5 to 3 hours, users can come back later once the results are available.

When all the simulations are done, users can hit the ```Export``` button which downloads all the results, and compiles all the necessary files which are needed to for the following steps. Once this step is done, users can either start another simulation run in case both anisotropic and isotropic flavors should be compared, otherwise they can proceed to the next step by clicking on the right arrow.

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