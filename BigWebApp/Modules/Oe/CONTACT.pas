unit Contact;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.DBGrids,
  Vcl.Buttons,
  Vcl.Menus,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
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
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniPageControl, uniMainMenu;

type
  TFrmContact = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOk: TUniButton;
    btnCancel: TUniButton;
    Panel1: TUniPanel;
    nav: TUniDBNavigator;
    spSearchOrders: TUniSpeedButton;
    sbtnToggleView: TUniSpeedButton;
    Src: TDataSource;
    TblContact: TFDTable;
    TblContactID: TBCDField;
    TblContactARCUSTO_ID: TBCDField;
    TblContactCONTACT_TYPE: TStringField;
    TblContactCONTACT_SEQNO: TBCDField;
    TblContactSALUTATION: TStringField;
    TblContactLAST_NAME: TStringField;
    TblContactFIRST_NAME: TStringField;
    TblContactTITLE: TStringField;
    TblContactPHONE_NUMBER: TStringField;
    TblContactEXT: TStringField;
    TblContactFAX_NUMBER: TStringField;
    TblContactEMAIL: TStringField;
    TblContactPAGER: TStringField;
    TblContactCUSER1: TStringField;
    TblContactCUSER2: TStringField;
    PKContact: TIQWebHPick;
    PKContactFIRST_NAME: TStringField;
    PKContactLAST_NAME: TStringField;
    PKContactTITLE: TStringField;
    PKContactSALUTATION: TStringField;
    PKContactID: TBCDField;
    PKContactPHONE_NUMBER: TStringField;
    PKContactFAX_NUMBER: TStringField;
    IQAbout1: TIQWebAbout;
    TblContactUSE_USA_MASK: TStringField;
    PnlMain: TUniPanel;
    pcMain: TUniPageControl;
    TabForm: TUniTabSheet;
    ScrollBox1: TUniScrollBox;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    Label3: TUniLabel;
    Label4: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label5: TUniLabel;
    Label6: TUniLabel;
    Label7: TUniLabel;
    Label8: TUniLabel;
    Label10: TUniLabel;
    Label12: TUniLabel;
    Label11: TUniLabel;
    PnlClient02: TUniPanel;
    dbSeq: TUniDBEdit;
    dbType: TUniDBEdit;
    dbFirst: TUniDBEdit;
    dbLast: TUniDBEdit;
    dbSalut: TUniDBEdit;
    dbTitle: TUniDBEdit;
    dbPhone: TUniDBEdit;
    dbFax: TUniDBEdit;
    dbPager: TUniDBEdit;
    dbEmail: TUniDBEdit;
    dbExt: TUniDBEdit;
    TabGrid: TUniTabSheet;
    grid: TUniDBGrid;
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblContactBeforePost(DataSet: TDataSet);
    procedure spSearchOrdersClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DoGetTelephoneText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArcustoID:Real;
    procedure SetArcustoID(const Value:Real);
  public
    { Public declarations }
    FID:Real;
    property ArcustoID: Real write SetArcustoID;
  end;

function DoGetContact(AID, ArcustoID:Real):Real;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib,
  IQMS.Common.NLS;

function DoGetContact(AID, ArcustoID:Real):Real;
var
  frm: TFrmContact;
begin
  frm := TFrmContact.Create(uniGUIApplication.UniApplication);
  frm.ArcustoID := ArcustoID;
  frm.FID := AID;

  if frm.ShowModal = mrOk then
    Result := frm.FID
  else Result := 0;
end;

procedure TFrmContact.FormCreate(Sender: TObject);
begin
  // adjust Vcl.Controls
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
//  IQMS.Common.Controls.CenterForm(Self);
  IQRegFormRead( self, [self, PnlLeft01, grid]); // IQMS.Common.RegFrm.pas
//  ScrollBox1.VertScrollBar.Position := 0;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);
end;


procedure TFrmContact.UniFormShow(Sender: TObject);
var
  nId:Real;
begin
  with tblContact do
  begin
    Close;
    Filter := Format('ARCUSTO_ID=%d', [Trunc(FArcustoID)]);
    Filtered := True;
    Open;
    Locate('ID', FID, []);
  end;

  with PkContact do
  begin
    Close;
    Sql.Text := Sql.Text + IQFormat(' where c.arcusto_id = %f', [FArcustoID]);
  end;
  grid.DataSource := nil;

end;

procedure TFrmContact.sbtnToggleViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmContact.SetArcustoID(const Value: Real);
begin
  FArcustoID := Value;
end;

procedure TFrmContact.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmContact.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   IQRegFormWrite( self, [self, PnlLeft01, grid]); // IQMS.Common.RegFrm.pas
end;

procedure TFrmContact.btnOkClick(Sender: TObject);
begin
  with tblContact do
  begin
    CheckBrowseMode;
    FID := FieldByName('ID').asFloat;
  end;
end;

procedure TFrmContact.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmContact.TblContactBeforePost(DataSet: TDataSet);
begin
  TblContact.FieldByName('ARCUSTO_ID').asFloat := FArcustoID;
  IQAssignIDBeforePost(DataSet); {in IQlib}
end;


procedure TFrmContact.spSearchOrdersClick(Sender: TObject);
begin
  with PKContact do
    if Execute then
    begin
      TblContact.CheckBrowseMode;
      TblContact.FindKey([GetValue('ID')]);
    end;
end;

procedure TFrmContact.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

procedure TFrmContact.DoGetTelephoneText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  // modify the display text of this telephone field
  Text := FormatTelephoneText(Sender.AsString,
    SelectValueFmtAsString('select NVL(use_usa_mask,''N'') from arcusto where id = %.0f',[FArcustoID]) = 'Y'); // iqlib
end;

end.
