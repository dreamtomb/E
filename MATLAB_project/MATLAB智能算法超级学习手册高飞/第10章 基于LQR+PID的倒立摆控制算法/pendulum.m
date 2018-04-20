function varargout = pendulum(varargin)
% PENDULUM M-file for pendulum.fig
%      PENDULUM, by itself, creates a new PENDULUM or raises the existing
%      singleton*.
%
%      H = PENDULUM returns the handle to a new PENDULUM or the handle to
%      the existing singleton*.
%
%      PENDULUM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENDULUM.M with the given input arguments.
%
%      PENDULUM('Property','Value',...) creates a new PENDULUM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pendulum_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pendulum_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help pendulum

% Last Modified by SHE on 15-Dec-2008 22:08:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pendulum_OpeningFcn, ...
                   'gui_OutputFcn',  @pendulum_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before pendulum is made visible.
function pendulum_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pendulum (see VARARGIN)

% Choose default command line output for pendulum
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pendulum wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pendulum_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
%以字符串的形式来存储数据文本框1的内容。如果字符串不是数字，则现实空白内容
input =str2double(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))     
set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
%以字符串的形式来存储数据文本框2的内容。如果字符串不是数字，则现实空白内容
input =str2double(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))     
set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
%以字符串的形式来存储数据文本框3的内容。如果字符串不是数字，则现实空白内容
input =str2double(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))    
set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
%以字符串的形式来存储数据文本框4的内容。如果字符串不是数字，则现实空白内容
input =str2double(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))     
set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
%以字符串的形式来存储数据文本框5的内容。如果字符串不是数字，则现实空白内容
input =str2double(get(hObject,'String'));
%检查输入是否为空. 如果为空,则默认显示为0
if (isempty(input))     
set(hObject,'String','0')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        set(handles.text10 ,'String','期望极点');
        set(handles.text11 ,'String','      -10             -10');
        set(handles.text12 ,'String','-2+2*sqrt(3)*i -2-2*sqrt(3)*i');
    case 2
        set(handles.text10 ,'String','加权矩阵');
        set(handles.text11 ,'String','Q=[1 0 0 0; 0 0 0 0; 0 0 1 0;0 0 0 0];');
        set(handles.text12 ,'String','     R=1');
    case 3
        set(handles.text10 ,'String','参考输入');
        set(handles.text11 ,'String','  y_r=0.2*U(t)');
        set(handles.text12 ,'String',' ');
     case 4
        set(handles.text10 ,'String','PID');
        set(handles.text11 ,'String','  P=5，I=0.001，D=1');
        set(handles.text12 ,'String',' ');    
end
        

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
M = str2double(get(handles.edit1, 'String'));%小车质量
m = str2double(get(handles.edit2, 'String'));%摆杆质量
b = str2double(get(handles.edit3, 'String'));%小车阻尼
I = str2double(get(handles.edit4, 'String'));%摆杆转动惯量
l = str2double(get(handles.edit5, 'String'));%摆杆长度
g=9.8;                                       %重力加速度
%%%%%%%%%%%%%%%%%%%%%%%%计算系统状态矩阵%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=[           0                   1 0             0;...
    (M+m)*m*g*l/((M+m)*I+M*m*l^2) 0 0 m*l*b/((M+m)*I+M*m*l^2);...
              0                   0 0             1;...
     -m^2*l^2*g/((M+m)*I+M*m*l^2) 0 0 -(I+m*l^2)*b/((M+m)*I+M*m*l^2)];
B=[0;-m*l/(((M+m)*I+M*m*l^2));0;(I+m*l^2)/((M+m)*I+M*m*l^2)];
C=[0 0 1 0;1 0 0 0];
D=zeros(2,1);
E=zeros(4,1);

%%%%%%%%%%%%%%%%%%%%将状态矩阵转存到状态空间%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
assignin('base','A',A);
assignin('base','B',B);
assignin('base','C',C);
assignin('base','D',D);
assignin('base','E',E);

