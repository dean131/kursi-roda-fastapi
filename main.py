from fastapi import FastAPI
from database.database import engine
from src.models import models
from route import product_route
import sys

app = FastAPI()


models.Base.metadata.create_all(bind=engine)

app.include_router(product_route.router)


@app.get("/")
def home():
    print("=====================================TEST")
    print("Python executable:", sys.executable)
    print("Python environment:", sys.prefix)
    print("=====================================")
    return {"message": "Welcome to FastAPI CRUD Product test23 CUYYY"}
