unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //结构体
  TPerson = record
    //必须是一个指定长度的字符串
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
  //读取文本文档的类型
  DataSourceFile: TextFile;
begin
  try
    //将磁盘上的文件跟我们的变量进行关联
    AssignFile(DataSourceFile, SOURCE_FILE);
    //打开文件
    Rewrite(DataSourceFile);

    //向文档中写入数据
    Writeln(DataSourceFile, 'HelloWorld');
  finally
    //关闭文件:1、把内存中数据写入到磁盘！2、释放资源
    CloseFile(DataSourceFile);
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  //读取文本文档的类型
  DataSourceFile: TextFile;
var
  Content: string;
begin
  try
     //将磁盘上的文件跟我们的变量进行关联
    AssignFile(DataSourceFile, SOURCE_FILE);
    //以读的方式打开文件
    Reset(DataSourceFile);

    //读取文本数据
    Readln(DataSourceFile, Content);

    Form1.Caption := Form1.Caption + '，' + Content;
  finally
    //关闭文件:1、把内存中数据写入到磁盘！2、释放资源
    CloseFile(DataSourceFile);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Person: TPerson;
var
  PersonFile: file of TPerson;
begin
  try
    //关联文件和变量
    AssignFile(PersonFile, SOURCE_FILE);
    //以写的方式打开文件
    Rewrite(PersonFile);
    //构造结构体的数据
    Person.Name := '萧蔷';
    Person.Age := 30;

    //将结构体的数据写入文件
    Write(PersonFile, Person);
    //
    ShowMessage('记录数：' + IntToStr(FileSize(PersonFile)) + '，当前的文件指针位置：' + IntToStr(FilePos(PersonFile)));
    //构造结构体的数据
    Person.Name := '林志玲';
    Person.Age := 30;

    //将结构体的数据写入文件
    Write(PersonFile, Person);
    ShowMessage('记录数：' + IntToStr(FileSize(PersonFile)) + '，当前的文件指针位置：' + IntToStr(FilePos(PersonFile)));
  finally
    CloseFile(PersonFile);
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Person: TPerson;
var
  PersonFile: file of TPerson;
begin
  try
    //关联文件和变量
    AssignFile(PersonFile, SOURCE_FILE);
    //以写的方式打开文件
    Reset(PersonFile);
    //改变文件指针位置，文件指针的索引是从0开始
    Seek(PersonFile, 1);
    //将结构体的数据写入文件
    read(PersonFile, Person);
    Memo1.Clear;
    Memo1.Lines.Add(Person.Name);
    Memo1.Lines.Add(Person.Age.ToString);
  finally
    CloseFile(PersonFile);
  end;

end;

end.

