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

### Benefits of SuMo

1. **Superior Performance**: SuMo consistently finds better solutions than exhaustive search methods, as measured by hypervolume performance indicators.

2. **Computational Efficiency**: By intelligently guiding the search to promising regions, SuMo requires fewer evaluations to find optimal solutions.

3. **Trade-off Navigation**: SuMo provides a diverse set of Pareto-optimal solutions, allowing users to easily navigate trade-offs like selectivity versus intensity.

4. **Parallel Processing**: SuMo fully leverages parallel processing capabilities to further reduce computation time.
