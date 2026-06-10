## TIP V5.2 <Badge type="tip" text="Latest" />

::: info SuMo Optimizer — Pareto Front Quality
- Improved SuMo optimizer Pareto front quality via three complementary enhancements to Step 6 (Post-Processing)
- Replaced penalty-based handling of invalid electrode configurations with native Dakota nonlinear inequality constraints, producing a smoother surrogate fit and eliminating invalid solutions from the Pareto front
- Added parallel multi-seed execution (default: 6 seeds) with Pareto front merging via non-dominated sorting, yielding a denser and more representative approximation of the true Pareto front without increasing wall-clock time
- Introduced adaptive convergence stopping based on the hypervolume indicator (HV): the optimizer halts each seed once HV improvement falls below a threshold, avoiding wasted iterations
:::

::: info New User Controls
- Added user-selectable convergence precision (Low / Medium / High), each backed by optimized evolutionary algorithm parameters, allowing users to trade off speed against Pareto front completeness
:::


## TIP V5.0 <Badge type="info" text="5.0.0" />

::: info Personalization
- Introduced offline personalization workflow (`run_personalizer.bat`) for local MRI anonymization and segmentation using Sim4Life 9.4+
- Raw MRI never leaves the user's machine; only the anonymized, segmented head model is uploaded to TIP
:::

::: info Exposure Analysis
- Upgraded Exposure Analysis from a read-only analysis viewer to a full Sim4Life workbench (Modeling + Simulation + Analysis)
- Added ready-to-use Sim4Life template projects for all precomputed models (MIDA isotropic/anisotropic, IXI Female, IXI Male, Mouse)
:::

::: info Performance
- Reduced SuMo optimizer runtime from ~1 hour to 5–10 minutes via lead-field array caching and Numba-accelerated field superposition
:::


## TIP V4.0 <Badge type="info" text="4.0.0" />

::: info Personalization
- Implemented automated personalization with neural network-based fiducial point detection
:::

::: info Optimizer
- Introduced SuMo optimizer replacing the previous sweeper
- Streamlined user workflow by eliminating electrode selector and sweep steps
:::

::: info Performance & Visualization
- Enhanced parallel processing for up to 50% faster optimization runs
- Improved visualization for Pareto-optimal solutions
:::


::: details TIP V3.0

**Personalization & Target Selection**
- Introduced personalized TI stimulation planning: users can upload subject-specific T1-weighted MRI (and optionally DTI) data for personalized exposure assessment and optimization
- Added ICBM brain atlas registration for an expanded number of target regions available for stimulation optimization

**Infrastructure**
- Migrated platform to Amazon Web Services (AWS) for increased reliability, stability, and scalability
- Parallelized low-frequency EM simulations across individual electrodes using AWS resources, accelerating the overall workflow

**New Features**
- Optimized for the TIBS-R multichannel device
- Launched TIP.lite: a reduced-functionality tier giving broader audiences access to Classic TI mode and selected precomputed head models

:::


::: details TIP V2.2

**Standards & Imaging**
- Adopted the RAS (Right, Anterior, Superior) coordinate convention for image and exposure viewing, aligning with established scientific standards
- Integrated co-registered brain atlases to expand the number of supported target regions for stimulation planning
- Registered MRI data to field distributions for improved visualization and methodological rigor

**Infrastructure**
- Expanded internal cluster capacity to increase availability and support multiple simultaneous users

:::


::: details TIP V2.0

**Head Models**
- Expanded head model library from one to four highly detailed computational anatomical models, enabling investigation of inter-subject variability
- Added a mouse head model to support optimization of TI protocols for rodent research

**New Stimulation Modes**
- Introduced Multichannel TI mode with up to eight independent channels, improving stimulation focality, selectivity, and multifocal targeting while distributing current over larger scalp areas
- Introduced Phase Modulation TI mode, enabling advanced pulse shapes, burst stimulation, and complex modulation schemes for activity-synchronized and state-dependent stimulation

**UX & Performance**
- Added visual guidance alongside the quantitative results table to help users interactively balance conflicting optimization goals (e.g., target exposure vs. collateral exposure)
- Leveraged cloud computing and parallelization to enable interactive exploration of large electrode configuration spaces

:::


::: details TIP V1.0

**Initial Release**
- First release of TIP: an online-accessible, cloud-based TI stimulation planning tool built on o2S2PARC technologies
- Optimization based on 71 precomputed 3D electric field distributions for the standard 10-10 International EEG Electrode System, computed using the MIDA head model with the Sim4Life low-frequency electro-quasistatic solver
- Pareto-based multi-goal optimization using field superposition for efficient search over electrode pair permutations
- Computed three key performance metrics per electrode configuration: target exposure strength, stimulation selectivity, and collateral exposure

**Analysis & Reporting**
- Visually guided interactive refinement of the stimulation strategy with high-frequency and TI modulation field distributions overlaid on anatomical image data
- 3D isosurface visualization of the TI exposure distribution within head anatomy to assess collateral stimulation
- Automatic report generation covering electrode placement, current intensities, performance metrics, field distributions, and cumulative dose histograms
- Field export in multiple formats (e.g., MATLAB) and integration with Sim4Life web for in-depth post-processing

:::

