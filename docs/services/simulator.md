## Simulator

**_Summary_**:

In this step, users generate the field library by selecting isotropic or anisotropic white matter conductivity simulations. Once completed, users can export the results and either start a new simulation run or proceed to TI Analysis.

----

In this step, the generation of the field library, as described in the chapter [**_Electromagnetic Modeling_**](/docs/background/electromagnetic_modeling.md), is computed. Given that DTI data was provided, the user can use the drop-down to select which type of simulation they would like to run first, isotropic or anisotropic. Afterwards the computation can be initialized by hitting the ```Setup``` button. A pop-up will appear with the information about the estimated cost of this action which can be accepted using the ```Confirm``` button. Since TIP runs on AWS servers and creating the field library is a rather computationally intense step, this part is a premium feature which needs credits to be executed. For instructions on how to acquire credits, please refer to chapter [**_Billing Center_**](/docs/platform_introduction/billing_center.md)

Once all the preparations are finished, the logging console will show the information that the window can be closed. Since the simulations will run for approximately 2.5 to 3 hours, users can come back later once the results are available.

When all the simulations are done, users can hit the ```Export``` button which downloads all the results, and compiles all the necessary files which are needed for the following steps. Once this step is done, users can either start another simulation run in case both anisotropic and isotropic flavors should be compared.

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/simulator.png">
</p>

The **_Setup_** interface has the following elements:

1. **_White Matter Selectivity Selection_**

1. **_Simulation Type Selection_**

2. **_Simulation Cost Estimation_**

   Before computation begins, a pop-up displays the estimated credit cost for this simulation run. Accept using the ```Confirm``` button to proceed.

You can now click to the arrow on the right side of the browser to move to [**TI Analysis**](/docs/services/post_processing.md).
