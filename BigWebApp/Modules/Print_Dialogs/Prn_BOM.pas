unit Prn_BOM;

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
  TFrmPrintDocsBOM = class(TFrmPrintDocsCustom)
    procedure BtnPropClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetReportName( const AMfgType: string ): string; override;
    function GetBeforeReport( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
  public
    { Public declarations }
  end;

procedure DoPrintBOM( const AFrom, ATo: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  iqms.common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.WebVcl.SecurityManager;

procedure DoPrintBOM( const AFrom, ATo: string );
begin
  TFrmPrintDocsBOM.DoShow( AFrom, ATo );

  // with TFrmPrintDocsBOM.Create(Application, AFrom, ATo ) do
  // try
  //   ShowModal;
  // finally
  //   Free;
  // end;
end;

procedure TFrmPrintDocsBOM.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{STANDARD.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintDocsBOM.GetReportName( const AMfgType: string ): string;
begin
  Result:= '';

  if SecurityManager.EPlant_ID_AsFloat > 0 then
     Result:= SelectValueFmtAsString('select bom_report from mfgtype_eplant_report where RTrim(mfgtype) = ''%s'' and eplant_id = %f', [ AMfgType, SecurityManager.EPlant_ID_AsFloat ]);

  if Result = '' then
     Result:= SelectValueFmtAsString('select bom_report from mfgtype where RTrim(mfgtype) = ''%s''', [ AMfgType ]);

  if Result = '' then
     // 'The %s BOM report is not assigned in Mfg Types. Please assign a report name.'
     raise Exception.CreateFmt(IQMS.Common.ResStrings.cTXT0000222, [ AMfgType ]);
end;

function TFrmPrintDocsBOM.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= '';

  if SecurityManager.EPlant_ID_AsFloat > 0 then
     Result:= SelectValueFmtAsString('select before_bom_report from mfgtype_eplant_report where RTrim(mfgtype) = ''%s'' and eplant_id = %f', [ AMfgType, SecurityManager.EPlant_ID_AsFloat ]);

  if Result = '' then
     Result:= SelectValueFmtAsString('select before_bom_report from mfgtype where RTrim(mfgtype) = ''%s''', [ AMfgType ]);
end;


procedure TFrmPrintDocsBOM.BtnPropClick(Sender: TObject);
begin
  DoReportProperties('bom_report', 'mfgtype');
end;

end.
