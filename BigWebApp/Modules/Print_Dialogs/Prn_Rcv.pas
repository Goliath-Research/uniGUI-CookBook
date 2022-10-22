unit Prn_Rcv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Data.DB,
  Mask,
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
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.SoftEPlant,
  System.ImageList,
  Vcl.Controls,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Dialogs,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Buttons, uniGUIBaseClasses, uniGUIClasses, uniImageList, uniMainMenu,
  uniButton, uniTabControl, Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniMultiItem, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter;

type
  TFrmPrintDocsReceive = class(TFrmPrintDocsCustom)
    QryMainRECEIPTNO: TStringField;
    QryMainID: TBCDField;
    QryMainMFG_TYPE: TStringField;
    procedure BtnPropClick(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
  private
    { Private declarations }
    procedure ValidateRange; override;
  public
    { Public declarations }
    procedure AssignCriteria( SelectionList: TStringList ); override;
    function GetReportName( const AMfgType: string ): string;  override;
    function GetBeforeReport( const AMfgType: string ): string; override;
  end;

procedure DoPrintRecv_Ticket( const AFrom, ATo: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  uniGUIApplication;

{used in IQWin32 and IQRF}
procedure DoPrintRecv_Ticket( const AFrom, ATo: string );
begin
  if not IsConsole then
  begin
    TFrmPrintDocsReceive.DoShow(AFrom, ATo );
  end
  else
  begin
    with TFrmPrintDocsReceive.Create(uniGUIApplication.UniApplication) do
    try
      ToTxt := ATo;
      From := AFrom;
      btnOK.Click;
    finally
      Free;
    end;
  end;



//  with TFrmPrintDocsReceive.Create(Application, AFrom, ATo ) do
//  try
//    if not IsConsole then
//       ShowModal
//    else
//       btnOK.Click;
//  finally
//    Free;
//  end;
end;

procedure TFrmPrintDocsReceive.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{PO_RECEIPTS.RECEIPTNO} = ''%s''', [ FieldByName('receiptno').asString ]));
  end;
end;

function TFrmPrintDocsReceive.GetReportName( const AMfgType: string ): string;
begin
  Result:= SelectValueFmtAsString('select %s from iqsys', ['RECV_TICKET_REPORT']);
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

procedure TFrmPrintDocsReceive.popmEmailPopup(Sender: TObject);
begin
  ThisVendor_ID:= SelectValueFmtAsFloat('select h.vendor_id                        '+
                            '  from po_receipts r, po_detail d, po h   '+
                            ' where RTrim(r.receiptno) = rtrim(''%s'') '+
                            '   and r.po_detail_id = d.id              '+
                            '   and d.po_id = h.id                     '+
                            ' order by rtrim(r.receiptno)              ',
                            [ wwcombFrom.Text ]);
  inherited;
end;

function TFrmPrintDocsReceive.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= SelectValueFmtAsString('select %s from iqsys', ['BEFORE_RECV_TICKET_REPORT']);
end;

procedure TFrmPrintDocsReceive.BtnPropClick(Sender: TObject);
begin
  //inherited;
  DoReportProperties('RECV_TICKET_REPORT');
end;

procedure TFrmPrintDocsReceive.ValidateRange;
var
  AFrom, ATo:String;
begin
  AFrom := SelectValueFmtAsString('select LPad( ''%s'', 50, ''0'') from dual', [wwcombFrom.ListField]);
  ATo   := SelectValueFmtAsString('select LPad( ''%s'', 50, ''0'') from dual', [wwcombTo.ListField]);


  if AFrom > ATo then
     // 'Invalid range: ''From'' must not be greater than ''To'' (character based)'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000209);
end;


end.
