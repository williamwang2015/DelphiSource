object Form1: TForm1
  Left = 288
  Top = 216
  Caption = 'Form1'
  ClientHeight = 331
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 280
    Top = 8
    Width = 75
    Height = 25
    Caption = #20889#20837#25968#25454
    TabOrder = 0
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 209
    Height = 137
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 36
      Height = 13
      Caption = #22995#21517#65306
    end
    object Label2: TLabel
      Left = 16
      Top = 72
      Width = 36
      Height = 13
      Caption = #24180#40836#65306
    end
    object edtName: TEdit
      Left = 66
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtAge: TEdit
      Left = 66
      Top = 69
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 152
    Width = 401
    Height = 177
    TabOrder = 2
  end
  object Button2: TButton
    Left = 280
    Top = 67
    Width = 75
    Height = 25
    Caption = #35835#25968#25454
    TabOrder = 3
    OnClick = Button2Click
  end
end
