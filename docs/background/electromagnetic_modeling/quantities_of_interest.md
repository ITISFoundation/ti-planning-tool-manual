## Quantities-of-Interest

Based on precomputed E-fields for the different electrode pairs (actually, based on linear combinations of single source-electrode simulations) distributions of the relevant TI-exposure quantity can be computed, and key performance metrics can be determined.

For classic TI (two channels), the total field is obtained as:

$$
\vec{E}(t,x)=\sin(\omega_1\cdot t)\vec{E}_1(x)+\sin(\omega_2\cdot t)\vec{E}_2(x)
$$

where $\vec{E}_{1,2}$ are the fields of the two channels and $\omega_{1,2}$ are their angular frequencies (initial phases are set to zero without loss of generality). Its projection along a direction of interest $\vec{n}$ (e.g., the principal axis of a pyramidal neuron, or the principal axis of the local diffusion tensor; $|\vec{n}|=1$) is obtained as:

$$
E_{\vec{n}}(t,x)=\sin(\omega_1\cdot t)\left(\vec{n}\cdot\vec{E}_1(x)\right)+\sin(\omega_2\cdot t)\left(\vec{n}\cdot\vec{E}_2(x)\right)
$$

The modulation envelope magnitude (MEM) along $\vec{n}$ can easily be obtained as

$$
T_{\vec{n}}(x)=\min\left(\left|\vec{n}\cdot\vec{E}_1(x)\right|,\left|\vec{n}\cdot\vec{E}_2(x)\right|\right)
$$

As TI-exposure quantity, the modulation envelope magnitude (MEM) has been chosen, which is computed according to the formula from [[5]](/docs/background/references.md):

$$
T_{\max}(x)=\max_{\vec{n}}\,T_{\vec{n}}(x)=\left|\vec{E}_{AM}^{\max}(\vec{x})\right| = 
\begin{cases}
2 \left|\vec{E}_2(\vec{x})\right| & \text{if } \left|\vec{E}_2(\vec{x})\right| < \left|\vec{E}_1(\vec{x})\right|\cos\alpha\\[6pt]
\frac{2\left|\vec{E}_2(\vec{x}) \times (\vec{E}_1(\vec{x}) - \vec{E}_2(\vec{x}))\right|}{\left|\vec{E}_1(\vec{x}) - \vec{E}_2(\vec{x})\right|} & \text{otherwise}
\end{cases}
$$

where $\alpha$ denotes the angle between $\vec{E}_{1,2}$. This metric has been chosen because it reproduces empirical observations, such as the neurons responding to the demodulated exposure and stimulation target moving towards the channel carrying less current when the current ratio is adapted.

To assess the quality of a TI exposure condition, three key metrics have been defined:

* M1 - target exposure strength (**strength**): the median of $T_{\max}$ in the target,
* M2 - exposure selectivity (**selectivity**): the squared ratio of the RMS of $T_{\max}$ in the target to the RMS of $T_{\max}$ in the off-target brain, i.e. $(RMS_{target} / RMS_{off\text{-}target})^2$,
* M3 - off-target exposure (**collateral**): the fraction of the non-target brain volume with $T_{\max}$ exceeding the *p*-th isopercentile of $T_{\max}$ in the target or the brain, where *p* can be set by users.

Typically, it is not possible to find exposure conditions that simultaneously optimize all three metrics, and a compromise or prioritization is needed.

In addition to the TI-relevant MEM distribution, **high-frequency** exposure can also be of interest (e.g., to analyze potential high frequency stimulation or conduction blocking). For this, the peak field magnitude is used, which is obtained as:

$$
E_{\max}(x)=\max\left(\left|\vec{E}_1(x)+\vec{E}_2(x)\right|,\left|\vec{E}_1(x)-\vec{E}_2(x)\right|\right)
$$

For [multi-channel TI](/docs/background/modes.md), the **high-frequency** exposure is evaluated as the local worst-case peak E-field magnitude over time, and the **TI exposure** as the local maximum of the modulation envelope magnitude along any orientation (high frequency oscillations are eliminated through root-mean-square filtering) -- this QoI can be extracted for any low-frequency difference between two channel carrier frequencies.

For [phase-modulation TI](/docs/background/modes.md), the **TI exposure** is evaluated as the local difference between the maximum and the minimum of the field magnitude envelope (the envelope is obtained based on the root of the low-pass-filtered squared field magnitude).
