#!/bin/bash
echo ""
echo "  ================================================"
echo "    ChurnPredictionAI — Starting..."
echo "  ================================================"
echo ""

command -v python3 &>/dev/null || { echo "  ERROR: python3 not found"; exit 1; }

echo "  Checking dependencies..."
python3 -c "import numpy, pandas, openpyxl" 2>/dev/null || pip install numpy pandas openpyxl

echo "  Starting backend on http://localhost:8000 ..."
cd "$(dirname "$0")/backend"
python3 main.py 8000 &
sleep 1

FRONT="$(dirname "$0")/frontend/index.html"
echo "  Opening frontend..."
command -v xdg-open &>/dev/null && xdg-open "$FRONT"
command -v open     &>/dev/null && open     "$FRONT"

echo ""
echo "  Backend running at http://localhost:8000"
echo "  Frontend: $FRONT"
echo "  Press Ctrl+C to stop."
echo ""
wait
