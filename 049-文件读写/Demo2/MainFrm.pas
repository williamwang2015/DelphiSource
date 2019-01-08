unit MainFrm;

interface

uses
  System.Generics.Collections, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtName: TEdit;
    Label2: TLabel;
    edtAge: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPerson = record
    Name: string[20];
    Age: Integer;
  end;

var
  Form1: TForm1;

const
  SOURCE_FILE = 'D:\Test\demo1.txt';

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  ReadDateFile, WriteDateFile: file of TPerson;
var
  Person: TPerson;
var
  Persons: TList<TPerson>;
var
  i: Integer;
begin
  Persons := TList<TPerson>.Create;
  //构造数据

  //文件不存在
  if not FileExists(SOURCE_FILE) then begin
    try
      AssignFile(WriteDateFile, SOURCE_FILE);
      Rewrite(WriteDateFile);
      Person.Name := edtName.Text;
      Person.Age := StrToInt(edtAge.Text);
      Write(WriteDateFile, Person);
    finally
      CloseFile(WriteDateFile);
    end;
    exit;
  end;
  try
    //先读
    AssignFile(ReadDateFile, SOURCE_FILE);
    Reset(ReadDateFile);
    //循环读取所有数据
    while not Eof(ReadDateFile) do begin
      Read(ReadDateFile, Person);
      Persons.Add(Person);
    end;
    //在原来数据的基础上添加上我们新的数据
    Person.Name := edtName.Text;
    Person.Age := StrToInt(edtAge.Text);
    Persons.Add(Person);
    //写入
    AssignFile(WriteDateFile, SOURCE_FILE);
    Rewrite(WriteDateFile);
    for i := 0 to (Persons.Count - 1) do begin
      Person := Persons[i];
      Write(WriteDateFile, Person);
    end;

  finally
    CloseFile(ReadDateFile);
    CloseFile(WriteDateFile);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  DataFile: file of TPerson;
var
  Person: TPerson;
begin
  Memo1.Clear;
  try
    AssignFile(DataFile, SOURCE_FILE);

    Reset(DataFile);

    //循环读取
    while not Eof(DataFile) do begin
      Read(DataFile, Person);
      Memo1.Lines.Add('姓名：' + Person.Name + '，年龄：' + IntToStr(Person.Age));
    end;

  finally
    CloseFile(DataFile);
  end;

end;

end.

