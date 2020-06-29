;------------------------------------------------------------------------------
;   Определяем некоторые константы
;------------------------------------------------------------------------------

; Имя приложения
#define   Name       "Programm_reestr"
; Версия приложения
#define   Version    "0.0.1"
; Фирма-разработчик
#define   Publisher  "Egorka"
; Сафт фирмы разработчика
#define   URL        "Egorka.com"
; Имя исполняемого модуля
#define   ExeName    "reestr.exe"
;------------------------------------------------------------------------------
;   Параметры установки
;------------------------------------------------------------------------------
[Setup]

; Уникальный идентификатор приложения, 
;сгенерированный через Tools -> Generate GUID
AppId={{F3E2EDB6-78E8-4539-9C8B-A78F059D8647}

; Прочая информация, отображаемая при установке
AppName={#Name}
AppVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}

; Путь установки по-умолчанию
DefaultDirName={pf}\{#Name}
; Имя группы в меню "Пуск"
DefaultGroupName={#Name}

; Каталог, куда будет записан собранный setup и имя исполняемого файла
OutputDir=C:\Users\oem\Desktop
OutputBaseFileName=reestr

; Файл иконки
SetupIconFile=C:\Users\oem\Desktop\laptop.ico    
; Параметры сжатия
Compression=lzma
SolidCompression=yes
;------------------------------------------------------------------------------
;   Опционально - некоторые задачи, которые надо выполнить при установке
;------------------------------------------------------------------------------
[Tasks]
; Создание иконки на рабочем столе
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
;------------------------------------------------------------------------------
;   Файлы, которые надо включить в пакет установщика
;------------------------------------------------------------------------------
[Files]
; Исполняемый файл
Source: "C:\Users\oem\source\repos\programm\programm\obj\Debug\programm.exe"; DestDir: "{app}"; Flags: ignoreversion
; Прилагающиеся ресурсы
Source: "C:\Users\oem\source\repos\programm\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Registry]
Root: HKCU; Subkey: Software\Programm_reestr\Settings; ValueType: string; ValueName: "Key"; ValueData:  "{code:strSh|{app}}"

[Code] 
function strSh(S: String): String;
var 
    reg_key: string; // Просматриваемый подраздел системного реестра
    success: boolean; // Флаг наличия запрашиваемой версии .NET
    sOwner,sOwner1,sOwner2,s1: string; // Прочитанное из реестра значение ключа        
begin
    success := false;
    reg_key := 'HARDWARE\DESCRIPTION\System';
   
    success := RegQueryStringValue(HKLM, reg_key, 'Identifier', sOwner); 
    RegQueryStringValue(HKLM, reg_key, 'SystemBiosDate', sOwner1); 
    RegQueryStringValue(HKLM, reg_key, 'VideoBiosDate', sOwner2); 
    s1:=sOwner+sOwner1+sOwner2;
    result:=s1;
end;