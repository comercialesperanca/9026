object frmMensagens: TfrmMensagens
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmMensagens'
  ClientHeight = 245
  ClientWidth = 233
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 8
    Top = 5
    Width = 71
    Height = 22
    Caption = 'T'#205'TULO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object btOK: TButton
    Left = 8
    Top = 195
    Width = 217
    Height = 42
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btOKClick
  end
  object memMenssagem: TcxMemo
    Left = 8
    Top = 48
    Lines.Strings = (
      'memMenssagem')
    ParentFont = False
    Properties.ScrollBars = ssVertical
    Style.Color = clBlack
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWhite
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Height = 137
    Width = 217
  end
end
