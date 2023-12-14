from database import session ,Todo



def get_todos():
    return session.query(Todo).all()
