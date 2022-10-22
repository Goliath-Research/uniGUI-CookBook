unit prn_wo_direct_staging;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
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
  uniEdit, uniLabel, uniPanel, uniPageControl, Vcl.Forms, uniSplitter;

type
  TFrmPrintWODirectedStaging = class(TFrmPrintDocsCustom)
    wwQryLookupID: TBCDField;
    wwQryLookupMFGNO: TStringField;
    wwQryLookupITEMNO: TStringField;
    wwQryLookupDESCRIP: TStringField;
    wwQryLookupDESCRIP2: TStringField;
    wwQryLookupREV: TStringField;
    wwQryLookupSTANDARD_ID: TBCDField;
    procedure BtnPropClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReportSubject: string; override;

    procedure AssignCriteria( SelectionList: TStringList ); override;
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure ValidateRange; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib,
  IQMS.Common.RepProps,
  IQMS.Common.ResStrings,
  IQMS.Common.DateDlg;

{ TTFrmPrintWOHardAlloc }

procedure TFrmPrintWODirectedStaging.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{WORKORDER.ID} = %f', [ FieldByName('workorder_id').asFloat ]));
  end;
end;

procedure TFrmPrintWODirectedStaging.BtnPropClick(Sender: TObject);
begin
  inherited;
  DoReportProperties(self, 'DIRECT_STAGING_REPORT', 'IQSYS2');
end;

function TFrmPrintWODirectedStaging.GetBeforeReport(const AMfgType: string): string;
begin
  Result:= SelectValueAsString('select BEFORE_DIRECT_STAGING_REPORT from iqsys2');
end;

function TFrmPrintWODirectedStaging.GetReportName(const AMfgType: string): string;
begin
  Result:= SelectValueAsString('select DIRECT_STAGING_REPORT from iqsys2');
  if Result = '' then
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 ); // 'No default report assigned in System Parameters. Please assign default report.'
end;

function TFrmPrintWODirectedStaging.GetReportSubject: string;
begin
  with QryMain do
    Result:= Format( IQMS.Common.ResStrings.cTXT0000223 {'Work Order # %s'}, [ FieldByName('workorder_id').asString ]);
end;

procedure TFrmPrintWODirectedStaging.ValidateRange;
begin
  if StrToFloat(wwcombFrom.ListField) > StrToFloat(wwcombTo.ListField) then
     // 'Invalid range: ''From'' must not be greater than ''To'' '
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000209 );
end;

end.
