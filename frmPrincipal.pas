unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, ExtCtrls, StdCtrls,
  cxContainer, cxTextEdit, Menus, cxButtons, ActnList;

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
    clNumOrdem: TcxGridDBColumn;
    clDataOnda: TcxGridDBColumn;
    grdOcorrenciasDBTableView1tipoos: TcxGridDBColumn;
    grdOcorrenciasDBTableView1desctipoos: TcxGridDBColumn;
    procedure btnAtualizaClick(Sender: TObject);
    procedure edtEnderecoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure actAutorizaLiberacaoExecute(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure grdOcorrenciasDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

///  Versão:       1.0.0.0
procedure TPrincipal.actAutorizaLiberacaoExecute(Sender: TObject);
begin

  if strtofloat(edtEndereco.Text)=CodEndereco then
  Begin
    edtEndereco.Text:='';
    if LiberaOcorrencia(OSAtual
                        ,UMAAtual
                        ,Usuario.Matricula) then
    Begin

      Menssagens('OS: '+floattostr(OSAtual)+' foi liberada da ocorrência!',2);

      tab_ListadeOcorrencias.TabVisible:=true;
      tab_FinalizaOcorrencia.TabVisible:=false;
      pcTelaPrincipal.ActivePage:=tab_ListadeOcorrencias;

      ProcuraOcorrencias();

    end else
    Begin
      Menssagens('Falha na liberação da OS, por favor tente novamente!',1) ;
      edtEndereco.SetFocus;
    end;
  end else
  Begin
    edtEndereco.Text:='';
    Menssagens('Endereço não confere com o solicitado!',1);
    edtEndereco.SetFocus;
  end;

end;

procedure TPrincipal.btnAtualizaClick(Sender: TObject);
begin

  ProcuraOcorrencias();

end;

procedure TPrincipal.btnCancelarClick(Sender: TObject);
begin

  tab_ListadeOcorrencias.TabVisible:=true;
  tab_FinalizaOcorrencia.TabVisible:=false;
  pcTelaPrincipal.ActivePage:=tab_ListadeOcorrencias;

end;

procedure TPrincipal.edtEnderecoKeyPress(Sender: TObject; var Key: Char);
begin

  if not (key in ['0'..'9', #8,#13]) then
  Begin
     key := #0;
  end else
  Begin

     if edtEndereco.SelLength>1 then edtEndereco.Text:='';

     if (key in [#13]) and (edtEndereco.Text<>'') then
     Begin
       actAutorizaLiberacao.Execute;
     end;

  end;

  

end;

procedure TPrincipal.edtEnderecoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if edtEndereco.Text<>'' then btnAutorizar.Enabled:=true else btnAutorizar.Enabled:=false;

end;

procedure TPrincipal.FormShow(Sender: TObject);
begin

  tab_ListadeOcorrencias.TabVisible:=true;
  tab_FinalizaOcorrencia.TabVisible:=false;
  pcTelaPrincipal.ActivePage:=tab_ListadeOcorrencias;

  ProcuraOcorrencias();
end;

procedure TPrincipal.grdOcorrenciasDBTableView1DblClick(Sender: TObject);
begin

  if dmdb.cdsOcorrencias.RecordCount>0 then
  Begin
    lblnumos.Caption   :=floattostr(dmdb.cdsOcorrencias.FieldByName('NUMOS').Value);
    lbluma.Caption     :=floattostr(dmdb.cdsOcorrencias.FieldByName('CODIGOUMA').Value);
    lbldata.Caption    :=datetostr(dmdb.cdsOcorrencias.FieldByName('DATAINCLUSAO').Value);
    lblfunc.Caption    :=dmdb.cdsOcorrencias.FieldByName('NOME').Value;
    lblProblema.Caption:=dmdb.cdsOcorrencias.FieldByName('DESCRICAOPROBLEMA').Value;

    lblDep.Caption   :=dmdb.cdsOcorrencias.FieldByName('deposito').Value;
    lblRua.Caption   :=dmdb.cdsOcorrencias.FieldByName('rua').Value;
    lblPredio.Caption:=dmdb.cdsOcorrencias.FieldByName('predio').Value;
    lblNivel.Caption :=dmdb.cdsOcorrencias.FieldByName('nivel').Value;
    lblApto.Caption  :=dmdb.cdsOcorrencias.FieldByName('apto').Value;

    OSAtual    :=dmdb.cdsOcorrencias.FieldByName('NUMOS').Value;
    UMAAtual   :=dmdb.cdsOcorrencias.FieldByName('CODIGOUMA').Value;
    CodEndereco:=dmdb.cdsOcorrencias.FieldByName('CODIGOENDERECO').Value;

    tab_ListadeOcorrencias.TabVisible:=false;
    tab_FinalizaOcorrencia.TabVisible:=true;
    pcTelaPrincipal.ActivePage       :=tab_FinalizaOcorrencia;

    btnCancelar.Enabled:=true;

    pnAutoriza.Enabled  :=true;
    btnAutorizar.Enabled:=false;
    edtEndereco.Text    :='';
    edtEndereco.SetFocus;
  end;

end;

end.
