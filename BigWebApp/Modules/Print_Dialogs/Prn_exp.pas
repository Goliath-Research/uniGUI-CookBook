unit Prn_exp;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Prn_Doc,
  vcl.wwdblook,
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
  TFrmPrintDocsExpReport = class(TFrmPrintDocsCustom)
  private
    { Private declarations }
  public
    { Public declarations }
    function GetReportName( const AMfgType: string ): string; override;
    procedure AssignCriteria( SelectionList: TStringList ); override;
    function GetBeforeReport( const AMfgType: string ): string; override;
  end;

procedure DoPrintExpReport( const AFrom, ATo: string );

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.StringUtils,
  IQMS.Common.RepProps,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings;

{$R *.dfm}

procedure DoPrintExpReport( const AFrom, ATo: string );
begin
   TFrmPrintDocsExpReport.DoShow( AFrom, ATo );
end;

function TFrmPrintDocsExpReport.GetReportName( const AMfgType: string ): string;
begin
  Result:= SelectValueAsString('select expense_report from iqsys2');
  if Empty( Result ) then
     raise Exception.Create('No default report assigned in System Parameters. Please assign default report');
end;

procedure TFrmPrintDocsExpReport.AssignCriteria( SelectionList: TStringList );
begin
  with QryMain, SelectionList do
  begin
    Clear;
    Add( IQFormat('{EXP_HEADER.ID} = %f', [ FieldByName('id').asFloat ]));
  end;
end;

function TFrmPrintDocsExpReport.GetBeforeReport( const AMfgType: string ): string;
begin
  Result:= '';
end;


end.






