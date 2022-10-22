unit Cust_Category;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
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
  uniLabel, IQUniGrid, uniGUIFrame, uniMultiItem, uniComboBox, uniDBComboBox;

type
  TFrmCustCategory = class(TUniForm)
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
    QryCustomers: TFDQuery;
    SrcCustomers: TDataSource;
    PkLinkedArcusto: TIQWebHPick;
    PkLinkedArcustoCUSTNO: TStringField;
    PkLinkedArcustoCOMPANY: TStringField;
    PkLinkedArcustoADDR1: TStringField;
    PkLinkedArcustoCITY: TStringField;
    PkLinkedArcustoSTATE: TStringField;
    PkLinkedArcustoCOUNTRY: TStringField;
    PkLinkedArcustoZIP: TStringField;
    PkLinkedArcustoPHONE_NUMBER: TStringField;
    PkLinkedArcustoPRIME_CONTACT: TStringField;
    PkLinkedArcustoID: TFloatField;
    PkLinkedArcustoADDR2: TStringField;
    PkLinkedArcustoADDR3: TStringField;
    PkLinkedArcustoEPLANT_ID: TFloatField;
    QryCustomersCUSTNO: TStringField;
    QryCustomersCOMPANY: TStringField;
    QryCustomersADDR1: TStringField;
    QryCustomersADDR2: TStringField;
    QryCustomersADDR3: TStringField;
    QryCustomersCITY: TStringField;
    QryCustomersSTATE: TStringField;
    QryCustomersCOUNTRY: TStringField;
    QryCustomersZIP: TStringField;
    QryCustomersPHONE_NUMBER: TStringField;
    QryCustomersPRIME_CONTACT: TStringField;
    QryCustomersEPLANT_ID: TBCDField;
    Reports1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    PkCategory: TIQWebHPick;
    PkCategoryID: TFloatField;
    PkCategoryCODE: TStringField;
    PkCategoryDESCRIP: TStringField;
    popmCustomers: TUniPopupMenu;
    JumpToCustomer1: TUniMenuItem;
    IQJumpCust: TIQWebJump;
    PkArcusto: TIQWebHPick;
    PkArcustoCUSTNO: TStringField;
    PkArcustoCOMPANY: TStringField;
    PkArcustoADDR1: TStringField;
    PkArcustoCITY: TStringField;
    PkArcustoSTATE: TStringField;
    PkArcustoCOUNTRY: TStringField;
    PkArcustoZIP: TStringField;
    PkArcustoPHONE_NUMBER: TStringField;
    PkArcustoPRIME_CONTACT: TStringField;
    PkArcustoID: TFloatField;
    PkArcustoADDR2: TStringField;
    PkArcustoADDR3: TStringField;
    PkArcustoEPLANT_ID: TFloatField;
    QryCustomersID: TBCDField;
    QryCustomersARCUSTO_CATEGORY_ID: TBCDField;
    QryCustomersARCUSTO_ID: TBCDField;
    PkLinkedArcustoARCUSTO_ID: TFloatField;
    PkArcustoARCUSTO_CAT_LINK_ID: TFloatField;
    Contents1: TUniMenuItem;
    procedure Close1Click(Sender: TObject);
    procedure DefineLabelText1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PkLinkedArcustoBeforeOpen(DataSet: TDataSet);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkCategoryIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure JumpToCustomer1Click(Sender: TObject);
    procedure QryCategoryBeforePost(DataSet: TDataSet);
    { TODO : TNavigateBtn not yet converted }
    //procedure NavDetailsBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure PkArcustoIQAfterHPickCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    FHelpContext: THelpContext;
    procedure AssociateCustomersToCategory;
    { TODO : TGridDrawState not yet converted }
   { procedure IQSearchUsersCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush); }
    function IsHelpContextStored: Boolean;
    procedure SetHelpContext(const Value: THelpContext);
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
    property HelpContext: THelpContext read FHelpContext write SetHelpContext stored IsHelpContextStored default 0;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook,
  IQMS.WebVcl.SearchPickList;

class procedure TFrmCustCategory.DoShow;
var
  LFrmCustCategory : TFrmCustCategory;
