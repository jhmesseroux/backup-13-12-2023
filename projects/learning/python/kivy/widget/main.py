from kivy.app import App
from kivy.lang import Builder
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.label import Label
from kivy.uix.anchorlayout import AnchorLayout
from kivy.uix.gridlayout import GridLayout
from kivy.uix.stacklayout import StackLayout
from kivy.uix.scrollview import ScrollView
from kivy.metrics import dp
from kivy.uix.screenmanager import ScreenManager, Screen
from kivy.core.window import Window

class PageLayoutScreen(Screen):
    pass

class GridLayoutScreen(Screen):
    '''
        organiza los widgets en una cuadricula,
        tiene dos propiedades que te permiten posicionar los widgets:
            cols: cantidad de columnas
            rows: cantidad de filas
    '''
    def __init__(self,**kwargs):
        super().__init__(**kwargs)
        # self.orientation = "rl-bt" # right to left, bottom to top
        # add some padding 
        # create a grid widget with 4   columns 
        grid = GridLayout(cols=9,spacing=dp(10),padding=dp(10))
        for i in range(0,95): # can display all without a scrollview
            b = Button(text=str(i+1),size_hint=(None,None),size=(dp(40),dp(40)),background_color=(255/255, 208/255, 73/255, 1))
            grid.add_widget(b)
        # create a scroll view and add the grid widget to the scroll view
        scrollview = ScrollView(size_hint=(1, None), size=(Window.width, Window.height +100))
        scrollview.add_widget(grid)
        # add the scroll view to this layout
        self.add_widget(scrollview) 

class StackLayoutScreen(Screen):
    '''
        apila los widgets uno encima del otro,
        tiene dos propiedades que te permiten posicionar los widgets:
            orientation: lr-tb, rl-tb, lr-bt, rl-bt
            padding: espacio entre los widgets
            
'''
    pass

class AnchorLayoutScreen(Screen):
    '''
        ocupa todo el espacio disponible y posiciona los widgets en el mismo lugar,
        tiene dos propiedades que te permiten posicionar los widgets:
            anchor_x: left, center, right
            anchor_y: top, center, bottom
    '''
    pass

class MainWindowManager(ScreenManager):
    pass
class MyMainApp(App):
    currentUser = 444
    def build(self):
        Window.clearcolor = (245/255, 245/255, 245/255, 1)
        Window.size = (450, 680)
        return sm     
