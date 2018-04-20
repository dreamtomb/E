function varargout = faceCore(varargin)
% FACECORE M-file for faceCore.fig
%      FACECORE, by itself, creates a new FACECORE or raises the existing
%      singleton*.
%
%      H = FACECORE returns the handle to a new FACECORE or the handle to
%      the existing singleton*.
%
%      FACECORE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACECORE.M with the given input arguments.
%
%      FACECORE('Property','Value',...) creates a new FACECORE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before faceCore_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to faceCore_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help faceCore

% Last Modified by GUIDE v2.5 28-May-2009 10:21:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @faceCore_OpeningFcn, ...
                   'gui_OutputFcn',  @faceCore_OutputFcn, ...
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


% --- Executes just before faceCore is made visible.
function faceCore_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to faceCore (see VARARGIN)

% Choose default command line output for faceCore
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes faceCore wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = faceCore_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TrainDatabasePath ;
TrainDatabasePath = uigetdir(strcat(matlabroot,'\TrainDatabasePath'), '—µ¡∑ø‚¬∑æ∂—°‘Ò...' );

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TestDatabasePath;
TestDatabasePath = uigetdir(strcat(matlabroot,'\TrainDatabasePath'), '≤‚ ‘ø‚¬∑æ∂—°‘Ò...');

% --- Executes on button press in pushbutton3.
%function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[filename,pathname]=uigetfile({'*.jpg';'*.bmp'},'');
%str=[pathname  filename];
%im=imread(str);
%axes(handles.axes1);
%imshow(im);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global TrainDatabasePath ;
global TestDatabasePath;
global T;
T = CreateDatabase(TrainDatabasePath);
%[m V_PCA V_Fisher ProjectedImages_Fisher] = FisherfaceCore(T);

% --- Executes on button press in pushbutton5.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
[filename,pathname]=uigetfile({'*.jpg';'*.bmp'},'—°‘Ò≤‚ ‘Õº∆¨...');
str=[pathname  filename];
im=imread(str);
axes(handles.axes1);
imshow(im);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%T = CreateDatabase(TrainDatabasePath);
global T;
global im;
global TrainDatabasePath ;
[m V_PCA V_Fisher ProjectedImages_Fisher] = FisherfaceCore(T);
OutputName = Recognition(im, m, V_PCA, V_Fisher, ProjectedImages_Fisher);
SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);
axes(handles.axes2);
imshow(SelectedImage);
%title('Equivalent Image');
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
clc
close(gcf);





