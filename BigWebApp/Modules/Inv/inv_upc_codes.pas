unit inv_upc_codes;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  Vcl.Menus,
  IQMS.WebVcl.SecurityRegister,
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
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvUPCCodes = class(TUniForm)
    pnlLeft01: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    IQSearch1: TIQUniGridControl;
    Panel3: TUniPanel;
    wwDBGridUPC: TIQUniGridControl;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtID: TBCDField;
    QryArinvtCLASS: TStringField;
    QryArinvtITEMNO: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtEPLANT_ID: TBCDField;
    SrcArinvt_UPC: TDataSource;
    QryArinvt_UPC: TFDQuery;
    QryArinvt_UPCID: TBCDField;
    QryArinvt_UPCARINVT_ID: TBCDField;
    QryArinvt_UPCUPC_CODE: TStringField;
    QryArinvt_UPCQTY: TFMTBCDField;
    UpdateSQLArinvt_UPC: TFDUpdateSQL;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryArinvt_UPCSEQ: TBCDField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryArinvt_UPCNewRecord(DataSet: TDataSet);
    procedure QryArinvt_UPCBeforePost(DataSet: TDataSet);
    procedure ApplyUpdatesToTable(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);   }
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetArinvt_ID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property Arinvt_ID: Real write SetArinvt_ID;
    class procedure DoShowModal( AArinvt_ID: Real = 0 );
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
{ TODO -oGPatil -cWebConvert : Dependency on Files
  IQSecIns,   }
  IQMS.Common.HelpHook;

class procedure TFrmInvUPCCodes.DoShowModal(AArinvt_ID: Real);
var
  LFrmInvUPCCodes : TFrmInvUPCCodes;
begin
  LFrmInvUPCCodes := TFrmInvUPCCodes.Create(UniGUIApplication.UniApplication);
  LFrmInvUPCCodes.Arinvt_ID := AArinvt_ID;
  LFrmInvUPCCodes.ShowModal;
end;

procedure TFrmInvUPCCodes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlLeft01, wwDBGridUPC ]);
end;

procedure TFrmInvUPCCodes.QryArinvt_UPCNewRecord(DataSet: TDataSet);
begin
  QryArinvt_UPCID.asFloat:=0;
  QryArinvt_UPCARINVT_ID.AsFloat:= QryArinvtID.asFloat;
  QryArinvt_UPCSeq.AsFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from arinvt_upc where arinvt_id = %f', [ QryArinvtID.asFloat ]);
end;

procedure TFrmInvUPCCodes.SetArinvt_ID(const Value: Real);
begin
  if Value > 0 then
     IQAssert( QryArinvt.Locate( 'ID', Value, []), Format('Unable to locate Arinvt_ID = %.0f', [ Value ]));
end;

procedure TFrmInvUPCCodes.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, pnlLeft01, wwDBGridUPC ]);
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.ResizeNavBar(NavUpcCodes); }
end;

procedure TFrmInvUPCCodes.QryArinvt_UPCBeforePost(DataSet: TDataSet);
begin
  IQAssert( QryArinvt_UPCQTY.asFloat > 0, 'Qty must be greater than 0.');

  if QryArinvt_UPCID.asFloat = 0 then
     QryArinvt_UPCID.asFloat:= GetNextID('arinvt_upc');
end;

procedure TFrmInvUPCCodes.ApplyUpdatesToTable(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvUPCCodes.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button );
end; }

procedure TFrmInvUPCCodes.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvUPCCodes.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvUPCCodes.FormShow(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : Dependency on Files
  EnsureSecurityInspectorOnTopOf( self );  {IQSecIns.pas}
end;

procedure TFrmInvUPCCodes.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmINVENTORY{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmInvUPCCodes.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(Self.HelpContext);
end;

end.
