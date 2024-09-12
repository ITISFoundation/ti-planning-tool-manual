## Electrode Placement

**_Summary_**:

After exporting, users can return to the [**Images Processing**](/docs/services/personalizer.md) page, click ```Start``` to automatically position electrodes on a 10-10 system, and then return to the modeling GUI. Upon re-importing, the head model will include the 10-10 system for the EM simulation; if electrodes are misplaced, users should redo the fiducials' placement.

----

Once exported, the user can click on the left arrow to go back to the page seen in [**Images Processing**](/docs/services/personalizer.md) and click on the ```Start``` button to automatically position electrodes on a 10-10 system according to the fiducials. After the placement finished successfully, users can press the arrow on the right to return to modelling GUI. Once re-importing the model again, the head model will contain the 10-10 system with it and you can move on to the EM simulation. Here the user is expected to view the head model and the placed electrodes. If the electrodes are misplaced, or present an undesired orientation with respect to the scalp try to re-do fiducials' placement.

It is important to note that if the fiducial were misplaced, or the imported head model is not proportional to the chosen electrode geometry, an error will occur. A workaround to this issue could be to:

* Verify accurate and consistent placement of fiducials according to the standard.
* Reduce electrode diameter for smaller circumference heads.


<br>
<p align="center">
  <img width="90%" src="assets/quickguide/fiducial_placement_3.png">
</p>

You can now click to the arrow on the right side of the browser to move to [**_Step 4: EM Simulations_**](/docs/services/simulator.md).
