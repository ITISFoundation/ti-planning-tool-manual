# Workflows

The TI Planning Tool supports multiple workflow configurations, each designed for a different use case. All workflows include a **Classic TI** analysis step; the number and type of preceding steps depend on the plan type selected.

The diagrams below outline each workflow. Click any step box to navigate directly to its documentation.

---

## TIP Lite

TIP Lite is the entry-level configuration, offering essential TI planning with **Classic TI** mode only. It works with pre-computed anatomical models and requires no personalization steps, making it the fastest way to get started.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">Classic TI</a>
</div>

---

## TIP (Non-Personalized)

The non-personalized TIP workflow extends TIP Lite by adding a full **Exposure Analysis** step, enabling comprehensive safety and dosimetry assessment via integrated Sim4Life postprocessing. Pre-computed anatomical models are used throughout — no imaging data required.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">Classic TI</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>

---

## TIP (Personalized)

The personalized workflow builds a patient-specific anatomical model from your own imaging data. After images are processed and inspected, an EM simulation is run, followed by the standard TI analysis and exposure assessment.

<div class="tip-workflow">
  <a class="tip-workflow__step twf-rose" href="#/docs/services/file_picker">File Picker</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-amber" href="#/docs/services/personalizer">Personalizer</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-teal" href="#/docs/services/fiducials_placement">Model Inspector</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-orange" href="#/docs/services/simulator">Simulator</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">Classic TI</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>

---

## TIP (Personalized & Anonymized)

This workflow extends the personalized workflow with an initial **Offline Personalization** step. All data anonymization is performed locally on your machine before anything is uploaded to the platform, ensuring that sensitive patient information never leaves your local environment.

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
  <a class="tip-workflow__step twf-blue" href="#/docs/services/post_processing">Classic TI</a>
  <span class="tip-workflow__arrow">&#8594;</span>
  <a class="tip-workflow__step twf-indigo" href="#/docs/services/s4l_post_processing">Exposure Analysis</a>
</div>
