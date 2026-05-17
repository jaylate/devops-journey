import random
import string
import logging
from fastapi import FastAPI, Response
from pydantic import BaseModel
from prometheus_fastapi_instrumentator import Instrumentator

class URLRequest(BaseModel):
  url: str

logging.basicConfig(
  level = logging.INFO,
  format = "%(asctime)s - - %(name)s - %(levelname)s - %(message)s",
  datefmt = "%Y-%m-%d %H:%M:%S",
)

logger = logging.getLogger(__name__)
app = FastAPI()
Instrumentator().instrument(app).expose(app)

urls = {
}

@app.post("/shorten", status_code=201)
async def shorten(request: URLRequest, response: Response):
  code = ''.join(random.choices(string.ascii_lowercase+string.digits, k=8))
  urls[code] = request.url
  logger.info(f"{request.url} shorten into {code} code")
  return {"code": code}

@app.get("/health")
async def health():
  return {"status": "ok"}

@app.get("/{code}", status_code=302)
async def root(code: str, response: Response):
  url = urls.get(code)
  if url is not None:
    response.headers["Location"] = url
    return "Redirecting..."
  else:
    response.status_code = 404
    return "Not found"
