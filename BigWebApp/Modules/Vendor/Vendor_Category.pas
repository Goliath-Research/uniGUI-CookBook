unit vendor_category;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
//  Vcl.Graphics,
  Vcl.DBCtrls, //TNavigateBtn
  Vcl.Controls,
  Vcl.Forms,
//  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.About,
  IQMS.WebVcl.UDComboBox,
  IQMS.WebVcl.UserDefinedLabel,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.Jump,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniMemo,
  uniDBMemo,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniMultiItem,
  uniComboBox, uniDBComboBox, Vcl.Dialogs;

type
  TFrmVendorCategory = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Panel6: TUniPanel;
    Panel7: TUniPanel;
    Splitter2: TUniSplitter;
    Splitter3: TUniSplitter;
    Panel8: TUniPanel;
    Splitter4: TUniSplitter;
    Panel9: TUniPanel;
    Panel10: TUniPanel;
    navMain: TUniDBNavigator;
    sbtnSearch: TUniSpeedButton;
    SpeedButton1: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    IQAbout1: TIQWebAbout;
    SR: TIQWebSecurityRegister;
    IQRepDef1: TIQWebRepDef;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DBEdit1: TUniDBEdit;
    DBEdit2: TUniDBEdit;
    DBMemo1: TUniDBMemo;
    IQUserDefLabel1: TIQWebUserDefLabel;
    IQUserDefLabel2: TIQWebUserDefLabel;
    IQUserDefLabel3: TIQWebUserDefLabel;
    DBEdit46: TIQWebUDComboBox;
    DBEdit47: TIQWebUDComboBox;
    DBEdit48: TIQWebUDComboBox;
    IQUserDefLabel4: TIQWebUserDefLabel;
    IQUserDefLabel5: TIQWebUserDefLabel;
    IQUserDefLabel6: TIQWebUserDefLabel;
    DBEdit49: TUniDBEdit;
    DBEdit50: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    wwDBGrid1: TIQUniGridControl;
    PopupUserDefLabel: TUniPopupMenu;
    DefineLabelText1: TUniMenuItem;
    QryCategory: TFDQuery;
    SrcCategory: TDataSource;
    QryVendors: TFDQuery;
    SrcVendors: TDataSource;
    QryCategoryID: TBCDField;
    QryCategoryCODE: TStringField;
    QryCategoryDESCRIP: TStringField;
    QryCategoryCUSER1: TStringField;
    QryCategoryCUSER2: TStringField;
    QryCategoryCUSER3: TStringField;
    QryCategoryNUSER1: TFMTBCDField;
    QryCategoryNUSER2: TFMTBCDField;
    QryCategoryNUSER3: TFMTBCDField;
    QryCategoryNOTE1: TStringField;
    PkCategory: TIQWebHPick;
    PkCategoryID: TBCDField;
    PkCategoryCODE: TStringField;
    PkCategoryDESCRIP: TStringField;
    PkLinkedVendor: TIQWebHPick;
    PkLinkedVendorVENDORNO: TStringField;
    PkLinkedVendorCOMPANY: TStringField;
    PkLinkedVendorCITY: TStringField;
    PkLinkedVendorSTATE: TStringField;
    PkLinkedVendorZIP: TStringField;
    PkLinkedVendorID: TBCDField;
    PkLinkedVendorADDR1: TStringField;
    PkLinkedVendorADDR2: TStringField;
    PkLinkedVendorADDR3: TStringField;
    PkVendor: TIQWebHPick;
    PkVendorVENDORNO: TStringField;
    PkVendorCOMPANY: TStringField;
    PkVendorCITY: TStringField;
    PkVendorSTATE: TStringField;
    PkVendorZIP: TStringField;
    PkVendorID: TBCDField;
    PkVendorADDR1: TStringField;
    PkVendorADDR2: TStringField;
    PkVendorADDR3: TStringField;
    PkLinkedVendorVENDOR_ID: TBCDField;
    PkVendorPK_HIDE: TStringField;
    PkVendorVENDOR_CAT_LINK_ID: TBCDField;
    popmVendors: TUniPopupMenu;
    IQJumpVendor: TIQWebJump;
    JumpToVendor1: TUniMenuItem;
    QryVendorsID: TBCDField;
    QryVendorsVENDOR_ID: TBCDField;
    QryVendorsVENDOR_CATEGORY_ID: TBCDField;
    QryVendorsVENDORNO: TStringField;
    QryVendorsCOMPANY: TStringField;
    QryVendorsCITY: TStringField;
    QryVendorsSTATE: TStringField;
    QryVendorsZIP: TStringField;
    QryVendorsADDR1: TStringField;
    QryVendorsADDR2: TStringField;
    QryVendorsADDR3: TStringField;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Contents1: TUniMenuItem;
    FDUpdateSQL_Category: TFDUpdateSQL;
    FDUpdateSQL_Vendors: TFDUpdateSQL;
    procedure Close1Click(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure JumpToVendor1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure QryCategoryBeforePost(DataSet: TDataSet);
    procedure sbtnSearchClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PkCategoryIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure PkVendorIQAfterHPickCreate(Sender: TObject);
    procedure NavDetailsBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure PkLinkedVendorBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SRAfterApply(Sender: TObject);
    procedure QryCategoryNewRecord(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FHelpContext: THelpContext;
    procedure AssociateVendorsToCategory;
{ TODO -oLema : To find a workaround to CalcCellColors }
//    procedure IQSearchUsersCalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure SetHelpContext(const Value: THelpContext);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
    property HelpContext: THelpContext read FHelpContext write SetHelpContext;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.SearchPickList,
  IQMS.Common.StringUtils;


procedure TFrmVendorCategory.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(True, Self);
{ TODO -oLema : getting Exception :'Form Owner must be UniApplication'. }
  LocateOrPickList(Self, 0, QryCategory, PkCategory);
end;

class procedure TFrmVendorCategory.DoShow;
var
  frm : TFrmVendorCategory;
begin
  frm := TFrmVendorCategory.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmVendorCategory.FormShow(Sender: TObject);
begin
  IQRegFormRead(Self, [Self, wwDBGrid1, Panel1, Panel5, Panel6, Panel9]);
end;

procedure TFrmVendorCategory.FormActivate(Sender: TObject);
begin
  Self.HelpContext := 22616; //EIQ-4985 New Map ID for Customer Categories
  IQHelp.AssignHTMLFile(iqchmSETUP{CHM}, iqhtmSETUPch3{HTM} ); {IQMS.Common.HelpHook.pas}
end;

procedure TFrmVendorCategory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, wwDBGrid1, Panel1, Panel5, Panel6, Panel9]);
end;

