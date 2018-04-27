unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, ADODB, ExtCtrls, Grids, DBGrids, ComCtrls,
  Buttons, unit1, Mask;

type
  TForm_Edit = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
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
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    Edit1: TEdit;
    Label9: TLabel;
    Timer2: TTimer;
    Panel1: TPanel;
    Label5: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Edit: TForm_Edit;

implementation

{$R *.dfm}

procedure TForm_Edit.Edit1Change(Sender: TObject);
{ ����� ������ }
begin
  try  // ������ ����� ������ �� ���������� ������� ��� ����� �������� ����
    if ADOTable1.Locate('name',edit1.Text,[loCaseInsensitive,loPartialKey])=false
      then beep; // ������ ���� ���� ����� ��������
  except
    beep; // ������ ���� ���� ���� ������
  end;
end;

procedure TForm_Edit.Timer1Timer(Sender: TObject);
{ ��������� ������, ������ 2 � 3 }
var s: string; i: integer;
begin
  try //������ � ��������� ������ ����� ���������� �������
    StatusBar1.Panels[0].Text:='����� �������: '+inttostr(adotable1.RecordCount);
  except
    StatusBar1.Panels[0].Text:='';
  end;
  try //������ � ��������� ������ ����� ������� ������
    i:=ADOTable1.recno; // ��������� ����� ������� ������
    if i>0 then s:='������� ������: '+inttostr(i) else abort;
    StatusBar1.Panels[1].Text:=s;
  except
    StatusBar1.Panels[1].Text:='������ �� ������������';
  end;
  try // ������ � ��������� ������ ���� � �����
    StatusBar1.Panels[2].Text:=datetimetostr(now);
  except
    StatusBar1.Panels[2].Text:='';
  end;
end;

procedure TForm_Edit.Timer2Timer(Sender: TObject);
{ ����� ��� -) }
const f: boolean=false; // ���������� ��� �������
begin
  if f then label5.Caption:='������ ���������� ��� �������' else
     label5.Caption:='���������� ���������� ������� ������!';
  if f then label5.font.Color:=clOlive else label5.font.Color:=clRed;
  f:=not f; // ������ �������? � ��������� ����������?
end;

procedure TForm_Edit.BitBtn1Click(Sender: TObject);
{ �������� ���� }
begin
  close;
end;

end.
