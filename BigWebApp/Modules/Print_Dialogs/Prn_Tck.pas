unit Prn_Tck;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  Data.DB,
//  Mask,
  FireDAC.Comp.Client,
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
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.SoftEPlant,
  System.ImageList,
  Vcl.Controls,
  IQMS.WebVcl.Hpick,
  Vcl.Menus,
  Vcl.Dialogs,
  FireDAC.Comp.DataSet,
  Vcl.Buttons, uniGUIBaseClasses, uniGUIClasses, uniImageList, uniMainMenu,
  uniButton, uniTabControl, Vcl.ComCtrls, uniMemo, uniComboBox, uniBitBtn,
  uniSpeedButton, uniCheckBox, uniMultiItem, uniDBComboBox, uniDBLookupComboBox,
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter, uniGUIApplication;

type
  TFrmPrintDocsTicket = class(TFrmPrintDocsCustom)
    procedure BtnPropClick(Sender: TObject);
    procedure popmEmailPopup(Sender: TObject);
    procedure AssignLocalParams(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDivision_ID: Real;
    function GetDivision_ID: Real;
    procedure SetDivision_ID(Value: Real);
  protected
    procedure AssignParams; override;
  public
    { Public declarations }
    property Division_ID : Real read GetDivision_ID write SetDivision_ID;
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
    function GetReportSubject: string; override;
    function GetTableNameForUpdatePrintCount: string; override;
    class procedure DoShow(AFrom, ATo: string; ADivision_ID: Real = 0);
  end;

{PkTicket report}
// procedure DoPrintPS_Ticket( const AFrom, ATo: string; ADivision_ID: Real = 0 );


implementation

{$R *.DFM}

uses
  eplant_profile,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.JumpConstants;
  { TODO -oLema : Dependent on RepProps }
//  RepProps;

//procedure DoPrintPS_Ticket( const AFrom, ATo: string; ADivision_ID: Real = 0 );
//begin
//  TFrmPrintDocsTicket.DoShow(Application, AFrom, ATo, ADivision_ID );
//end;


{  TFrmPrintDocsTicket }

class procedure TFrmPrintDocsTicket.DoShow(AFrom, ATo: string; ADivision_ID: Real = 0 );
var
  frm : TFrmPrintDocsTicket;
begin
  frm := TFrmPrintDocsTicket.Create(uniGUIApplication.UniApplication);
  frm.From := AFrom;
  frm.ToTxt := ATo;
  frm.Division_ID := ADivision_ID;
  frm.TouchScreen := False;
  frm.Show;
end;

procedure TFrmPrintDocsTicket.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  { TODO -oLema : to check if it is valid - PostMessageToForm ? }
  IQMS.Common.Controls.PostMessageToForm( 'TFrmPSTicket', iq_RefreshDataSets );
end;


procedure TFrmPrintDocsTicket.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{V_PS_TICKETS.PS_TICKET_ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintDocsTicket.GetReportName( const AMfgType: string ): string;
begin
  Result:= TFrmEPlantProfile.GetReportName( 'PS_TICKET_REPORT' );  {eplant_profile.pas}

  if Result = '' then
     Result:= SelectValueFmtAsString('select %s from iqsys', ['PS_TICKET_REPORT']);

  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

function TFrmPrintDocsTicket.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= TFrmEPlantProfile.GetBeforeExecName( 'PS_TICKET_REPORT' );  {eplant_profile.pas}

  if Empty( Result ) then
     Result:= SelectValueFmtAsString('select %s from iqsys', ['BEFORE_PS_TICKET_REPORT']);
end;

procedure TFrmPrintDocsTicket.AssignLocalParams(DataSet: TDataSet);
begin
  DataSet.Close;
  AssignQueryParamValue(DataSet, 'division_id', FDivision_ID);
end;

procedure TFrmPrintDocsTicket.AssignParams;
begin
  AssignLocalParams( QryMain );
  inherited;
end;

procedure TFrmPrintDocsTicket.BtnPropClick(Sender: TObject);
begin
  //inherited;
  { TODO -oLema : Dependent on RepProps }
//  DoReportProperties(self, 'PS_TICKET_REPORT');
end;

function TFrmPrintDocsTicket.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format('Pk Ticket# %s', [ FieldByName('id').asString ]);
end;

function TFrmPrintDocsTicket.GetTableNameForUpdatePrintCount: string;
begin
  Result:= 'ps_ticket';
end;

procedure TFrmPrintDocsTicket.popmEmailPopup(Sender: TObject);
begin
  ThisArcusto_ID:= SelectValueFmtAsFloat('select arcusto_id from ps_ticket where id = %s', [ wwcombFrom.Text ]);
  inherited;
end;

function TFrmPrintDocsTicket.GetDivision_ID: Real;
begin
  result := FDivision_ID;
end;

procedure TFrmPrintDocsTicket.SetDivision_ID(Value: Real);
begin
  FDivision_ID := Value;
end;

end.