procedure TFrmVendorCategory.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmVendorCategory.Close1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmVendorCategory.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(Self.HelpContext);
end;

procedure TFrmVendorCategory.JumpToVendor1Click(Sender: TObject);
begin
  IQJumpVendor.Execute;
end;


procedure TFrmVendorCategory.NavDetailsBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
    nbInsert:
      begin
        QryVendors.Cancel;
        AssociateVendorsToCategory;
        System.SysUtils.Abort;
      end;
  end;
end;


procedure TFrmVendorCategory.PkCategoryIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  SendInsertViaNavigator(navMain, Action, ResultValue, SR);
end;

procedure TFrmVendorCategory.PkLinkedVendorBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'ID', QryCategoryID.AsLargeInt);
end;

procedure TFrmVendorCategory.PkVendorIQAfterHPickCreate(Sender: TObject);
begin
{ TODO -oLema : To find a workaround to CalcCellColors }
//  TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors := IQSearchUsersCalcCellColors;

  //IQMS.WebVcl.SearchPickList.pas
end;


{
procedure TFrmVendorCategory.IQSearchUsersCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  ALinkExists: Boolean;
begin
  if PkVendorVENDOR_CAT_LINK_ID.AsLargeInt = 0 then
    Exit;

  case Highlight of
    False:
      begin
        ABrush.Color := clWhite;
        AFont.Color := clGreen;
      end;
    True:
      begin
        ABrush.Color := clBlack;
        AFont.Color := clLime;
      end
  end;
end;
}


procedure TFrmVendorCategory.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmVendorCategory.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmVendorCategory.QryCategoryBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'vendor_category');
end;

procedure TFrmVendorCategory.QryCategoryNewRecord(DataSet: TDataSet);
begin
  QryCategoryID.AsLargeInt := GetNextID('VENDOR_CATEGORY');
end;

procedure TFrmVendorCategory.sbtnSearchClick(Sender: TObject);
begin
  with PkCategory do
    if Execute then
      QryCategory.Locate('id', GetValue('id'), [])
end;

procedure TFrmVendorCategory.SetHelpContext(const Value: THelpContext);
begin
  FHelpContext := Value;
end;

procedure TFrmVendorCategory.SpeedButton1Click(Sender: TObject);
begin
  with PkLinkedVendor do
    if Execute then
      QryVendors.Locate('id', GetValue('id'), [])
end;

procedure TFrmVendorCategory.SRAfterApply(Sender: TObject);
begin
{ TODO -oLema : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator' }
//  IQMS.Common.Controls.AutoSizeNavBar(navMain);
//  IQMS.Common.Controls.AutoSizeNavBar(NavDetails);

end;


procedure TFrmVendorCategory.AssociateVendorsToCategory;
var
  I: Integer;
begin
  QryCategory.CheckBrowseMode;
  with PkVendor do
    if ExecuteEx('ID') then
    begin
      for I := 0 to ResultList.Count - 1 do
      begin
        if SelectValueFmtAsInteger(
          'select 1 from vendor_cat_link where vendor_category_id = %d and vendor_id = %s',
          [QryCategoryID.AsLargeInt, ResultList[I]]) = 0 then
        begin
          ExecuteCommandFmt(
            'insert into vendor_cat_link( vendor_category_id, vendor_id ) values(%d, %s)',
            [QryCategoryID.AsLargeInt, ResultList[I]]);
        end;
      end;
      QryVendors.Refresh;
    end;
end;

procedure TFrmVendorCategory.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;

end.
