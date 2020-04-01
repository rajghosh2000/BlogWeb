from flask import Flask , render_template , request,session , redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import os
import math
import json
from werkzeug.utils import secure_filename
#from flask_mail import Mail


with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True

app = Flask(__name__)
app.secret_key = 'rajdeep_2507'
'''app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']

)
mail = Mail(app)'''
app.config['UPLOAD_FOLDER']=params['upload_location']
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):  #Write the table name as class name and the first letter in capital

   #1
    sno = db.Column(db.Integer, primary_key=True)
   #2
    name = db.Column(db.String(80), nullable=False)
   #3
    email = db.Column(db.String(90), nullable=False)
   #4
    ph_no = db.Column(db.String(15), nullable=False)
   #5
    msg = db.Column(db.String(500), nullable=False)
   #6 
    date = db.Column(db.String(12), nullable=True)



class Posts(db.Model):  #Write the table name as class name and the first letter in capital

   #1
    sno = db.Column(db.Integer, primary_key=True)
   #2
    title = db.Column(db.String(80), nullable=False)
   #3
    slug = db.Column(db.String(25), nullable=False)
   #3
    subtitle = db.Column(db.String(90), nullable=False)
   #4
    content = db.Column(db.String(120), nullable=False)
   #5
    img_file = db.Column(db.String(40), nullable=False)
   #6 
    date = db.Column(db.String(12), nullable=True)

@app.route("/")
def home():
     posts = Posts.query.filter_by().all()
     #[0:params['no_of_posts']]
     last=math.ceil(len(posts)/int(params['no_of_posts']))
 
     page=request.args.get('page')
     if(not str(page).isnumeric()):
         page=1
     page=int(page)    
     
     posts = posts[(page-1)*int(params['no_of_posts']): (page-1)*int(params['no_of_posts'])+int(params['no_of_posts']) ]
     #slicing of posts i.e from say x to y -- to here is :

     if(page==1):
         prev = "#"
         next = "/?page="+ str(page+1)
     elif(page==last):
         prev = "/?page="+ str(page-1)
         next = "#"
     else:
         prev = "/?page="+ str(page-1)
         next = "/?page="+ str(page+1)

     return render_template('index.html',params=params,posts=posts,prev=prev,next=next)

@app.route("/about")
def about():
     return render_template('about.html',params=params)

@app.route("/logout")
def logout():
    session.pop('user')
    return render_template('login.html',params=params)

@app.route("/delete/<string:sno>", methods=['GET','POST'])
def delete(sno):
     if('user' in session and session['user']==params['admin_user']):
            post = Posts.query.filter_by(sno=sno).first()
            db.session.delete(post)
            db.session.commit()
     return redirect('/admin')
     


@app.route("/admin")
def admin():
     return render_template('admin.html',params=params)

@app.route("/login" , methods=['GET','POST'])
def login():

     if('user' in session and session['user']==params['admin_user']):
         posts=Posts.query.all()
         return render_template('admin.html',params=params,posts=posts)  #if the admin is already logged in 

     if (request.method=='POST'):
         username=request.form.get('uname')
         userpass=request.form.get('pass')

         if(username==params['admin_user'] and userpass==params['admin_password'] ):
             session['user'] = username 
             #session variable - variable used untill the user is active with the server say if the user is the admin than he/she logins and is active with the server
             posts=Posts.query.all()
             return render_template('admin.html',params=params,posts=posts)
     return render_template('login.html',params=params)


@app.route("/uploader" , methods=['GET','POST'])
def uploader():
     if('user' in session and session['user']==params['admin_user']):
         if (request.method=='POST'):
             f=request.files['file1']
             f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))

             return "Uploaded files succesfully"



@app.route("/contact", methods = ['GET','POST'])
def contact():
     if(request.method=='POST'):
          #ENTRIES
         __table__='contacts'
         name = request.form.get('name')
         email = request.form.get('email')
         ph = request.form.get('ph')
         msg_in = request.form.get('msg')
         
         entry = Contacts(name = name, email = email, ph_no = ph, msg = msg_in, date= datetime.now())

         db.session.add(entry)
         db.session.commit()
         '''mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['gmail-user']],
                          body = msg_in + "\n" + ph
                          )'''

     return render_template('contact.html',params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
                                                  #string part after post is for the slug i.e the text that comes after the / in the http part
def post_f(post_slug):                            #post_slug accessed as argument
    post=Posts.query.filter_by(slug=post_slug).first() #first is gievn if by chance the slug name gets repeated than the for the given preference but  
                                                  #here we have tried to keep it unquie that is no repeatation will be done
    return render_template('post.html',params=params,post=post)


@app.route("/edit/<string:sno>", methods = ['GET','POST'])
def edit(sno):
     
     if('user' in session and session['user']==params['admin_user']):
          if(request.method=='POST'):
              new_title = request.form.get('title')
              new_slug = request.form.get('Slug')
              new_subtitle = request.form.get('subt')
              new_content = request.form.get('Content')
              new_image = request.form.get('img_file')
              new_date = datetime.now()
              
              if sno=='0':
                  post = Posts(title = new_title, slug = new_slug, subtitle = new_subtitle, content = new_content, img_file= new_image , date= new_date)
                  db.session.add(post)
                  db.session.commit()

              else:
                  post = Posts.query.filter_by(sno=sno).first()
                  post.title = new_title
                  post.slug = new_slug
                  post.subtitle = new_subtitle
                  post.content = new_content
                  post.img_file = new_image
                  post.date = new_date
                  db.session.commit()
                  return redirect('/edit/'+sno)

          
     post=Posts.query.filter_by(sno=sno).first()
     return render_template('edit.html',params=params,post=post,sno=sno)

app.run(debug=True)