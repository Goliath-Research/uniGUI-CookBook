unit IQMS.Common.TransError;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniLabel,
  uniDBText,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Controls;

type
  TTransError = class(TUniForm)
    Query1: TFDQuery;
    Query1ID: TBCDField;
    Query1TRANS_TYPE: TStringField;
    Query1TRANS_BATCH: TBCDField;
    Query1FGMULTI_ID: TBCDField;
    Query1ERR_MESG: TStringField;
    DataSource1: TDataSource;
    DBMemo1: TUniDBMemo;
    Query1TRANS_IN_OUT: TStringField;
    DBGrid1: TUniDBGrid;
    Panel1: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label5: TUniLabel;
    dbText1: TUniDBText;
    dbText2: TUniDBText;
    dbText3: TUniDBText;
    dbText4: TUniDBText;
    dbText5: TUniDBText;
    Splitter1: TUniSplitter;
    Query2: TFDQuery;
    DataSource2: TDataSource;
    Query2CLASS: TStringField;
    Query2ITEMNO: TStringField;
    Query2REV: TStringField;
    Query2DESCRIP: TStringField;
    Query2UNIT: TStringField;
  private
    procedure SetBatchID(const BatchID: Real);
    { Private declarations }
  public
    { Public declarations }
    property aBatchID : Real write SetBatchID;
  end;

procedure ShowTransError( BatchID : Real; ARaiseException: Boolean = FALSE );
procedure Check_Raise_Exception( ABatchId:Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.ApplicationSet,
  IQMS.DBTrans.dbtdbexp,
  Data.SqlExpr;

procedure ShowTransError( BatchID : Real; ARaiseException: Boolean = FALSE );
var
  S:string;
  ASuppressDisplayRaiseException: Boolean;
begin
  Check_Raise_Exception( BatchId );

  ASuppressDisplayRaiseException:= IQMS.Common.ApplicationSet.NoModalTransactionMessages or IsConsole or ARaiseException;

  with TTransError.Create( uniGUIApplication.UniApplication  ) do
  begin
    aBatchID:=BatchID;
    if ASuppressDisplayRaiseException then
       S:= Query1ERR_MESG.asString     {Store exception text to S}
    else
       ShowModal                       {Show Exception}
  end;

  if ASuppressDisplayRaiseException then     {For console apps or dispo_server - raise exception}
     raise Exception.Create( S );
end;
procedure Check_Raise_Exception( ABatchId:Real );
var
  AppExeName:String;
  ASQLConn : TSQLConnection;
  ATranDesc: TTransactionDesc;
  AStr:String;
begin
 AppExeName := UpperCase(ExtractFileName( Application.ExeName ));
 if (AppExeName = 'IQALERT') or (AppExeName = 'ESERVER') then
 begin
   ASQLConn:= TSQLConnection.Create(nil);
   try
      DBX_ConfigureSQLConnection(ASQLConn, True);                // Configure the SQL Connection
      DBX_ConfigureTransaction(Application.Handle, ATranDesc);   // Configure the transaction record

      AStr := DBX_GetValStrFmt(ASQLConn, 'select e.err_mesg                ' +
                                                  '  from invtrans i, invtrans_err e ' +
                                                  ' where i.trans_batch = %f     ' +
                                                  '   and i.id = e.invtrans_id       ' +
                                                  ' order by e.id ', [ABatchId]);
      raise Exception.Create(AStr);
   finally
     FreeAndNil( ASQLConn );
   end;

 end;

end;


procedure TTransError.SetBatchID(const BatchID: Real);
begin
  with Query1 do
  begin
    Close;
    Params[0].AsFloat:= BatchID;
    Open;
  end;
  Query2.Open;
end;

end.

