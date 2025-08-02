from fastapi import APIRouter, Depends
from app.schemas.user import UserCreate, UserOut
from app.auth.jwt_handler import create_access_token
from app.auth.utils import get_current_user

router = APIRouter()

@router.post("/register", response_model=UserOut)
async def register_user():
    # Add user registration logic here
    return {"id": 1, "username": "test", "email": "test@test.com", "is_verified": "false"}

@router.post("/login")
async def login_user():
    # Add user login logic here
    return {"access_token": "test_token", "token_type": "bearer"}

@router.get("/me", response_model=UserOut)
async def get_profile(current_user: UserOut = Depends(get_current_user)):
    return current_user
