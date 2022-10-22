unit SerDrlDn;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.WebVcl.About,
  IQMS.Common.DataLib,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, Vcl.Controls,
  uniGUIFrame;

type
  TFrmSerDD = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    SrcTransLog: TDataSource;
    QryTransLog: TFDQuery;
    IQAbout1: TIQWebAbout;
    QryTransLogCLASS: TStringField;
    QryTransLogITEMNO: TStringField;
    QryTransLogREV: TStringField;
    QryTransLogDESCRIP: TStringField;
    QryTransLogUNIT: TStringField;
    QryTransLogTRANS_IN_OUT: TStringField;
    QryTransLogTRANS_DATE: TDateTimeField;
    QryTransLogTRANS_QUAN: TFMTBCDField;
    QryTransLogRG_QUAN: TFMTBCDField;
    QryTransLogTRANS_TYPE: TStringField;
    QryTransLogLOC_DESC: TStringField;
    QryTransLogACT_COST: TFMTBCDField;
    QryTransLogMFGNO: TStringField;
    QryTransLogUSERID: TStringField;
    QryTransLogLOTNO: TStringField;
    QryTransLogFG_LOTNO: TStringField;
    QryTransLogTRANS_REASON: TStringField;
    QryTransLogBATCH: TBCDField;
    QryTransLogBEGIN_QUAN: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN: TFMTBCDField;
    QryTransLogSTD_COST: TFMTBCDField;
    QryTransLogCOST_ELEMENT: TStringField;
    QryTransLogRECEIPTNO: TStringField;
    QryTransLogTRANS_CODE: TStringField;
    QryTransLogTRANS_DESCRIP: TStringField;
    QryTransLogLOCATION_DESCRIP: TStringField;
    QryTransLogEPLANT_ID: TBCDField;
    QryTransLogBEGIN_QUAN_TOTAL: TFMTBCDField;
    QryTransLogBEGIN_RG_QUAN_TOTAL: TFMTBCDField;
    QryTransLogRECV_DATE: TDateTimeField;
    QryTransLogPROD_DATE: TDateTimeField;
    QryTransLogORDERNO: TStringField;
    QryTransLogDESCRIP2: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetAID(AId:Real);
  public
    property Id:Real write SetAID;
    { Public declarations }
  end;

procedure DoSerialDrillDown(AId:Real);


implementation
uses
  IQMS.Common.RegFrm;
{$R *.DFM}

procedure DoSerialDrillDown(AId:Real);
var
  FrmSerDD: TFrmSerDD;
begin
  FrmSerDD:=TFrmSerDD.Create(uniGUIApplication.UniApplication);
  FrmSerDD.Id:=AId;
  FrmSerDD.ShowModal;
end;
procedure TFrmSerDD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmSerDD.SetAID(AId: Real);
begin
//  IqSearch1.wwDBGrid.Color := clBtnFace;
//  IqSearch1.wwDbGrid.CTL3D := False;
  with QryTransLog do
  begin
    Close;
    ParamByName('nId').Value := AId;
    Open;
  end;
end;

procedure TFrmSerDD.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmSerDD.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmSerDD.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

end.
