unit UVariaveiseFuncoes;

interface

Uses
  Graphics, IniFiles, ClipBrd, Variants, SysUtils, UUsuariosWinthor;

Procedure ExibirMensagem(menssagem: string; tipoTitulo: integer);
function ProcuraOcorrencias(): boolean;
function LiberaOcorrencia(AnumOS: double; ACodigoUMA: double; AMatricula: double): boolean;

var
  OSAtual, UMAAtual, CodEndereco: double;
  repostasimnao: boolean;
  UsuarioControler: TUsuarioController;
  Usuario: TUsuario;

implementation

uses UFRMdmdb, ULibrary, uFrmMensagens;

Procedure ExibirMensagem(menssagem: string; tipoTitulo: integer);
Begin

  // pelo tipo do título da mensagem indentificamos as características da mesma,
  // logo conseguimos definir a Palavra usada no título e sua cor.
  if (tipoTitulo = 1) then
  Begin
    frmMensagens.lblTitulo.Caption := 'ERRO !';
    frmMensagens.lblTitulo.Font.Color := clRed;
  end;
  if (tipoTitulo = 2) then
  Begin
    frmMensagens.lblTitulo.Caption := 'INFORMAÇÃO !';
    frmMensagens.lblTitulo.Font.Color := clBlue;
  end;

  if (tipoTitulo = 3) then
  Begin
    frmMensagens.lblTitulo.Caption := 'ALERTA !';
    frmMensagens.lblTitulo.Font.Color := clYellow;
  end;

  frmMensagens.memMenssagem.Text := menssagem;
  frmMensagens.ShowModal;
end;

/// Versão:       1.0.0.0
function ProcuraOcorrencias(): boolean;
Begin

  dmdb.cdsOcorrencias.Close;
  dmdb.qryOcorrencias.Close;
  dmdb.qryOcorrencias.Open;
  dmdb.cdsOcorrencias.Open;

end;

/// Versão:       1.0.0.0
function LiberaOcorrencia(AnumOS: double; ACodigoUMA: double; AMatricula: double): boolean;
Begin

  dmdb.qryLiberaOcorrencia.Close;
  dmdb.qryLiberaOcorrencia.ParamByName('NUMOS').Value := AnumOS;
  dmdb.qryLiberaOcorrencia.ParamByName('CODIGOUMA').Value := ACodigoUMA;
  dmdb.qryLiberaOcorrencia.ParamByName('MATRICULA').Value := AMatricula;
  dmdb.qryLiberaOcorrencia.ExecSQL;

  dmdb.qryLiberaOS.Close;
  dmdb.qryLiberaOS.ParamByName('NUMOS').AsFloat := AnumOS;
  dmdb.qryLiberaOS.ExecSQL;

  Result := dmdb.qryLiberaOcorrencia.RowsAffected > 0;

end;

end.
