unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, ExtCtrls, StdCtrls,
  cxContainer, cxTextEdit, Menus, cxButtons, ActnList, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkroom, dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinOffice2019Colorful, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxBarBuiltInMenu, cxNavigator, dxDateRanges, System.Actions, cxCheckBox;

type
  TPrincipal = class(TForm)
    pcTelaPrincipal: TcxPageControl;
    tab_ListadeOcorrencias: TcxTabSheet;
    tab_FinalizaOcorrencia: TcxTabSheet;
    grdOcorrenciasDBTableView1: TcxGridDBTableView;
    grdOcorrenciasLevel1: TcxGridLevel;
    grdOcorrencias: TcxGrid;
    clData: TcxGridDBColumn;
    clNumOS: TcxGridDBColumn;
    clUMA: TcxGridDBColumn;
    clRua: TcxGridDBColumn;
    clQuemLancou: TcxGridDBColumn;
    pnCabecalho: TPanel;
    pnAutoriza: TPanel;
    pnBotoes: TPanel;
    lblnumoslbl: TLabel;
    lblnumos: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblumalbl: TLabel;
    lbluma: TLabel;
    lbldatalbl: TLabel;
    lbldata: TLabel;
    lblFunclbl: TLabel;
    lblfunc: TLabel;
    edtEndereco: TcxTextEdit;
    lblProblema: TLabel;
    lblDeplbl: TLabel;
    lblDep: TLabel;
    lblRualbl: TLabel;
    lblRua: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblPrediolbl: TLabel;
    lblPredio: TLabel;
    lblNivellbl: TLabel;
    lblNivel: TLabel;
    lblApto: TLabel;
    lblAptolbl: TLabel;
    btnCancelar: TcxButton;
    btnAutorizar: TcxButton;
    ListadeAcoes: TActionList;
    actAutorizaLiberacao: TAction;
    Panel1: TPanel;
    btnAtualiza: TcxButton;
    Shape1: TShape;
    clNumOnda: TcxGridDBColumn;
    clDataOnda: TcxGridDBColumn;
    grdOcorrenciasDBTableView1tipoos: TcxGridDBColumn;
    grdOcorrenciasDBTableView1desctipoos: TcxGridDBColumn;
    cxLookAndFeelController1: TcxLookAndFeelController;
    grdOcorrenciasDBTableView1USUARIOINCLUSAO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1DESCRICAOPROBLEMA: TcxGridDBColumn;
    grdOcorrenciasDBTableView1CODIGOENDERECO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1DEPOSITO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1PREDIO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1NIVEL: TcxGridDBColumn;
    grdOcorrenciasDBTableView1APTO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1SELECIONADO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1CODMOTIVO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1CODPROD: TcxGridDBColumn;
    grdOcorrenciasDBTableView1PRODUTO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1REGISTROS_MESMA_OS: TcxGridDBColumn;
    grdOcorrenciasDBTableView1CALC_SELECIONADO: TcxGridDBColumn;
    grdOcorrenciasDBTableView1CALC_REINCIDENTE: TcxGridDBColumn;
    btnMarcarTodos: TcxButton;
    btnDesmarcarTodos: TcxButton;
    btnLiberarSelecionados: TcxButton;
    procedure btnAtualizaClick(Sender: TObject);
    procedure edtEnderecoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure actAutorizaLiberacaoExecute(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdOcorrenciasDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdOcorrenciasDBTableView1SELECIONADOPropertiesChange(Sender: TObject);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnDesmarcarTodosClick(Sender: TObject);
    procedure btnLiberarSelecionadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

uses UFRMdmdb, UVariaveiseFuncoes, ULibrary;

{$R *.dfm}

/// Versão:       1.0.0.0
procedure TPrincipal.actAutorizaLiberacaoExecute(Sender: TObject);
begin

  if strtofloat(edtEndereco.Text) <> CodEndereco then
  begin

    edtEndereco.Text := '';
    ExibirMensagem('Endereço não confere com o solicitado!', 1);
    Exit;
  end;

  edtEndereco.Text := '';

  if LiberaOcorrencia(OSAtual, UMAAtual, Usuario.Matricula) then
  Begin

    ExibirMensagem('OS: ' + floattostr(OSAtual) + ' foi liberada da ocorrência!', 2);

    tab_ListadeOcorrencias.TabVisible := true;
    tab_FinalizaOcorrencia.TabVisible := false;
    pcTelaPrincipal.ActivePage := tab_ListadeOcorrencias;

    ProcuraOcorrencias();

  end
  else
  Begin
    ExibirMensagem('Falha na liberação da OS, por favor tente novamente!', 1);
    edtEndereco.SetFocus;
  end;

end;

procedure TPrincipal.btnAtualizaClick(Sender: TObject);
begin

  ProcuraOcorrencias();

end;

procedure TPrincipal.btnCancelarClick(Sender: TObject);
begin

  tab_ListadeOcorrencias.TabVisible := true;
  tab_FinalizaOcorrencia.TabVisible := false;
  pcTelaPrincipal.ActivePage := tab_ListadeOcorrencias;

end;

procedure TPrincipal.btnDesmarcarTodosClick(Sender: TObject);
begin

  MarcarDesmarcarTodos(false);

end;

procedure TPrincipal.btnLiberarSelecionadosClick(Sender: TObject);
var
  total: integer;
begin

  total := LiberarOcorrenciaMultiplas();

  if total > 1 then
  begin

     ExibirMensagem(floattostr(total) + ' OSs liberadas da ocorrência!', 2);
  end;

  ProcuraOcorrencias();

end;

procedure TPrincipal.btnMarcarTodosClick(Sender: TObject);
begin

  MarcarDesmarcarTodos(true);

end;

procedure TPrincipal.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin

  if not(Key in ['0' .. '9', #8, #13]) then
  Begin
    Key := #0;
  end
  else
  Begin

    if edtEndereco.SelLength > 1 then
      edtEndereco.Text := '';

    if (Key in [#13]) and (edtEndereco.Text <> '') then
    Begin
      actAutorizaLiberacao.Execute;
    end;

  end;

end;

procedure TPrincipal.edtEnderecoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if edtEndereco.Text <> '' then
    btnAutorizar.Enabled := true
  else
    btnAutorizar.Enabled := false;

end;

procedure TPrincipal.FormShow(Sender: TObject);
begin

  tab_ListadeOcorrencias.TabVisible := true;
  tab_FinalizaOcorrencia.TabVisible := false;
  pcTelaPrincipal.ActivePage := tab_ListadeOcorrencias;

  ProcuraOcorrencias();
end;

procedure TPrincipal.grdOcorrenciasDBTableView1DblClick(Sender: TObject);
begin

  LiberarOcorrenciaUnica();

end;

procedure TPrincipal.grdOcorrenciasDBTableView1SELECIONADOPropertiesChange(Sender: TObject);
begin

  if dmdb.cdsOcorrencias.State = dsEdit then
  begin

    dmdb.cdsOcorrencias.Post;
  end;

end;

end.
