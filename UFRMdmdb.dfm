object DMDB: TDMDB
  OldCreateOrder = False
  Height = 318
  Width = 464
  object dsOcorrencias: TDataSource
    DataSet = cdsOcorrencias
    Left = 32
    Top = 160
  end
  object cdsOcorrencias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorrencias'
    Left = 32
    Top = 112
    object cdsOcorrenciascodigouma: TFloatField
      FieldName = 'codigouma'
    end
    object cdsOcorrenciasnumos: TFloatField
      FieldName = 'numos'
    end
    object cdsOcorrenciasusuarioinclusao: TFloatField
      FieldName = 'usuarioinclusao'
    end
    object cdsOcorrenciasdescricaoproblema: TStringField
      FieldName = 'descricaoproblema'
      Size = 100
    end
    object cdsOcorrenciasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object cdsOcorrenciasdeposito: TFloatField
      FieldName = 'deposito'
    end
    object cdsOcorrenciasrua: TFloatField
      FieldName = 'rua'
    end
    object cdsOcorrenciaspredio: TFloatField
      FieldName = 'predio'
    end
    object cdsOcorrenciasnivel: TFloatField
      FieldName = 'nivel'
    end
    object cdsOcorrenciasapto: TFloatField
      FieldName = 'apto'
    end
    object cdsOcorrenciascodigoendereco: TFloatField
      FieldName = 'codigoendereco'
    end
    object cdsOcorrenciasdatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object cdsOcorrenciasnumonda: TFloatField
      FieldName = 'numonda'
    end
    object cdsOcorrenciasnumordem: TFloatField
      FieldName = 'numordem'
    end
    object cdsOcorrenciasdataonda: TDateTimeField
      FieldName = 'dataonda'
    end
    object cdsOcorrenciastipoos: TFloatField
      FieldName = 'tipoos'
    end
    object cdsOcorrenciasdesctipoos: TStringField
      FieldName = 'desctipoos'
      Size = 200
    end
  end
  object dspOcorrencias: TDataSetProvider
    DataSet = qryOcorrencias
    Left = 32
    Top = 64
  end
  object qryOcorrencias: TOraQuery
    SQL.Strings = (
      'with ocorrencias as ('
      'select '
      'booscompendencia.codigouma'
      ',booscompendencia.numos'
      ',booscompendencia.datainclusao'
      ',booscompendencia.usuarioinclusao'
      ',booscompendencia.descricaoproblema'
      ',pcempr.nome'
      ',mep.tipoos'
      ',bodefineondai.numonda'
      ',bodefineondai.numordem'
      ',bodefineondai.data as dataonda'
      ',(case when mep.tipoos in (17,23,98)'
      '   then mep.codendereco'
      '   else (case when mep.tipoos=61'
      '         then mep.codenderecoorig'
      '         else (case when mep.dtinicioos is null'
      '               then mep.codenderecoorig'
      '               else mep.codendereco '
      '               end)'
      '         end)'
      '   end) as codigoendereco'
      '   '
      'from booscompendencia'
      
        '     join pcempr on pcempr.matricula = booscompendencia.usuarioi' +
        'nclusao'
      '     join pcmovendpend mep on mep.numos=booscompendencia.numos'
      
        '     left join bodefineondai on bodefineondai.numtransWMS = mep.' +
        'numtransWMS'
      'where booscompendencia.dataliberacao is null)'
      ''
      'select '
      'ocorrencias.*'
      ',pcendereco.deposito'
      ',pcendereco.rua'
      ',pcendereco.predio'
      ',pcendereco.nivel'
      ',pcendereco.apto'
      ', PCTIPOOS.descricao as desctipoos'
      'from ocorrencias'
      
        '     join pcendereco on pcendereco.codendereco=ocorrencias.codig' +
        'oendereco'
      '     LEFT JOIN PCTIPOOS on PCTIPOOS.codigo = ocorrencias.tipoos')
    Left = 32
    Top = 16
    object qryOcorrenciascodigouma: TFloatField
      FieldName = 'codigouma'
    end
    object qryOcorrenciasnumos: TFloatField
      FieldName = 'numos'
    end
    object qryOcorrenciasusuarioinclusao: TFloatField
      FieldName = 'usuarioinclusao'
    end
    object qryOcorrenciasdescricaoproblema: TStringField
      FieldName = 'descricaoproblema'
      Size = 100
    end
    object qryOcorrenciasnome: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object qryOcorrenciasdeposito: TFloatField
      FieldName = 'deposito'
    end
    object qryOcorrenciasrua: TFloatField
      FieldName = 'rua'
    end
    object qryOcorrenciaspredio: TFloatField
      FieldName = 'predio'
    end
    object qryOcorrenciasnivel: TFloatField
      FieldName = 'nivel'
    end
    object qryOcorrenciasapto: TFloatField
      FieldName = 'apto'
    end
    object qryOcorrenciascodigoendereco: TFloatField
      FieldName = 'codigoendereco'
    end
    object qryOcorrenciasdatainclusao: TDateTimeField
      FieldName = 'datainclusao'
    end
    object qryOcorrenciasnumordem: TFloatField
      FieldName = 'numordem'
    end
    object qryOcorrenciasnumonda: TFloatField
      FieldName = 'numonda'
    end
    object qryOcorrenciasdataonda: TDateTimeField
      FieldName = 'dataonda'
    end
    object qryOcorrenciastipoos: TFloatField
      FieldName = 'tipoos'
    end
    object qryOcorrenciasdesctipoos: TStringField
      FieldName = 'desctipoos'
      Size = 200
    end
  end
  object qryLiberaOcorrencia: TOraQuery
    SQL.Strings = (
      'update booscompendencia'
      'set dataliberacao=sysdate'
      '      ,usuarioliberacao=:MATRICULA'
      'where codigouma=:CODIGOUMA'
      '          and numos=:NUMOS'
      '          and dataliberacao is null')
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MATRICULA'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'CODIGOUMA'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'NUMOS'
        Value = nil
      end>
    object FloatField1: TFloatField
      FieldName = 'codigouma'
    end
    object FloatField2: TFloatField
      FieldName = 'numos'
    end
    object FloatField3: TFloatField
      FieldName = 'usuarioinclusao'
    end
    object StringField1: TStringField
      FieldName = 'descricaoproblema'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'nome'
      Size = 40
    end
    object FloatField4: TFloatField
      FieldName = 'deposito'
    end
    object FloatField5: TFloatField
      FieldName = 'rua'
    end
    object FloatField6: TFloatField
      FieldName = 'predio'
    end
    object FloatField7: TFloatField
      FieldName = 'nivel'
    end
    object FloatField8: TFloatField
      FieldName = 'apto'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'datainclusao'
    end
  end
  object qryLiberaOS: TOraQuery
    SQL.Strings = (
      'update pcmovendpend'
      'set'
      'codfuncos = '#39#39','
      'dtinicioos = '#39#39','
      'funcpriimp = '#39#39','
      'dtpriimp = '#39#39','
      'numvias = '#39#39','
      'funcultimp = '#39#39','
      'dtultimp = '#39#39
      'where data >= Trunc(sysdate - 30)'
      'and numos = :NUMOS'
      'and posicao = '#39'P'#39)
    Left = 280
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMOS'
        Value = nil
      end>
  end
end
