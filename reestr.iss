;------------------------------------------------------------------------------
;   ���������� ��������� ���������
;------------------------------------------------------------------------------

; ��� ����������
#define   Name       "Programm_reestr"
; ������ ����������
#define   Version    "0.0.1"
; �����-�����������
#define   Publisher  "Egorka"
; ���� ����� ������������
#define   URL        "Egorka.com"
; ��� ������������ ������
#define   ExeName    "reestr.exe"
;------------------------------------------------------------------------------
;   ��������� ���������
;------------------------------------------------------------------------------
[Setup]

; ���������� ������������� ����������, 
;��������������� ����� Tools -> Generate GUID
AppId={{F3E2EDB6-78E8-4539-9C8B-A78F059D8647}

; ������ ����������, ������������ ��� ���������
AppName={#Name}
AppVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#URL}
AppSupportURL={#URL}
AppUpdatesURL={#URL}

; ���� ��������� ��-���������
DefaultDirName={pf}\{#Name}
; ��� ������ � ���� "����"
DefaultGroupName={#Name}

; �������, ���� ����� ������� ��������� setup � ��� ������������ �����
OutputDir=C:\Users\oem\Desktop
OutputBaseFileName=reestr

; ���� ������
SetupIconFile=C:\Users\oem\Desktop\laptop.ico    
; ��������� ������
Compression=lzma
SolidCompression=yes
;------------------------------------------------------------------------------
;   ����������� - ��������� ������, ������� ���� ��������� ��� ���������
;------------------------------------------------------------------------------
[Tasks]
; �������� ������ �� ������� �����
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
;------------------------------------------------------------------------------
;   �����, ������� ���� �������� � ����� �����������
;------------------------------------------------------------------------------
[Files]
; ����������� ����
Source: "C:\Users\oem\source\repos\programm\programm\obj\Debug\programm.exe"; DestDir: "{app}"; Flags: ignoreversion
; ������������� �������
Source: "C:\Users\oem\source\repos\programm\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Registry]
Root: HKCU; Subkey: Software\Programm_reestr\Settings; ValueType: string; ValueName: "Key"; ValueData:  "{code:strSh|{app}}"

[Code] 
function strSh(S: String): String;
var 
    reg_key: string; // ��������������� ��������� ���������� �������
    success: boolean; // ���� ������� ������������� ������ .NET
    sOwner,sOwner1,sOwner2,s1: string; // ����������� �� ������� �������� �����        
begin
    success := false;
    reg_key := 'HARDWARE\DESCRIPTION\System';
   
    success := RegQueryStringValue(HKLM, reg_key, 'Identifier', sOwner); 
    RegQueryStringValue(HKLM, reg_key, 'SystemBiosDate', sOwner1); 
    RegQueryStringValue(HKLM, reg_key, 'VideoBiosDate', sOwner2); 
    s1:=sOwner+sOwner1+sOwner2;
    result:=s1;
end;