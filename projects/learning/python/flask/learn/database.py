import os 
from dotenv import load_dotenv
from sqlalchemy import create_engine,Column,Integer,String,Date,inspect
from sqlalchemy.orm import sessionmaker,declarative_base

load_dotenv()

Base = declarative_base()
engine = create_engine(os.getenv('CONECTION_STRING')) 
Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)
session = Session()


# create a model for todo with id,name,description,color,data 
class Todo(Base):
    __tablename__ = 'todos'
    id = Column(Integer, primary_key=True, autoincrement=True, unique=True)
    name = Column(String(250))
    description = Column(String(500))
    color = Column(String(20))
    date = Column(Date())
    state = Column(String(20))

    def toDict(self):
        return { c.key: getattr(self, c.key) for c in inspect(self).mapper.column_attrs }