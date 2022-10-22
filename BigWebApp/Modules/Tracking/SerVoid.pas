unit SerVoid;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBGrid,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, uniGUIFrame, IQUniGrid;

type
  TFrmSerialVoid = class(TUniForm)
    Panel1: TUniPanel;
    Panel42: TUniPanel;
    Label9: TUniLabel;
    Label10: TUniLabel;
    Label1: TUniLabel;
    edFrom: TUniEdit;
    Label2: TUniLabel;
    edTo: TUniEdit;
    btnApply: TUniButton;
    wwDBGrid1: TIQUniGridControl;
    Panel2: TUniPanel;
    btnVoid: TUniButton;
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
    Shape5: TUniPanel;
    SR: TIQWebSecurityRegister;
    QryMasterLabelDESCRIP2: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnApplyClick(Sender: TObject);
    procedure btnVoidClick(Sender: TObject);
    procedure QryMasterLabelBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure QryMasterLabelCalcFields(DataSet: TDataSet);
    procedure wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    procedure VoidLabels;
    procedure DeleteLabel(AMaster_Label_ID: Real);
    function GetSerialNoFrom: string;
    function GetSerialNoTo: string;
    procedure SetSerialNoFrom( AValue: string );
    procedure SetSerialNoTo( AValue: string );
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
    property SerialNoFrom: string read GetSerialNoFrom write SetSerialNoFrom;
    property SerialNoTo: string read GetSerialNoTo write SetSerialNoTo;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Dialogs,
  IQMS.Common.PanelMsg;
//  IQSecIns;

{ TFrmSerialVoid }

class procedure TFrmSerialVoid.DoShowModal;
begin
  with self.Create(uniGUIApplication.UniApplication) do
  begin
    ShowModal;
  end;
end;

procedure TFrmSerialVoid.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSerialVoid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSerialVoid.FormShow(Sender: TObject);
begin
  Reopen( QryMasterLabel ); {just to make the grid show up blank}
end;

procedure TFrmSerialVoid.btnApplyClick(Sender: TObject);
begin
  IQAssert( edFrom.Text > '', '''From'' Serial # must be entered' );
  IQAssert( edTo.Text > '',   '''To'' Serial # must be entered' );

  Reopen( QryMasterLabel );
end;

procedure TFrmSerialVoid.QryMasterLabelBeforeOpen(DataSet: TDataSet);
begin
  AssignQueryParamValue(DataSet, 'From_Serial', SerialNoFrom);
  AssignQueryParamValue(DataSet, 'To_Serial', SerialNoTo);
end;

procedure TFrmSerialVoid.btnVoidClick(Sender: TObject);
begin
  if not IQWarningYN('You are about to delete displayed labels permanently from the system. Labels highlighted in red will be skipped.'#13#13'Are you sure you wish to continue?') then
     EXIT;

  VoidLabels;
  ModalResult:= mrOK;
end;

procedure TFrmSerialVoid.wwDBGrid1DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (QryMasterLabelIs_Shipped.asString = 'Y') or (QryMasterLabelDISPO_SCAN.asString = 'Y') then
  begin
    Attribs.Font.Color:= clRed;
  end;
end;

procedure TFrmSerialVoid.VoidLabels;
var
  hMsg : TPanelMesg;
begin
  with QryMasterLabel do
  begin
    DisableControls;
    First;
    hMsg:= hPleaseWait( '' ); // 'Accessing database.  Please wait...'
    try
      while not Eof do
      begin
        hMsg.Mesg:= Format('Processing Serial# %s ...', [ QryMasterLabelSERIAL.asString ]);
        if not ((QryMasterLabelIs_Shipped.asString = 'Y') or (QryMasterLabelDISPO_SCAN.asString = 'Y')) then
          DeleteLabel( QryMasterLabelID.asFloat );
        Next;
      end;
    finally
      EnableControls;
      hMsg.Free;
    end;
  end;
end;

procedure TFrmSerialVoid.DeleteLabel( AMaster_Label_ID: Real );
begin
  ExecuteCommandFmt('declare                                                                         '+
            '  v_master_label_id number::= %f;                                               '+
            'begin                                                                           '+
            '  update master_label set parent_id = NULL where parent_id = v_master_label_id; '+
            '                                                                                '+
            '  delete from master_label where id = v_master_label_id;                        '+
            'end;                                                                            ',
            [ AMaster_Label_ID ]);
end;


procedure TFrmSerialVoid.QryMasterLabelCalcFields(DataSet: TDataSet);
begin
  // if  (QryMasterLabelSHIPMENT_DTL_ID.asFloat  > 0) or
  //     (QryMasterLabelPS_TICKET_REL_ID.asFloat > 0) or
  //     (QryMasterLabelPS_TICKET_DTL_ID.asFloat > 0) then
  {July-09-2007}
  if  (QryMasterLabelSHIPMENT_DTL_ID.asFloat  > 0) then
    QryMasterLabelIs_Shipped.asString:= 'Y'
  else
    QryMasterLabelIs_Shipped.asString:= 'N';
end;

function TFrmSerialVoid.GetSerialNoFrom: string;
begin
//  Result:= iqrf.share.StripSerialPrefix( edFrom.Text );
end;

function TFrmSerialVoid.GetSerialNoTo: string;
begin
//  Result:= iqrf.share.StripSerialPrefix( edTo.Text );
end;

procedure TFrmSerialVoid.SetSerialNoFrom( AValue: string );
begin
 edFrom.Text:= AValue;
end;

procedure TFrmSerialVoid.SetSerialNoTo( AValue: string );
begin
 edTo.Text:= AValue;
end;


end.