begin
  LFrmCustCategory := TFrmCustCategory.Create(UniGUIApplication.UniApplication);
  LFrmCustCategory.Show;
end;

procedure TFrmCustCategory.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmCustCategory.Close1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmCustCategory.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmCustCategory.FormActivate(Sender: TObject);
begin
  Self.HelpContext := 22612;  // EIQ-4985 New Map ID for Customer Categories
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch3{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmCustCategory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1, Panel1, Panel5, Panel6, Panel9 ]);
end;


procedure TFrmCustCategory.JumpToCustomer1Click(Sender: TObject);
begin
  IQJumpCust.Execute
end;

{ TODO : TNavigateBtn not yet converted }
{procedure TFrmCustCategory.NavDetailsBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  case Button of
     nbInsert:
       begin
         QryCustomers.Cancel;
         AssociateCustomersToCategory;
         ABORT;
       end;
  end;
end;    }

procedure TFrmCustCategory.DefineLabelText1Click(Sender: TObject);
begin
  (PopupUserDefLabel.PopupComponent as TIQWebUserDefLabel).Execute;
end;


procedure TFrmCustCategory.PkLinkedArcustoBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'id', QryCategoryID.asFloat);
//  TFDQuery(DataSet).ParamByName('id').Value := QryCategoryID.asFloat;
end;

procedure TFrmCustCategory.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmCustCategory.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmCustCategory.QryCategoryBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'arcusto_category');
end;

procedure TFrmCustCategory.sbtnSearchClick(Sender: TObject);
begin
  with PkCategory do
    if Execute then
       QryCategory.Locate('id', GetValue('id'), [])
end;

procedure TFrmCustCategory.SetHelpContext(const Value: THelpContext);
begin
  FHelpContext := Value;
end;

procedure TFrmCustCategory.SpeedButton1Click(Sender: TObject);
begin
  with PkLinkedArcusto do
    if Execute then
       QryCustomers.Locate('id', GetValue('id'), [])
end;

procedure TFrmCustCategory.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1, Panel1, Panel5, Panel6, Panel9 ]);
  LocateOrPickList( self, 0, QryCategory, PkCategory );
end;

procedure TFrmCustCategory.PkCategoryIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  SendInsertViaNavigator( NavMain, Action, ResultValue, SR );
end;

procedure TFrmCustCategory.AssociateCustomersToCategory;
var
  I: Integer;
begin
  QryCategory.CheckBrowseMode;
  with PkArcusto do
   if ExecuteEx('ID') then
   begin
      for I:= 0 to ResultList.Count - 1 do
      begin
        if SelectValueFmtAsFloat('select 1 from arcusto_cat_link where arcusto_category_id = %f and arcusto_id = %s',
           [ QryCategoryID.asFloat, ResultList[ I ]]) = 0 then
        begin
          ExecuteCommandFmt('insert into arcusto_cat_link( arcusto_category_id, arcusto_id ) values(%f, %s)',
                    [ QryCategoryID.asFloat, ResultList[ I ] ]);
        end;
      end;
      QryCustomers.Refresh;
   end;
end;

procedure TFrmCustCategory.PkArcustoIQAfterHPickCreate(Sender: TObject);
begin
  { TODO : TIQUniGridControl has no member OnCalcCellColors }
  //TFrmIQSearchPickList(Sender).IQSearch1.OnCalcCellColors:= IQSearchUsersCalcCellColors;  // IQMS.WebVcl.SearchPickList.pas
end;

{ TODO : TGridDrawState not yet converted }
{procedure TFrmCustCategory.IQSearchUsersCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
var
  ALinkExists: Boolean;
begin
  if PkArcustoARCUSTO_CAT_LINK_ID.asFloat = 0 then
     EXIT;

  case Highlight of
    FALSE:
         begin
           ABrush.Color:= clWhite;
           AFont.Color := clGreen;
         end;
    TRUE :
         begin
           ABrush.Color:= clBlack;
           AFont.Color := clLime;
         end
  end;
end;     }

function TFrmCustCategory.IsHelpContextStored: Boolean;
begin

end;

end.
