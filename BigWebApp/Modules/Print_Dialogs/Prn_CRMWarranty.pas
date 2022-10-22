unit Prn_CRMWarranty;

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
  TFrmPrintDocsCRMService = class(TFrmPrintDocsCustom)
    wwQryLookupID: TBCDField;
    QryMainID: TBCDField;
    QryMainMFG_TYPE: TStringField;
    QryDocsDOC_BLOB: TBlobField;
    QryDocsDESCRIP: TStringField;
    QryDocsDOCSEQ: TBCDField;
    QryDocsExtLIB_PATH: TStringField;
    QryDocsExtFILENAME: TStringField;
    QryDocsExtSEQ: TBCDField;
    procedure BtnPropClick(Sender: TObject);
    procedure DoBeforeLookupDropDown(Sender: TObject);
  private
    { Private declarations }
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  public
    { Public declarations }
  end;

  procedure DoPrintCRMServiceReport(const AFrom, ATo: string );

implementation

{$R *.dfm}

uses
  IQMS.Common.NLS,
  IQMS.Common.DataLib,
  IQMS.Common.RepProps,
  IQMS.Common.ResStrings;

procedure DoPrintCRMServiceReport(const AFrom, ATo: string );
begin
  TFrmPrintDocsCRMService.DoShow(AFrom, ATo );
end;

{ TFrmPrintDocsCustom1 }

procedure TFrmPrintDocsCRMService.AssignCriteria(SelectionList: TStringList);
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{CRM_WARRANTY.ID} = %f', [ FieldByName('ID').asFloat ]));
  end;
end;

function TFrmPrintDocsCRMService.GetBeforeReport(
  const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from iqsys', [ 'BEFORE_CRM_SERVICE_REPORT' ]);
end;

function TFrmPrintDocsCRMService.GetReportName(
  const AMfgType: string): string;
begin
  Result:= SelectValueFmtAsString('select %s from iqsys', ['CRM_SERVICE_REPORT']);
  if Result = '' then
     // 'No default report assigned in System Parameters. Please assign default report.'
     raise Exception.Create(IQMS.Common.ResStrings.cTXT0000160 );
end;

procedure TFrmPrintDocsCRMService.BtnPropClick(Sender: TObject);
begin
  inherited;
  DoReportProperties('CRM_SERVICE_REPORT');
end;

procedure TFrmPrintDocsCRMService.DoBeforeLookupDropDown(Sender: TObject);
begin
 //  inherited; nothing
 ReOpen(wwQryLookup);
end;

end.
