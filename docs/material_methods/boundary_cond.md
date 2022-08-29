**Boundary Conditions**

Based on the superposition principle (consequence of the linearity of Maxwell's equations), all possible exposure conditions from $n$ electrodes can be computed using $n-1$ simulations (only $n-1$ are needed, because adding a constant voltage offset does not modify the resulting fields, and because the amount of current entering the domain must exactly equal that exiting). In these simulations, one electrode is assigned a 1V Dirichlet boundary conditions, while the other ones are set to ground. Linear combinations of these fields can then be found that inject/extract the desired currents at the desired active electrodes, while ensuring that the other electrodes do not contribute current.

Electrode-skin interfaces were treated as ideal -- i.e., perfect contact, no gel/paste, no electrode polarization, no capacitive component.
