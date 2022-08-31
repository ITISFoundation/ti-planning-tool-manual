## Quantities-of-Interest

Based on precomputed E-fields for the different electrode pairs (actually, based on linear combinations of single source-electrode simulations) distributions of the relevant TI-exposure quantity can be computed, and key performance metrics can be determined.

The total field is obtained as:

$$
\vec{E}(t,x)=\textrm{sin} (\omega_1\cdot t)\vec{E}_1(x)+\textrm{sin}(\omega_2\cdot t)\vec{E}_2(x)
$$ 

where $\vec{E}_{1,2}$ are the fields of the two channels and $\omega_{1,2}$ are their angular frequencies (initial phases are set to zero without loss of generality). Its projection along a direction of interest $\vec{n}$ (e.g., the principal axis of a pyramidal neuron, or the principal axis of the local diffusion tensor; $\left| \vec{n} \right| = 1$) is obtained as:

$$
    \vec{E}_{\vec{n}}(t,x)=\textrm{sin} (\omega_1\cdot t)\left(\vec{n}\cdot\vec{E}_1(x)\right)+\textrm{sin}(\omega_2\cdot t)\left(\vec{n}\cdot\vec{E}_2(x)\right).
$$

The modulation envelope magnitude (MEM) along $\vec{n}$ can easily be obtained as \begin{equation}

$$ T_{\vec{n}}(x)=\textrm{min}(\left|\vec{n}\cdot\vec{E}_1(x)\right|,\left|\vec{n}\cdot\vec{E}_2(x)\right|) $$

As TI-exposure quantity, the modulation envelope magnitude (MEM) has been chosen, which is computed according to the formula from [[8]](/docs/background/references.md):

$$
T_{\textrm{max}}(x)=\textrm{max}_{\vec{n}}\,T_{\vec{n}}(x)=\left|\vec{E}_{AM}^{\max}(\vec{x})\right| = 
\begin{cases}
2 \cdot \left|\vec{E_2}(\vec{x})\right| & \text{if $\left|\vec{E_2}(\vec{x})\right| < \left|\vec{E_1}(\vec{x})\right|\cos{\alpha}$}\\
\frac{2\cdot\left|\vec{E_2}(\vec{x}) \times (\vec{E_1}(\vec{x}) - \vec{E_2}(\vec{x}))\right|}{\left|{\vec{E_1}(\vec{x}) - \vec{E_2}(\vec{x})}\right|} & \text{otherwise}
\end{cases}    
$$

where $\alpha$ denotes the angle between $\vec{E}_{1,2}$. This metric has been chosen because it reproduces empirical observations, such as the neurons responding to the demodulated exposure and stimulation target moving towards the channel carrying less current when the current ratio is adapted.

To assess the quality of a TI exposure condition, three key metrics have been defined:

* M1 - target exposure strength (**strength**): the median of $T_{\textrm{max}}$ in the target,
* M2 - exposure selectivity (**selectivity**): the ratio of the mean target $T_{\textrm{max}}$ and the mean off-target $T_{\textrm{max}}$,
* M3 - off-target exposure (**collateral**): the fraction of the non-target brain volume with $T_{\textrm{max}}$ exceeding M1.
Typically, it is not possible to find exposure conditions that simultaneously optimize all three metrics, and a compromise or prioritization is needed.

In addition to the TI-relevant MEM distribution, **high-frequency** exposure can also be of interest (e.g., to analyze potential high frequency stimulation or conduction blocking). For this, the peak field magnitude is used, which is obtained as:

$$
    E_{\textrm{max}}(x)=\textrm{max}(\left|\vec{E}_1(x)+\vec{E}_2(x)\right|,\left|\vec{E}_1(x)-\vec{E}_2(x)\right|).
$$
