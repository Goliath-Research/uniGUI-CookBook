unit SerReprintRange;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Hpick,
  Mask,
  Spring.Services,
  Spring.Collections,
  IQWeb.Server.DataServices,
  PickListDlg,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniMultiItem,
  uniComboBox;

type
  TFrmSerialPrintRange = class(TUniForm)
    Panel1: TUniPanel;
    Panel42: TUniPanel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label1: TUniLabel;
    edFrom: TUniEdit;
    Label2: TUniLabel;
    edTo: TUniEdit;
    wwDBGrid1: TIQUniGridControl;
    PnlButtons: TUniPanel;
    btnReprint: TUniButton;
    btnCancel: TUniButton;
    SrcMasterLabel: TDataSource;
    QryMasterLabel: TFDQuery;
    QryMasterLabelID: TBCDField;
    QryMasterLabelSERIAL: TStringField;
    QryMasterLabelCLASS: TStringField;
    QryMasterLabelITEMNO: TStringField;
    QryMasterLabelREV: TStringField;
    QryMasterLabelDESCRIP: TStringField;
    QryMasterLabelDISPO_SCAN: TStringField;
    QryMasterLabelSHIPMENT_DTL_ID: TBCDField;
    QryMasterLabelPS_TICKET_REL_ID: TBCDField;
    QryMasterLabelPS_TICKET_DTL_ID: TBCDField;
    QryMasterLabelMFGNO: TStringField;
    QryMasterLabelORDERNO: TStringField;
    QryMasterLabelPONO: TStringField;
    QryMasterLabelFG_LOTNO: TStringField;
    QryMasterLabelPRINT_DATE: TDateTimeField;
    QryMasterLabelSCANNED: TStringField;
    QryMasterLabelQTY: TFMTBCDField;
    QryMasterLabelPARENT_ID: TBCDField;
    QryMasterLabelLOC_DESC: TStringField;
    QryMasterLabelARINVT_ID: TBCDField;
    QryMasterLabelSYS_DATE: TDateTimeField;
    QryMasterLabelUSER_NAME: TStringField;
    QryMasterLabelIs_Shipped: TStringField;
    SR: TIQWebSecurityRegister;
    QryMasterLabelDESCRIP2: TStringField;
    QryMasterLabelLABEL_MENU_NAME: TStringField;
    Label3: TUniLabel;
    Edit1: TUniEdit;
    sbtnSearch: TUniSpeedButton;
    Label4: TUniLabel;
    btnApply: TUniButton;
    PrintDialog1: TPrintDialog;
    PnlButtonsInner: TUniPanel;
    wwDBComboDlgCRWPrinter: TUniComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
    procedure QryMasterLabelBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryMasterLabelCalcFields(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure wwDBComboDlgCRWPrinterCustomDlg(Sender: TObject);
    procedure wwDBComboDlgCRWPrinterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ReprintLabel(AMaster_Label_ID: Real);
    procedure Execute;
    function GetSerialNoFrom: string;
    function GetSerialNoTo: string;
    procedure SetSerialNoFrom( AValue: string );
    procedure SetSerialNoTo( AValue: string );
    { Private declarations }
  public
    { Public declarations }
    FIsModeless: Boolean;
    class procedure DoShowModal;
    class procedure DoShow;
    property SerialNoFrom: string read GetSerialNoFrom write SetSerialNoFrom;
    property SerialNoTo: string read GetSerialNoTo write SetSerialNoTo;
  end;

var
  FrmSerialPrintRange: TFrmSerialPrintRange;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.PrintLabels.LMBase,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
//  iqrf.share,
//  SerTrack,
  IQMS.Common.PanelMsg,
  Vcl.Printers;

{ TFrmSerialVoid }

class procedure TFrmSerialPrintRange.DoShowModal;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

class procedure TFrmSerialPrintRange.DoShow;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    FIsModeless:= TRUE;
    Show;
  end;
end;

procedure TFrmSerialPrintRange.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSerialPrintRange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSerialPrintRange.FormShow(Sender: TObject);
begin
  Reopen( QryMasterLabel ); {just to make the grid show up blank}
end;

procedure TFrmSerialPrintRange.btnApplyClick(Sender: TObject);
begin
  IQAssert( edFrom.Text > '', '''From'' Serial # must be entered' );
  IQAssert( edTo.Text > '',   '''To'' Serial # must be entered' );

  Reopen( QryMasterLabel );
end;

procedure TFrmSerialPrintRange.QryMasterLabelBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'From_Serial', SerialNoFrom);
  AssignQueryParamValue(DataSet, 'To_Serial', SerialNoTo);
end;

procedure TFrmSerialPrintRange.btnCancelClick(Sender: TObject);
begin
  if FIsModeless then
     Close;
end;

procedure TFrmSerialPrintRange.btnReprintClick(Sender: TObject);
begin
  if not IQWarningYN('You are about to reprint displayed labels.'#13#13'Are you sure you wish to continue?') then
     EXIT;
  Execute;
  ModalResult:= mrOK;
  if FIsModeless then
     Close;
end;

procedure TFrmSerialPrintRange.Execute;
var
  hMsg : TPanelMesg;
  AWasAnyLabelPrinted: Boolean;
  APrintIntervalFlag: Boolean;
begin
  AWasAnyLabelPrinted:= IQMS.PrintLabels.LMBase.IsAnyLabelBeenPrinted;

  with QryMasterLabel do
  begin
    DisableControls;
    First;
    hMsg:= hPleaseWait( '' ); // 'Accessing database.  Please wait...'
    TFrmLM_Base.DoForceCRWPrinterName( wwDBComboDlgCRWPrinter.Text );
    APrintIntervalFlag := TFrmLM_Base.AssignSkipCheckMinimumPrintInterval( TRUE );
    try
      while not Eof do
      begin
        hMsg.Mesg:= Format('Processing Serial# %s ...', [ QryMasterLabelSERIAL.asString ]);

        {08-15-2007 see if we can get rid of the delay}
        // {if this is the 1st label that maybe is still printing then give it 3 sec to finish}
        // if IQMS.PrintLabels.LMBase.IsAnyLabelBeenPrinted and not AWasAnyLabelPrinted then
        // begin
        //   Sleep(3 * 1000);
        //   AWasAnyLabelPrinted:= TRUE;
        // end;

//        TFrmTrackSer.ReprintLabel( QryMasterLabelID.asFloat, FALSE {AConfirmYN} );  {SerTrack.pas}

        {08-15-2007 see if we can get rid of the delay}
        // {allow LMWprint to finish running}
        // Sleep(5000);
        Application.ProcessMessages;

        Next;
      end;
    finally
      TFrmLM_Base.AssignSkipCheckMinimumPrintInterval( APrintIntervalFlag ); //reset back to how it was
      TFrmLM_Base.DoForceCRWPrinterName( '' );
      EnableControls;
      hMsg.Free;
    end;
  end;
end;


procedure TFrmSerialPrintRange.QryMasterLabelCalcFields(DataSet: TDataSet);
begin
  if  (QryMasterLabelSHIPMENT_DTL_ID.asFloat  > 0) or
      (QryMasterLabelPS_TICKET_REL_ID.asFloat > 0) or
      (QryMasterLabelPS_TICKET_DTL_ID.asFloat > 0) then
    QryMasterLabelIs_Shipped.asString:= 'Y'
  else
    QryMasterLabelIs_Shipped.asString:= 'N';
end;


procedure TFrmSerialPrintRange.ReprintLabel( AMaster_Label_ID: Real );
begin

end;

function TFrmSerialPrintRange.GetSerialNoFrom: string;
begin
//  Result:= iqrf.share.StripSerialPrefix( edFrom.Text );
end;

function TFrmSerialPrintRange.GetSerialNoTo: string;
begin
//  Result:= iqrf.share.StripSerialPrefix( edTo.Text );
end;

procedure TFrmSerialPrintRange.SetSerialNoFrom( AValue: string );
begin
 edFrom.Text:= AValue;
end;

procedure TFrmSerialPrintRange.SetSerialNoTo( AValue: string );
begin
 edTo.Text:= AValue;
end;




procedure TFrmSerialPrintRange.wwDBComboDlg1CustomDlg(Sender: TObject);
var
  AId:Real;
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select l.id as id, '+
                      ' l.label_file as label_file, '+
                      ' l.label_menu_name as label_menu, '+
                      ' l.label_type as label_type, '+
                      ' a.custno as custno, '+
                      ' a.company as customer, '+
                      ' l.eplant_id as eplant_id '+
                      ' from lm_labels l, '+
                      ' arcusto a '+
                      ' where l.arcusto_id = a.id(+) '+
                      ' and misc.eplant_filter(l.eplant_id) = 1');

  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);

    AId := qry.FieldByName('ID').AsInteger;
    ExecuteCommandFmt('update master_label set lm_labels_id = %f where id = %f', [AId, QryMasterLabelID.asFloat]);
    AId := QryMasterLabelID.asFloat;
    QryMasterLabel.Close;
    QryMasterLabel.Open;
    QryMasterLabel.Locate('ID', AId, []);
  finally
    Qry.Free;
  end;
