function varargout = demo(varargin)

% DEMO MATLAB code for demo.fig
%      DEMO, by itself, creates a new DEMO or raises the existing
%      singleton*.
%
%      H = DEMO returns the handle to a new DEMO or the handle to
%      the existing singleton*.
%
%      DEMO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO.M with the given input arguments.
%
%      DEMO('Property','Value',...) creates a new DEMO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo

% Last Modified by GUIDE v2.5 24-Dec-2017 22:07:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo_OpeningFcn, ...
                   'gui_OutputFcn',  @demo_OutputFcn, ...
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

% --- Executes just before demo is made visible.
function demo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo (see VARARGIN)

global mQueryImagePath mCurrentDescriptor;

% Choose default command line output for demo
handles.output = hObject;
mQueryImagePath = '';
mCurrentDescriptor = 'surf';

set(handles.axes1,'Visible', 'off');
set(handles.axes2,'Visible', 'off');

set(handles.pushbutton2,'Visible', 'off');
set(handles.pushbutton3,'Visible', 'off');
set(handles.pushbutton4,'Visible', 'off');
set(handles.pushbutton4,'Enable', 'off');

set(handles.text2,'Visible', 'off');

set(handles.uibuttongroup1,'Visible', 'off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo_OutputFcn(hObject, eventdata, handles) 
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
    global mQueryImagePath mQueryROI;
    mQueryROI = [];
    cla(handles.axes2,'reset');
    set(handles.axes2,'Visible', 'off');

    filespec = {'*.jpg;*.png;*.jpeg','All Image Files'};
    [filename, pathname] = uigetfile(filespec, 'Pick an image');
    
    set(handles.pushbutton4,'Enable', 'off');

    if ~isequal(filename,0)
        set(handles.axes1,'Visible', 'on');
        
        set(handles.pushbutton2,'Visible', 'on');
        set(handles.pushbutton3,'Visible', 'on');
        set(handles.pushbutton4,'Visible', 'on');

        set(handles.text2,'Visible', 'on');
        
        set(handles.uibuttongroup1,'Visible', 'on');
         
        mQueryImagePath = fullfile(pathname, filename);
        set(handles.text2, 'String', mQueryImagePath);
        
        imageData = imread(mQueryImagePath);

        imshow(imageData, 'Parent', handles.axes1);
        
    else
        cla(handles.axes1,'reset');
        set(handles.axes1,'Visible', 'off');
        
        set(handles.pushbutton2,'Visible', 'off');
        set(handles.pushbutton3,'Visible', 'off');
        set(handles.pushbutton4,'Visible', 'off');
        
        set(handles.text2,'Visible', 'off');
        
        set(handles.uibuttongroup1,'Visible', 'off');
    end
    

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global mQueryImagePath mQueryROI mCurrentDescriptor;

    set(handles.axes2,'Visible', 'off');
    set(get(handles.axes2,'children'),'visible','off') %hide the current axes contents
    drawnow

    queryImg = imread(mQueryImagePath);
    resultPaths = retrieval(mCurrentDescriptor, queryImg, mQueryROI, 20);
    img = mergeImagesResult(resultPaths);

    set(handles.axes2,'Visible', 'on');
    imshow(img, 'Parent', handles.axes2);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global mQueryImagePath mQueryROI;

    imageData = imread(mQueryImagePath);   

    set(handles.pushbutton4,'Enable', 'on');

    mQueryROI = getrect(handles.axes1);
    imshow(imageData,'Parent',handles.axes1);
    axes(handles.axes1);
    rectangle('Position', mQueryROI, 'EdgeColor', 'y', 'LineWidth', 1);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global mQueryImagePath mQueryROI;
    set(handles.pushbutton4,'Enable', 'off');
    mQueryROI = [];

    imageData = imread(mQueryImagePath);   
    imshow(imageData,'Parent',handles.axes1);

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global mCurrentDescriptor;
    if isequal(eventdata.NewValue.String, 'SURF')
        mCurrentDescriptor = 'surf';
    elseif isequal(eventdata.NewValue.String, 'SURF-HOG')
        mCurrentDescriptor = 'hog-surf';
    end
