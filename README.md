# Fingerprint-Recognition-and-False-Alert-System-using-Minutiae-Extraction

This project implements a complete fingerprint recognition and verification system based on minutiae extraction and transformed minutiae matching. The system performs fingerprint preprocessing, skeletonization, minutiae detection, alignment, and similarity-based matching to authenticate fingerprint pairs.

The matching algorithm compares transformed minutiae using Euclidean distance and orientation constraints, producing a normalized similarity score for verification. System performance is evaluated using standard biometric metrics including False Match Rate (FMR), False Non-Match Rate (FNMR), and Equal Error Rate (EER) on the FVC fingerprint dataset and a custom dataset.


## Objectives

- Meet the demand for advanced biometric authentication in the digital era
- Provide robust protection against unauthorized access
- Reduce false alerts in fingerprint verification through principled false minutiae elimination
- Implement a lightweight, interpretable pipeline without GPU or deep-learning dependencies

---

## Pipeline

<img width="2176" height="1213" alt="image" src="https://github.com/user-attachments/assets/d3cbb32f-c9c2-4ae9-90dc-abee4eff851a" />

<img width="2176" height="1213" alt="image" src="https://github.com/user-attachments/assets/93ea9e1e-4710-4926-8fd6-7b0227faaeaa" />



---

## System Components

The system consists of three main blocks:

1. **Sensor** — fingerprint image acquisition via ZKT Eco SKL20R fingerprint sensor
2. **Minutiae Extractor** — enhancement, binarisation, thinning, and crossing-number extraction
3. **Minutiae Matcher** — spatial and angular correspondence scoring

---

## Datasets

### FVC2002 DB1 (Public Benchmark)
- **Source:** Fingerprint Verification Competition 2002
- **Link:** http://bias.csr.unibo.it/fvc2002/databases.asp
- **Size:** 110 fingers × 8 impressions = 880 fingerprint images
- **Sensor type:** Optical


### Custom ZKTeco SKL20R Dataset
- **Sensor:** ZKTeco SKL20R capacitive fingerprint sensor
- **Size:** 4 fingers × 3 impressions = 12 fingerprint images
- **Subjects:** 4 group members

---

## Results

### FVC2002 DB1

| Metric | Value |
|---|---|
| Equal Error Rate (EER) | ~5% |
| Threshold at EER | 0.38 |
| Zero-FMR threshold | 0.48 |
| FNMR at Zero-FMR threshold | ~10% |

### Custom ZKTeco SKL20R Dataset

| Metric | Value |
|---|---|
| FMR = 0 from threshold | 0.40 |
| FNMR = 0 up to threshold | 0.52 |
| Score separation | Complete — genuine and impostor distributions fully disjoint |

The complete score separation on the custom dataset confirms that the pipeline generalises across sensor types, achieving perfect discrimination between genuine and impostor pairs under controlled acquisition conditions.

---

## Requirements

- MATLAB (R2018b or later recommended)
- Image Processing Toolbox

No additional toolboxes, training data, or GPU hardware required.

---


---

## Usage

```matlab
% Evaluate on FVC2002 DB1
cd eval
evaluate_fvc2002

% Evaluate on ZKTeco custom dataset
evaluate_zkteco
```

---

## Social Impacts

- Enhanced security across authentication systems
- Crime prevention through reliable identity verification
- Improved access control in embedded and resource-constrained environments
- Personal data protection via hardware-agnostic biometric verification
- Convenient and user-friendly authentication without tokens or passwords

---

## Future Prospects

- Integration with emerging technologies (IoT, edge devices)
- Multimodal biometric fusion (fingerprint + face, fingerprint + iris)
- More sophisticated anti-spoofing techniques
- AI-driven adaptive preprocessing
- Expansion of applications to healthcare, banking, and border control

---

## Conclusion

The system offers a secure and convenient method for biometric authentication across various sectors. Reliability depends heavily on the minutiae extraction quality — the FFT-based enhancement and false minutiae elimination stages are the core contributions that make the pipeline robust to acquisition artefacts. The dual-dataset evaluation confirms cross-sensor generalisation.

---

---


