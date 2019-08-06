
function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 16-May-2018 20:14:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Open.
function Open_Callback(hObject, eventdata, handles)
% hObject    handle to Open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[Filename,Pathname] = uigetfile('*.jpg','File Selector');
name = strcat('Path:', Pathname, Filename);
a = imread([Pathname, Filename]);
[row,col,clrmap]=size(a);
set(handles.text14, 'string',row);
set(handles.text16, 'string',col);
axes(handles.imgAwal);
imshow(a);
axes(handles.imgHasil);
imshow(a);
set(handles.path, 'string',name);
fileinfo = dir(Filename);
SIZE = fileinfo.bytes;
Size = SIZE/1024;
set(handles.HasilAwal,'string',Size);

% --- Executes on button press in Zoomin.
function Zoomin_Callback(hObject, eventdata, handles)
% hObject    handle to Zoomin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
hasil = zoomIn(a);
% c = uint8(c);
figure ('Name', 'Gambar Awal');
imshow(a);
% axes(handles.imgHasil);
figure ('Name', 'Gambar Hasil');
imshow(hasil);

% --- Executes on button press in Zoomout.
function Zoomout_Callback(hObject, eventdata, handles)
% hObject    handle to Zoomout (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
hasil = zoomOut(a);
figure ('Name','Gambar Zoom Out 2x');
imshow(hasil);

% --- Executes on button press in GS.
function GS_Callback(hObject, eventdata, handles)
% hObject    handle to GS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% pathn = getappdata(0, 'Pathname');
% filen = getappdata(0, 'Filename');
% i = strcat(pathn, filen);
% im = imread(i);
global a;
hasil = gs(a)
axes(handles.imgHasil);
imshow(hasil);

% --- Executes on button press in Inv.
function Inv_Callback(hObject, eventdata, handles)
% hObject    handle to Inv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
y(:,:,:)=255-a(:,:,:);
axes(handles.imgHasil);
imshow(y);


% --- Executes on button press in Crop.
function Crop_Callback(hObject, eventdata, handles)
% hObject    handle to Crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
valx1 = str2num(get(handles.valx,'string'));
valy1 = str2num(get(handles.valy,'string'));
valx2 = str2num(get(handles.valx2,'string'));
valy2 = str2num(get(handles.valy2,'string'));
res(:, :, 1)=a(valx1:valx2, valy1:valy2,1);
res(:, :, 2)=a(valx1:valx2, valy1:valy2,2);
res(:, :, 3)=a(valx1:valx2, valy1:valy2,3);
res = uint8(res);
axes(handles.imgHasil);
imshow(res);

% --- Executes on slider movement.
function Bagi_Callback(hObject, eventdata, handles)
% hObject    handle to Bagi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a;
[row, col, clrmap] = size(a);
val = get(hObject, 'Value');
bg = a;
bg = a/val;
bg = uint8(bg);
axes(handles.imgHasil);
imshow(bg);

% --- Executes on slider movement.
function Kurang_Callback(hObject, eventdata, handles)
% hObject    handle to Kurang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a;
[row, col, clrmap] = size(a);
val = get(hObject, 'Value');
min = a;
min = a-val;
min = uint8(min);
axes(handles.imgHasil);
imshow(min);

% --- Executes on slider movement.
function Tambah_Callback(hObject, eventdata, handles)
% hObject    handle to Tambah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a;
[row, col, clrmap] = size(a);
val = get(hObject, 'Value');
plus = a;
plus = a+val;
plus = uint8(plus);
axes(handles.imgHasil);
imshow(plus);

% --- Executes on slider movement.
function Kali_Callback(hObject, eventdata, handles)
% hObject    handle to Kali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global a;
[row, col, clrmap] = size(a);
val = get(hObject, 'Value');
times = a;
% disp(val);
times = a*val;
times = uint8(times);
axes(handles.imgHasil);
imshow(times);
        

% --- Executes on button press in Horizontal.
function Horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[row, col, clrmap]=size(a);
hor = a;
for i=1 : row
    k = col;
    for j=1 : col
        hor(i,k,:)=a(i,j,:);
        k=k-1;
    end
end
axes(handles.imgHasil);
imshow(hor);

% --- Executes on button press in Vertical.
function Vertical_Callback(hObject, eventdata, handles)
% hObject    handle to Vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[row, col, clrmap]=size(a);
ver = a;
k = row;
for i=1 : row
    for j=1 : col
        ver(k,j,:)=a(i,j,:);
    end
    k=k-1;
end
axes(handles.imgHasil);
imshow(ver);

function valx2_Callback(hObject, eventdata, handles)
% hObject    handle to valx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valx2 as text
%        str2double(get(hObject,'String')) returns contents of valx2 as a double


% --- Executes during object creation, after setting all properties.
function valx2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valx2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function valy2_Callback(hObject, eventdata, handles)
% hObject    handle to valy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valy2 as text
%        str2double(get(hObject,'String')) returns contents of valy2 as a double

% --- Executes during object creation, after setting all properties.
function valy2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valy2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function valx_Callback(hObject, eventdata, handles)
% hObject    handle to valx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valx as text
%        str2double(get(hObject,'String')) returns contents of valx as a double


% --- Executes during object creation, after setting all properties.
function valx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function valy_Callback(hObject, eventdata, handles)
% hObject    handle to valy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valy as text
%        str2double(get(hObject,'String')) returns contents of valy as a double


% --- Executes during object creation, after setting all properties.
function valy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in isi.
function isi_Callback(hObject, eventdata, handles)
% hObject    handle to isi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns isi contents as cell array
%        contents{get(hObject,'Value')} returns selected item from isi


% --- Executes on button press in Rot90.
function Rot90_Callback(hObject, eventdata, handles)
% hObject    handle to Rot90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
x = size(a,1);
    y = zeros(size(a,2),size(a,1),3);
    k = x(1);
    for i = 1:size(a,1)
        for j=1:size(a,2)
            y(j,k,:)=a(i,j,:);
        end
        k=k-1;
    end
y = uint8(y);
axes(handles.imgHasil);
imshow(y);

% --- Executes on button press in Rot180.
function Rot180_Callback(hObject, eventdata, handles)
% hObject    handle to Rot180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
x = size(a,1);
y = zeros(size(a,1),size(a,2),3);
for i = 1:size(a,1)
    k = size(a,2);
    for j=1:size(a,2)
        y(x,k,:)=a(i,j,:);
        k=k-1;
    end
    x=x-1;
end
y = uint8(y);
axes(handles.imgHasil);
imshow(y);

% --- Executes on button press in Rot270.
function Rot270_Callback(hObject, eventdata, handles)
% hObject    handle to Rot270 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
x = size(a,1);
y = zeros(size(a,2),size(a,1),3);
for i = 1:size(a,1)
    k = size(a,2);
    for j=1:size(a,2)
        y(k,i,:)=a(i,j,:);
        k=k-1;
    end
end
y = uint8(y);
axes(handles.imgHasil);
imshow(y);


% --- Executes on button press in histogs.
function histogs_Callback(hObject, eventdata, handles)
% hObject    handle to histogs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
y = gs(a);
x = zeros(1, 256);
for i=1:256
    x(i)=size(y(y==i-1)',2);
end
axes(handles.imgHasil)
bar(x);


% --- Executes on button press in HistoRGB.
function HistoRGB_Callback(hObject, eventdata, handles)
% hObject    handle to HistoRGB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
[r,g,b]=historgb(a);

% --- Executes on button press in ed.
function ed_Callback(hObject, eventdata, handles)
% hObject    handle to ed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
konv = zeros(3,3,3);
konv(:,:,1) =[0 -1 0; -1 4 -1; 0 -1 0];
konv(:,:,2) =[0 -1 0; -1 4 -1; 0 -1 0];
konv(:,:,3) =[0 -1 0; -1 4 -1; 0 -1 0];
hasil = convo(a,konv);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Edge Detection');
imshow(hasil);

% --- Executes on button press in sharp.
function sharp_Callback(hObject, eventdata, handles)
% hObject    handle to sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
konv = zeros(3,3,3);
konv(:,:,1) =[0 -1 0; -1 5 -1; 0 -1 0];
konv(:,:,2) =[0 -1 0; -1 5 -1; 0 -1 0];
konv(:,:,3) =[0 -1 0; -1 5 -1; 0 -1 0];
hasil = convo(a,konv);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Sharp');
imshow(hasil);

% --- Executes on button press in Blur.
function Blur_Callback(hObject, eventdata, handles)
% hObject    handle to Blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
konv = zeros(3,3,3);
konv(:,:,1) =[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
konv(:,:,2) =[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
konv(:,:,3) =[1/9 1/9 1/9; 1/9 1/9 1/9; 1/9 1/9 1/9];
hasil = convo(a,konv);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Blur');
imshow(hasil);



% --- Executes on button press in FilMedian.
function FilMedian_Callback(hObject, eventdata, handles)
% hObject    handle to FilMedian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Asli');
imshow(a);
hasil=med(a);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Median');
imshow(hasil);

% --- Executes on button press in FilMean.
function FilMean_Callback(hObject, eventdata, handles)
% hObject    handle to FilMean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
hasil=rata(a);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Mean');
imshow(hasil);

% --- Executes on button press in FilModus.
function FilModus_Callback(hObject, eventdata, handles)
% hObject    handle to FilModus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
figure ('Name','Gambar Awal');
imshow(a);
hasil = modus(a);
hasil = uint8(hasil);
axes(handles.imgHasil);
imshow(hasil);
figure ('Name','Gambar Modus');
imshow(hasil);

% --- Executes on button press in SeedGrowth.
function SeedGrowth_Callback(hObject, eventdata, handles)
% hObject    handle to SeedGrowth (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
x = str2num(get(handles.seedx,'string'));
y = str2num(get(handles.seedy,'string'));
% J=zeros(size(a));
% for i=1:size(a,1)
%     for j=1:size(a,2)
%         if a(i,j)<=(a(x,y)+3) && a(i,j)>=(a(x,y)-3)
%             J(i,j)=a(i,j)
%         end
%     end
% end
J=seedgrowth(a,x,y,(0.2));
hasil =uint8(J);
axes(handles.imgHasil);
imshow(hasil);

function seedy_Callback(hObject, eventdata, handles)
% hObject    handle to seedy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedy as text
%        str2double(get(hObject,'String')) returns contents of seedy as a double


% --- Executes during object creation, after setting all properties.
function seedy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function seedx_Callback(hObject, eventdata, handles)
% hObject    handle to seedx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of seedx as text
%        str2double(get(hObject,'String')) returns contents of seedx as a double


% --- Executes during object creation, after setting all properties.
function seedx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to seedx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Threshold.
function Threshold_Callback(hObject, eventdata, handles)
% hObject    handle to Threshold (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
% hasil = threshold(a);
% [row, col, clr]=size(a);
x = str2num(get(handles.xtres,'string'));
y = str2num(get(handles.ytres,'string'));
gray = gs(a);
hasil=uint8(zeros(size(a)));
for i = 1:size(a,1)
    for j = 1:size(a,2)
        if ((gray(i,j,1) >= x) && (gray(i,j,1) <= y))
            hasil(i,j,:) = gray(i,j,:);
        end
    end
end
axes(handles.imgHasil);
imshow(hasil);
% t = graythresh(a);
% disp(t);
% tres = im2bw(a,t);
% figure ('Name', 'Gambar Awal');
% imshow(tres);


% --- Executes on button press in Dilasianderosi.
function Dilasianderosi_Callback(hObject, eventdata, handles)
% hObject    handle to Dilasianderosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
hasil = Delasi(a);



function ytres_Callback(hObject, eventdata, handles)
% hObject    handle to ytres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ytres as text
%        str2double(get(hObject,'String')) returns contents of ytres as a double


% --- Executes during object creation, after setting all properties.
function ytres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ytres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xtres_Callback(hObject, eventdata, handles)
% hObject    handle to xtres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xtres as text
%        str2double(get(hObject,'String')) returns contents of xtres as a double


% --- Executes during object creation, after setting all properties.
function xtres_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xtres (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in kompresi.
function kompresi_Callback(hObject, eventdata, handles)
% hObject    handle to kompresi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
% [Filename,Pathname] = uigetfile('*.jpg','File Selector');
% kompres(Filename,2);
[L,Size] = lossless(a);
set(handles.HasilAkhir,'string',Size);
axes(handles.imgHasil);
imshow(L);