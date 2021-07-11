object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exerc'#237'cio - M'#233'dio 2 - Rafael R.'
  ClientHeight = 315
  ClientWidth = 412
  Color = 14143423
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 85
    Top = 95
    Width = 156
    Height = 14
    Caption = 'Informe o valor do troco:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 56
    Top = 128
    Width = 305
    Height = 10
    Shape = bsBottomLine
  end
  object Button1: TButton
    Left = 169
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Exibir troco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object edt_vrTroco: TEdit
    Left = 247
    Top = 92
    Width = 73
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = 'ex: 125,15'
    OnExit = edt_vrTrocoExit
  end
end
