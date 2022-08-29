### Boundary Conditions

Based on the superposition principle (the consequence of the linearity of Maxwell's equations), all possible exposure conditions from *n* electrodes can be computed using *n-1* simulations <sup>1</sup>. In these simulations, one electrode is assigned 1V Dirichlet boundary conditions, while the other ones are set to the ground. Linear combinations of these fields can then be found that inject/extract the desired currents at the desired active electrodes while ensuring that the other electrodes do not contribute current.

Electrode-skin interfaces were treated as ideal - i.e., perfect contact, no gel/paste, no electrode polarization, and no capacitive component.

---


<sup>1</sup>: Only *n-1* simulations are needed, because adding a constant voltage offset does not modify the resulting fields, and because the amount of current entering the domain must exactly equal that exiting.