unit Prn_MRB_WO;

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
  TFrmPrintMRB_WO = class(TFrmPrintDocsCustom)
    procedure BtnPropClick(Sender: TObject);
  protected
    function GetReportSubject: string; override;
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  end;

procedure DoPrintMRB_WO( const AFrom, ATo: string );

implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings;

{ TFrmPrintRR_WO }

procedure DoPrintMRB_WO( const AFrom, ATo: string );
begin
  TFrmPrintMRB_WO.DoShow( AFrom, ATo );

  {with TFrmPrintMRB_WO.Create(Application, AFrom, ATo ) do
  try
    ShowModal;
  finally
    Free;
  end;
  }
end;


procedure TFrmPrintMRB_WO.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{WF_DEVIATION_ITEM.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintMRB_WO.GetBeforeReport(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', [ 'before_mrb_wo_report', 'IQSys' ]);
end;

function TFrmPrintMRB_WO.GetReportName(const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from %s', ['mrb_wo_report', 'IQSys' ]);
  if Empty( Result ) then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

function TFrmPrintMRB_WO.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format(IQMS.Common.ResStrings.cTXT0000223 {'Work Order # %s'}, [ FieldByName('mrb_workorderno').asString ]);
end;


procedure TFrmPrintMRB_WO.BtnPropClick(Sender: TObject);
begin
  inherited;
  DoReportProperties('MRB_WO_REPORT');
end;

end.
