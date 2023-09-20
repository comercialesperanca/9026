program OcorrenciasConvocacaoAtiva;

uses
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {Principal},
  UFRMdmdb in 'UFRMdmdb.pas' {DMDB: TDataModule},
  ULibrary in '..\LIBS\ULibrary.pas',
  UVariaveiseFuncoes in 'UVariaveiseFuncoes.pas',
  UFRM_MENSSAGEM in '..\Conferencia de saida\UFRM_MENSSAGEM.pas' {frmMenssagens},
  UUsuariosWinthor in '..\LIBS\UUsuariosWinthor.pas',
  UHistoricoAlteracoes in 'UHistoricoAlteracoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TDMDB, DMDB);
  Application.CreateForm(TfrmMenssagens, frmMenssagens);
  abrirConexaoBDE;

  UsuarioControler:= TUsuarioController.Create('BDEConnection');
  Usuario:=UsuarioControler.GetUsuarioPorLogin(Paramstr(1));

  Application.Title := 'Libera ocorências - '+Retorna_Versao;
  Principal.caption:='Libera ocorrências - '+Retorna_Versao;

  Application.Run;
end.
