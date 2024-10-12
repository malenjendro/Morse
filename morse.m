function varargout = morse(varargin)
% MORSE MATLAB code for morse.fig
%      MORSE, by itself, creates a new MORSE or raises the existing
%      singleton*.
%
%      H = MORSE returns the handle to a new MORSE or the handle to
%      the existing singleton*.
%
%      MORSE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MORSE.M with the given input arguments.
%
%      MORSE('Property','Value',...) creates a new MORSE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before morse_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to morse_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help morse

% Last Modified by GUIDE v2.5 14-Jul-2021 20:45:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @morse_OpeningFcn, ...
                   'gui_OutputFcn',  @morse_OutputFcn, ...
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


% --- Executes just before morse is made visible.
function morse_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to morse (see VARARGIN)
% Choose default command line output for morse
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes morse wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = morse_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function texto_Callback(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of texto as text
%        str2double(get(hObject,'String')) returns contents of texto as a double
% importa=get(handles.importar,'Value')% para usar la opción
% if 


% --- Executes during object creation, after setting all properties.
function texto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to texto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonTransf.
function botonTransf_Callback(hObject, eventdata, handles)

tex = get(handles.texto,'String');
tex = upper(tex); %todo en mayusculas para funcion diccionario
k = numel(tex); %consigue el número de caracteres en el texto
Morse = join(diccionario(tex,k)); %cambio a código morse y une la matriz tipo string
set(handles.codigo,'String',Morse); %Set static text
Morse = convertStringsToChars(Morse); %cambio a char para poder asignar cada signo a otro arreglo más grande
p = numel(Morse);% tamaño del nuevo arreglo
op = get(handles.popupmenu1,'Value');%obtiene datos del popupmenu de tono

 if(op==1)
    f=600; %tono grave
    
 elseif (op==2)
    f=1000; %tono agudo 
  
 end
 fs=60*f;  %frecuencia de muestreo
 
z = audiorecorder(44100,16,1);% inicar audio(frecuencia,bits,canal)
record(z);%empieza grabacion
for i = 1:p
    vol= get(handles.volumen,'Value');   %obtiene valor string de volumen
    ve=get(handles.frec,'Value');        %obtiene valor string de velocidad
    if Morse(i)=='.'
     T=0.18;
     t=0:1/8192:T;
     dot=sin(f*t);
     sound(vol*dot,ve*fs)
     pause(0.3); 
     
   elseif Morse(i)=='-'
      T=0.8; 
      t=0:1/8192:T; 
      dash=sin(f*t);
      sound(vol*dash,ve*fs)
      pause(0.3); 
      
   elseif Morse(i)=='/'
   pause(1);    
   elseif Morse(i)==' '
   pause(0.5);
   end
end
pause(1);
stop(z);      %termina grabacion
 
handles.mor = getaudiodata(z,'double');  %obtenido a una matriz del audio audio
%set(handles.codigo,'String',Morse);
guidata(hObject, handles);               %guarda datos de la mtriz en el handles

% hObject    handle to botonTransf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

op=get(handles.popupmenu1,'Value'); %obtiene valor númerico del tono

% handles.op = get(hObject,'Value');
% botonTransf_Callback(handles.botonTransf,eventdata,handles);
% guidata(hObject,handles);
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


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


% --- Executes on slider movement.
function volumen_Callback(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vol=get(handles.volumen,'Value'); %obtiene valor númerico del slider de volumen
set(handles.infovol,'String',vol); %asigna el valor en un static text


% --- Executes during object creation, after setting all properties.
function volumen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in importar.
function importar_Callback(hObject, eventdata, handles)
% hObject    handle to importar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname]=uigetfile('*.txt','Elige el archivo'); %para seleccionar el archivo de texto
cadena=textread(filename,'%s');  %obtiene los caracteres presentes en el archivo txt
cadena=join(cadena);             %une en una sola matriz las cadenas obtenidas
%transformaciones necesarias para usar la funcion diccionario
cadena = convertCharsToStrings(cadena); 
cadena = convertStringsToChars(cadena);
set(handles.texto,'String',cadena); %asigna el texto obtenido al edit text


function importar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor');
end


% --- Executes on button press in descarga.
function descarga_Callback(hObject, eventdata, handles)
% hObject    handle to descarga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sonido=handles.mor;   %llama la matriz almacenada en el handles
Fs=44100;             %frecuencia de muestreo
audiowrite('Codigo.wav',sonido,Fs);%genera el archivo de audio 

% --- Executes on slider movement.
function frec_Callback(hObject, eventdata, handles)
% hObject    handle to frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
ve=get(handles.frec,'Value');         %obtiene valor númerico del slider de velocidad
set(handles.informacion,'String',ve); %asigna valor numerico a static text

% --- Executes during object creation, after setting all properties.
function frec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function codigo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to codigo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
