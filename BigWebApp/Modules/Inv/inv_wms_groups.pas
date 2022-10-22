unit inv_wms_groups;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.Common.JumpConstants,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  vcl.wwdatsrc,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvWmsGroups = class(TUniForm)
    pnlTopMain: TUniPanel;
    dpnlClientMain: TUniPanel;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    wwDBGrid1: TIQUniGridControl;
    SrcWmsInvGroup: TDataSource;
    QryWmsInvGroup: TFDQuery;
    QryWmsInvGroupID: TBCDField;
    QryWmsInvGroupCODE: TStringField;
    QryWmsInvGroupDESCRIP: TStringField;
    UpdateSQLWmsInvGroup: TFDUpdateSQL;
    sbtnSearch: TUniSpeedButton;
    PkWmsInvGroup: TIQWebHPick;
    PkWmsInvGroupID: TBCDField;
    PkWmsInvGroupCODE: TStringField;
    PkWmsInvGroupDESCRIP: TStringField;
    SR: TIQWebSecurityRegister;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtCLASS2: TStringField;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtONHAND: TBCDField;
    QryArinvtEPLANT_ID: TBCDField;
    QryArinvtUNIT: TStringField;
    QryArinvtDESCRIP2: TStringField;
    QryArinvtID: TBCDField;
    QryArinvtWMS_INV_GROUP_ID: TBCDField;
    Panel4: TUniPanel;
    IQSearch1: TIQUniGridControl;
    PkArinvt: TIQWebHPick;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtONHAND: TBCDField;
    PkArinvtID: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtUNIT: TStringField;
    PkArinvtPK_HIDE: TStringField;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure DispatchActionOnChild(Sender: TObject; Button: TNavigateBtn); }
    procedure QryWmsInvGroupBeforePost(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkWmsInvGroupIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);

    procedure AbortInsert(DataSet: TDataSet);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQNotify( var Msg: TMessage ); message iq_Notify;
    procedure AppendItemsToGroup;
    procedure RemoveItemFromGroup(AArinvt_ID: Real);
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  inv_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

const constInsertViaNavigator = 1;

class procedure TFrmInvWmsGroups.DoShow;
var
  LFrmInvWmsGroups : TFrmInvWmsGroups;
begin
  LFrmInvWmsGroups := TFrmInvWmsGroups.Create( UniGUIApplication.UniApplication );
  LFrmInvWmsGroups.Show;
end;

procedure TFrmInvWmsGroups.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmWMS{CHM}, iqhtmWMS{HTM} );
end;

procedure TFrmInvWmsGroups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;


procedure TFrmInvWmsGroups.IQNotify(var Msg: TMessage);
begin
{ TODO -oGPatil -cWebConvert : nbInsert not available
  case Msg.WParam of
    constInsertViaNavigator:
      if navMain.Controls[ Ord(nbInsert) ].Enabled and SR.Enabled['NavMain'] and SR.Insert['NavMain'] then
         navMain.BtnClick( nbInsert );
  end;   }
end;

procedure TFrmInvWmsGroups.PkWmsInvGroupIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action:= mrOK;
  ResultValue:= 0;
  PostMessage( self.Handle, IQ_Notify, constInsertViaNavigator, 0 );   { Call Insert }
end;

procedure TFrmInvWmsGroups.QryWmsInvGroupBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'wms_inv_group' );
  QryWmsInvGroupCODE.asString:= UpperCase(QryWmsInvGroupCODE.asString);
end;

procedure TFrmInvWmsGroups.sbtnSearchClick(Sender: TObject);
begin
  with PkWmsInvGroup do
    if Execute then
       QryWmsInvGroup.Locate('id', GetValue('id'), [])
end;

procedure TFrmInvWmsGroups.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( true, self );
  IQRegFormRead(self, [ self ]);
(* TODO -oGPatil -cWebConvert : Form owner must be UniApplication Error
  LocateOrPickList( self, 0{id}, QryWmsInvGroup, PkWmsInvGroup );  *)
end;

procedure TFrmInvWmsGroups.AbortInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmInvWmsGroups.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmInvWmsGroups.ApplyUpdate(DataSet: TDataSet);
begin
//  IQApplyUpdateToTable( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvWmsGroups.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;  }

procedure TFrmInvWmsGroups.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvWmsGroups.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( HelpContext );
end;

(* TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvWmsGroups.DispatchActionOnChild(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbRefresh:
       CheckRefresh( Sender, Button );
    nbDelete :
       begin
         if IQConfirmYN( inv_rscstr.cTXT0000169 {'Remove this item from the group?'}) then
            RemoveItemFromGroup( QryArinvtID.asFloat );
         ABORT;
       end;
    nbInsert:
       begin
         AppendItemsToGroup;
         ABORT;
       end;
  end;
end;   *)

procedure TFrmInvWmsGroups.RemoveItemFromGroup( AArinvt_ID: Real );
begin
  ExecuteCommandFmt('update arinvt set wms_inv_group_id = null where id = %f', [ AArinvt_ID ]);

  // position on the next rec
  QryArinvt.Next;
  if QryArinvt.Eof then QryArinvt.Prior;
  RefreshDataSetByID( QryArinvt );
end;


procedure TFrmInvWmsGroups.AppendItemsToGroup;
var
  I: Integer;
begin
  QryWmsInvGroup.CheckBrowseMode;

  with PkArinvt do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
         ExecuteCommandFmt('update arinvt set wms_inv_group_id = %f where id = %s', [ QryWmsInvGroupID.asFloat, ResultList[ I ] ]);
      RefreshDataSetByID( QryArinvt );
   end;
end;

end.
