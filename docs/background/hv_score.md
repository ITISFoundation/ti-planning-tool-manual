## Hypervolume Indicator

The Hypervolume Indicator (HV), originally proposed by Zitzler and Thiele [[11]](/docs/background/references.md), is a widely used scalar measure for assessing the quality of a Pareto front obtained from a multi-objective optimization. It quantifies how well a set of solutions covers the objective space relative to a chosen reference point $\mathbf{r}$ that is dominated by all solutions of interest.

Geometrically, the hypervolume is the $n$-dimensional volume of the region in objective space that is dominated by the solution set $S$ and bounded by $\mathbf{r}$:

$$
HV(S, \mathbf{r}) = \lambda_n\!\left(\bigcup_{\mathbf{y} \in S} \left[\mathbf{y},\, \mathbf{r}\right]\right)
$$

where $\lambda_n$ denotes the $n$-dimensional Lebesgue measure (hypervolume), $n$ is the number of objectives, and $[\mathbf{y}, \mathbf{r}]$ is the axis-aligned hypercuboid between solution $\mathbf{y}$ and reference point $\mathbf{r}$.

<br>
<p align="center">
  <img width="60%" class="dark-only" src="/assets/hv_score/hv_score_dark.png">
  <img width="60%" class="light-only" src="/assets/hv_score/hv_score_light.png">
</p>

A larger hypervolume indicates a better Pareto front: solutions that are closer to the true optimum and more spread out across the trade-off surface contribute more volume. This makes the indicator particularly useful for comparing the output of different optimizers or tracking optimization progress, as it captures both convergence toward the Pareto front and diversity of the solution set in a single number.

In the context of TI planning, the hypervolume indicator is used to evaluate the quality of the Pareto front produced by the [SuMo optimizer](/docs/background/sumo_optimizer.md) over the three exposure quality metrics **M1** (strength), **M2** (selectivity), and **M3** (collateral).
