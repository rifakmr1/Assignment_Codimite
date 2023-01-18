from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
db = SQLAlchemy(app)

class Todo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    text = db.Column(db.String(200))

    def __init__(self, text):
        self.text = text

@app.route('/todos', methods=['GET'])
def list_todos():
    todos = Todo.query.all()
    return jsonify([todo.text for todo in todos])

@app.route('/todos', methods=['POST'])
def add_todo():
    text = request.json['text']
    todo = Todo(text)
    db.session.add(todo)
    db.session.commit()
    return jsonify({'text': todo.text}), 201

@app.route('/todos/<int:todo_id>', methods=['DELETE'])
def delete_todo(todo_id):
    Todo.query.filter_by(id=todo_id).delete()
    db.session.commit()
    return jsonify({'message': 'Todo deleted'}), 200

if __name__ == '__main__':
    db.create_all()
    app.run(debug=True)
