from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import user, posts, followers, notifications, ai_moderation

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(user.router)
app.include_router(posts.router)
app.include_router(followers.router)
app.include_router(notifications.router)
app.include_router(ai_moderation.router)
app.include_router(post.router)
