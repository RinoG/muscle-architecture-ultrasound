# Muscle Architecture in Ultrasound Data — UMUD Challenge

**Kaggle Competition**: [UMUD Challenge — Muscle Architecture in Ultrasound Data](https://www.kaggle.com/competitions/umud-challenge-muscle-architecture-in-ultrasound-data)

## Installation & Setup

We use `uv` for dependency resolution to guarantee microsecond environment builds and precise CUDA 13.0 wheel alignment.

### 1. Prerequisites
Ensure you have the following installed on your host OS:
*   Python >= 3.14
*   [uv](https://docs.astral.sh/uv/) (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
*   Python C-API headers (`sudo apt install python3.14-dev`)

### 2. Environment Initialization
From the project root, simply run the make command. This will enforce a 300-second network timeout to safely download massive `nvidia-cufft` binaries, build the `.venv`, and install our internal `umud` package in editable mode.

```bash
make install