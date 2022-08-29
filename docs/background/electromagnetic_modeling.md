## Electromagnetic Modeling

The TI exposure optimization and visualization is currently based on libraries of precomputed fields for rapid answers and an interactive experience. From the precomputed fields (and associated impedance matrices), distributions of TI, as well as high frequency exposure can be obtained for any stimulation configuration, using the superposition principle.

These precomputed fields were determined using the Sim4Life software, along with detailed anatomical models, such as the MIDA model [1], the Virtual Population (ViP) models [2], and the Virtual Zoo (ViZoo) models [3]. The simulations were performed using the ohmic-current-dominated electro-quasistatic simulator that solves the equation 

∇σ∇ϕ=0

where σ is the electric conductivity, ϕ is the electric potential.

The electric field (E-field) is obtained as 

E = −∇ϕ

This equation is applicable, as the wavelength is much larger than the head size and displacement currents are negligible compared to ohmic currents at the relevant frequencies. Tissue properties of the models were assigned according to [4], and careful solver convergence and grid refinement analyses were carried out.
