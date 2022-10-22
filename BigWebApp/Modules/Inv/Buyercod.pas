unit Buyercod;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
//  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  Vcl.Menus,
  Vcl.DBCtrls,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmBuyerCode = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    IQSearch1: TIQUniGridControl;
    SrcBC: TDataSource;
    QryBC: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    QryBCID: TBCDField;
    QryBCBUYER_CODE: TStringField;
    QryBCDESCRIP: TStringField;
    IQAbout1: TIQWebAbout;
    Contents1: TUniMenuItem;
    procedure QryBCAfterPost(DataSet: TDataSet);
    procedure QryBCBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSet:TDataSet;
    function GetDataSet: TDataSet;
    procedure SetDataSet(Value: TDataSet);
  public
    { Public declarations }
    property DataSet : TDataset read GetDataSet write SetDataSet;
  end;

procedure DoBuyerCode(ADataSet:TDataSet = nil);


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

{$R *.DFM}

procedure DoBuyerCode(ADataSet:TDataSet = nil);
var
  frm : TFrmBuyerCode;
begin
  frm := TFrmBuyerCode.Create(uniGUIApplication.UniApplication);
  frm.DataSet := ADataSet;
  frm.Show;
end;

procedure TFrmBuyerCode.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
  QryBC.Open;
end;


procedure TFrmBuyerCode.QryBCAfterPost(DataSet: TDataSet);
begin
{
  try
    QryBC.DataBase.ApplyUpdates( [ QryBC ]);
    if Assigned(FdataSet) and (FDataSet <> nil) then
    begin
      FdataSet.Close;
      FdataSet.Open;
    end;
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryBC.Close;
      QryBC.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmBuyerCode.QryBCBeforePost(DataSet: TDataSet);
begin
  if QryBCID.asFloat = 0 then
     QryBCID.asFloat:= GetNextID('BUYER_CODE');
end;



procedure TFrmBuyerCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
  if Assigned(FdataSet) and (FDataSet <> nil) then
  begin
    FdataSet.Close;
    FdataSet.Open;
  end;
//  Action := caFree;
end;

procedure TFrmBuyerCode.SetDataSet(Value: TDataSet);
begin
   FDataSet := Value;
end;

function TFrmBuyerCode.GetDataSet: TDataSet;
begin
  result := FDataSet;
end;

procedure TFrmBuyerCode.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmBuyerCode.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBuyerCode.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    QryBC.Close;
    QryBC.Open;
    if Assigned(FdataSet) and (FDataSet <> nil) then
    begin
      FdataSet.Close;
      FdataSet.Open;
    end;
    Abort;
  end;
end;

procedure TFrmBuyerCode.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmBuyerCode.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

end.
