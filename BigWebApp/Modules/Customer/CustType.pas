unit CustType;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.SecurityRegister,
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
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator;

type
  TFrmCust_Type = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    TblTypes: TFDTable;
    TblTypesID: TBCDField;
    TblTypesDESCRIP: TStringField;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    procedure FormCreate(Sender: TObject);
    procedure TblTypesBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoCustomerTiersType;

implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;
  //IQSecIns;

procedure DoCustomerTiersType;
var
  LFrmCust_Type : TFrmCust_Type;
begin
  LFrmCust_Type := TFrmCust_Type.Create( uniGUIApplication.UniApplication );
  LFrmCust_Type.ShowModal;
end;

procedure TFrmCust_Type.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmCust_Type.TblTypesBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmCust_Type.FormShow(Sender: TObject);
begin
{ TODO -oysingh -cWeb Convert : Dependent on security inspector }
 // EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmCust_Type.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmCust_Type.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