%%%%%%%%%%%%%%%%%%%%%%选择倒立摆的控制方式%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1                         %%极点配置法
        Qc=ctrb(A,B);
        EA=[-10   0        0        0;...
             0  -10        0        0;...
             0    0  -2-2*sqrt(3)*i 0;...
             0    0        0        -2+2*sqrt(3)*i];
        PP=polyvalm(poly(EA),A);
        Ks=[0 0 0 1]*inv(Qc)*PP;   %%计算反馈矩阵
       
        [t,x,y]=sim('jwgcqp.mdl'); %%调用降维观测器的simulink模块
%         figure(1)
%         subplot(4,2,1)
%         plot(t,y(:,1))
%         title('系统状态变化')
%         subplot(4,2,2)
%         plot(t,y(:,5))
%         title('降维观测器结果') 
%         subplot(4,2,3)
%         plot(t,y(:,2))
%         subplot(4,2,4)
%         plot(t,y(:,6))
%         subplot(4,2,5)
%         plot(t,y(:,3))
%         subplot(4,2,6)
%         plot(t,y(:,7))
%         subplot(4,2,7)
%         plot(t,y(:,4))
%         subplot(4,2,8)
%         plot(t,y(:,8))
        
%%%[Y,X] = lsim(A-B*Ks,B,C,D,U,T);
        axes(handles.axes1);
        plot(t,y(:,1));
        axes(handles.axes2);
        plot(t,y(:,3));
        axes(handles.axes3)
        plot([-0.02;0.02],[-0.8;-0.8],'color','k','linestyle','-','linewidth',2);
        axis([-0.02 0.02 -1.2 1.2]);
        car1=line([-0.004;0.004],[-0.5;-0.5],'color','k','linestyle','-','erasemode','xor','linewidth',25);
        car21=line(-0.004,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        car22=line( 0.004,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        pendulum1=line([0;0],[-0.3;0.6],'color','r','linestyle','-','erasemode','xor','linewidth',10);
        pendulum2=line(0,-0.27,'color','g','linestyle','.','erasemode','xor','markersize',30);
        for s=1:length(t)
            set(car21,'xdata',-0.004+y(s,3),'ydata',-0.72);
            set(car22,'xdata', 0.004+y(s,3),'ydata',-0.72);
            set(car1,'xdata',[-0.004+y(s,3);0.004+y(s,3)],'ydata',[-0.5;-0.5]);
            set(pendulum2,'xdata',y(s,3),'ydata',-0.27);
            set(pendulum1,'xdata',[y(s,3);sin(y(s,1))+y(s,3)],'ydata',[-0.3;-0.3+cos(y(s,1))]);
            drawnow;
        end
        
    case 2                         %%LQR最优控制器
        QQ=diag([1,0,1,0]);
        RR=1;
        Ks=lqr(A,B,QQ,RR);         %%计算反馈矩阵

        [t,x,y]=sim('jwgcql.mdl'); %%调用降维观测器的simulink模块
%         figure(2)
%         subplot(4,2,1)
%         plot(t,y(:,1))
%         title('系统状态变化')
%         subplot(4,2,2)
%         plot(t,y(:,5))
%         title('降维观测器结果') 
%         subplot(4,2,3)
%         plot(t,y(:,2))
%         subplot(4,2,4)
%         plot(t,y(:,6))
%         subplot(4,2,5)
%         plot(t,y(:,3))
%         subplot(4,2,6)
%         plot(t,y(:,7))
%         subplot(4,2,7)
%         plot(t,y(:,4))
%         subplot(4,2,8)
%         plot(t,y(:,8))
        
        axes(handles.axes1);
        plot(t,y(:,1));
        axes(handles.axes2);
        plot(t,y(:,3));
        axes(handles.axes3);
        plot([-0.3;0.3],[-0.8;-0.8],'color','k','linestyle','-','linewidth',2);
        axis([-0.3 0.3 -1.2 1.2]);
        car1=line([-0.06;0.06],[-0.5;-0.5],'color','k','linestyle','-','erasemode','xor','linewidth',25);
        car21=line(-0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        car22=line( 0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        pendulum1=line([0;0],[-0.3;0.6],'color','r','linestyle','-','erasemode','xor','linewidth',10);
        pendulum2=line(0,-0.27,'color','g','linestyle','.','erasemode','xor','markersize',30);
        for s=1:length(t)
            set(car21,'xdata',-0.06+y(s,3),'ydata',-0.72);
            set(car22,'xdata', 0.06+y(s,3),'ydata',-0.72);
            set(car1,'xdata',[-0.06+y(s,3);0.06+y(s,3)],'ydata',[-0.5;-0.5]);
            set(pendulum2,'xdata',y(s,3),'ydata',-0.27);
            set(pendulum1,'xdata',[y(s,3);sin(y(s,1))+y(s,3)],'ydata',[-0.3;-0.3+cos(y(s,1))]);
            drawnow;
        end
        
    case 3                         %%无静差跟踪器
        [t,x,y]=sim('wjchgzq.mdl'); %%调用降维观测器的simulink模块 
        axes(handles.axes1);
        plot(t,y(:,1));
        axes(handles.axes2);
        plot(t,y(:,3));
        axes(handles.axes3);
        plot([-0.3;0.3],[-0.8;-0.8],'color','k','linestyle','-','linewidth',2);
        axis([-0.3 0.3 -1.2 1.2]);
        car1=line([-0.06;0.06],[-0.5;-0.5],'color','k','linestyle','-','erasemode','xor','linewidth',25);
        car21=line(-0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        car22=line( 0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
        pendulum1=line([0;0],[-0.3;0.6],'color','r','linestyle','-','erasemode','xor','linewidth',10);
        pendulum2=line(0,-0.27,'color','g','linestyle','.','erasemode','xor','markersize',30);
        for s=1:length(t)
            set(car21,'xdata',-0.06+y(s,3),'ydata',-0.72);
            set(car22,'xdata', 0.06+y(s,3),'ydata',-0.72);
            set(car1,'xdata',[-0.06+y(s,3);0.06+y(s,3)],'ydata',[-0.5;-0.5]);
            set(pendulum2,'xdata',y(s,3),'ydata',-0.27);
            set(pendulum1,'xdata',[y(s,3);sin(y(s,1))+y(s,3)],'ydata',[-0.3;-0.3+cos(y(s,1))]);
            drawnow;
        end      
        
        case 4
%             A=[           0                   1 0             0;...
%     (M+m)*m*g*l/((M+m)*I+M*m*l^2) 0 0 m*l*b/((M+m)*I+M*m*l^2);...
%               0                   0 0             1;...
%      -m^2*l^2*g/((M+m)*I+M*m*l^2) 0 0 -(I+m*l^2)*b/((M+m)*I+M*m*l^2)];
%             B=[0;-m*l/(((M+m)*I+M*m*l^2));0;(I+m*l^2)/((M+m)*I+M*m*l^2)];
%             C=[0 0 1 0;1 0 0 0];
%             p=[-10,-7,-1.901,-1.9];
%             Kysw=place(A,B,p);
            [x,y]=sim('pedulumpid.mdl');
            axes(handles.axes1);
            plot(t,y(:,1));
            axes(handles.axes2);
            plot(t,y(:,3));
            axes(handles.axes3);
            plot([-0.3;0.3],[-0.8;-0.8],'color','k','linestyle','-','linewidth',2);
            axis([-0.3 0.3 -1.2 1.2]);
            car1=line([-0.06;0.06],[-0.5;-0.5],'color','k','linestyle','-','erasemode','xor','linewidth',25);
            car21=line(-0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
            car22=line( 0.06,-0.72,'color','k','linestyle','.','erasemode','xor','markersize',40);
            pendulum1=line([0;0],[-0.3;0.6],'color','r','linestyle','-','erasemode','xor','linewidth',10);
            pendulum2=line(0,-0.27,'color','g','linestyle','.','erasemode','xor','markersize',30);
            for s=1:length(t)
                set(car21,'xdata',-0.06+y(s,3),'ydata',-0.72);
                set(car22,'xdata', 0.06+y(s,3),'ydata',-0.72);
                set(car1,'xdata',[-0.06+y(s,3);0.06+y(s,3)],'ydata',[-0.5;-0.5]);
                set(pendulum2,'xdata',y(s,3),'ydata',-0.27);
                set(pendulum1,'xdata',[y(s,3);sin(y(s,1))+y(s,3)],'ydata',[-0.3;-0.3+cos(y(s,1))]);
                drawnow;
            end      
end




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
