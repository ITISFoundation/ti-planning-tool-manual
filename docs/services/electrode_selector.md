Electrode Selector

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
   Depending on what sort of experiment should be planned, a human or mouse model with the standard electrode positions
   can be selected. 

<br>
<p align="center">
  <img width="300" height="144" src="_media/electrode_selector/species.png">
</p>

3. **Target Structure** <br/>
   Specify the structure that should be targeted by TI. All the metrics will be calculated for this region. 
 
4. **Electrode Pairs** <br/>
   Interactive selection of electrode position candidates. Ex +/- create one E-Field. All permutations of the candidates 
   are then evaluated in the **Optimizer**.

5. **Submit Button** <br/>
   Once you are finished setting up all parameters, you can hit ```Submit```. This will relay all the necessary information
   to the **Optimizer** for the evaluation. If settings were changed after submitting, the Button will become orange to 
   indicate this mismatch. Settings need to be resubmitted and the **Optimizer** executed once more to update the pipeline.
