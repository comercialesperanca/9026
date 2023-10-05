unit UFRMdmdb;

interface

uses
  SysUtils, Classes, DBAccess, Ora, OraSmart, MemDS, OraError, Provider, DB, DBClient, MidasLib, OraCall;

type
  TDMDB = class(TDataModule)
    dsOcorrencias: TDataSource;
    cdsOcorrencias: TClientDataSet;
    dspOcorrencias: TDataSetProvider;
    qryOcorrencias: TOraQuery;
    qryLiberaOcorrencia: TOraQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    DateTimeField1: TDateTimeField;
    qryLiberaOS: TOraQuery;
    OraSession1: TOraSession;
    cdsOcorrenciasCODIGOUMA: TFloatField;
    cdsOcorrenciasNUMOS: TFloatField;
    cdsOcorrenciasDATAINCLUSAO: TDateTimeField;
    cdsOcorrenciasUSUARIOINCLUSAO: TIntegerField;
    cdsOcorrenciasDESCRICAOPROBLEMA: TStringField;
    cdsOcorrenciasNOME: TStringField;
    cdsOcorrenciasTIPOOS: TIntegerField;
    cdsOcorrenciasNUMONDA: TIntegerField;
    cdsOcorrenciasNUMORDEM: TIntegerField;
    cdsOcorrenciasDATAONDA: TDateTimeField;
    cdsOcorrenciasCODIGOENDERECO: TFloatField;
    cdsOcorrenciasDEPOSITO: TIntegerField;
    cdsOcorrenciasRUA: TIntegerField;
    cdsOcorrenciasPREDIO: TIntegerField;
    cdsOcorrenciasNIVEL: TIntegerField;
    cdsOcorrenciasAPTO: TIntegerField;
    cdsOcorrenciasDESCTIPOOS: TStringField;
    cdsOcorrenciasSELECIONADO: TStringField;
    cdsOcorrenciasCODMOTIVO: TIntegerField;
    cdsOcorrenciasCODPROD: TIntegerField;
    cdsOcorrenciasPRODUTO: TStringField;
    cdsOcorrenciasREGISTROS_MESMA_OS: TFloatField;
    cdsOcorrenciasCALC_SELECIONADO: TIntegerField;
    cdsOcorrenciasCALC_REINCIDENTE: TStringField;
    cdsOcorrenciasAGG_SELECIONADO: TAggregateField;
    procedure cdsOcorrenciasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDB: TDMDB;

implementation

{$R *.dfm}

procedure TDMDB.cdsOcorrenciasCalcFields(DataSet: TDataSet);
var
  selecionado: integer;
  reincidente: string;
begin

  selecionado := 0;
  reincidente := 'N';

  if cdsOcorrenciasSELECIONADO.AsString = 'S' then
  begin

    selecionado := 1;
  end;

  if cdsOcorrenciasREGISTROS_MESMA_OS.AsFloat > 1 then
  begin

    reincidente := 'S';
  end;

  cdsOcorrenciasCALC_SELECIONADO.Value := selecionado;
  cdsOcorrenciasCALC_REINCIDENTE.Value := reincidente;

end;

end.
