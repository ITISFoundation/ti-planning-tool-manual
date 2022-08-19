Electromagnetic simulations were executed using the Sim4Life V7.0 (ZMT Zurich MedTech AG, Zurich, Switzerland) platform 
for computational life sciences, using the structured (rectilinear) version of the LF QS Ohmic Current Dominated (LF-QS-OCD) 
solver and under the validity of the quasi-static approximation [Bossetti2008] for investigations related to electromagnetic 
neurostimulation for the relevant pulse shapes and frequencies (below a few hundred of kHz). The LF-QS-OCD solver finds 
the solution to the equation: ∇𝜎∇𝜑=0 where 𝜎 is the electrical conductivity (scalar or tensorial value) 
and ![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png) is the electric potential 
(electric field E=-∇![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)) calculated on 
a rectilinear grid created on the computational domain. The equation is the QS-approximation of Maxwell's equations, 
valid when 𝜎≫![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image004.png), where 𝜀 is the 
electrical permittivity of the tissue/material, ![](file:///C:/Users/steiner/AppData/Local/Temp/msohtmlclip1/01/clip_image006.png)is 
the permittivity of the vacuum, and 𝜔 is the angular frequency of the applied field. In addition, the equation 
is valid for 𝜆≫d  where 𝜆  is the wavelength of the EM field and *d* is the dimension of the nerve or the 
electrode. This condition implies that all capacitive and inductive phenomena are neglected in the computation.

The structured EM simulation was set-up by assigning (i) material and tissue dielectric properties, (ii) boundary 
conditions (voltage or current at the electrodes), (iii) grid resolutions and priorities and (v) solver settings.