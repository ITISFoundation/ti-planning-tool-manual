## Quantities-of-Interest

Based on precomputed E-fields for the different electrode pairs (actually, based on linear combinations of single source-electrode simulations) distributions of the relevant TI-exposure quantity can be computed, and key performance metrics can be determined.

The total field is obtained as:

<p align="center">
  <img src="_media/eq1w.png">
</p>

<!--
$$
\vec{E}(t,x)=\textrm{sin} (\omega_1\cdot t)\vec{E}_1(x)+\textrm{sin}(\omega_2\cdot t)\vec{E}_2(x)
$$
-->

where <img src="_media/E12w.png"> are the fields of the two channels and ω<sub>1,2</sub> are their angular frequencies (initial phases are set to zero without loss of generality). Its projection along a direction of interest <img src="_media/nvecw.png"> (e.g., the principal axis of a pyramidal neuron, or the principal axis of the local diffusion tensor; <img src="_media/n1w.png"> ) is obtained as:

<p align="center">
  <img src="_media/eq2w.png">
</p>

<!--
$$
\vec{E}_{\vec{n}}(t,x)=\textrm{sin} (\omega_1\cdot t)\left(\vec{n}\cdot\vec{E}_1(x)\right)+\textrm{sin}(\omega_2\cdot t)\left(\vec{n}\cdot\vec{E}_2(x)\right)
$$
-->

The modulation envelope magnitude (MEM) along <img src="_media/nvecw.png">  can easily be obtained as

<p align="center">
  <img src="_media/eq3w.png">
</p>

<!--
$$
T_{\vec{n}}(x)=\textrm{min}(\left|\vec{n}\cdot\vec{E}_1(x)\right|,\left|\vec{n}\cdot\vec{E}_2(x)\right|)
$$
-->

As TI-exposure quantity, the modulation envelope magnitude (MEM) has been chosen, which is computed according to the formula from [[5]](/docs/background/references.md):

<p align="center">
  <img src="_media/eq4w.png">
</p>

<!--
$$
T_{\textrm{max}}(x)=\textrm{max}_{\vec{n}}\,T_{\vec{n}}(x)=\left|\vec{E}_{AM}^{\max}(\vec{x})\right| = 
\begin{cases}
2 \cdot \left|\vec{E_2}(\vec{x})\right| & \text{if $\left|\vec{E_2}(\vec{x})\right| < \left|\vec{E_1}(\vec{x})\right|\cos{\alpha}$}\\
\frac{2\cdot\left|\vec{E_2}(\vec{x}) \times (\vec{E_1}(\vec{x}) - \vec{E_2}(\vec{x}))\right|}{\left|{\vec{E_1}(\vec{x}) - \vec{E_2}(\vec{x})}\right|} & \text{otherwise}
\end{cases}
$$
-->


where α denotes the angle between <img src="_media/E12w.png">. This metric has been chosen because it reproduces empirical observations, such as the neurons responding to the demodulated exposure and stimulation target moving towards the channel carrying less current when the current ratio is adapted.

To assess the quality of a TI exposure condition, three key metrics have been defined:

* M1 - target exposure strength (**strength**): the median of T<sub>max</sub> in the target,
* M2 - exposure selectivity (**selectivity**): the ratio of the mean target T<sub>max</sub> and the mean off-target T<sub>max</sub>,
* M3 - off-target exposure (**collateral**): the fraction of the non-target brain volume with T<sub>max</sub> exceeding M1.
Typically, it is not possible to find exposure conditions that simultaneously optimize all three metrics, and a compromise or prioritization is needed.

In addition to the TI-relevant MEM distribution, **high-frequency** exposure can also be of interest (e.g., to analyze potential high frequency stimulation or conduction blocking). For this, the peak field magnitude is used, which is obtained as:

<p align="center">
  <img src="_media/eq5w.png">
</p>

<!--
$$
E_{\textrm{max}}(x)=\textrm{max}(\left|\vec{E}_1(x)+\vec{E}_2(x)\right|,\left|\vec{E}_1(x)-\vec{E}_2(x)\right|).
$$
-->
