unit crmquote_soprompt;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Menus,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmCRMQuoteConvertPrompt = class(TUniForm)
    pgctrlMain: TUniPageControl;
    tabSelectSalesOrder: TUniTabSheet;
    tabCreateNewSalesOrder: TUniTabSheet;
    PnlPrompt: TUniPanel;
    lblPrompt: TUniLabel;
    PnlCheckboxes: TUniPanel;
    chkIncludeInternalDocs: TUniCheckBox;
    chkIncludeExternalDocs: TUniCheckBox;
    chkEMailCorr: TUniCheckBox;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnCreateNewSalesOrderOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnUpdateSalesOrder: TUniButton;
    btnUpdateSalesOrderNo: TUniButton;
    btnUpdateSalesOrderCreateNew: TUniButton;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Panel4: TUniPanel;
    IQSearch1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1ORDERNO: TStringField;
    wwQuery1PONO: TStringField;
    wwQuery1CUSTNO: TStringField;
    wwQuery1COMPANY: TStringField;
    wwQuery1EPLANT_ID: TBCDField;
    SR: TIQWebSecurityRegister;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    chkCombineSalesConfigurations: TUniCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUpdateSalesOrderCreateNewClick(Sender: TObject);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCRM_Quote_ID: Int64;
    procedure SetCRM_Quote_ID(const Value: Int64);
  public
    { Public declarations }
    property CRM_Quote_ID: Int64 write SetCRM_Quote_ID;
  end;

function DoPromptConvert(
  ACRM_Quote_ID: Int64;
  var AIntDoc, AExtDoc, AEMailCorr, ACombineSalesConfig: Boolean;
  var AExistingOrders_ID: Int64): Boolean;



implementation

{$R *.dfm}


uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns
  ;

function DoPromptConvert(
  ACRM_Quote_ID: Int64;
  var AIntDoc, AExtDoc, AEMailCorr, ACombineSalesConfig: Boolean;
  var AExistingOrders_ID: Int64): Boolean;
var
  FrmCRMQuoteConvertPrompt: TFrmCRMQuoteConvertPrompt;
begin
  FrmCRMQuoteConvertPrompt := TFrmCRMQuoteConvertPrompt.Create(uniGUIApplication.UniApplication);
  with FrmCRMQuoteConvertPrompt do
  begin
    try
      CRM_Quote_ID := ACRM_Quote_ID;
      Result := ShowModal = mrOk;
      if Result then
      begin
        AIntDoc := chkIncludeInternalDocs.Checked;
        AExtDoc := chkIncludeExternalDocs.Checked;
        AEMailCorr := chkEMailCorr.Checked;
        ACombineSalesConfig := chkCombineSalesConfigurations.Checked;
        if pgctrlMain.ActivePage = tabSelectSalesOrder then
          AExistingOrders_ID := wwQuery1ID.AsLargeInt
        else
          AExistingOrders_ID := 0;
      end;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmCRMQuoteConvertPrompt.FormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.ResizeCheckBoxes(self, PnlCheckboxes);

  IQSetTablesActive(TRUE, self);
  AdjustPageControlToParent(pgctrlMain);

  if (wwQuery1.Eof and wwQuery1.Bof) then
    pgctrlMain.ActivePage := tabCreateNewSalesOrder
  else
    pgctrlMain.ActivePage := tabSelectSalesOrder;
end;

procedure TFrmCRMQuoteConvertPrompt.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(self, [self, chkIncludeInternalDocs, chkIncludeExternalDocs,
    chkEMailCorr, chkCombineSalesConfigurations]);
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //EnsureSecurityInspectorOnTopOf(self); { IQSecIns.pas }
end;

procedure TFrmCRMQuoteConvertPrompt.SetCRM_Quote_ID(const Value: Int64);
begin
  FCRM_Quote_ID := Value;
end;

procedure TFrmCRMQuoteConvertPrompt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(self, [self, chkIncludeInternalDocs, chkIncludeExternalDocs,
    chkEMailCorr, chkCombineSalesConfigurations]);
end;

procedure TFrmCRMQuoteConvertPrompt.btnUpdateSalesOrderCreateNewClick(Sender: TObject);
begin
  pgctrlMain.ActivePage := tabCreateNewSalesOrder;
end;

procedure TFrmCRMQuoteConvertPrompt.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'crm_quote_id', FCRM_Quote_ID);
end;

procedure TFrmCRMQuoteConvertPrompt.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFrmCRMQuoteConvertPrompt.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

end.
