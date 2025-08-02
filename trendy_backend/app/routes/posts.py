from fastapi import APIRouter

router = APIRouter()

@router.get("/posts")
def get_posts():
    return []

@router.post("/posts")
def create_post():
    return {"message": "Post created successfully"}
