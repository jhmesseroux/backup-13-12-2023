from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.
def index(request):
    return HttpResponse("Hello,This is the index page of the Jean app")


def sayMyName(request,name):
    return HttpResponse(f"My name is : {name}")

def post(request):
    return render(request,'post.html',{
        'title':'This is the title of the post',
        'content':'This is the content of the post',
    })