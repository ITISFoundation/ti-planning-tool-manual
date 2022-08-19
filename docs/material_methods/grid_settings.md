The rectilinear version of the LF-QS-OCD solver required the discretization of the complete model geometry
(inclusive of the MIDA head model and the electrodes) using a cartesian grid. In this project, a 3D isotropic 
and homogeneous rectilinear grid was created with grid resolution 0.5mm, resulting in a xxx million grid elements
(voxels). The grid size was identified performing a convergence analysis by varying the grid resolution from 1mm down 
to 0.3mm. It was also checked that the identified grid allows an acceptable discretization of thin structures, such as 
the cerebrospinal fluid and the dura, that may contribute significantly to the distribution of electric currents in 
the head.