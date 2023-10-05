program OcorrenciasConvocacaoAtiva;

uses
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {Principal},
  UFRMdmdb in 'UFRMdmdb.pas' {DMDB: TDataModule},
  UVariaveiseFuncoes in 'UVariaveiseFuncoes.pas',
  UHistoricoAlteracoes in 'UHistoricoAlteracoes.pas',
  ULibrary in '..\LIBSODAC\ULibrary.pas',
  UUsuariosWinthor in '..\LIBSODAC\UUsuariosWinthor.pas',
  uFrmMensagens in 'uFrmMensagens.pas' {frmMensagens};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDMDB, DMDB);
  Application.CreateForm(TfrmMensagens, frmMensagens);
  //abrirConexaoBDE;

  abrirConexaoODAC();

  AtribuiSessionDmd(DMDB, ODACSessionGlobal);

  UsuarioControler:= TUsuarioController.Create(ODACSessionGlobal);
  Usuario:=UsuarioControler.GetUsuarioPorLogin(Paramstr(1));

  Application.Title := 'Libera ocorências - '+Retorna_Versao;
  Principal.caption:='Libera ocorrências - '+Retorna_Versao;

  Application.Run;
end.
