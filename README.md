# ChurnPredictionAI

Customer churn prediction system with advanced analytics. Full-stack — Python backend + HTML frontend.
ML engine built from scratch. Zero scikit-learn.

**NEW FEATURES:** Early Warning System • Customer Lifetime Value (CLV) • High-Risk Segmentation • Retention Strategies • Comprehensive Dashboard

## Quick Start

**Windows** — double-click `start.bat`

**Mac / Linux**
```bash
bash start.sh
```

The backend starts on `http://localhost:8000` and the frontend opens in your browser.

## Manual Start

```bash
# 1. Install deps
pip install numpy pandas openpyxl

# 2. Start backend
cd backend
python main.py

# 3. Open frontend/index.html in your browser
```

## If you see "Failed to fetch" or "API offline"

Open a second terminal and run:
```bash
cd frontend
python -m http.server 3000
```
Then visit `http://localhost:3000` in your browser.

## Navigation Tabs

1. **Upload** — drag in `telco.xlsx` and click Run Predictions
2. **Dashboard** — original model metrics, feature importance, risk distribution
3. **Overview** — comprehensive dashboard with all key metrics
4. **Early Warning** — high-priority alerts for at-risk customers
5. **CLV** — customer lifetime value prioritization
6. **High Risk** — segmentation analysis of high-risk customers  
7. **Retention** — personalized retention strategy suggestions
8. **Single Predict** — predict churn for individual customers

## Features

### Core ML Pipeline
- 4 predictive models (Logistic Regression, Decision Tree, Random Forest, XGBoost)
- Automatic model selection based on AUC-ROC
- Leave-One-Out CV for small datasets, 80/20 split for large datasets
- Counterfactual simulation (15% discount impact analysis)

### Advanced Analytics
- **Early Warning System** — Severity-based alerts (CRITICAL/HIGH/MEDIUM/LOW)
- **CLV Analysis** — Calculate and prioritize customers by lifetime value
- **Risk Segmentation** — Identify common characteristics of high-risk customers
- **Retention Strategies** — AI-recommended retention actions per customer
- **Comprehensive Dashboard** — All-in-one view of risk, value, and actions

## API

### Original Endpoints
| Method | URL | Description |
|--------|-----|-------------|
| GET | `/api/health` | Server status |
| POST | `/api/predict` | File upload → all predictions |
| POST | `/api/predict/single` | JSON → one prediction |

## Structure

```
churnpredictionai/
├── backend/
│   ├── main.py              ← HTTP server (Python built-ins only)
│   ├── services/
│   │   └── ml_service.py    ← ML pipeline wrapper
│   ├── src/                 ← ML engine (from scratch)
│   └── telco.xlsx           ← sample dataset
├── frontend/
│   └── index.html           ← full UI (single file)
├── start.bat                ← Windows launcher
├── start.sh                 ← Mac/Linux launcher
└── README.md
```
