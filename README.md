*This project is built on top of the ChipFoundry OpenFrame user project template. Template documentation has been removed to highlight the custom project description.*

*Note: This repo was initialized from the ChipFoundry OpenFrame template. 
Template example code remains and will be replaced with Secure Boot design files during implementation.*



# Microwatt Secure Boot + Root of Trust

## Overview
This project extends the open-source **MicroWatt POWER CPU** with a **Secure Boot mechanism** and a **custom FAIL peripheral**.  
The system ensures that only trusted firmware executes by verifying firmware integrity during boot.  
If verification fails, the FAIL peripheral raises a hardware signal (GPIO/LED flag or UART output) to prevent untrusted code from running.

## Motivation
While MicroWatt demonstrates the POWER ISA in a compact and educational form, it lacks hardware trust mechanisms.  
As IoT and embedded devices increasingly require secure execution, the ability to validate and enforce trusted firmware is critical.  
This project introduces a **minimal root of trust** to the MicroWatt ecosystem, making it more relevant for security-conscious applications such as:  
- Secure IoT devices  
- Embedded controllers  
- Academic demonstrations of trusted computing  

By implementing Secure Boot on MicroWatt, we aim to prove that open hardware can also deliver **secure and trustworthy execution**.

## Objectives
1. **Design and integrate a Secure Boot ROM** that loads firmware and validates its integrity before handing over control.  
2. **Implement a Verification Unit** to perform cryptographic or checksum validation (CRC32 as baseline, SHA-256 as optional extension).  
3. **Create a FAIL Peripheral** to raise a hardware/software visible flag when verification fails.  
4. **Develop testbenches and verification** for both valid and invalid firmware images.  
5. **Provide reproducible documentation and Docker flows** for easy build and integration.  
6. **Demonstrate secure boot functionality** with clear outputs (success/failure states).  

## Planned Deliverables
- **RTL Modules:**  
  - Boot ROM (firmware loader)  
  - Verification Unit (CRC32/SHA)  
  - FAIL Peripheral (LED/GPIO/UART signaling)  

- **Simulation Testbenches:**  
  - Valid firmware path (system boots normally)  
  - Invalid firmware path (FAIL peripheral asserts, CPU halted)  

- **Documentation:**  
  - Block diagrams  
  - Design rationale  
  - Verification coverage results  

- **Demo Material:**  
  - Screenshots & waveform captures  
  - Short video demo of secure boot flow  

- **Dockerized Build Flow:**  
  - OpenLane integration for reproducible builds  
  - Scripts for running testbenches  


## Repository Structure
- `src/` – # RTL source files (boot ROM, verification, FAIL peripheral)
- `tb/` – # Testbenches (valid/invalid firmware verification) 
- `docker/` – # Reproducible build & simulation environment  
- `docs/` – # Design documentation, diagrams, verification reports  
- `media/` – Screenshots and demo video
- `Readm/` - # Complete project proposal

## Judging Criteria Alignment
- **Design Technical Merit:** Secure Boot + FAIL peripheral directly extends MicroWatt functionality.  
- **Verification Coverage:** Plan includes rigorous testbenches for both valid and invalid firmware cases.  
- **Documentation Quality:** Full design rationale, diagrams, and reproducible build flow will be provided.  
- **Novelty & Ecosystem Impact:** Introduces root of trust to an open POWER CPU, bridging security with open hardware.  

---

*Note: This repository was initialized using the [ChipFoundry OpenFrame template](https://github.com/chipfoundry/openframe_user_project).  
Template code and example files remain for integration and will be progressively replaced with Secure Boot design modules.*

---

