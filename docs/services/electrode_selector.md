## Setup

----

**_Summary_**: _During the **Setup** step, an anatomical model and an electrode shape and placement is chosen, the target structure is specified, and the huge search space is narrowed down by selecting potential electrode placement regions._

----

<br>

When you start the pipeline, you will see the **Electrode Selector** interface. Here, you can interactively select the 
electrode candidates for each electrode pair. These candidates are then used in the **Optimizer** and **Post Processing**
stages to find the optimal electrode setup to target a certain region of interest with respect to the three main metrics
outlined in the **Background** chapter. 

<br>
<p align="center">
  <img width="440" height="336" src="_media/electrode_selector/electrode_selector.png">
</p>

Let us briefly explain the different elements of the interface:

1. **Select Species** <br/>
   Depending on the TI exposure to be planned, a human or mouse model with associated standard electrode locations can be selected. The list of available models will continue to expand in the near future.

<br>
<p align="center">
  <img width="300" height="144" src="_media/electrode_selector/species.png">
</p>

3. **Target Structure** <br/>
   Specify the brain structure that should be targeted by TI. All the exposure quality metrics will be calculated according to the selected structure. 
 
4. **Electrode Pairs** <br/>
   Interactive selection of electrode position candidates. xxxxxxxx E*n* + and E*n* - correspond to candidate locations for the two electrodes that make up the *n*-th pair. All permutations of the candidates locations are then evaluated as part of the optimization process.

5. **Submit Button** <br/>
   Once you are finished with the setup, you can press ```Submit```. This will relay all the required information
   to the **Optimizer** for the evaluation. If settings are changed again after submitting, the button turns orange to 
   indicate that the optimization results are outdated. Settings can then be resubmitted and the **Optimizer** is executed once more to update the pipeline, and the button color reverts to the standard color.
