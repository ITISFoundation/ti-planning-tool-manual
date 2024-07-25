## Fiducials Placement

**_Summary_**:

Import the generated anatomical 3D model into the GUI by selecting ```Import``` and loading the model file from the ```inputs/input_1``` directory. Place the fiducial points Nz, Iz, LPA, and RPA by selecting ```Sketch``` then ```Point``` in the GUI, rename them using ```F2```, and export them to the ```outputs/output_1``` directory with the .sab extension.

----

Now that the anatomical 3D model is generated, it needs to be imported into the newly open GUI. Selecting ```Import```, the model file to be loaded should be in the ```inputs/input_1``` directory. Now, the user can place the fiducial points that will be used for the positioning of the electrodes on a 10-10 system.

**Fiducial Points** <br>

- Nasion (Nz): The depressed area between the eyes, just above the bridge of the nose.
- Inion (Iz): The crest point of the back of the skull, often indicated by a bump.
- Right Pre-Auricular (RPA): Frontal to the right ear, on the posterior root of the zygomatic arch.
- Left Pre-Auricular (LPA): Frontal to the left ear, on the posterior root of the zygomatic arch.

<br>
<p align="center">
  <img width="70%" src="assets/quickguide/fiducial_locations.png">
</p>

 In the top ribbon of the GUI, selecting ```Sketch``` then ```Point``` allows for the creation of points directly on the model visible in the 3D viewer on the right.

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/fiducial_placement_1.png">
</p>

The **Fiducials Placement** interface has the following elements:

1. **_Place Points_** <br/>
   To place a point, select ```Sketch``` then ```Point``` in the top toolbar and click on the chosen location in the 3D model.

2. **_Model Tree_** <br/>
   This part of the UI shows you an exact overview of all the entities visible in the model view. This entails entity groups containing different tissues for example.

Users are asked to create 4 points, representing positions Nz (nasion), Iz (inion), LPA and RPA (left/right pre-auricular). These points should be properly renamed according to their position (Nz, Iz, LPA, RPA). This can be done using the shortcut ```F2```.

<br>
<p align="center">
  <img width="90%" src="assets/quickguide/fiducial_placement_2.png">
</p>

 Once created, points need to be exported by selecting them and clicking ```Export Selected``` in the top ribbon to put them in the ```outputs/output_1``` directory. Please specify the file extension ```.sab``` in the file name.

1. **_Export Selected_** <br/>
   Clicking this button will open the file explorer, where the selected entities can be saved to a file.

2. **_Fiducial Point Entities_** <br/>
   Once points are placed on the 3D model, they appear in the model tree. Here they can be renamed, deleted or selected for export.

3. **_Selection Details_** <br/>
   When selecting an entity from the model tree, this section of the UI will display information and editable settings.

Fiducial placement workflow:

<p align="center">
  <img width="90%"  src="assets/quickguide/fiducial_placement.gif">
</p>