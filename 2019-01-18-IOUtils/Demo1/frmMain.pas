unit frmMain;

interface

uses
  System.Types, System.IOUtils, Winapi.Windows, Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure ListFiless(FilePath: string);
    procedure ListDirs(DirName: string);

    { Private declarations }
  public
    { Public declarations }
    // �ݹ���ʾ:�����ۼ�
    procedure ProRecursion(i: Integer);

    function FunRecursion(i: Integer): Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('���÷���' + FunRecursion(0).ToString);
end;

procedure TForm1.Button2Click(Sender: TObject);

begin
  // ��ȡ��ǰĿ¼�����е��ļ�
  ListFiless(Edit1.Text);
  // ��ȡ��ǰĿ¼�����е��ļ���
  ListDirs(Edit1.Text);

end;

// �ݹ���ʾ(����):�����ۼ�
function TForm1.FunRecursion(i: Integer): Integer;
begin
  ShowMessage('�����ڲ���' + i.ToString);
  i := i + 1;
  if (i < 10) then begin
    Result := FunRecursion(i);
  end
  else begin
    Result := i;
  end;

end;

procedure TForm1.ListDirs(DirName: string);
var
  DirList: TStringDynArray;
  Name: string;
begin
  // ��ȡĳ��·���µ������ļ���
  DirList := TDirectory.GetDirectories(DirName);
  // ��������ȡÿһ���ļ���(·��)
  for Name in DirList do begin
    // ����ȡ����·�����봰��
    Self.Memo1.Lines.Add(Name);
    // ��ȡ���·���������ļ�
    ListFiless(Name);
    // �ݹ�,������ȡ��ǰ(Name)Ŀ¼�µ��ļ���
    ListDirs(Name);
  end;
end;

procedure TForm1.ListFiless(FilePath: string);
var
  FileList: TStringDynArray;
  FileName: string;
begin
  // ��ȡ��ǰ·���µ������ļ�
  FileList := TDirectory.GetFiles(FilePath);
  //�������飬��ȡ�ļ���Ϣ
  for FileName in FileList do begin
    Self.Memo1.Lines.Add(FileName);
  end;
end;

// �ݹ���ʾ:�����ۼ� ,�ݹ鷽��һ��Ҫ�г���
procedure TForm1.ProRecursion(i: Integer);
begin
  ShowMessage(i.ToString);
  i := i + 1;
  if (i < 10) then begin
    ProRecursion(i);
  end;
end;

end.