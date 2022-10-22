unit oc_vendors;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Forms,
  Vcl.wwDataInspector,
  IQMS.WebVcl.Search,
  Data.DB,
  FireDAC.Comp.Client,
  MainModule,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, Vcl.Grids, IQUniGrid, uniGUIFrame;

type
  TFrmOutsourceVendors = class(TUniForm)
    pnlCarrier: TUniPanel;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    wwDataInspector1: TwwDataInspector;
    Panel1: TUniPanel;
    NavShipTo: TUniDBNavigator;
    SrcVendors: TDataSource;
    QryVendors: TFDQuery;
    QryVendorsCUSTNO: TStringField;
    QryVendorsCOMPANY: TStringField;
    QryVendorsADDR1: TStringField;
    QryVendorsADDR2: TStringField;
    QryVendorsADDR3: TStringField;
    QryVendorsCITY: TStringField;
    QryVendorsSTATE: TStringField;
    QryVendorsCOUNTRY: TStringField;
    QryVendorsZIP: TStringField;
    QryVendorsPHONE_NUMBER: TStringField;
    QryVendorsPRIME_CONTACT: TStringField;
    QryVendorsID: TBCDField;
    SrcShipTo: TDataSource;
    TblShipTo: TFDTable;
    TblShipToID: TBCDField;
    TblShipToARCUSTO_ID: TBCDField;
    TblShipToATTN: TStringField;
    TblShipToADDR1: TStringField;
    TblShipToADDR2: TStringField;
    TblShipToADDR3: TStringField;
    TblShipToCITY: TStringField;
    TblShipToSTATE: TStringField;
    TblShipToCOUNTRY: TStringField;
    TblShipToZIP: TStringField;
    TblShipToSHIP_TIME: TBCDField;
    TblShipToPHONE_NUMBER: TStringField;
    TblShipToFAX: TStringField;
    TblShipToPRIME_CONTACT: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblShipToBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib;

procedure TFrmOutsourceVendors.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
end;

procedure TFrmOutsourceVendors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action:= caFree;
end;

procedure TFrmOutsourceVendors.TblShipToBeforeInsert(DataSet: TDataSet);
begin
  ABORT; // do not allow insert
end;

end.
