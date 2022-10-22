unit ProdRprLst;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
//  Vcl.Wwdatsrc,
//  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmProdRepairList = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Splitter1: TUniSplitter;
    SrcProdCode: TDataSource;
    QryProdCode: TFDQuery;
    SrclRepairItemList: TDataSource;
    TblRepairItemList: TFDTable;
    QryProdCodeID: TBCDField;
    QryProdCodeCODE: TStringField;
    QryProdCodeDESCRIP: TStringField;
    TblRepairItemListID: TBCDField;
    TblRepairItemListPROD_CODE_ID: TBCDField;
    TblRepairItemListARINVT_ID: TBCDField;
    TblRepairItemListItemNo: TStringField;
    TblRepairItemListClass: TStringField;
    TblRepairItemListRev: TStringField;
    TblRepairItemListDescription: TStringField;
    PkArinvt: TIQWebHPick;
    PkArinvtID: TBCDField;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtDESCRIP2: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    PnlDetail: TUniPanel;
    Panel2: TUniPanel;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Panel15: TUniPanel;
    PnlGridDetail: TUniPanel;
    wwDBComboBoxItemNo: TUniDBComboBox;
    wwDBGrid1: TIQUniGridControl;
    Bevel3: TUniPanel;
    TblRepairItemListQTY: TFMTBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    TblRepairItemListDescrip2: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{ TODO -oLema : To find a workaround to Grid.CalcCellColors }
//    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//      ABrush: TBrush);
    procedure wwDBComboBoxItemNoDropDown(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure TblRepairItemListBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  { TODO -oLema : to see if posting a message is working here }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oLema : Dependent on IQSecIns }
//  IQSecIns,
  rma_rscstr;

class procedure TFrmProdRepairList.DoShowModal;
var
  frm: TFrmProdRepairList;
begin
  frm:= TFrmProdRepairList.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmProdRepairList.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.ResizeNavBar(DBNavigator1);
end;

procedure TFrmProdRepairList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

{
procedure TFrmProdRepairList.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if not Highlight and not Field.ReadOnly then
     ABrush.Color:= clWindow;
end;
}

procedure TFrmProdRepairList.wwDBComboBoxItemNoDropDown(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
    begin
      TblRepairItemList.Edit;
      TblRepairItemListARINVT_ID.asFloat:= GetValue('ID');
    end;
end;


procedure TFrmProdRepairList.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
     PostMessage( self.Handle, iq_Notify, 0, 0 );  {notify about insert}
end;


procedure TFrmProdRepairList.IQNotify(var Msg: TMessage);
begin
  wwDBComboBoxItemNoDropDown( NIL );
end;

procedure TFrmProdRepairList.TblRepairItemListBeforePost(
  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmProdRepairList.FormShow(Sender: TObject);
begin
  { TODO -oLema : Dependent on IQSecIns }
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmProdRepairList.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSHIP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