sm = """

MainWindowManager:
    StackLayoutScreen:
    AnchorLayoutScreen:
    GridLayoutScreen:
    PageLayoutScreen:

<PageLayoutScreen>:
    name: 'page_layout'
    PageLayout:
        GridLayoutScreen:
        StackLayoutScreen:
        AnchorLayoutScreen:
<GridLayoutScreen>:
    name: 'grid_layout'
    BoxLayout:
        orientation: "horizontal"
        size_hint: 1, None
        # spacing : 20
        # padding : 10
        height: 70
        canvas.before:
            Color:
                rgba:(7/255, 12/255, 32/255, 0.95)
            Rectangle:
                pos: self.pos
                size: self.size
        Button:                
            text: "Stack"    
            on_release: app.root.current = "stack_layout"
            outline_width: 0.1
            outline_color: 0, 0, 0, 1
            color: (223/255, 223/255, 223/255, 1)
            background_color:(27/255, 43/255, 106/255, 0.95)
            bold : True
            font_size: 23
        
        Button:
            outline_width: 0.1
            outline_color: 0, 0, 0, 1
            text: "Anchor"
            font_size: 23
            color: (223/255, 223/255, 223/255, 1)
            bold : True
            on_release: app.root.current = "anchor_layout"
            background_color:(38/255, 9/255, 28/255, 0)
        Button:
            outline_width: 0.1
            outline_color: 0, 0, 0, 1
            text: "Grid"
            font_size: 23
            color: (252/255, 198/255, 7/255, 1)
            bold : True
            on_release: app.root.current = "grid_layout"
            background_color:(38/255, 9/255, 28/255, 0)    
        Button:
            outline_width: 0.1
            outline_color: 0, 0, 0, 1
            text: "Page"
            font_size: 23
            color: (223/255, 223/255, 223/255, 1)
            bold : True
            on_release: app.root.current = "page_layout"
            background_color:(38/255, 9/255, 28/255, 0)              
<StackLayoutScreen>:
    name: 'stack_layout'
    BoxLayout:
        orientation: "vertical"
        ScrollView:
            StackLayout:
                size_hint: 1, None
                height: self.minimum_height
                spacing: 10
                padding: 10
                # orientation:
                # size_hint: 1,.1
                # add a background color red 
                canvas.before:
                    Color:
                        rgba: 200/255,200/255,200/255,1
                    Rectangle:
                        pos: self.pos
                        size: self.size
                Button:
                    text: '13'     
                    size: 300, 300
                    # size_hint: None, None   
                    background_color:(0, 0, 0, 1)  
                    # pos_hint: {'center_x': .2, 'center_y': .25}
                    size_hint: 0.2, 0.1
                Button:
                    text: '12'     
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(245/255, 0, 127/255, 1)
                    pos_hint: {'center_x': .7, 'center_y': .4}
                    size: 250, 250
                    size_hint: None, None   
                Button:
                    text: '1'    
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(1, 0, 0, 1)
                    size: 200, 200
                    size_hint: None, None  
                    pos_hint: {'center_x': .3, 'center_y': .7}          
                Button:
                    text: '14' 
                    color: (1, 0, 0, 1)
                    background_color:(127/255, 3/255, 106/255, 0.95)  
                    size: 100, 100
                    size_hint: None, None                   
                Button:
                    text: '14' 
                    color: (1, 0, 0, 1)
                    background_color:(127/255, 3/255, 106/255, 0.95)  
                    size: 100, 100
                    size_hint: None, None                   
                Button:
                    text: '13'     
                    size: 300, 300
                    size_hint: None, None   
                    background_color:(0, 0, 0, 1)  
                    pos_hint: {'center_x': .2, 'center_y': .25}
                Button:
                    text: '12'     
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(245/255, 0, 127/255, 1)
                    pos_hint: {'center_x': .7, 'center_y': .4}
                    size: 250, 250
                    size_hint: 1, None   
                Button:
                    text: '1'    
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(1, 0, 0, 1)
                    size: 200, 200
                    size_hint: None, None  
                    pos_hint: {'center_x': .3, 'center_y': .7}          
                Button:
                    text: '12'     
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(245/255, 0, 127/255, 1)
                    pos_hint: {'center_x': .7, 'center_y': .4}
                    size: 250, 250
                    size_hint: None, None   
                Button:
                    text: '13'     
                    size: 300, 300
                    size_hint: None, None   
                    background_color:(0, 0, 0, 1)  
                    pos_hint: {'center_x': .2, 'center_y': .25}
                Button:
                    text: '1'    
                    color: (252/255, 198/255, 7/255, 1)
                    background_color:(1, 0, 0, 1)
                    size: 200, 200
                    size_hint: None, None  
                    pos_hint: {'center_x': .3, 'center_y': .7}          
                Button:
                    text: '14' 
                    color: (1, 0, 0, 1)
                    background_color:(127/255, 3/255, 106/255, 0.95)  
                    size: 100, 100
                    size_hint: None, None                   
        BoxLayout:
            orientation: "horizontal"
            size_hint: 1, None
            spacing : 20
            # padding : 10
            height: 70
            canvas.before:
                Color:
                    rgba:(7/255, 12/255, 32/255, 0.95)
                Rectangle:
                    pos: self.pos
                    size: self.size
            Button:                
                text: "Stack"    
                on_release: app.root.current = "stack_layout"
                outline_width: 0.1
                outline_color: 0, 0, 0, 1
                color: (252/255, 198/255, 7/255, 1)
                background_color:(27/255, 43/255, 106/255, 0)
                bold : True
                font_size: 23
            
            Button:
                outline_width: 0.1
                outline_color: 0, 0, 0, 1
                text: "Anchor"
                font_size: 23
                color: (223/255, 223/255, 223/255, 1)
                bold : True
                on_release: app.root.current = "anchor_layout"
                background_color:(38/255, 9/255, 28/255, 0)
            Button:
                outline_width: 0.1
                outline_color: 0, 0, 0, 1
                text: "Grid"
                font_size: 23
                color: (223/255, 223/255, 223/255, 1)
                bold : True
                on_release: app.root.current = "grid_layout"
                background_color:(38/255, 9/255, 28/255, 0)    
            Button:
                outline_width: 0.1
                outline_color: 0, 0, 0, 1
                text: "Page"
                font_size: 23
                color: (223/255, 223/255, 223/255, 1)
                bold : True
                on_release: app.root.current = "page_layout"
                background_color:(38/255, 9/255, 28/255, 0)    


<AnchorLayoutScreen>:



"""

# class MyMainApp(App):
#     currentUser = 444
#     def build(self):
#         Window.clearcolor = (245/255, 245/255, 245/255, 1)
#         Window.size = (450, 680)
#         return sm       

MyMainApp().run()