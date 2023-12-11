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
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOcorrencias'
    OnCalcFields = cdsOcorrenciasCalcFields
    Left = 32
    Top = 112
    object cdsOcorrenciasCODIGOUMA: TFloatField
      FieldName = 'CODIGOUMA'
    end
    object cdsOcorrenciasNUMOS: TFloatField
      FieldName = 'NUMOS'
    end
    object cdsOcorrenciasDATAINCLUSAO: TDateTimeField
      FieldName = 'DATAINCLUSAO'
    end
    object cdsOcorrenciasUSUARIOINCLUSAO: TIntegerField
      FieldName = 'USUARIOINCLUSAO'
    end
    object cdsOcorrenciasDESCRICAOPROBLEMA: TStringField
      FieldName = 'DESCRICAOPROBLEMA'
      Size = 100
    end
    object cdsOcorrenciasNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object cdsOcorrenciasTIPOOS: TIntegerField
      FieldName = 'TIPOOS'
    end
    object cdsOcorrenciasNUMONDA: TIntegerField
      FieldName = 'NUMONDA'
    end
    object cdsOcorrenciasDATAONDA: TDateTimeField
      FieldName = 'DATAONDA'
    end
    object cdsOcorrenciasCODIGOENDERECO: TFloatField
      FieldName = 'CODIGOENDERECO'
    end
    object cdsOcorrenciasDEPOSITO: TIntegerField
      FieldName = 'DEPOSITO'
    end
    object cdsOcorrenciasRUA: TIntegerField
      FieldName = 'RUA'
    end
    object cdsOcorrenciasPREDIO: TIntegerField
      FieldName = 'PREDIO'
    end
    object cdsOcorrenciasNIVEL: TIntegerField
      FieldName = 'NIVEL'
    end
    object cdsOcorrenciasAPTO: TIntegerField
      FieldName = 'APTO'
    end
    object cdsOcorrenciasDESCTIPOOS: TStringField
      FieldName = 'DESCTIPOOS'
      Size = 50
    end
    object cdsOcorrenciasSELECIONADO: TStringField
      FieldName = 'SELECIONADO'
      FixedChar = True
      Size = 1
    end
    object cdsOcorrenciasCODMOTIVO: TIntegerField
      FieldName = 'CODMOTIVO'
    end
    object cdsOcorrenciasCODPROD: TIntegerField
      FieldName = 'CODPROD'
    end
    object cdsOcorrenciasPRODUTO: TStringField
      FieldName = 'PRODUTO'
      Size = 40
    end
    object cdsOcorrenciasREGISTROS_MESMA_OS: TFloatField
      FieldName = 'REGISTROS_MESMA_OS'
    end
    object cdsOcorrenciasCALC_SELECIONADO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_SELECIONADO'
    end
    object cdsOcorrenciasCALC_REINCIDENTE: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CALC_REINCIDENTE'
      Size = 1
    end
    object cdsOcorrenciasAGG_SELECIONADO: TAggregateField
      FieldName = 'AGG_SELECIONADO'
      Required = True
      Active = True
      DisplayName = ''
      Expression = 'SUM(CALC_SELECIONADO)'
    end
  end
  object dspOcorrencias: TDataSetProvider
    DataSet = qryOcorrencias
    Left = 32
    Top = 64
  end
  object qryOcorrencias: TOraQuery
    SQL.Strings = (
      'WITH OCORRENCIAS'
      '     AS (SELECT BOOSCOMPENDENCIA.CODIGOUMA'
      '                , BOOSCOMPENDENCIA.NUMOS'
      '                , BOOSCOMPENDENCIA.DATAINCLUSAO'
      '                , BOOSCOMPENDENCIA.USUARIOINCLUSAO'
      '                , BOOSCOMPENDENCIA.DESCRICAOPROBLEMA'
      '                , BOOSCOMPENDENCIA.CODMOTIVO '
      '                , PCEMPR.NOME'
      '                , MEP.TIPOOS'
      '                , BODEFINEONDAI.NUMONDA'
      '                , BODEFINEONDAI.DATA AS dataonda'
      '                , MEP.CODPROD'
      '                , ( CASE'
      
        '                      WHEN MEP.TIPOOS IN ( 17, 23, 98 ) THEN MEP' +
        '.CODENDERECO'
      '                      ELSE ( CASE'
      
        '                               WHEN MEP.TIPOOS = 61 THEN MEP.COD' +
        'ENDERECOORIG'
      '                               ELSE ( CASE'
      
        '                                        WHEN MEP.DTINICIOOS IS N' +
        'ULL THEN MEP.CODENDERECOORIG'
      '                                        ELSE MEP.CODENDERECO'
      '                                      END )'
      '                             END )'
      '                    END )            AS codigoendereco'
      '         FROM   BOOSCOMPENDENCIA'
      '                JOIN PCEMPR'
      
        '                  ON PCEMPR.MATRICULA = BOOSCOMPENDENCIA.USUARIO' +
        'INCLUSAO'
      '                JOIN PCMOVENDPEND MEP'
      '                  ON MEP.NUMOS = BOOSCOMPENDENCIA.NUMOS'
      '                LEFT JOIN BODEFINEONDAI'
      
        '                       ON BODEFINEONDAI.NUMTRANSWMS = MEP.NUMTRA' +
        'NSWMS                       '
      '         WHERE  BOOSCOMPENDENCIA.DATALIBERACAO IS NULL'
      '         GROUP BY BOOSCOMPENDENCIA.CODIGOUMA'
      '                , BOOSCOMPENDENCIA.NUMOS'
      '                , BOOSCOMPENDENCIA.DATAINCLUSAO'
      '                , BOOSCOMPENDENCIA.USUARIOINCLUSAO'
      '                , BOOSCOMPENDENCIA.DESCRICAOPROBLEMA'
      '                , BOOSCOMPENDENCIA.CODMOTIVO '
      '                , PCEMPR.NOME'
      '                , MEP.TIPOOS'
      '                , BODEFINEONDAI.NUMONDA'
      '                , BODEFINEONDAI.DATA'
      '                , MEP.CODPROD'
      '                , ( CASE'
      
        '                      WHEN MEP.TIPOOS IN ( 17, 23, 98 ) THEN MEP' +
        '.CODENDERECO'
      '                      ELSE ( CASE'
      
        '                               WHEN MEP.TIPOOS = 61 THEN MEP.COD' +
        'ENDERECOORIG'
      '                               ELSE ( CASE'
      
        '                                        WHEN MEP.DTINICIOOS IS N' +
        'ULL THEN MEP.CODENDERECOORIG'
      '                                        ELSE MEP.CODENDERECO'
      '                                      END )'
      '                             END )'
      '                    END )          '
      '         )'
      'SELECT '#39'N'#39' AS SELECIONADO'
      #9'   , OCORRENCIAS.CODIGOUMA'
      '       , OCORRENCIAS.NUMOS'
      '       , OCORRENCIAS.DATAINCLUSAO'
      '       , OCORRENCIAS.USUARIOINCLUSAO'
      '       , OCORRENCIAS.CODMOTIVO'
      '       , OCORRENCIAS.DESCRICAOPROBLEMA'
      '       , OCORRENCIAS.NOME'
      '       , OCORRENCIAS.TIPOOS'
      '       , OCORRENCIAS.NUMONDA'
      '       , OCORRENCIAS.DATAONDA'
      '       , OCORRENCIAS.CODIGOENDERECO'
      '       , OCORRENCIAS.CODPROD'
      '       , PCPRODUT.DESCRICAO AS PRODUTO'
      '       , PCENDERECO.DEPOSITO'
      '       , PCENDERECO.RUA'
      '       , PCENDERECO.PREDIO'
      '       , PCENDERECO.NIVEL'
      '       , PCENDERECO.APTO'
      '       , PCTIPOOS.DESCRICAO AS desctipoos'
      '       , SUM((SELECT COUNT(*)'
      '       '#9'  FROM BOOSCOMPENDENCIA'
      '       '#9'  WHERE BOOSCOMPENDENCIA.NUMOS = OCORRENCIAS.NUMOS'
      
        '       '#9'  AND BOOSCOMPENDENCIA.DATAINCLUSAO >= TRUNC(OCORRENCIAS' +
        '.DATAINCLUSAO) - 30'
      '       )) AS REGISTROS_MESMA_OS'
      'FROM   OCORRENCIAS'
      '       JOIN PCENDERECO'
      '         ON PCENDERECO.CODENDERECO = OCORRENCIAS.CODIGOENDERECO'
      '       LEFT JOIN PCPRODUT'
      '       '#9'ON PCPRODUT.CODPROD = OCORRENCIAS.CODPROD'
      '       LEFT JOIN PCTIPOOS'
      '              ON PCTIPOOS.CODIGO = OCORRENCIAS.TIPOOS'
      'GROUP BY'
      #9'OCORRENCIAS.CODIGOUMA'
      '       , OCORRENCIAS.NUMOS'
      '       , OCORRENCIAS.DATAINCLUSAO'
      '       , OCORRENCIAS.USUARIOINCLUSAO'
      '       , OCORRENCIAS.CODMOTIVO'
      '       , OCORRENCIAS.DESCRICAOPROBLEMA'
      '       , OCORRENCIAS.NOME'
      '       , OCORRENCIAS.TIPOOS'
      '       , OCORRENCIAS.NUMONDA'
      '       , OCORRENCIAS.DATAONDA'
      '       , OCORRENCIAS.CODIGOENDERECO'
      '       , OCORRENCIAS.CODPROD'
      '       , PCPRODUT.DESCRICAO'
      '       , PCENDERECO.DEPOSITO'
      '       , PCENDERECO.RUA'
      '       , PCENDERECO.PREDIO'
      '       , PCENDERECO.NIVEL'
      '       , PCENDERECO.APTO'
      '       , PCTIPOOS.DESCRICAO')
    Left = 32
    Top = 16
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
