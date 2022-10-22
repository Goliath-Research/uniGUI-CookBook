unit Prn_Tck_Over_Lbl;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Tck,
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
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter;

type
  TFrmPrintDocsTicketOverlayLabels = class(TFrmPrintDocsTicket)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

procedure DoPrintPS_Ticket_OverlayLabels( const AFrom, ATo: string );
procedure DoPrintPS_Ticket_OverlayLabels_Silent( const AFrom, ATo: string );


implementation

{$R *.DFM}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  uniGUIApplication;

procedure DoPrintPS_Ticket_OverlayLabels( const AFrom, ATo: string );
var
  LFrm : TFrmPrintDocsTicketOverlayLabels;
begin
  LFrm := TFrmPrintDocsTicketOverlayLabels.Create(uniGUIApplication.UniApplication);
  LFrm.ToTxt := ATo;
  LFrm.From := AFrom;
  LFrm.ShowModal;
end;

procedure DoPrintPS_Ticket_OverlayLabels_Silent( const AFrom, ATo: string );
var
  LFrm : TFrmPrintDocsTicketOverlayLabels;
begin
  LFrm := TFrmPrintDocsTicketOverlayLabels.Create(uniGUIApplication.UniApplication);
  LFrm.ToTxt := ATo;
  LFrm.From := AFrom;
  LFrm.btnOK.Click;
end;


procedure TFrmPrintDocsTicketOverlayLabels.FormCreate(Sender: TObject);
begin
  inherited;
  {for now lets disable this button because RepProps.pas looks at IQsys hardcoded}
  BtnProp.Visible:= FALSE;
end;

function TFrmPrintDocsTicketOverlayLabels.GetReportName( const AMfgType: string ): string;
begin
  {in case of the pick tickets when we need to print an overlay label report - look up the name in ARCUSTO}
  with QryMain do
    Result:= FieldByName('overlay_label_report').asString;
  if Empty( Result ) then
     // 'Overlay Label Report name is not assigned in the customer table. Please assign report name'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000224);
end;

function TFrmPrintDocsTicketOverlayLabels.GetBeforeReport( const AMfgType: string ): string;
begin
  with QryMain do
    Result:= FieldByName('before_overlay_label_report').asString;
end;

procedure TFrmPrintDocsTicketOverlayLabels.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{C_OVERLAY_LABELS.PS_TICKET_ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;


end.
