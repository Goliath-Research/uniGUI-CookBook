unit shipman_document_list;

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
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  Mask,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
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
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmShipManDocumentList = class(TUniForm)
    PnlCarrier: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PnlToolbar: TUniPanel;
    NavMain: TUniDBNavigator;
    pcMain: TUniPageControl;
    TabForm: TUniTabSheet;
    TabGrid: TUniTabSheet;
    sbtnSearchPackages: TUniSpeedButton;
    sbtnToggleView: TUniSpeedButton;
    Search1: TUniMenuItem;
    N1: TUniMenuItem;
    PkDoc: TIQWebHPick;
    PkDocID: TBCDField;
    PkDocDESCRIP: TStringField;
    PkDocMFG_COUNTRY: TStringField;
    SrcFreightDoc: TDataSource;
    TblFreightDoc: TFDTable;
    TblFreightDocID: TBCDField;
    TblFreightDocDESCRIP: TStringField;
    TblFreightDocMFG_COUNTRY: TStringField;
    PnlClient01: TUniPanel;
    Splitter1: TUniSplitter;
    PnlLeft01: TUniPanel;
    PnlClient02: TUniPanel;
    Grid: TIQUniGridControl;
    Label1: TUniLabel;
    lblMFGCountry: TUniLabel;
    cmbCountry: TUniDBComboBox;
    cmbDescription: TUniDBComboBox;
    SR: TIQWebSecurityRegister;
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure sbtnToggleViewClick(Sender: TObject);
    procedure DoAssignIDBeforePost(DataSet: TDataSet);
    procedure TblFreightDocNewRecord(DataSet: TDataSet);
    procedure PkDocIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure TblFreightDocBeforePost(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure SetDocumentID(const Value: Real);
    { Private declarations }
  public
    { Public declarations }
    property DocumentID : Real write SetDocumentID;

  end;

  procedure DoShippingDocuments(ADocumentID: Real = 0);

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  shipman_region,
  IQMS.Common.Controls;

procedure DoShippingDocuments(ADocumentID: Real);
var
  LFrmShipManDocumentList : TFrmShipManDocumentList;
begin
   LFrmShipManDocumentList :=  TFrmShipManDocumentList.Create(UniGUIApplication.UniApplication);
   LFrmShipManDocumentList.DocumentID := ADocumentID;
   LFrmShipManDocumentList.Show;
end;

procedure TFrmShipManDocumentList.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipManDocumentList.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipManDocumentList.Search1Click(Sender: TObject);
begin
  with PkDoc do
   if Execute then
      begin
        if NewResultValue then
           TblFreightDoc.Append
        else
           TblFreightDoc.Locate('ID',GetValue('ID'),[]);
      end
   else System.SysUtils.Abort;
end;

procedure TFrmShipManDocumentList.SetDocumentID(const Value: Real);
begin
    // Locate record
  if Value > 0 then
     TblFreightDoc.Locate( 'ID', Value, [] )
  else
      try
         Search1Click( NIL );
      except on E:EAbort do
         PostMessage( Handle, wm_Command, Close1.Command, 0 );   // Call "Exit"
      end;

end;

procedure TFrmShipManDocumentList.sbtnToggleViewClick(Sender: TObject);
begin
  IQMS.Common.Controls.TogglePageControl(pcMain);
end;

procedure TFrmShipManDocumentList.DoAssignIDBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmShipManDocumentList.TblFreightDocNewRecord(DataSet: TDataSet);
var
   ACode: String;
begin
  DoAssignIDBeforePost(DataSet);

  // prepopulate the country code
  ACode := shipman_region.CountryCodeFor(SelectValueAsString('select country from iqsys where rownum < 2'));
  if ACode = '' then ACode := 'XX';
  TblFreightDocMFG_COUNTRY.AsString := ACode;

end;

procedure TFrmShipManDocumentList.UniFormCreate(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  ReOpen(TblFreightDoc);
{ TODO -oGPatil -cWebConvert :  Incompatible types: 'TForm' and 'TFrmShipManDocumentList'
  IQMS.Common.Controls.CenterForm(Self); // initial center  }
  IQRegFormRead( Self, [ Self, PnlLeft01 ]); // IQMS.Common.RegFrm.pas
{ TODO -oGPatil -cWebConvert : Incompatible types: 'TDBNavigator' and 'TUniDBNavigator'
  IQMS.Common.Controls.ResizeNavBar(NavMain); // ensure symmetry after SR applies }
  IQMS.Common.Controls.AdjustPageControlToParent(pcMain);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlClient02);


  // load the country codes; we only have to do this once
  // NOTE:  We load it with the "multiple" option; meaning, for "multiple" countries
  //        of manufacture, the code should be "XX"
  shipman_region.LoadCountryCodes(cmbCountry, TRUE {Multiple}); // shipman_common.pas
end;

procedure TFrmShipManDocumentList.PkDocIQModify(Sender: TObject;
  var Action: TModalResult; var ResultValue: Variant);
begin
  Action := mrOk;
  ResultValue := 0;
end;

procedure TFrmShipManDocumentList.TblFreightDocBeforePost(DataSet: TDataSet);
begin
  DoAssignIDBeforePost(DataSet);
  if (TblFreightDocDESCRIP.AsString = '') then
     raise Exception.Create('Please enter a description.');

  if IsFoundParam('select id from freight_document ' +
                        'where Upper(Trim(descrip)) = Upper(Trim(:DESCRIP)) and id <> :ID' +
                        ' and rownum < 2',
                        ['DESCRIP','ID'],
                        [TblFreightDocDESCRIP.AsString,TblFreightDocID.AsFloat]) and
     not IQWarningYN('The description you entered is already in use.  Save changes anyway?') then
     System.SysUtils.Abort;

end;

end.
