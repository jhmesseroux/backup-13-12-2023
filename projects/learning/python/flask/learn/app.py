from flask import Flask,render_template,jsonify,redirect,request
# from db.todos import get_todos
from todos import get_todos

app = Flask(__name__)

# create a list of todos with a dictionary of key value pairs for each todo item with id, name,state,date,color and description
# todos = [
#     {
#         "id": 1,
#         "name": "Todo One",
#         "state": "Done",
#         "date": "2020-01-01",
#         "color": "red",
#         "description": "This is the first todo item"
#     },
#     {
#         "id": 2,
#         "name": "Todo Two",
#         "state": "In Progress",
#         "date": "2020-01-02",
#         "color": "blue",
#         "description": "This is the second todo item"
#     },
#     {
#         "id": 3,
#         "name": "Todo Three",
#         "state": "Pending",
#         "date": "2020-01-03",
#         "color": "green",
#         "description": "This is the third todo item"
#     },
#     {
#         "id": 4,
#         "name": "Todo Four",
#         "state": "Pending",
#         "date": "2020-01-04",
#         "color": "yellow",
#         "description": "This is the fourth todo item"
#     }
# ]



@app.route('/')
def index():
    todos = get_todos()
    return render_template('index.html', todos=todos)
    # return 'hello'

@app.route('/todos/create')
def createTodo():
    return render_template('/todos/create.html')
    # return 'hello'


@app.route('/todos/save', methods=['POST'])
def saveTodo():
    data = request.form # send data with post method in the form 
    print(data)
    # return render_template('/todos/create.html')
    # return 'hello'


@app.route('/api/v1/todos', methods=['GET'])
def getTodos():
    todos = get_todos()
    jsonTodos = []
    # for todo in todos:
    #     jsonTodos.append(todo.toDict())

    # do the same using a list comprehension 
    jsonTodos = [todo.toDict() for todo in todos]

    print(jsonTodos)
    return jsonify((jsonTodos))

@app.route('/api/v1/todos/<int:id>', methods=['GET'])
def getTodoById(id):
    pass 


if __name__ == '__main__':
    app.run(debug=True)