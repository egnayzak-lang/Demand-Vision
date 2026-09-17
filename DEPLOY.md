# DemandVision — Production Deployment

This package is prepared for a persistent web deployment.

## Important
The trained model artifacts are expected in `model/`:
- ai_model.pkl
- encoder.pkl
- scaler.pkl
- feature_columns.pkl
- categorical_cols.pkl
- data.pkl

If they are not present, run:

```bash
python prepare_model.py --data retail_store_inventory.csv
```

The training script preserves the notebook configuration: train/test split 80/20, date features, OneHotEncoder, StandardScaler and RandomForestRegressor with 200 trees.

## Local production test

```bash
pip install -r requirements.txt
gunicorn --bind 0.0.0.0:5000 --workers 1 --timeout 120 app:app
```

## Railway

1. Put this project in a GitHub repository.
2. Create a Railway project and deploy the repository.
3. Railway uses the included `Dockerfile`.
4. Generate a public domain from the service networking settings.
5. Keep the generated domain as the permanent project URL.

For a custom domain, add your own domain in the service's networking/domain settings.
