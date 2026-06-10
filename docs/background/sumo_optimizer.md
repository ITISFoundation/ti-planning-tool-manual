## SuMo Optimizer

### Introduction

The Surrogate-Modeling-Based Optimizer (SuMo) is a powerful new optimization engine introduced in TIP V4.0. It replaces the previous sweeper approach with a more sophisticated and efficient method for finding optimal stimulation parameters. SuMo combines Gaussian process modeling with a multi-objective genetic algorithm to systematically explore the solution space, delivering improved results in less time.

### Key Technologies

#### Gaussian Process Modeling

Gaussian Process (GP) regression is a probabilistic machine learning technique that builds surrogate models of the objective functions. These surrogate models:

- Provide predictions with uncertainty quantification
- Enable efficient exploration of the parameter space
- Reduce the number of expensive function evaluations needed
- Adapt as more data is collected during optimization

#### Multi-Objective Genetic Algorithm

The genetic algorithm component systematically explores the parameter space to find diverse Pareto-optimal solutions:

- Evaluates multiple candidate solutions simultaneously
- Uses evolutionary principles to generate better solutions over time
- Maintains diversity to explore different trade-off options
- Focuses on identifying the full Pareto front of optimal solutions
- Excludes geometrically invalid electrode configurations (e.g., overlapping electrodes) via native constraint handling, keeping the objective landscape smooth and the surrogate fit accurate

#### Multi-Seed Parallel Execution

To improve the coverage and robustness of the returned Pareto front, SuMo (as of TIP V5.2) runs multiple independent optimization seeds in parallel. Each seed starts from a different random initial sample and explores the electrode search space independently. Once all seeds complete, their individual Pareto fronts are merged using non-dominated sorting: a solution is retained only if no other solution in the combined pool is strictly better on all objectives simultaneously. The merged front is denser and more representative of the true trade-off surface than any single-seed result, without increasing wall-clock time on multi-core hardware.

#### Adaptive Convergence Stopping

Rather than always running to a fixed maximum iteration count, SuMo (as of TIP V5.2) monitors the [hypervolume indicator](/docs/background/hv_score.md) (HV) after every iteration. Once the relative improvement in HV falls below a threshold for a number of consecutive iterations, the seed is considered converged and stops automatically, avoiding wasted computation. Users control the trade-off between run time and Pareto front completeness by selecting a convergence precision level (Low, Medium, or High) before starting the optimization.

### Benefits of SuMo

1. **Superior Performance**: SuMo consistently finds better solutions than exhaustive search methods, as measured by the [hypervolume indicator](/docs/background/hv_score.md).

2. **Computational Efficiency**: By intelligently guiding the search to promising regions and stopping each seed once convergence is reached, SuMo avoids wasted evaluations and completes in less time.

3. **Trade-off Navigation**: SuMo provides a diverse set of Pareto-optimal solutions, allowing users to easily navigate trade-offs like selectivity versus intensity.

4. **Robust Front Coverage**: Parallel multi-seed execution with non-dominated sorting produces a denser and more reliable Pareto front, reducing the risk that a single unlucky seed dominates the result.
