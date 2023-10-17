object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = '.'
  ClientHeight = 608
  ClientWidth = 579
  Color = clBtnFace
  Constraints.MinHeight = 266
  Constraints.MinWidth = 237
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 25
    Height = 16
    Caption = 'OS:'
  end
  object Label2: TLabel
    Left = 32
    Top = 0
    Width = 8
    Height = 16
    Caption = '0'
  end
  object Label7: TLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 16
    Caption = 'OS:'
  end
  object Label8: TLabel
    Left = 32
    Top = 8
    Width = 8
    Height = 16
    Caption = '0'
  end
  object pcTelaPrincipal: TcxPageControl
    Left = 0
    Top = 0
    Width = 579
    Height = 608
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tab_ListadeOcorrencias
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 605
    ClientRectLeft = 2
    ClientRectRight = 576
    ClientRectTop = 30
    object tab_ListadeOcorrencias: TcxTabSheet
      Caption = 'Ocorr'#234'ncias'
      ImageIndex = 0
      DesignSize = (
        574
        575)
      object grdOcorrencias: TcxGrid
        Left = 0
        Top = 33
        Width = 575
        Height = 498
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object grdOcorrenciasDBTableView1: TcxGridDBTableView
          OnDblClick = grdOcorrenciasDBTableView1DblClick
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DMDB.dsOcorrencias
          DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skCount
              Column = clData
            end
            item
              Format = '0'
              Kind = skSum
              FieldName = 'CALC_SELECIONADO'
              Column = grdOcorrenciasDBTableView1SELECIONADO
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = 'Sem dados para serem exibidos'
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object grdOcorrenciasDBTableView1SELECIONADO: TcxGridDBColumn
            Caption = 'Selecionado'
            DataBinding.FieldName = 'SELECIONADO'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ValueChecked = 'S'
            Properties.ValueUnchecked = 'N'
            Properties.OnChange = grdOcorrenciasDBTableView1SELECIONADOPropertiesChange
            Options.Moving = False
            VisibleForCustomization = False
            Width = 96
          end
          object clData: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'datainclusao'
            Options.Editing = False
          end
          object clQuemLancou: TcxGridDBColumn
            Caption = 'Quem lan'#231'ou'
            DataBinding.FieldName = 'nome'
            Options.Editing = False
            Width = 169
          end
          object clNumOS: TcxGridDBColumn
            Caption = 'Num.OS'
            DataBinding.FieldName = 'numos'
            Options.Editing = False
          end
          object clUMA: TcxGridDBColumn
            Caption = 'U.M.A.'
            DataBinding.FieldName = 'codigouma'
            Options.Editing = False
          end
          object clDataOnda: TcxGridDBColumn
            Caption = 'Data Onda'
            DataBinding.FieldName = 'dataonda'
            Options.Editing = False
          end
          object clNumOnda: TcxGridDBColumn
            Caption = 'Num. Onda'
            DataBinding.FieldName = 'numonda'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1tipoos: TcxGridDBColumn
            Caption = 'Tipo da O.S.'
            DataBinding.FieldName = 'tipoos'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1desctipoos: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'desctipoos'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1USUARIOINCLUSAO: TcxGridDBColumn
            DataBinding.FieldName = 'USUARIOINCLUSAO'
            Visible = False
            Options.Editing = False
            VisibleForCustomization = False
          end
          object grdOcorrenciasDBTableView1CODMOTIVO: TcxGridDBColumn
            Caption = 'C'#243'd. motivo'
            DataBinding.FieldName = 'CODMOTIVO'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1DESCRICAOPROBLEMA: TcxGridDBColumn
            Caption = 'Motivo da pend'#234'ncia'
            DataBinding.FieldName = 'DESCRICAOPROBLEMA'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1CODIGOENDERECO: TcxGridDBColumn
            Caption = 'C'#243'd. Endere'#231'o'
            DataBinding.FieldName = 'CODIGOENDERECO'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1DEPOSITO: TcxGridDBColumn
            Caption = 'Dep'#243'sito'
            DataBinding.FieldName = 'DEPOSITO'
            Options.Editing = False
          end
          object clRua: TcxGridDBColumn
            Caption = 'Rua'
            DataBinding.FieldName = 'rua'
            Options.Editing = False
            Width = 32
          end
          object grdOcorrenciasDBTableView1PREDIO: TcxGridDBColumn
            Caption = 'Pr'#233'dio'
            DataBinding.FieldName = 'PREDIO'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1NIVEL: TcxGridDBColumn
            Caption = 'N'#237'vel'
            DataBinding.FieldName = 'NIVEL'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1APTO: TcxGridDBColumn
            Caption = 'Apto.'
            DataBinding.FieldName = 'APTO'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1CODPROD: TcxGridDBColumn
            Caption = 'C'#243'd. Produto'
            DataBinding.FieldName = 'CODPROD'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1PRODUTO: TcxGridDBColumn
            Caption = 'Produto'
            DataBinding.FieldName = 'PRODUTO'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1REGISTROS_MESMA_OS: TcxGridDBColumn
            Caption = 'Qtd. registros ocorr'#234'ncias nessa OS'
            DataBinding.FieldName = 'REGISTROS_MESMA_OS'
            Options.Editing = False
          end
          object grdOcorrenciasDBTableView1CALC_SELECIONADO: TcxGridDBColumn
            DataBinding.FieldName = 'CALC_SELECIONADO'
            Visible = False
            VisibleForCustomization = False
          end
          object grdOcorrenciasDBTableView1CALC_REINCIDENTE: TcxGridDBColumn
            Caption = 'Reincidente'
            DataBinding.FieldName = 'CALC_REINCIDENTE'
            Width = 144
          end
        end
        object grdOcorrenciasLevel1: TcxGridLevel
          GridView = grdOcorrenciasDBTableView1
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 33
        Align = alTop
        Color = clWhite
        TabOrder = 1
        object btnAtualiza: TcxButton
          Left = 6
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Atualizar'
          TabOrder = 0
          OnClick = btnAtualizaClick
        end
      end
      object btnMarcarTodos: TcxButton
        Left = 6
        Top = 544
        Width = 129
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Marcar todos'
        TabOrder = 2
        OnClick = btnMarcarTodosClick
      end
      object btnDesmarcarTodos: TcxButton
        Left = 141
        Top = 544
        Width = 129
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Desmarcar todos'
        TabOrder = 3
        OnClick = btnDesmarcarTodosClick
      end
      object btnLiberarSelecionados: TcxButton
        Left = 400
        Top = 544
        Width = 168
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Liberar selecionados'
        TabOrder = 4
        OnClick = btnLiberarSelecionadosClick
      end
    end
    object tab_FinalizaOcorrencia: TcxTabSheet
      Caption = 'Finaliza ocorr'#234'ncia'
      ImageIndex = 1
      object pnCabecalho: TPanel
        Left = 0
        Top = 0
        Width = 574
        Height = 105
        Align = alTop
        Color = clWhite
        TabOrder = 0
        object lblnumoslbl: TLabel
          Left = 6
          Top = 5
          Width = 25
          Height = 16
          Caption = 'OS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblnumos: TLabel
          Left = 41
          Top = 5
          Width = 8
          Height = 16
          Caption = '0'
        end
        object lblumalbl: TLabel
          Left = 6
          Top = 28
          Width = 52
          Height = 16
          Caption = 'U.M.A.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbluma: TLabel
          Left = 62
          Top = 28
          Width = 8
          Height = 16
          Caption = '0'
        end
        object lbldatalbl: TLabel
          Left = 6
          Top = 52
          Width = 107
          Height = 16
          Caption = 'Dt. ocorr'#234'ncia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbldata: TLabel
          Left = 120
          Top = 52
          Width = 60
          Height = 16
          Caption = '00/00/00'
        end
        object lblFunclbl: TLabel
          Left = 6
          Top = 76
          Width = 45
          Height = 16
          Caption = 'Func.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblfunc: TLabel
          Left = 57
          Top = 76
          Width = 134
          Height = 16
          Caption = 'Nome do funcion'#225'rio'
        end
        object lblProblema: TLabel
          Left = 197
          Top = 46
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
        Top = 105
        Width = 574
        Height = 428
        Align = alClient
        Color = clWhite
        TabOrder = 1
        object Shape1: TShape
          Left = 6
          Top = 6
          Width = 252
          Height = 49
        end
        object lblDeplbl: TLabel
          Left = 6
          Top = 9
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dep.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDep: TLabel
          Left = 6
          Top = 28
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object lblRualbl: TLabel
          Left = 54
          Top = 9
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Rua'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblRua: TLabel
          Left = 54
          Top = 28
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object lblPrediolbl: TLabel
          Left = 102
          Top = 9
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Pred.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblPredio: TLabel
          Left = 102
          Top = 28
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object lblNivellbl: TLabel
          Left = 150
          Top = 9
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Niv.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNivel: TLabel
          Left = 150
          Top = 28
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object lblApto: TLabel
          Left = 198
          Top = 28
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = '0'
        end
        object lblAptolbl: TLabel
          Left = 198
          Top = 10
          Width = 60
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Apto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtEndereco: TcxTextEdit
          Left = 6
          Top = 61
          TabOrder = 0
          OnKeyPress = edtEnderecoKeyPress
          OnKeyUp = edtEnderecoKeyUp
          Width = 148
        end
        object btnAutorizar: TcxButton
          Left = 172
          Top = 61
          Width = 86
          Height = 25
          Caption = 'Autorizar'
          TabOrder = 1
          OnClick = actAutorizaLiberacaoExecute
        end
      end
      object pnBotoes: TPanel
        Left = 0
        Top = 533
        Width = 574
        Height = 42
        Align = alBottom
        Color = clWhite
        TabOrder = 2
        object btnCancelar: TcxButton
          Left = 6
          Top = 10
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
    Left = 296
    Top = 56
    object actAutorizaLiberacao: TAction
      Caption = 'actAutorizaLiberacao'
      OnExecute = actAutorizaLiberacaoExecute
    end
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    NativeStyle = False
    ScrollbarMode = sbmClassic
    SkinName = 'SevenClassic'
    Left = 388
    Top = 156
  end
end
