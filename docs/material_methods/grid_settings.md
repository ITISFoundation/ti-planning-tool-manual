### Discretization


The employed LF-QS-OCD solver variant requires the discretization of the complete model geometry (head model and electrodes) using an adaptive rectilinear grid. For the existing simulations library, a 3D isotropic and homogeneous rectilinear grid with a grid resolution 0.5mm was used. A grid convergence analysis (varying the resolution between 0.3-1.0mm) confirmed this resolution to be sufficient. It was also checked and verified that the grid resolution ensures an acceptable discretization of thin structures, such as the cerebrospinal fluid, cortical skull layers, and the dura, which can contribute significantly to the distribution of electric currents in the head.
