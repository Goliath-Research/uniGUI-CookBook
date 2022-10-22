unit Prn_Tck_RF;

{This class is created to support printing of shipping labels from IQRF.}

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Tck,
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
  Data.DB,
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
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter, uniGUIApplication;

type
  TFrmPrintDocsTicketShippingLabel = class(TFrmPrintDocsTicket)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FReportName      : string;
    FPS_Ticket_Rel_ID: Real;
    FCopies          : Real;
  protected
    function AssignPrinterSettingsInternal( AComponent:TComponent; const AReportName: string; var ACopies: Integer; var ACollated: Boolean; var AStartPage: Integer; var AStopPage: Integer ): Boolean; override;
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

{Shipping Labels report}
procedure DoPrintPS_Ticket_ShippingLabel_Silent( AFrom, ATo,                     {ps_ticket_id from/to}
                                                 AReportName: string;            {shipping label report - assigned in ship_to_labels}
                                                 ACopies: Real;                  {number of copies - assigned in ship_to_labels}
                                                 APS_Ticket_Rel_ID: Real = 0 );  {optional ps_ticket_rel_id if we need to restrict a report to particular release}



implementation

{$R *.DFM}

uses
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils;

procedure DoPrintPS_Ticket_ShippingLabel_Silent( AFrom, ATo,                     {ps_ticket_id from/to}
                                                 AReportName: string;            {shipping label report assigned in ship_to_labels}
                                                 ACopies: Real;                  {number of copies - assigned in ship_to_labels}
                                                 APS_Ticket_Rel_ID: Real = 0 );  {optional ps_ticket_rel_id if we need to restrict a report to particular release}
var
  frm: TFrmPrintDocsTicketShippingLabel;
begin
  frm := TFrmPrintDocsTicketShippingLabel.Create(uniGUIApplication.UniApplication);
  frm.From := AFrom;
  frm.ToTxt := Ato;
  frm.FReportName := AReportName;
  frm.FPS_Ticket_Rel_ID:= APS_Ticket_Rel_ID;
  frm.FCopies := IIf( ACopies <= 0, 1, ACopies );
  frm.btnOK.Click;
end;


procedure TFrmPrintDocsTicketShippingLabel.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{V_PS_TICKETS_EX.PS_TICKET_ID} = %f', [ FieldByName('id').asFloat ]));      {V_PS_TICKETS_EX combines both current & history data}

    if FPS_Ticket_Rel_ID > 0 then
       Add( IQFormat(' and {V_PS_TICKETS_EX.PS_TICKET_REL_ID} = %f', [ FPS_Ticket_Rel_ID ]));
  end;
end;

function TFrmPrintDocsTicketShippingLabel.GetReportName(const AMfgType: string): string;
begin
  Result:= FReportName; {assigned passed report name}

  if Empty( Result ) then
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000302);  // 'Report name is not assigned.'
end;

function TFrmPrintDocsTicketShippingLabel.AssignPrinterSettingsInternal( AComponent:TComponent; const AReportName: string; var ACopies: Integer; var ACollated: Boolean; var AStartPage: Integer; var AStopPage: Integer ): Boolean;
begin
  Result:= inherited AssignPrinterSettingsInternal( AComponent, 'CRW_LABEL', ACopies, ACollated, AStartPage, AStopPage );
  ACopies:= Trunc(FCopies);
end;

procedure TFrmPrintDocsTicketShippingLabel.FormShow(Sender: TObject);
begin
 { TODO -oLema : There is no need to show the form. We just call a procedure of it }
//  inherited;
  Visible := False;
end;

end.
