function varargout = TerrainGenerator(varargin)
% TERRAINGENERATOR MATLAB code for TerrainGenerator.fig
%      TERRAINGENERATOR, by itself, creates a new TERRAINGENERATOR or raises the existing
%      singleton*.
%
%      H = TERRAINGENERATOR returns the handle to a new TERRAINGENERATOR or the handle to
%      the existing singleton*.
%
%      TERRAINGENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TERRAINGENERATOR.M with the given input arguments.
%
%      TERRAINGENERATOR('Property','Value',...) creates a new TERRAINGENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TerrainGenerator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TerrainGenerator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TerrainGenerator

% Last Modified by GUIDE v2.5 19-Mar-2014 13:54:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TerrainGenerator_OpeningFcn, ...
                   'gui_OutputFcn',  @TerrainGenerator_OutputFcn, ...
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


% --- Executes just before TerrainGenerator is made visible.
function TerrainGenerator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TerrainGenerator (see VARARGIN)

NewdataO(1:100, 1:100)=1;

% Choose default command line output for TerrainGenerator
handles.NewdataO = NewdataO;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TerrainGenerator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TerrainGenerator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

val = get(hObject, 'Value');

switch val
    case 2
        load('Sample1.mat');
    case 3
        load('Sample2.mat');
    case 4
        load('Sample3.mat');
    case 5
        load('Sample4.mat');
    case 6
        load('Sample5.mat');
    case 7
        load('Sample6.mat');
    case 8
        load('Sample7.mat');
    case 9
        load('Sample8.mat');
    case 10
        load('Sample9.mat');
    case 11
        load('Sample10.mat');
    otherwise
        demdata(1:100, 1:100) = 1;
end

%Calling Terrain Genaration function
NewdataO = TerrainGen(demdata);

for i = 1:100
    minarr(i) = min(NewdataO(i, :));
end
low = min(minarr);

NewdataO = NewdataO - low;

low = 0;

for i = 1:100
    maxarr(i) = max(NewdataO(i, :));
end
high = max(maxarr);

%displaying 3D Surface plot
surf(handles.axes3, NewdataO);
axis(handles.axes3, [1 100 1 100 0 2.5]);

%displaying 2D Surface plot
contour(handles.axes2, NewdataO, 20);
axis(handles.axes2, [1 100 1 100]);

save ('NewdataO.mat' , 'NewdataO');

% Choose default command line output for TerrainGenerator
handles.NewdataO = NewdataO;
handles.low = low;
handles.high = high;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonSmo.
function buttonSmo_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSmo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Calling Terrain Smoothing function
NewdataS = TerrainSmo(handles.NewdataO);

NewdataS = NewdataS - mod(NewdataS, 0.01);

%displaying 3D Surface plot
surf(handles.axes3, NewdataS);
axis(handles.axes3, [1 100 1 100 0 2.5]);

%displaying 2D Surface plot
%contour(handles.axes2, NewdataS, 20);
%axis(handles.axes2, [1 100 1 100]);

save ('NewdataS.mat' , 'NewdataS');

% Choose default command line output for TerrainGenerator
handles.NewdataS = NewdataS;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonOrg.
function buttonOrg_Callback(hObject, eventdata, handles)
% hObject    handle to buttonOrg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Org(1, 1) = 0;
Org(1, 2) = 0;
Org = GetOrigin();

axes(handles.axes2); % Select the proper axes
hold on;
plot(Org(1, 1), Org(1, 2), 'ro');
hold off;

set(handles.labelO, 'String', {int2str(Org(1, 1)) , int2str(Org(1, 2))});

% Choose default command line output for TerrainGenerator
handles.Org = Org;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonTrg.
function buttonTrg_Callback(hObject, eventdata, handles)
% hObject    handle to buttonTrg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Trg(1, 1) = 100;
Trg(1, 2) = 100;
Trg = GetTarget();
 
axes(handles.axes2); % Select the proper axes
hold on;
plot(Trg(1, 1), Trg(1, 2), 'r*');
hold off;

set(handles.labelT, 'String', {int2str(Trg(1, 1)) , int2str(Trg(1, 2))});

% Choose default command line output for TerrainGenerator
handles.Trg = Trg;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonPPlan.
function buttonPPlan_Callback(hObject, eventdata, handles)
% hObject    handle to buttonPPlan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Path = PathPlanning( handles.Org,handles.Trg );

axes(handles.axes2); % Select the proper axes
hold on;
plot(Path(:, 1), Path(:, 2), 'k+');
hold off;

save ('Path.mat' , 'Path');

% Choose default command line output for TerrainGenerator
handles.Path = Path;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonGenKDataO.
function buttonGenKDataO_Callback(hObject, eventdata, handles)
% hObject    handle to buttonGenKDataO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MdataO = MotionPlanningO( handles.NewdataO,handles.Path );

KdataO = InvKinematics( MdataO(:,1),MdataO(:,2),3,2 );

MKdataO = [ MdataO(:,1) MdataO(:,2) KdataO(:,1) KdataO(:,2) ];

save ('MKdataO.mat' , 'MKdataO');

% Choose default command line output for TerrainGenerator
handles.MKdataO = MKdataO;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonGenKDataS.
function buttonGenKDataS_Callback(hObject, eventdata, handles)
% hObject    handle to buttonGenKDataS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MdataS = MotionPlanningS( handles.NewdataO,handles.NewdataS,handles.Path );

KdataS = InvKinematics( MdataS(:,1),MdataS(:,2),3,2 );

MKdataS = [ MdataS(:,1) MdataS(:,2) KdataS(:,1) KdataS(:,2) ];

save ('MKdataS.mat' , 'MKdataS');

% Choose default command line output for TerrainGenerator
handles.MKdataS = MKdataS;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonActMuscMem.
function buttonActMuscMem_Callback(hObject, eventdata, handles)
% hObject    handle to buttonActMuscMem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MuscMem = ActMuscMemory( handles.MKdataS );

save ('MuscMem.mat' , 'MuscMem');

% Choose default command line output for TerrainGenerator
handles.MuscMem = MuscMem;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in buttonTstMuscMem.
function buttonTstMuscMem_Callback(hObject, eventdata, handles)
% hObject    handle to buttonTstMuscMem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

MuscMemN = TstMuscMemory( handles.MuscMem,handles.NewdataO,handles.NewdataS,handles.Path );

save ('MuscMemN.mat' , 'MuscMemN');

% Choose default command line output for TerrainGenerator
handles.MuscMemN = MuscMemN;

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbuttonGenSig.
function pushbuttonGenSig_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGenSig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SignalGen( handles.MKdataO,handles.MKdataS );


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
