## Known Issues

### TIP V2.0

#### Release Date: 17.08.2023

#### general

- Refresh issue: the 3D view viewing angle need to be changed to trigger an update of the rendering.
- When changing from one model to another (in mcTI or pmTI), the loading of the field libraries is not visualized. It should only take a couple of minutes until evaluations can be started.
- Slice viewer: The models are not yet allignet to have consistent axis. The according MRIs might not be resampled correctly (eg. Mouse) so blending to MRI not yet flawlessly possible.
- When changing settings, the Button to evaluate TI will flash and become inactive for a couple of seconds. This stemps from canceled features and will be changed to make it more responsive.

#### classic TI mode

- Once an electrode selector setting has been submitted, it can not be changed anymore since the input of the second step ([Step 2: Optimal Configuration Identification](/docs/platform_introduction/platform.md)) is not updated anymore.
- If "Load Analysis" fails since no results file is there, then optimization is done to create the file, "Load Analysis" still doesn't work even if the file is present.

#### mc TI mode

- Report generation is not yet fully adapted. The setup choice will be added as a table.

#### pm TI mode

- Report generation is not yet fully adapted. The setup choice will be added as a table.
