### Head Models

TIP is designed such that it supports different head models. While the initial release only provided access to a single head model, more models are available in version 2.0 and more will be provided over time (male/female, different age and weight classes; anatomical models of research-relevant, non-human species, such as mouse and monkey). The following list provides additional information about the currently available models:

* The MIDA head model [[1]](/docs/background/references.md), developed by the IT'IS Foundation in collaboration with the US Food and Drug Administration (FDA), is derived from multi-modal MRI (Magnetic Resonance Imaging) imaging data from a healthy volunteer.  The underlying image data includes T1- and T2-weighted images, arterial spin labeling (ASL) for vasculature imaging, and non-rigidly registered diffusion tensor imaging (DTI) data. The latter can be used to assign inhomogeneous, anisotropic conductivity maps to neural tissues. The resolution of the underlying image data is better than 0.5mm throughout, and it was segmented into 115 distinct tissues and anatomical regions, including important (deep) brain structures. In version 2.0, models with anisotropic and isotropic conductivity are provided.

<br>
<p align="center">
  <img width="500" src="assets/methods/MIDAHead.png">
</p>

* Shifting focus to the IXI head models, we introduce two new additions: IXI025, representing a female head model, and IXI208, corresponding to a male head model. These two models have been generated from MR images of the IXI Dataset, which contains 600 scans of healthy subjects [[8]](/docs/background/references.md). Each subject's dataset includes T1, T2, and PD-weighted images, as well as MRA images and diffusion-weighted images with 15 directions. All images were resampled to an isotropic resolution of 0.5 mm during segmentation.
IXI025, the female model, is characterized by 43 individually segmented tissues. Conversely, IXI208, the male model, contains 50 segmented tissues. The difference in the number of tissues included in the two head models is due to the segmentation of deep brain structures in the male model.

<br>
<p align="center">
  <img width="500" src="assets/methods/IXI_male_model.png">
</p>

* The newly introduced mouse model has been segmented from high-resolution structural magnetic resonance imaging (MRI) data obtained from the Animal Imaging Center of the Institute of Biomedical Engineering, a joint institution of the ETH Zurich and the University of Zurich. This model represents a 3-week-old male mouse and comprises a total of 67 detailed segmented tissues and organs. The model was introduced to enable researchers engaged in rodent studies, to also use TIP for the planning. Further technical details can be explored through the comprehensive documentation accessible at [[9]](/docs/background/references.md).

<br>
<p align="center">
  <img width="500" src="assets/methods/mouse_model.png">
</p>

In version 3.0, users can generate personalized head models based on a T1-weighted MR images. The tissue segmentation is automatically generated using a U-Net, which is able to delineate 29 tissues, eight of which are subcortical regions.

Here is a list of all the tissues which are segmented and their electric conductivity values which are taken directly from our material database:

<table style="width: 100%; border-collapse: separate; border-spacing: 0px;">
<tr>
<td style="padding-left: 0px; vertical-align: top;">

| Tissue Name       | Elec. Conductivity [S/m] | Density [kg/m^3]        |
| ---------- | --- | ----------- |
| Amygdala   | 0.419055  | 1044.5    |
| Artery | 0.66246  | 1049.75 |
| Brainstem| 0.35  | 1045.5     |
| Caudate nucleus   | 0.419055  | 1044.5    |
| Cerebellum gray matter | 0.419055  | 1044.5 |
| Cerebellum white matter| 0.347954  | 1041     |
| Cerebrospinal fluid   | 1.879  | 1007    |
| Cerebrum gray matter | 0.419055  | 1044.5 |
| Cerebrum white matter| 0.347954  | 1041     |
| Dura   | 0.06  | 1174    |
| Eyes | 2.16486  | 1004.5 |
| Globus pallidus| 0.419055  | 1044.5     |
| Hippocampus   | 0.419055  | 1044.5    |
| Midbrain ventral | 0.35  | 1045.5 |
| Mucosa | 0.461008  | 1102     |

</td>
<td style="vertical-align: top;">

| Tissue Name       | Elec. Conductivity [S/m] | Density [kg/m^3]        |
| ---------- | --- | ----------- |
| Ocular muscle | 0.461008  | 1090.4    |
| Nerve cranial II optic | 0.347954  | 1075 |
| Nucleus accumbens| 0.419055  | 1044.5     |
| Other tissues   | 0.0776213  | 911    |
| Putamen | 0.419055  | 1044.5 |
| Skin | 0.148297  | 1109     |
| Skull cancellous | 0.0804595  | 1178.33    |
| Skull cortical | 0.006302  | 1908 |
| Spinal cord | 0.610954  | 1075     |
| Thalamus   | 0.475  | 1044.5    |
| Vein | 0.66246  | 1049.75 |
| Ventricles | 1.879  | 1007     |
| Vertebrae cancellous | 0.0804595  | 1178.33    |
| Vetebrae cortical | 0.006302  | 1908 |

</td>
</tr>
</table>

Since the model is trained on healthy subjects without implants/lesions/atrophy, it is recommended to use MRI data from subjects who fulfill these criteria as well. 

In addition to that, users have to option to provide diffusion tensor imaging data. Based on that, an inhomogeneous, anisotropic conductivity map can be extracted using a linear relationship which has been described by D.S. Tuch [citation ...]. To use this feature, users need to provide a preprocessed DTI nifty (.nii.gz), a .bval and .bvec file. The bval file lists the b-value for each volume in the series, the bvec file the gradient direction, with one column per volume

