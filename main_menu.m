function varargout = main_menu(varargin)
% MAIN_MENU MATLAB code for main_menu.fig
%      MAIN_MENU, by itself, creates a new MAIN_MENU or raises the existing
%      singleton*.
%
%      H = MAIN_MENU returns the handle to a new MAIN_MENU or the handle to
%      the existing singleton*.
%
%      MAIN_MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_MENU.M with the given input arguments.
%
%      MAIN_MENU('Property','Value',...) creates a new MAIN_MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_menu

% Last Modified by GUIDE v2.5 20-Oct-2019 15:32:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_menu_OpeningFcn, ...
                   'gui_OutputFcn',  @main_menu_OutputFcn, ...
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


% --- Executes just before main_menu is made visible.
function main_menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_menu (see VARARGIN)





% Choose default command line output for main_menu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_gambar.
function btn_gambar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_gambar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%browse gambar khusus format .bmp, .jpg, .tif
[file_name,file_path] = uigetfile( ...
    {'*.bmp;*.jpg;*.tif','Files of type (*.bmp,*.jpg,*.tif)';
    '*.bmp','File Bitmap (*.bmp)';...
    '*.jpg','File jpeg (*.jpg)';
    '*.tif','File Tif (*.tif)';
    '*.*','All Files (*.*)'},...
    'Open Image');

%jika file terpilih
if ~isequal(file_name,0)
    %membaca gambar dan menyimpan dalam variabel handles.gambar_mobil
    handles.gambar_mobil = imread(fullfile(file_path,file_name));
    %menyimpan ke dalam variabel mobil_rgb
    mobil_rgb = handles.gambar_mobil;
    %menyimpan data UI dalam function guidata() milik matlab
    guidata(hObject,handles);
    %menampilkan image ke dalam axes dengan label img_rgb 
    axes(handles.img_rgb);
    imshow(mobil_rgb);
    
    %convert ke grayscale
    mobil_grayscale = convert_grayscale(mobil_rgb);
    %menampilkan image ke dalam axes dengan label img_grayscale
    axes(handles.img_grayscale);
    
    imshow(mobil_grayscale);
    %mendeteksi edge dengan metode canny
    mobil_edge =konvolusi(mobil_grayscale);
    %menampilkan image ke dalam axes dengan label img_grayscale
    axes(handles.img_edge);
    imshow(mobil_edge);
    splitImage = split(mobil_edge);
    
    if exist('sampleT.mat', 'file') && exist('sampleF.mat', 'file')
        load('sampleT.mat');
        load('sampleF.mat');
    else
        set(handles.txt_kesimpulan, 'String', 'Lakukan training dahulu!');
    end
    
    %checkif train data valid
    if exist('fTotalF','var') && exist('fTotalT','var')
      
        
       mseXeniaTotal = zeros;
       mseAvanzaTotal = zeros;
       xenia = 0; %tiren
       avanza = 0; %segar
       %per- split image test
       for i =1: 2
           for j =1 : 2
                curGray = splitImage{i, j}; 
                dataVector=curGray(:);
                [~,fr] = TDistribusiFrekuensi(dataVector,6);
                mseXenia = MeanSquareE(fTotalF, fr);
                mseAvanza = MeanSquareE(fTotalT, fr);
                
                %save result for table
                if i==1 && j==1
                    mseXeniaTotal = mseXenia;
                    mseAvanzaTotal = mseAvanza;
                else
                    mseXeniaTotal = [mseXeniaTotal;mseXenia];
                    mseAvanzaTotal = [mseAvanzaTotal;mseAvanza];
                end
                
                %decide each image
                if mseAvanza>mseXenia
                   kesimpulan = 'Xenia';
                   xenia = xenia +1;
                else
                    kesimpulan = 'Avanza';
                    avanza = avanza+1;
                end


           end
       end
       
       %end
       
       %estimating
       %formatting data into table
       format shortG;

       if xenia>avanza
           set(handles.txt_kesimpulan, 'String', 'Avanza');
       elseif avanza>xenia
           set(handles.txt_kesimpulan, 'String', 'Xenia');
       else
           %sama
            if sum(mseAvanzaTotal)>sum(mseXeniaTotal)
               set(handles.txt_kesimpulan, 'String', 'Avanza');
            else
               set(handles.txt_kesimpulan, 'String', 'Xenia');
            end
       end
       
    else
        set(handles.txt_kesimpulan, 'String', 'Lakukan training dahulu!');
    end
    
else
    return;
end


% --- Executes on button press in btn_avanza.
function btn_avanza_Callback(hObject, eventdata, handles)
% hObject    handle to btn_avanza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir('','Pilih Folder mobil avanza');
if ~isequal(folder_name,0)
    samplingT(folder_name);
    f = msgbox('Training gambar mobil avanza selesai!');
else
    return;
end


% --- Executes on button press in btn_innova.
function btn_xenia_Callback(hObject, eventdata, handles)
% hObject    handle to btn_innova (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir('','Pilih Folder Gambar mobil xenia');
if ~isequal(folder_name,0)
    samplingF(folder_name);
    f = msgbox('Training gambar mobil xenia selesai!');
else
    return;
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
