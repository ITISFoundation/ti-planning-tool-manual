## Electromagnetic Modeling

The TI exposure optimization and visualization is currently based on libraries of precomputed fields for rapid answers and an interactive experience. From the precomputed fields (and associated impedance matrices), distributions of TI, as well as high frequency exposure can be obtained for any stimulation configuration, using the superposition principle.

These precomputed fields were determined using the Sim4Life software, along with detailed anatomical models, such as the MIDA model [[1]](/docs/background/references.md), the Virtual Population (ViP) models [[2]](/docs/background/references.md), and the Virtual Zoo (ViZoo) models [[3]](/docs/background/references.md). The simulations were performed using the ohmic-current-dominated electro-quasistatic simulator that solves the equation 

<p align="center">
∇σ∇ϕ = 0
</p>
where σ is the electric conductivity, ϕ is the electric potential.

The electric field (E-field) is obtained as 

<p align="center">
E = −∇ϕ
</p>

This equation is applicable, as the wavelength is much larger than the head size and displacement currents are negligible compared to ohmic currents at the relevant frequencies. Tissue properties of the models were assigned according to [[4]](/docs/background/references.md), and careful solver convergence and grid refinement analyses were carried out. 

For some precomputed models, the anisotropy of brain tissues is considered by using tensorial rather than scalar distributions of conductivity σ, as reflected in the model name. This is achieved by mapping diffusion tensor imaging data (from the same subjects imaged to generate the anatomical models) to tensorial σ maps.
