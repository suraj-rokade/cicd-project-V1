# 🚀 Flask CI/CD Project with GitHub Actions and Docker

This project demonstrates a **real-world CI/CD pipeline** setup for a Python Flask application using **GitHub Actions** and **Docker Hub**.  
The pipeline automatically builds, tests, and pushes Docker images whenever code is committed to the main branch.

---

## 🏗️ Step 1 — Project Setup

1. **Create a new project directory**
   ```bash
   mkdir cicd-project-V1
   cd cicd-project-V1


# Create and activate virtual environment

python -m venv .venv
.venv\Scripts\activate        # (Windows)
source .venv/bin/activate     # (Linux/Mac)


# Install Flask and generate requirements

pip install flask
pip freeze > requirements.txt

# Project structure

cicd-project-V1/
├── app/
│   ├── __init__.py
│   └── main.py
├── tests/
│   └── test_app.py
├── run.py
├── requirements.txt
├── Dockerfile
├── .github/
│   └── workflows/
│       └── ci-cd.yml
└── README.md


# Step 2 — Git & GitHub Setup

git init
git add .
git commit -m "Initial commit"


# Link GitHub repository

git remote add origin https://github.com/suraj-rokade/cicd-project-V1.git
git branch -M main
git push -u origin main

# Verify Git setup

git remote -v
git status


# Step 3 — Dockerfile Setup

# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose app port
EXPOSE 5000

# Run the Flask app
CMD ["python", "run.py"]


# Note:
Initially, the Dockerfile was missing, causing this error:

--> Fixed by creating the Dockerfile in the root directory (not inside any folder).

# GitHub Actions CI/CD Workflow
 >> Created .github/workflows/ci-cd.yml

 # Adding Repository Secrets

# Reference Commands Used

# Environment setup
python -m venv .venv
.venv\Scripts\activate
pip install flask
pip freeze > requirements.txt

# Git setup
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/suraj-rokade/cicd-project-V1.git
git push -u origin main

# Docker test (optional)
docker build -t docker-hub-user-name/cicd-project-v1 .
docker run -p 5000:5000 docker-hub-user-name/cicd-project-v1

# Common Errors & Fixes

| Issue                                   | Cause                                       | Fix                                        |
| --------------------------------------- | ------------------------------------------- | ------------------------------------------ |
| `Permission denied` on pip              | Running inside restricted folder (OneDrive) | Moved project to `C:\project\` and retried |
| `src refspec master does not match any` | Branch was renamed to `main`                | Used `git push origin main`                |
| `failed to read Dockerfile`             | Dockerfile missing in root                  | Added `Dockerfile` in project root         |
| `Process completed with exit code 127`  | No build/test command defined               | Added placeholder `echo` command           |

# Pipeline Success

After fixing all issues:

All GitHub Action jobs ran successfully.

Docker image was built and pushed to Docker Hub