from kivy.app import App
from kivy.uix.widget import Widget
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.anchorlayout import AnchorLayout
from kivy.uix.gridlayout import GridLayout
from kivy.uix.stacklayout import StackLayout
from kivy.metrics import dp
from kivy.properties import StringProperty,BooleanProperty
from kivy.uix.screenmanager import ScreenManager, Screen


class CounterLayout(GridLayout):

    counter = 1
    counterString  = StringProperty(str(counter))
    inp  = StringProperty('')
    # CanChange = False
    CanChange = BooleanProperty(False)

    def __init__(self,**kwargs):
        super().__init__(**kwargs)

    def increase(self):
        print(self.counter)
        if self.CanChange:
            self.counter += 1
            self.counterString = str(self.counter)
    
    def decrease(self):
        self.counter -= 1
        self.counterString = str(self.counter)
    
    def reset(self):
        self.counter = 0
        self.counterString = str(self.counter)

    
    def start_stop(self,btn):
        print(btn)
        print('toggle :: ' , btn.state) # down or normal
        if btn.state == 'down':
            self.CanChange = True
            btn.text = 'On'
        else:
            btn.text = 'Off'
            self.CanChange = False
    def toogleSwitch(self,switch):
        print(switch.active)
        if switch.active:
            self.CanChange = True
        else:
            self.CanChange = False

    def on_enter (self,input):
        print('on enter',input)
        self.inp = input.text

class StackLayoutExample(StackLayout):
    def __init__(self,**kwargs):
        super().__init__(**kwargs)
        self.orientation = "rl-bt" # right to left, bottom to top
        # add some padding 
        self.padding = dp(10)
        self.spacing = dp(10)
        for i in range(0,150): # can display all without a scrollview
            b = Button(text=str(i+1),size_hint=(None,None),size=(dp(100),dp(100)))
            self.add_widget(b)

class AnchorLayoutExample(AnchorLayout):
    pass

class BoxLayoutExample(BoxLayout):
    pass
    # def __init__(self,**kwargs):
    #     super().__init__(**kwargs)
    #     self.orientation = "vertical"
    #     b1 = Button(text="A")
    #     v2 = Button(text="B")
    #     b3 = Button(text="C")
    #     self.add_widget(b1)
    #     self.add_widget(v2)
    #     self.add_widget(b3)

class MainWidget(Widget):
    pass

class MenuScreen(Screen):
    pass

class SettingsScreen(Screen):
    pass

class MyTextApp(App):
    def build(self):
        # Create the screen manager
        sm = ScreenManager()
        sm.add_widget(MenuScreen(name='menu'))
        sm.add_widget(SettingsScreen(name='settings'))

        return sm


MyTextApp().run()