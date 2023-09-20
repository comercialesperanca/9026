unit UVariaveiseFuncoes;

interface
Uses
Graphics, IniFiles, ClipBrd, Variants, SysUtils, UUsuariosWinthor;

Procedure Menssagens (menssagem : string; tipoTitulo: integer);
function ProcuraOcorrencias():boolean;
function LiberaOcorrencia(AnumOS:double
                          ;ACodigoUMA:double
                          ;AMatricula:double):boolean;

var
 OSAtual, UMAAtual, CodEndereco:double;
 repostasimnao    : boolean;
 UsuarioControler:TUsuarioController;
 Usuario : TUsuario;

implementation

uses UFRMdmdb, ULibrary, UFRM_MENSSAGEM;
Procedure Menssagens (menssagem : string; tipoTitulo: integer);
Begin

  //pelo tipo do t�tulo da mensagem indentificamos as caracter�sticas da mesma,
  //logo conseguimos definir a Palavra usada no t�tulo e sua cor.
  if (tipoTitulo=1) then
   Begin
      frmMenssagens.lblTitulo.Caption:='ERRO !';
      frmMenssagens.lblTitulo.Font.Color:=clRed;
   end;
  if (tipoTitulo=2) then
  Begin
      frmMenssagens.lblTitulo.Caption:='INFORMA��O !';
      frmMenssagens.lblTitulo.Font.Color:=clBlue;
  end;

  if (tipoTitulo=3) then
  Begin
      frmMenssagens.lblTitulo.Caption:='ALERTA !';
      frmMenssagens.lblTitulo.Font.Color:=clYellow;
  end;
  frmMenssagens.memMenssagem.Text:= menssagem;

  frmMenssagens.ShowModal;
end;

///  Vers�o:       1.0.0.0
function ProcuraOcorrencias():boolean;
Begin

 dmdb.cdsOcorrencias.Close;
 dmdb.qryOcorrencias.Close;
 dmdb.qryOcorrencias.Open;
 dmdb.cdsOcorrencias.Open;

end;

///  Vers�o:       1.0.0.0
function LiberaOcorrencia(AnumOS:double
                          ;ACodigoUMA:double
                          ;AMatricula:double):boolean;
Begin

  dmdb.qryLiberaOcorrencia.Close;
  dmdb.qryLiberaOcorrencia.ParamByName('NUMOS').Value:=AnumOS;
  dmdb.qryLiberaOcorrencia.ParamByName('CODIGOUMA').Value:=AcodigoUMA;
  dmdb.qryLiberaOcorrencia.ParamByName('MATRICULA').Value:=AMatricula;
  dmdb.qryLiberaOcorrencia.ExecSQL;

  DMDB.qryLiberaOS.Close;
  DMDB.qryLiberaOS.ParamByName('NUMOS').AsFloat := aNumOS;
  DMDB.qryLiberaOS.ExecSQL;

  Result := dmdb.qryLiberaOcorrencia.RowsAffected > 0;

end;

end.
