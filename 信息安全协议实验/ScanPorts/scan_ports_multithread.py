from tkinter import *
import socket
import threading
import time
import queue
import tkinter.messagebox as msgbox
import re

# GUI界面
# 其中的MyThread是多线程执行函数
class MyGui():
    def __init__(self, init_window_name):
        self.init_window_name = init_window_name
        self.threadsnum = 800
        self.timeout = 0.1

    # 初始化窗口
    def set_init_window(self):                  
        self.init_window_name.title("ScanPorts")
        self.window_center(600, 520)
        self.init_window_name.resizable(0,0)    

        # 定义区域，把全局分为上中下部分
        self.frame_top = Frame(self.init_window_name, width=600, height=200)
        self.frame_center = Frame(self.init_window_name, width=600, height=300)
        self.frame_foot = Frame(self.init_window_name, width=600, height=10)

        self.frame_top.grid(row=0, column=0)
        self.frame_center.grid(row=1, column=0)
        self.frame_foot.grid(row=2, column=0, pady="20")

        # 上部分布局
        # ip
        # 起始端口 终止端口
        # 开始扫描
        self.ip_lb_top = Label(self.frame_top, text="IP地址", font="楷体")
        self.startport_lb_top = Label(self.frame_top, text="起始端口", font="楷体")
        self.endport_lb_top = Label(self.frame_top, text="终止端口", font="楷体")

        self.ip_input = StringVar()
        self.startport_input = StringVar()
        self.endport_input = StringVar()

        # 设置参数ip, startport, endport的默认值
        self.ip_input.set('127.0.0.1')
        self.startport_input.set('1')
        self.endport_input.set('65535')

        # 设置输入框
        self.ip_content = Entry(self.frame_top, textvariable=self.ip_input, font="楷体")
        self.startport_content = Entry(self.frame_top, textvariable=self.startport_input, font="楷体")
        self.endport_content = Entry(self.frame_top, textvariable=self.endport_input, font="楷体")
        # 开始扫描按钮，设置点击后的事件runing
        self.PortScan = Button(self.frame_top, text="开始扫描", command=self.runing, font="楷体")
        
        self.ip_lb_top.grid(row=0, column=0, padx=15, pady=20)
        self.ip_content.grid(row=0, column=1, padx=15, pady=20)
        self.startport_lb_top.grid(row=1, column=0, padx=15, pady=20)
        self.endport_lb_top.grid(row=1, column=2, padx=15, pady=20)
        self.startport_content.grid(row=1, column=1, padx=15, pady=20)
        self.endport_content.grid(row=1, column=3, padx=15, pady=20)
       
        self.PortScan.grid(row=3, column=2, padx=30, pady=20)


        # 中间部分布局
        self.porttext = Text(self.frame_center, width=60, height=22)
        self.scroll = Scrollbar(self.frame_center)
        self.scroll.pack(side=RIGHT, fill=Y)
        self.porttext.pack(side=RIGHT, fill=Y)
        self.scroll.config(command=self.porttext.yview)
        self.porttext.config(yscrollcommand=self.scroll.set)
        #self.porttext.grid(row=0, column=0, pady=10)

        # 下部分布局

    # 窗口居中
    def window_center(self, width, height):
        screenwidth = self.init_window_name.winfo_screenwidth()
        screenheight = self.init_window_name.winfo_screenheight()
        size = '%dx%d+%d+%d' % (width, height, (screenwidth - width) / 2, (screenheight - height) / 2)
        self.init_window_name.geometry(size)

    # 获取当前时间
    def get_current_time(self):
        current_time = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(time.time()))
        return current_time
    
    # 扫描函数；connect判断TCP是否开放此端口
    # 多线程从端口队列中取出端口，进行扫描
    def scan(self, port_queue):
        # 不断循环直到port队列为空
        while True:
            if port_queue.empty():
                break
            ip = self.ip
            port = port_queue.get()
            timeout = self.timeout
            # 创建socket对象，connect连接端口
            try:
                s = socket.socket()
                s.settimeout(timeout)
                s.connect((ip, port))
                string = "Port " + str(port) + " is OPEN\n"
                self.porttext.insert(END, string)
                self.porttext.see(END)
            except Exception as e:
                pass
            finally:
                s.close()

    # 多线程类，将执行函数作为一个对象；将端口列表传入参数
    class MyThread(threading.Thread):
        def __init__(self, func, *args):
            super().__init__()

            self.func = func
            self.args = args

            self.setDaemon(True)
            self.start()  # 在这里开始
        def is_alive(self) -> bool:
            return super().is_alive()
        def run(self):
            self.func(*self.args)


    # 开始扫描按钮的事件
    def runing(self):
        self.porttext.delete(1.0, END)
        # 判断ip格式是否正确
        if re.match(r"^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$", self.ip_content.get()):
            self.ip = self.ip_content.get()
        else:
            msgbox.showerror(title="Error", message="ip格式错误，格式为：x.x.x.x")
            return
        
        # 获取端口范围
        startport = self.startport_content.get()
        endport = self.endport_content.get()

        self.porttext.insert(END, "当前时间为： "+self.get_current_time()+"\nIP地址："+self.ip+"\n端口列表："\
                             +self.startport_content.get()+"-"+self.endport_content.get()+"\n开始扫描\n")
        
        self.portslist = list(range(int(startport), int(endport) + 1))
        # 将端口列表放入队列中
        port_queue = queue.Queue()
        for port in self.portslist:
            port_queue.put(port)
        threads = []
        # 多线程执行扫描函数，设置线程数为800
        start = time.time()
        for _ in range(0, self.threadsnum):
            thread = self.MyThread(self.scan, port_queue)
            threads.append(thread)
        # 等待线程结束
        while 1:
            for thread in threads:
                if thread.is_alive():
                    time.sleep(0.0001)
            break
        end = time.time()
        spent = str(end-start)
        spent = spent[:spent.find('.')+3]
        self.porttext.insert(END, "扫描结束\n")
        # 打印扫描时间
        self.porttext.insert(END, "\nTime Cost: "+str(spent)+"\n\n")
    

if __name__ == "__main__":
    pygui = Tk()
    init_window = MyGui(pygui)
    init_window.set_init_window()
    pygui.mainloop()