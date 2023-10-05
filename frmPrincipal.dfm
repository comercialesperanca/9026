object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = '.'
  ClientHeight = 228
  ClientWidth = 221
  Color = clBtnFace
  Constraints.MinHeight = 266
  Constraints.MinWidth = 237
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
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 18
    Height = 13
    Caption = 'OS:'
  end
  object Label2: TLabel
    Left = 32
    Top = 0
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 18
    Height = 13
    Caption = 'OS:'
  end
  object Label8: TLabel
    Left = 32
    Top = 8
    Width = 6
    Height = 13
    Caption = '0'
  end
  object pcTelaPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 221
    Height = 228
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tab_ListadeOcorrencias
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 224
    ClientRectLeft = 4
    ClientRectRight = 217
    ClientRectTop = 24
    object tab_ListadeOcorrencias: TcxTabSheet
      Caption = 'Ocorr'#234'ncias'
      ImageIndex = 0
      object grdOcorrencias: TcxGrid
        Left = 0
        Top = 33
        Width = 213
        Height = 167
        Align = alClient
        TabOrder = 0
        object grdOcorrenciasDBTableView1: TcxGridDBTableView
          OnDblClick = grdOcorrenciasDBTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DMDB.dsOcorrencias
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          object clData: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'datainclusao'
          end
          object clRua: TcxGridDBColumn
            Caption = 'Rua'
            DataBinding.FieldName = 'rua'
            Width = 32
          end
          object clQuemLancou: TcxGridDBColumn
            Caption = 'Quem lan'#231'ou'
            DataBinding.FieldName = 'nome'
            Width = 169
          end
          object clNumOS: TcxGridDBColumn
            Caption = 'Num.OS'
            DataBinding.FieldName = 'numos'
          end
          object clUMA: TcxGridDBColumn
            Caption = 'U.M.A.'
            DataBinding.FieldName = 'codigouma'
          end
          object clDataOnda: TcxGridDBColumn
            Caption = 'Data Onda'
            DataBinding.FieldName = 'dataonda'
          end
          object clNumOnda: TcxGridDBColumn
            Caption = 'Num. Onda'
            DataBinding.FieldName = 'numonda'
          end
          object clNumOrdem: TcxGridDBColumn
            Caption = 'Num. Ordem'
            DataBinding.FieldName = 'numordem'
          end
          object grdOcorrenciasDBTableView1tipoos: TcxGridDBColumn
            Caption = 'Tipo da O.S.'
            DataBinding.FieldName = 'tipoos'
          end
          object grdOcorrenciasDBTableView1desctipoos: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'desctipoos'
          end
        end
        object grdOcorrenciasLevel1: TcxGridLevel
          GridView = grdOcorrenciasDBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 213
        Height = 33
        Align = alTop
        Color = clWhite
        TabOrder = 1
        object btnAtualiza: TcxButton
          Left = 0
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Atualiza'
          TabOrder = 0
          OnClick = btnAtualizaClick
        end
      end
    end
    object tab_FinalizaOcorrencia: TcxTabSheet
      Caption = 'Finaliza ocorr'#234'ncia'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnCabecalho: TPanel
        Left = 0
        Top = 0
        Width = 221
        Height = 89
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object lblnumoslbl: TLabel
          Left = 1
          Top = 8
          Width = 18
          Height = 13
          Caption = 'OS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblnumos: TLabel
          Left = 24
          Top = 8
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblumalbl: TLabel
          Left = 88
          Top = 8
          Width = 38
          Height = 13
          Caption = 'U.M.A.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbluma: TLabel
          Left = 132
          Top = 8
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lbldatalbl: TLabel
          Left = 1
          Top = 27
          Width = 93
          Height = 13
          Caption = 'Data ocorr'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbldata: TLabel
          Left = 98
          Top = 27
          Width = 44
          Height = 13
          Caption = '00/00/00'
        end
        object lblFunclbl: TLabel
          Left = 1
          Top = 46
          Width = 32
          Height = 13
          Caption = 'Func.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfunc: TLabel
          Left = 37
          Top = 46
          Width = 4
          Height = 13
          Caption = '-'
        end
        object lblProblema: TLabel
          Left = 1
          Top = 61
          Width = 220
          Height = 27
          AutoSize = False
          Caption = '-'
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          WordWrap = True
        end
      end
      object pnAutoriza: TPanel
        Left = 0
        Top = 89
        Width = 221
        Height = 73
        Align = alClient
        Color = clWhite
        TabOrder = 1
        object Shape1: TShape
          Left = 19
          Top = 3
          Width = 182
          Height = 36
        end
        object lblDeplbl: TLabel
          Left = 24
          Top = 5
          Width = 25
          Height = 13
          Caption = 'Dep.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDep: TLabel
          Left = 28
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblRualbl: TLabel
          Left = 53
          Top = 5
          Width = 22
          Height = 13
          Caption = 'Rua'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRua: TLabel
          Left = 55
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblPrediolbl: TLabel
          Left = 93
          Top = 5
          Width = 29
          Height = 13
          Caption = 'Pred.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPredio: TLabel
          Left = 98
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblNivellbl: TLabel
          Left = 136
          Top = 5
          Width = 20
          Height = 13
          Caption = 'Niv.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNivel: TLabel
          Left = 136
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblApto: TLabel
          Left = 168
          Top = 24
          Width = 6
          Height = 13
          Caption = '0'
        end
        object lblAptolbl: TLabel
          Left = 168
          Top = 5
          Width = 27
          Height = 13
          Caption = 'Apto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtEndereco: TcxTextEdit
          Left = 1
          Top = 46
          TabOrder = 0
          OnKeyPress = edtEnderecoKeyPress
          OnKeyUp = edtEnderecoKeyUp
          Width = 148
        end
        object btnAutorizar: TcxButton
          Left = 155
          Top = 42
          Width = 57
          Height = 25
          Caption = 'Autorizar'
          TabOrder = 1
          OnClick = actAutorizaLiberacaoExecute
        end
      end
      object pnBotoes: TPanel
        Left = 0
        Top = 162
        Width = 221
        Height = 42
        Align = alBottom
        Color = clWhite
        TabOrder = 2
        object btnCancelar: TcxButton
          Left = 48
          Top = 6
          Width = 127
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object ListadeAcoes: TActionList
    Left = 80
    Top = 72
    object actAutorizaLiberacao: TAction
      Caption = 'actAutorizaLiberacao'
      OnExecute = actAutorizaLiberacaoExecute
    end
  end
end
