unit UVariaveiseFuncoes;

interface

Uses
  Graphics, IniFiles, DB, Variants, SysUtils, UUsuariosWinthor, StrUtils;

Procedure ExibirMensagem(menssagem: string; tipoTitulo: integer);
function ProcuraOcorrencias(): boolean;
function LiberaOcorrencia(AnumOS: double; ACodigoUMA: double; AMatricula: double): boolean;
procedure MarcarDesmarcarTodos(marcar: boolean);
procedure LiberarOcorrenciaUnica();
function LiberarOcorrenciaMultiplas(): integer;

var
  OSAtual, UMAAtual, CodEndereco: double;
  repostasimnao: boolean;
  UsuarioControler: TUsuarioController;
  Usuario: TUsuario;

implementation

uses UFRMdmdb, ULibrary, uFrmMensagens, frmPrincipal;

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
  // dmdb.qryOcorrencias.Close;
  // dmdb.qryOcorrencias.Open;
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

procedure MarcarDesmarcarTodos(marcar: boolean);
begin

  with dmdb do
  begin

    if (cdsOcorrencias.State = dsEdit) then
    begin

      cdsOcorrencias.Post;
    end;

    if (cdsOcorrencias.State <> dsBrowse) or (cdsOcorrencias.RecordCount = 0) then
    begin

      Exit;
    end;

    dsOcorrencias.DataSet := nil;

    cdsOcorrencias.First;

    while (not cdsOcorrencias.Eof) do
    begin

      cdsOcorrencias.Edit;
      cdsOcorrenciasSELECIONADO.AsString := IfThen(marcar, 'S', 'N');
      cdsOcorrencias.Post;

      cdsOcorrencias.Next;
    end;

    dsOcorrencias.DataSet := cdsOcorrencias;
    cdsOcorrencias.First;

  end;
end;

procedure LiberarOcorrenciaUnica();
begin

  with dmdb do
  begin

    if (cdsOcorrencias.State = dsEdit) then
    begin

      cdsOcorrencias.Post;
    end;

    if (cdsOcorrencias.State <> dsBrowse) or (cdsOcorrencias.RecordCount = 0) then
    begin

      Exit;
    end;

    principal.lblnumos.Caption := cdsOcorrenciasNUMOS.AsString;
    principal.lbluma.Caption := cdsOcorrenciasCODIGOUMA.AsString;
    principal.lbldata.Caption := cdsOcorrenciasDATAINCLUSAO.AsString;
    principal.lblfunc.Caption := cdsOcorrenciasNOME.AsString;
    principal.lblProblema.Caption := cdsOcorrenciasDESCRICAOPROBLEMA.AsString;

    principal.lblDep.Caption := cdsOcorrenciasDEPOSITO.AsString;
    principal.lblRua.Caption := cdsOcorrenciasRUA.AsString;
    principal.lblPredio.Caption := cdsOcorrenciasPREDIO.AsString;
    principal.lblNivel.Caption := cdsOcorrenciasNIVEL.AsString;
    principal.lblApto.Caption := cdsOcorrenciasAPTO.AsString;

    OSAtual := cdsOcorrenciasNUMOS.AsFloat;
    UMAAtual := cdsOcorrenciasCODIGOUMA.AsFloat;
    CodEndereco := cdsOcorrenciasCODIGOENDERECO.AsFloat;

  end;

  principal.tab_ListadeOcorrencias.TabVisible := false;
  principal.tab_FinalizaOcorrencia.TabVisible := true;
  principal.pcTelaPrincipal.ActivePage := principal.tab_FinalizaOcorrencia;

  principal.btnCancelar.Enabled := true;
  principal.pnAutoriza.Enabled := true;
  principal.btnAutorizar.Enabled := false;
  principal.edtEndereco.Text := '';
  principal.edtEndereco.SetFocus;
end;

function LiberarOcorrenciaMultiplas(): integer;
var
  total_selecionado: integer;
  num_os, codigo_uma: double;
begin

  Result := 0;

  with dmdb do
  begin

    if (cdsOcorrencias.State = dsEdit) then
    begin

      cdsOcorrencias.Post;
    end;

    if (cdsOcorrencias.State <> dsBrowse) or (cdsOcorrencias.RecordCount = 0) then
    begin

      Exit;
    end;

    if (not cdsOcorrencias.Locate('SELECIONADO', 'S', [])) then
    begin

      ExibirMensagem('Selecione ao menos uma pendência', 3);
      Exit;
    end;

    dsOcorrencias.DataSet := nil;

    cdsOcorrencias.Filter := 'SELECIONADO = ' + QuotedStr('S');
    cdsOcorrencias.Filtered := true;

    if (cdsOcorrencias.RecordCount = 1) then
    begin

      cdsOcorrencias.Filtered := false;
      dsOcorrencias.DataSet := cdsOcorrencias;

      cdsOcorrencias.Locate('SELECIONADO', 'S', []);
      LiberarOcorrenciaUnica();
      Result := 1;
      Exit;
    end;

    cdsOcorrencias.First;

    while (not cdsOcorrencias.Eof) do
    begin

      num_os := cdsOcorrenciasNUMOS.AsFloat;
      codigo_uma := cdsOcorrenciasCODIGOUMA.AsFloat;

      LiberaOcorrencia(num_os, codigo_uma, Usuario.Matricula);

      cdsOcorrencias.Next;
    end;

    Result := cdsOcorrencias.RecordCount;

    cdsOcorrencias.Filtered := false;
    dsOcorrencias.DataSet := cdsOcorrencias;

  end;

end;

end.
