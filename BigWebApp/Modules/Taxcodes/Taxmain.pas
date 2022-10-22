unit TaxMain;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  Tax_DM,
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  Wwdbdlg,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniDBText,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFormTaxMain = class(TUniForm)
    MainMenu1: TUniMainMenu;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    SBToggle: TUniSpeedButton;
    pcMain: TUniPageControl;
    TabCodes: TUniTabSheet;
    TabElements: TUniTabSheet;
    Reports2: TUniMenuItem;
    Print1: TUniMenuItem;
    PrintSetup1: TUniMenuItem;
    ListofTaxCodes2: TUniMenuItem;
    ListofElements2: TUniMenuItem;
    N2: TUniMenuItem;
    Userdefined2: TUniMenuItem;
    N3: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PnlTaxCodePCCarrier: TUniPanel;
    pcTaxCodes: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    Splitter1: TUniSplitter;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQSearch1: TIQUniGridControl;
    IQSearch2: TIQUniGridControl;
    wwDBComboDlg1: TUniEdit;
    PnlTaxElements: TUniPanel;
    PnlToolbar: TUniPanel;
    PnlToolbarCaption: TUniPanel;
    lblCaptionLabel: TUniLabel;
    PnlToolbarInner: TUniPanel;
    PnlTaxElementsGrid: TUniPanel;
    PnlTaxCodesForm: TUniPanel;
    Splitter2: TUniSplitter;
    PnlTaxCodesFormLeft: TUniPanel;
    PnlTaxCodesFormClient: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    DBEditTaxCode: TUniDBEdit;
    DBEditDescript: TUniDBEdit;
    DBTextTaxRate: TUniDBText;
    DBInclFreight: TUniDBCheckBox;
    Label4: TUniLabel;
    wwDBGrid1: TIQUniGridControl;
    wwDBComboDlg2: TUniEdit;
    sbtnWebServices: TUniSpeedButton;
    procedure SBToggleClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabFormEnter(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    { TODO -oathite -cWebConvert : Undeclared identifier: 'TNavigateBtn'
    procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);       }
    procedure pcMainChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    { TODO -oathite -cWebConvert :  'TNavigateBtn' is not a type identifier
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);   }
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwDBComboDlg2CustomDlg(Sender: TObject);
    procedure sbtnWebServicesClick(Sender: TObject);

  protected
//    procedure SrcTaxCodeLinkDataChange(Sender: TObject; Field: TField); virtual;

  private
    { Private declarations }
    NavDataSource :TDataSource;
    procedure CheckTaxTable;
  public
    { Public declarations }
    DM:TDM_Tax;
  end;

procedure DoTaxCode;

implementation

{$R *.DFM}

uses
  IQMS.Common.Applications,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  IQSecIns, }
  IQMS.WebVcl.SecurityManager,
  taxcodes_rscstr,
  web_service_settings;

procedure DoTaxCode;
begin
  with TFormTaxMain.Create(UniApplication) do
  begin
    DM:= TDM_Tax.Create(UniApplication);
    ShowModal;
  end;
end;

procedure TFormTaxMain.FormCreate(Sender: TObject);
begin
//  DM.SrcTaxCodeLink.OnDataChange  := SrcTaxCodeLinkDataChange;
  SecurityManager.SetVisibleIfLicensed( sbtnWebServices, nil,  NIL, IQAppsNames[apAvalaraTax], NIL);

  DM.Name:= '';              // Makes the form to look at Local DM

  IQSetTablesActiveEx( TRUE, DM, taxcodes_rscstr.cTXT000002 {'Accessing Tax Codes.  Please wait.'});

  IQMS.Common.Controls.AdjustPageControlToParent(pcTaxCodes);
  pcMain.ActivePage := TabCodes;
  IQMS.Common.Controls.ResizeCheckBoxes(Self,PnlTaxCodesFormClient);
//  NavMain.DataSource := DM.SrcTaxCodes;
//  NavDataSource  := NavMain.DataSource;
  IQRegFormRead( self, [ self, PnlTaxCodePCCarrier, PnlTaxCodesForm ]);
  wwDBComboDlg1.Parent :=  IQSearch2.DBGrid;
  wwDBComboDlg1.Visible := False;
end;

procedure TFormTaxMain.FormShow(Sender: TObject);
begin
  { TODO -oathite -cWebConvert : Depends on IQSecIns
  EnsureSecurityInspectorOnTopOf( self ); }
  IQSearch1.DBGrid.SetFocus
end;

procedure TFormTaxMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //if ModalResult = mrOk then
  //begin
    DM.QryTaxCodes.Close;
    DM.QryTaxCodes.Open;

    DM.QryTaxElements.Close;
    DM.QryTaxElements.Open;


//    DM.TblTaxElements.Refresh;
//    DM.TblTaxCodes.Refresh;
    DM.TblTaxCodeLink.Refresh;
    CheckTaxTable;
  //end;

  // AA. Aug 12, 98
  //if not ( (ModalResult = mrOk) or (ModalResult = mrAbort) ) then
  //   ModalResult := mrAbort;

