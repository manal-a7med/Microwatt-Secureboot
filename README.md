*This project is built on top of the ChipFoundry OpenFrame user project template. Template documentation(original Readme.md) has been removed to highlight the custom project description.*


# Microwatt Secure Boot + Root of Trust

## Overview
This project extends the open-source **MicroWatt POWER CPU** with a **Secure Boot mechanism** and a **custom FAIL peripheral**. The system ensures only trusted firmware can run on the CPU by verifying its integrity at boot time. If verification fails, the FAIL peripheral signals the error via a GPIO/LED flag or UART output.

## Motivation
While MicroWatt demonstrates the POWER ISA in an accessible form, it lacks built-in security. This project introduces a **minimal root of trust**, making the design more suitable for secure IoT and embedded systems. By showcasing secure boot on an open POWER core, we highlight how open hardware can also enforce trusted execution.

## Planned Deliverables
- **Secure Boot ROM** that loads and verifies firmware before execution.
- **Verification Unit** (CRC32 → optional SHA-256).
- **FAIL Peripheral** (GPIO/LED or UART) for signaling verification failure.
- **Simulation Testbenches** for valid and invalid firmware images.
- **Documentation** (block diagrams, build instructions, verification).
- **Demo video & screenshots**.

## Repository Structure
- `src/` – RTL modules (boot ROM, verification unit, FAIL peripheral)  
- `tb/` – Testbenches (valid/invalid firmware flows)  
- `docker/` – Dockerfile + build scripts  
- `docs/` – Architecture, verification, results  
- `media/` – Screenshots and demo video  

---

*This repository was created from the [ChipFoundry OpenFrame user project template](https://github.com/chipfoundry/openframe_user_project). Template files remain for integration reference.*

