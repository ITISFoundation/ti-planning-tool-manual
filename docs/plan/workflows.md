# Workflows

The TI Planning Tool supports multiple workflow configurations, each designed for a different use case. All workflows include a **TI Analysis** step, though the available features within that step depend on the plan type (see [TIP vs TIP Lite](/docs/welcome/tip-vs-tip-lite.md)). The number and type of preceding steps also depend on the plan type selected.

The diagrams below outline each workflow. Click any step box to navigate directly to its documentation.

---

## TIP Lite

TIP Lite is the free, entry-level configuration. It supports **classic TI** mode with two pre-computed anatomical models (MIDA anisotropic and Mouse). No personalization steps are required, making it the fastest way to get started. TI Analysis is available with basic exposure visualization; report generation, and Exposure Analysis are not available.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">TI Analysis</a>
</div>

---

## TIP (Non-Personalized)

The non-personalized TIP workflow provides access to the full TI Analysis feature set — all three TI modes ([classic TI, multi-channel TI, and phase-modulation TI](/docs/background/modes.md)), five pre-computed anatomical models, the SuMo optimizer, and report generation — followed by a full **Exposure Analysis** step for in-depth safety and dosimetry assessment via an integrated Sim4Life workbench. No imaging data is required.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">TI Analysis</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>

---

## TIP (Personalized)

The personalized workflow builds a patient-specific anatomical model from the user's own imaging data. Each step serves a distinct purpose:

- **[File Picker](/docs/services/file_picker.md)**: Upload a T1-weighted MRI (isotropic model) or a zipped T1 + DTI package (anisotropic model).
- **[Personalizer](/docs/services/personalizer.md)**: An AI model generates a tissue-segmented head model from the uploaded data, automatically placing EEG 10-10 electrode landmarks.
- **[Model Inspector](/docs/services/fiducials_placement.md)**: Inspect the generated head model and manually correct fiducial points if needed.
- **[Simulator](/docs/services/simulator.md)**: Run isotropic or anisotropic EM simulations on AWS to generate the electromagnetic field library (~2.5–3 hours).
- **[TI Analysis](/docs/services/post_processing.md)**: Optimize and analyze TI exposure conditions using the SuMo optimizer and interactive visualization tools.
- **[Exposure Analysis](/docs/services/s4l_post_processing.md)**: Perform in-depth field visualization and dosimetry assessment in the full Sim4Life workbench.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-rose" href="#/docs/services/file_picker">File Picker</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-amber" href="#/docs/services/personalizer">Personalizer</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-teal" href="#/docs/services/fiducials_placement">Model Inspector</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-orange" href="#/docs/services/simulator">Simulator</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">TI Analysis</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>

---

## TIP (Personalized & Anonymized)

This workflow is identical to the personalized workflow, but adds an initial **Offline Personalization** step for users with data privacy requirements. The full segmentation and anonymization pipeline runs locally on the user's machine (requires [Sim4Life](https://sim4life.swiss/) v9.4+ on Windows): facial features are deformed beyond recognition while fully preserving the internal tissue structures needed for simulation. Only the anonymized, segmented head model is uploaded to the cloud — no identifiable imaging data ever leaves the local environment.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-purple" href="#/docs/services/data_privacy">Offline Personalization</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-rose" href="#/docs/services/file_picker">File Picker</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-amber" href="#/docs/services/personalizer">Personalizer</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-teal" href="#/docs/services/fiducials_placement">Model Inspector</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-orange" href="#/docs/services/simulator">Simulator</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">TI Analysis</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>
