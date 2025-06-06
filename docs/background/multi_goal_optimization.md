## Multi-Goal Optimization

In view of the above-mentioned impossibility of simultaneously optimizing all exposure quality metrics (**M1:strength**, **M2:selectivity**, and **M3:collateral**; see [Quantities-of-Interest](/docs/background/electromagnetic_modeling/quantities_of_interest.md)), a Pareto multi-goal optimization approach is chosen, wherein an entire Pareto front of 'optimal' configurations is identified, from all possible electrode configurations and current ratios between the two channels. Here 'optimal' has the meaning that no configuration is known that improves on quality metrics, without degrading performance with regard to one or multiple other metrics.

### Surrogate-Modeling-Based Optimizer (SuMo)

Starting with TIP V4.0, the optimization process uses a surrogate-modeling-based optimizer (SuMo) which combines Gaussian process modeling with a multi-objective genetic algorithm. This approach systematically explores the solution space to provide a diverse set of Pareto-optimal solutions, enabling users to efficiently navigate trade-offs like selectivity versus intensity.

The SuMo optimizer works by:

1. Building surrogate models of the objective functions using Gaussian process regression
2. Using these models to efficiently guide the search toward promising regions of the parameter space
3. Employing a multi-objective genetic algorithm to find diverse Pareto-optimal solutions
4. Continuously refining the surrogate models as more evaluations are performed

This approach significantly improves both the speed and quality of the optimization process compared to previous versions, completing runs in approximately half the time while achieving better results as measured by hypervolume performance indicators.

From this front of solutions, a specific solution can either be chosen by focusing on a single metric, or by assigning weights to the three metrics. Both is possible in the second step of the planning workflow (Optimal Configuration Identification). Furthermore, the current ratio can be varied in this step, supported by graphs that show the current-ratio-dependence of M1–M3. The user is also free to interactively vary other parameters of the exposure configuration (e.g., electrode selection).
