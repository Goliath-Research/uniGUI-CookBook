unit IQMS.Common.BulletinBoardEdit;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  vcl.wwdatsrc,
  IQMS.WebVcl.About,
  Vcl.Menus,
  vcl.wwdblook,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, vcl.wwdbgrid,
  uniMainMenu, IQUniGrid, uniGUIFrame, uniBasicGrid, uniDBGrid,PickListDlg,
  uniDBEdit, uniButton, uniMemo, uniDBMemo;

type
  TBulletinBoardEdit = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    srcBulletinBoardEdit: TDataSource;
    qryBulletinBoardEdit: TFDQuery;
    qryBulletinBoardEditID: TBCDField;
    qryBulletinBoardEditUSER_NAME: TStringField;
    qryBulletinBoardEditMESSAGE: TStringField;
    qryBulletinBoardEditMESSAGE_DATE: TDateTimeField;
    updtBulletinBoardEdit: TFDUpdateSQL;
    NavMain: TUniDBNavigator;
    qryBulletinBoardEditSOURCE: TStringField;
    qryBulletinBoardEditSOURCE_ID: TBCDField;
    qryBulletinBoardEditTAG_NAME: TStringField;
    qryBulletinBoardEditSrc: TStringField;
    Contents1: TUniMenuItem;
    UniDBGrid1: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    wwDBLookupComboSource: TUniDBLookupComboBox;
    PKEplant: TFDQuery;
    PKEplantECODE: TStringField;
    PKEplantCOMPANY_NAME: TStringField;
    PKEplantID: TBCDField;
    PKEplantPLANT_NAME: TStringField;
    qrySources: TFDQuery;
    qrySourcesDISPLAY_NAME: TStringField;
    qrySourcesSOURCE: TStringField;
    PkMfg: TFDQuery;
    PkMfgMFGNO: TStringField;
    PkMfgSTANDARD_DESCRIP: TStringField;
    PkMfgMFG_TYPE: TStringField;
    PkMfgITEMNO: TStringField;
    PkMfgREV: TStringField;
    PkMfgDESCRIP: TStringField;
    PkMfgDESCRIP2: TStringField;
    PkMfgCOMPANY: TStringField;
    PkMfgID: TBCDField;
    PkMfgROUTE_SEQ: TBCDField;
    PkMfgEFFECT_DATE: TDateTimeField;
    PkMfgDEACTIVE_DATE: TDateTimeField;
    PkMfgPK_HIDE: TStringField;
    PkMfgCUSER1: TStringField;
    PkMfgCUSER2: TStringField;
    PkMfgCUSER3: TStringField;
    PkMfgCUSER4: TStringField;
    PkMfgCUSER5: TStringField;
    PkMfgCUSER6: TStringField;
    PkArinvt: TFDQuery;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtONHAND: TBCDField;
    PkArinvtID: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtCUSTOMER_NAME: TStringField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    PkArinvtNON_CONFORM_TOTAL: TBCDField;
    PkArinvtNON_ALLOCATE_TOTAL: TBCDField;
    PkArinvtUNIT: TStringField;
    PkArinvtCONFIG_CODE: TStringField;
    PkArinvtPROD_CODE: TStringField;
    PkArinvtNON_COMMITTED: TFMTBCDField;
    PkMfgCell: TFDQuery;
    PkArcusto: TFDQuery;
    PkWorkCntr: TFDQuery;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TBCDField;
    PkArcustoEPLANT_ID: TBCDField;
    PkArcustoACTIVE_TYPE: TStringField;
    PkWorkCntrEQNO: TStringField;
    PkWorkCntrCNTR_DESC: TStringField;
    PkWorkCntrCNTR_TYPE: TStringField;
    PkWorkCntrID: TBCDField;
    PkWorkCntrEPLANT_NAME: TStringField;
    PkWorkCntrMFGCELL: TStringField;
    PkWorkCntrDIVISION_NAME: TStringField;
    PkWorkCntrPK_HIDE: TStringField;
    PkWorkCntrMFG_TYPE: TStringField;
    PkWorkCntrEPLANT_ID: TBCDField;
    CmDlgTag: TUniDBLookupComboBox;
    cmbDlgMessage: TUniDBLookupComboBox;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure qryBulletinBoardEditNewRecord(DataSet: TDataSet);
    procedure cmbDlgMessageCustomDlg(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbDlgTagCustomDlg(Sender: TObject);
    procedure FilterEplant(DataSet: TDataSet);
    procedure qryBulletinBoardEditSOURCEChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryBulletinBoardEditBeforePost(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure qryBulletinBoardEditAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    function FormMemoMessage(var Msg:String ) : Boolean;
  public
    { Public declarations }
    class procedure AddOrEdit;
  end;

var
  BulletinBoardEdit1: TBulletinBoardEdit;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.HelpHook;

{ TBulletinBoardEdit }

class procedure TBulletinBoardEdit.AddOrEdit;
var
   form : TBulletinBoardEdit;
begin
  form := TBulletinBoardEdit.Create(uniGUIApplication.UniApplication);
  form.ShowModal;
end;

procedure TBulletinBoardEdit.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TBulletinBoardEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  IQRegFormWrite( self, [ wwDBGrid1 ] );
end;

procedure TBulletinBoardEdit.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  //IQRegFormRead( self, [ wwDBGrid1 ] );
end;

function TBulletinBoardEdit.FormMemoMessage(var Msg: String): Boolean;
var
  frm : TUniForm;
  MemoEdit : TUniMemo;
  ButtonOk,ButtonCancel:TUniButton;
  Panel : TUniPanel;
begin
   Result:=False;
   frm        := TUniForm.Create(uniGUIApplication.UniApplication);
   frm.Width  := 400;
   frm.Height := 300;
   frm.Caption:= 'Message';

   MemoEdit:=TUniMemo.Create(frm);
   with MemoEdit do
   begin
     Parent:= frm;
     Height:= 230;
     Align := alTop;
     Lines.Text:=Msg;
   end;

   Panel := TUniPanel.Create(frm) ;
   Panel.Parent  := frm;
   Panel.Align   := alClient;

   ButtonOk        := TUniButton.Create(Panel);
   ButtonOK.Parent := Panel;
   ButtonOK.Width  := 60;
   ButtonOk.Height := 40;
   ButtonOk.Caption:='OK';
   ButtonOk.Align  := alRight;
   ButtonOK.ModalResult := mrOk;

   ButtonCancel       := TUniButton.Create(Panel);
   ButtonCancel.Parent := Panel;
   ButtonCancel.Width := 60;
   ButtonCancel.Height:= 40;
   ButtonCancel.Align  := alRight;
   ButtonCancel.Caption:='Cancel';
   ButtonCancel.ModalResult := mrCancel;

   Result := frm.ShowModal = MrOk;
   if Result  then
      Msg:=MemoEdit.Text;
end;

procedure TBulletinBoardEdit.FilterEplant(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );  {pas}
  Dataset.Filtered := True;
end;

procedure TBulletinBoardEdit.qryBulletinBoardEditAfterPost(DataSet: TDataSet);
begin
  qryBulletinBoardEdit.Refresh;
end;

procedure TBulletinBoardEdit.qryBulletinBoardEditBeforePost(DataSet: TDataSet);
begin
  if qryBulletinBoardEditUSER_NAME.IsNull then
    qryBulletinBoardEditUSER_NAME.AsString := SecurityManager.UserName;
end;

procedure TBulletinBoardEdit.qryBulletinBoardEditNewRecord(DataSet: TDataSet);
begin
  if qryBulletinBoardEditID.IsNull then
    qryBulletinBoardEditID.AsFloat := GetNextID('BULLETIN_CONV');
end;

procedure TBulletinBoardEdit.qryBulletinBoardEditSOURCEChange(Sender: TField);
begin
  qryBulletinBoardEditSOURCE_ID.Clear;
  cmbDlgTagCustomDlg(nil);
end;

procedure TBulletinBoardEdit.cmbDlgMessageCustomDlg(Sender: TObject);
var
  Msg:String;
begin
  Msg:=qryBulletinBoardEditMESSAGE.AsString;
  if FormMemoMessage(Msg) then
  begin
     qryBulletinBoardEdit.Edit;
     qryBulletinBoardEditMESSAGE.asString:= Msg;
     qryBulletinBoardEdit.Post;
  end;
end;

procedure TBulletinBoardEdit.cmbDlgTagCustomDlg(Sender: TObject);
var
  id:Integer;

  function _DoPickSource(ASource:string; APicker:TDataSet):Boolean;
  begin
    Result:= false;
    if not (qryBulletinBoardEditSOURCE.AsString = ASource) then
      EXIT;

    id:=DoSinglePickList(APicker,id);
    if id>0 then

//    with APicker do
//      if Execute then
      begin
       qryBulletinBoardEdit.Edit;
       qryBulletinBoardEditSOURCE_ID.asFloat:= id; // GetValue('ID');
       qryBulletinBoardEditTAG_NAME.asString:= SelectValueFmtAsString('select rt_misc.getTagname(''%s'', %.0f) from dual',
         [ qryBulletinBoardEditSOURCE.AsString, DtoF( id {GetValue('ID')}) ]);
       qryBulletinBoardEdit.Post;
      end;
  end;
begin
  // jason todo
  if qryBulletinBoardEditSOURCE.AsString = '' then
    raise Exception.Create('Please select a Source first!');

  if      _DoPickSource('EPLANT',     PkEplant)   then EXIT
  else if _DoPickSource('MFGCELL',    PkMfgCell)  then EXIT
  else if _DoPickSource('WORK_CENTER',PkWorkCntr) then EXIT
  else if _DoPickSource('STANDARD',   PkMfg)      then EXIT
  else if _DoPickSource('ARINVT',     PkArinvt)   then EXIT
  else if _DoPickSource('ARCUSTO',    PkArcusto)  then EXIT
end;

procedure TBulletinBoardEdit.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TBulletinBoardEdit.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TBulletinBoardEdit.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmEIQ{CHM}, iqhtmEIQ{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
