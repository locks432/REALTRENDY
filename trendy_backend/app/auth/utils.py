from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)

def get_password_hash(password):
    return pwd_context.hash(password)

def get_current_user():
    # Add logic to get the current user from the token
    return {"id": 1, "username": "test", "email": "test@test.com", "is_verified": "false"}
