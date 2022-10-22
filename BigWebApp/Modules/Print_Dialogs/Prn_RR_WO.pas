unit Prn_RR_WO;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
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
  uniEdit, uniLabel, uniPanel, uniPageControl, uniSplitter;

type
  TFrmPrintRR_WO = class(TFrmPrintDocsCustom)
    procedure BtnPropClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReportSubject: string; override;
    function GetTableNameForUpdatePrintCount: string; override;
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

procedure DoPrintRR_WO( const AFrom, ATo: string );


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings;

{ TFrmPrintRR_WO }

procedure DoPrintRR_WO( const AFrom, ATo: string );
begin
  TFrmPrintRR_WO.DoShow(AFrom, ATo );

  {with TFrmPrintRR_WO.Create(Application, AFrom, ATo ) do
  try
    ShowModal;
  finally
    Free;
  end;
  }
end;


procedure TFrmPrintRR_WO.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{RMA_DETAIL.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintRR_WO.GetBeforeReport(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'before_rr_wo_report', 'IQSys' ]);
end;

function TFrmPrintRR_WO.GetReportName(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', ['rr_wo_report', 'IQSys' ]);
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

function TFrmPrintRR_WO.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format(IQMS.Common.ResStrings.cTXT0000223 {'Work Order # %s'}, [ FieldByName('workorderno').asString ]);
end;

procedure TFrmPrintRR_WO.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('RR_WO_REPORT');
end;

function TFrmPrintRR_WO.GetTableNameForUpdatePrintCount: string;
begin
  Result:= 'rma_detail';
end;

end.
