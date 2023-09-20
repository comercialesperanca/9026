unit UFRMdmdb;

interface

uses
  SysUtils, Classes, DBTables, Provider, DB, DBClient;

type
  TDMDB = class(TDataModule)
    dsOcorrencias: TDataSource;
    cdsOcorrencias: TClientDataSet;
    dspOcorrencias: TDataSetProvider;
    qryOcorrencias: TQuery;
    qryOcorrenciascodigouma: TFloatField;
    qryOcorrenciasnumos: TFloatField;
    qryOcorrenciasusuarioinclusao: TFloatField;
    qryOcorrenciasdescricaoproblema: TStringField;
    qryOcorrenciasnome: TStringField;
    cdsOcorrenciascodigouma: TFloatField;
    cdsOcorrenciasnumos: TFloatField;
    cdsOcorrenciasusuarioinclusao: TFloatField;
    cdsOcorrenciasdescricaoproblema: TStringField;
    cdsOcorrenciasnome: TStringField;
    qryOcorrenciasdeposito: TFloatField;
    qryOcorrenciasrua: TFloatField;
    qryOcorrenciaspredio: TFloatField;
    qryOcorrenciasnivel: TFloatField;
    qryOcorrenciasapto: TFloatField;
    cdsOcorrenciasdeposito: TFloatField;
    cdsOcorrenciasrua: TFloatField;
    cdsOcorrenciaspredio: TFloatField;
    cdsOcorrenciasnivel: TFloatField;
    cdsOcorrenciasapto: TFloatField;
    qryOcorrenciasdatainclusao: TDateTimeField;
    cdsOcorrenciasdatainclusao: TDateTimeField;
    qryLiberaOcorrencia: TQuery;
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
    qryOcorrenciascodigoendereco: TFloatField;
    cdsOcorrenciascodigoendereco: TFloatField;
    cdsOcorrenciasnumonda: TFloatField;
    cdsOcorrenciasnumordem: TFloatField;
    qryOcorrenciasnumordem: TFloatField;
    qryOcorrenciasnumonda: TFloatField;
    qryOcorrenciasdataonda: TDateTimeField;
    cdsOcorrenciasdataonda: TDateTimeField;
    qryOcorrenciastipoos: TFloatField;
    qryOcorrenciasdesctipoos: TStringField;
    cdsOcorrenciastipoos: TFloatField;
    cdsOcorrenciasdesctipoos: TStringField;
    qryLiberaOS: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDB: TDMDB;

implementation

{$R *.dfm}

end.
