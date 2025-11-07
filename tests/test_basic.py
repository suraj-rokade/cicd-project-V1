from app import create_app

def test_index(client):
    response = client.get("/")
    assert response.status_code == 200
    assert response.json == {"message": "Hello from my-flask-app!"}
