### Electromagnetic (EM) Simulations

Electromagnetic (EM) simulations were executed using the Sim4Life V7.0 (ZMT Zurich MedTech AG, Zurich, Switzerland) platform for computational life sciences, using the structured (rectilinear) version of the LF QS Ohmic Current Dominated (LF-QS-OCD) solver. The LF-QS-OCD solver finds the solution to the equation: 

<p align="center">
∇σ∇ϕ = 0, 
</p>

where σ is the local electrical conductivity (scalar or tensorial) and ϕ is the electric potential (electric field: E=-∇ϕ). The equation is the QS-approximation of Maxwell's equations, which is valid when: 

* σ ≫ ωϵϵ<sub>0</sub>, where ϵ is the electrical permittivity of the tissue/material, ϵ<sub>0</sub> is the permittivity of the vacuum, and ω is the angular frequency of the applied field, and
*  λ ≫ *d*,  where  λ is the wavelength of the EM field and *d* is the characteristic size of the structure of interest or the computational domain. 

Under these conditions, ohmic currents dominate over displacement currents, and inductive effects can be neglected (see [[6]](/docs/background/references.md) for an analysis on the applicability of the quasistatic approximation in neurostimulation applications).

After selection of the solver, the structured EM simulation was set up by following the steps below:

1. assigning material and tissue dielectric properties, 
2. assigning boundary conditions at the head model surface and the electrode contacts, and 
3. discretizing the computational domain.

To ensure solver convergence, a strong convergence criterion was used: reduction of the residuum by 12 orders of magnitude (10<sup>-12</sup>).
