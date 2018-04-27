unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids, ComCtrls,
  Buttons;

type
  TForm_Search = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOTable1ID: TIntegerField;
    ADOTable1Organ: TWideMemoField;
    ADOTable1Phone: TWideStringField;
    ADOTable1Fax: TWideStringField;
    ADOTable1Name: TWideStringField;
    ADOTable1Doljnost: TWideStringField;
    ADOTable1Email: TWideStringField;
    ADOTable1Site: TWideStringField;
    DBMemo1: TDBMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Search: TForm_Search;

implementation

{$R *.dfm}

procedure TForm_Search.Edit1Change(Sender: TObject);
{ ����� ������ }
var s: string; k1,k2: integer;
begin
  try // ��������� ������ �� �����
    k1:=0; adotable1.Filtered:=false; // ���������� ����������
    s:=''; k1:=adotable1.RecordCount; // ������ ���������� �������
     { ������� ������ �������� ������ }
    if trim(edit1.Text)<>'' then s:=s+' and (organ like '''+trim(edit1.Text)+'%'')';
    if trim(edit2.Text)<>'' then s:=s+' and (name  like '''+trim(edit2.Text)+'%'')';
    if trim(edit3.Text)<>'' then s:=s+' and (phone like '''+trim(edit3.Text)+'%'')';
    if trim(edit4.Text)<>'' then s:=s+' and (fax   like '''+trim(edit4.Text)+'%'')';
    delete(s,1,5); adotable1.Filter:=s;
     { ------------------------------ }
    adotable1.Filtered:=true; // ������������ ������
    k2:=adotable1.RecordCount; // ������ ���������� ������� � �������
  except // ����������� ������ � ������ ������
    adotable1.Filtered:=false; beep; k2:=k1; // ����� �������, ������ ����
    // ������ ������������ ��������� �� ������
    messagedlg('������ ������ ������! ������ �� �������.',mtError, [mbOK],0);
  end;
  { ��������� ������, ������ 0 � 1 }
  StatusBar1.Panels[0].Text:='����� �������: '+inttostr(k1);
  StatusBar1.Panels[1].Text:='�������� �������: '+inttostr(k2);
end;

procedure TForm_Search.Timer1Timer(Sender: TObject);
{ ��������� ������, ������ 2 � 3 }
var s: string; i: integer;
begin
  try
     i:=ADOTable1.recno; // ��������� ����� ������� ������
     if i>0 then s:='������� ������: '+inttostr(i) else abort;
     StatusBar1.Panels[2].Text:=s;
  except
    StatusBar1.Panels[2].Text:='������ �� ������������';
  end;
  try
    // ������ � ��������� ������ ���� � �����
    StatusBar1.Panels[3].Text:=datetimetostr(now);
  except
    StatusBar1.Panels[3].Text:='';
  end;
end;

procedure TForm_Search.BitBtn1Click(Sender: TObject);
{ �������� ���� }
begin
  close;
end;

end.