//  begin
//    if not IqConfirmYN('Do you wish to abort the changes?')
//      then Abort
//      else ModalResult := mrAbort;
//  end;
  IQSetTablesActive( FALSE, DM );
  IQRegFormWrite( self, [ self, PnlTaxCodePCCarrier, PnlTaxCodesForm ]);
end;

procedure TFormTaxMain.SBToggleClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcTaxCodes);
end;

procedure TFormTaxMain.TabFormEnter(Sender: TObject);
begin
//  NavMain.DataSource := DM.SrcTaxCodes;
end;

procedure TFormTaxMain.pcMainChange(Sender: TObject);
begin
//  if pcMain.ActivePage = TabCodes
//    then NavMain.DataSource:= DM.SrcTaxCodes
//    else NavMain.DataSource:= DM.SrcTaxElements;
  {if pcMain.ActivePage = TabCodes then
  begin
   NavMain.DataSource:= NavDataSource;
   if GridTaxCode.DataSource = NavDataSource
     then GridTaxCode.setFocus
     else GridTaxLinks.setFocus;
  end
  else
  begin
    NavDataSource  := NavMain.DataSource;
    NavMain.DataSource := DM.SrcTaxElements;
  end;}
end;

procedure TFormTaxMain.pcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  try
    if pcMain.ActivePage = TabCodes then
    begin
      DM.QryTaxCodes.Close;
      DM.QryTaxCodes.Open;

//      DM.TblTaxCodes.Refresh;
      DM.TblTaxCodeLink.Refresh;
    end
    else
    begin
      DM.QryTaxElements.Close;
      DM.QryTaxElements.Open;

//      DM.TblTaxElements.Refresh;
    end;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      AllowChange := False;
    end;
  end;
end;

{procedure TFormTaxMain.SrcTaxCodeLinkDataChange(Sender: TObject; Field: TField);
begin
end;}

procedure TFormTaxMain.CheckTaxTable;
var
  cTaxCode:String;
begin
  with TFDQuery.Create(self) do
  try
    Connection := UniMainModule.FDConnection1;
    Sql.Add('select * from tax_codes tc ' +
      'where not exists (select id from tax_code_link ' +
      'where tax_codes_id = tc.id)');
    Open;
    while not eof do
    begin
      cTaxCode := FieldByName('TAX_CODE').asString;
      {'Tax Code %s does not have tax elements.  ' +
       'Please attach a tax element to it or delete the record.'}
      raise Exception.Create(Format(taxcodes_rscstr.cTXT000001, [cTaxCode]));
      Next;
    end;
  finally
    Free;
  end;
end;



procedure TFormTaxMain.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFormTaxMain.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFormTaxMain.PrintSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFormTaxMain.sbtnWebServicesClick(Sender: TObject);
begin
  DoTaxWebServiceSettings;
end;

{procedure TFormTaxMain.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbInsert then
    with TUniDBNavigator(Sender).DataSource.DataSet do
    begin
      Cancel;
      Append;
    end;
end;   }

procedure TFormTaxMain.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
// AA Aug 12, 98
// if not( (ModalResult = mrOk) or (ModalResult = mrAbort)) then
//   if not (IQConfirmYN('By closing the form without clicking on the ''Save'' button, ' + #13 +
//                       'your modified data will not be saved. Close the form anyway?')) then abort;

end;

procedure TFormTaxMain.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1093302 );
end;

procedure TFormTaxMain.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFormTaxMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

{ TODO -oathite -cWebConvert :  'TNavigateBtn' is not a type identifier
procedure TFormTaxMain.NavMainBeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbrefresh then
  begin
    if pcMain.ActivePage = TabCodes then
    begin
      AId := DM.QryTaxCodesID.asFloat;
      DM.QryTaxCodes.Close;
      DM.QryTaxCodes.Open;
      DM.QryTaxCodes.Locate('ID', AId, []);
    end
    else
    begin
      AId := DM.QryTaxElementsID.asFloat;
      DM.QryTaxElements.Close;
      DM.QryTaxElements.Open;
      DM.QryTaxElements.Locate('ID', AId, []);
    end;
    Abort;
  end;
end;   }

procedure TFormTaxMain.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  with DM.PKAcct do
    if Execute then
    begin
//      if not (DM.TblTaxElements.State in [dsEdit, dsInsert]) then DM.TblTaxElements.Edit;
//      DM.TblTaxElements.FieldByName('GLACCT_ID').asFloat := GetValue('ID');

      if not (DM.QryTaxElements.State in [dsEdit, dsInsert]) then DM.QryTaxElements.Edit;
      DM.QryTaxElements.FieldByName('GLACCT_ID').asFloat := GetValue('ID');
      DM.QryTaxElements.FieldByName('ACCT').asString := GetValue('ACCT');

    end;
end;

procedure TFormTaxMain.wwDBComboDlg2CustomDlg(Sender: TObject);
begin
  with DM.PkTaxElements do
  if execute then
  begin
    if not (DM.TblTaxCodeLink.State in [dsEdit, dsInsert]) then DM.TblTaxCodeLink.Edit;
    DM.TblTaxCodeLinkTAX_ELEMENTS_ID.asFloat := GetValue('ID');
  end;

end;

end.
