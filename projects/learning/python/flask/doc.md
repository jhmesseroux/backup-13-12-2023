# those three lines allows me to refresh the browser when i make a change in the code

export FLASK_ENV=development
export FLASK_APP=app.py
flask run

# create a virtual machine

python -m venv <path>

# jinja

allow us to use python inside the html code

# filter in jinja https://jinja.palletsprojects.com/en/2.10.x/templates/

safe --> convert html tags
capitalize-title-upper-lower-trim
striptags --> remove html to prevent hack stuff
title --> capitalize every first letter of a paragraph

# access list item using the <List>.<pos> --> fruits.0

# error page

@app.errorhandler(404)
def page_not_found(e):
return render_template('404.html')

@app.errorhandler(500)
def page_not_found(e):
return render_template('500.html')

# generate .ssh direcory with a password

    ssh-keygen.exe --> enter for the rest

# setup git info in every project

    git config --global user.name <username>
    git config --global user.email <email>
    git config --global push.default.matching
    git config --gloabl alias.co checkout
    git init

# URL

url_for(<function_name>)

# form

    pip install flask_wtf