end;

procedure TFrmSerialPrintRange.wwDBComboDlgCRWPrinterCustomDlg(Sender: TObject);
begin
  with PrintDialog1 do
    if Execute then
       wwDBComboDlgCRWPrinter.Text:= Printer.Printers[ Printer.PrinterIndex ]
end;

procedure TFrmSerialPrintRange.wwDBComboDlgCRWPrinterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    wwDBComboDlgCRWPrinter.Text:= '';
    Key:= 0;
  end;
end;

procedure TFrmSerialPrintRange.sbtnSearchClick(Sender: TObject);
var
  AId:Real;
  Qry : TDataSet;
  IDS : IIQDataServices;
  ID  : integer;
begin
  IDS := ServiceLocator.GetService<IIQDataServices>('FireDAC-Oracle');

  Qry := IDS.GetQuery('select l.id as id, '+
                      ' l.label_file as label_file, '+
                      ' l.label_menu_name as label_menu, '+
                      ' l.label_type as label_type, '+
                      ' a.custno as custno, '+
                      ' a.company as customer, '+
                      ' l.eplant_id as eplant_id '+
                      ' from lm_labels l, '+
                      ' arcusto a '+
                      ' where l.arcusto_id = a.id(+) '+
                      ' and misc.eplant_filter(l.eplant_id) = 1');

  try
    Qry.Open;

    ID := DoSinglePickList(Qry, 0);

    AId := qry.FieldByName('ID').AsInteger;

    if not IqConfirmYN('Do you wish to update all the labels in the range?') then exit;
    ExecuteCommandFmt('update master_label set lm_labels_id = %f where serial between ''%s'' and ''%s'' ',
              [AId, SerialNoFrom, SerialNoTo]);
    Edit1.ReadOnly := false;
    Edit1.text := qry.FieldByName('LABEL_MENU').AsString;
    Edit1.ReadOnly := true;
    QryMasterLabel.Close;
    QryMasterLabel.Open;
  finally
    Qry.Free;
  end;
end;



end.
