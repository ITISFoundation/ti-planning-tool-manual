### Electromagnetic (EM) Simulations

Electromagnetic (EM) simulations were executed using the Sim4Life V7.0 (ZMT Zurich MedTech AG, Zurich, Switzerland) platform for computational life sciences, using the structured (rectilinear) version of the LF QS Ohmic Current Dominated (LF-QS-OCD) solver. The LF-QS-OCD solver finds the solution to the equation: ∇𝜎∇𝜑=0, where 𝜎 is the local electrical conductivity (scalar or tensorial) 
and 𝜑 ![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)is the electric potential 
(electric field: E=-∇𝜑 ![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)). The equation is the QS-approximation of Maxwell's equations, which is
valid when: 
* 𝜎≫![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image004.png), where 𝜀 is the 
electrical permittivity of the tissue/material, ![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image006.png)is 
the permittivity of the vacuum, and 𝜔 is the angular frequency of the applied field, and
* 𝜆≫*d*,  where 𝜆  is the wavelength of the EM field and *d* is the characteristic size of the structure of interest or the computational domain. 

Under these conditions, ohmic currents dominate over displacement currents, and inductive effects can be neglected (see [Bossetti2008] for an analysis on the applicability of the quasistatic approximation in neurostimulation applications).

The structured EM simulation was set up 

1. by assigning material and tissue dielectric properties, 
2. by assigning boundary conditions at the head model surface and the electrode contacts, and 
3. by discretizing the computational domain.

To ensure solver convergence, a strong convergence criterion was used: reduction of the residuum by 12 orders of magnitude (10<sup>-12</sup>).
