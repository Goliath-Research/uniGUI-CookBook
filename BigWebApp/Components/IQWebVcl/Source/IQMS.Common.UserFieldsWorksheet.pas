unit IQMS.Common.UserFieldsWorksheet;

interface

uses
  Winapi.Windows,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  IQMS.Common.Usr_Flds,
  Datasnap.DBClient,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.DBExpress,
  Data.DB,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniButton, uniPageControl, uniScrollBox, uniStatusBar, uniDBNavigator,
  uniBitBtn, uniSpeedButton;

type
  TFrmUsrFldsWS = class(TFrmUsr_Flds)
    pnlBottomButtons: TUniPanel;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(
                        const ATable_Name,
                        ASource: string;
                        AParent_ID: Real;
                        ASource_Attribute: string = ''); override;
    class function Execute(
                            ATableName,
                            AColumnName: string;
                            AParent_ID: Real ): Real;
  end;

var
  FrmUsrFldsWS: TFrmUsrFldsWS;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.ResStrings,
  IQMS.Common.StringUtils,
  IQMS.Common.udworksheet;


constructor TFrmUsrFldsWS.Create( const ATable_Name,
  ASource: string; AParent_ID: Real; ASource_Attribute: string);
begin
  inherited;

  _sbtnStructure.Visible:= False;  // force them to go throw ud_worksheet so they will assign the result field

  Caption:=  IQMS.Common.StringUtils.nz( SelectValueFmtAsString('select form_caption from ud_tables where source = ''%s'' and nvl(rtrim(source_attribute), ''*'') = nvl(''%s'', ''*'')',
                                       [ ASource, ASource_Attribute ]),
                          IQMS.Common.ResStrings.cTXT0000449 );  // 'User Defined Form'
end;

class function TFrmUsrFldsWS.Execute(  ATableName, AColumnName: string; AParent_ID: Real ): Real;
var
  A: Variant;
  AUD_Worksheet_ID: Real;
  ASourceAttribute: string;
  AResultColumnName: string;
  AUD_Tables_ID: Real;
  AUD_Cols_ID: Real;
begin
  Result:= 0;

  AUD_Worksheet_ID:= TFrmUDWorksheet.GetID( ATableName, AColumnName );
  if AUD_Worksheet_ID = 0 then
     EXIT;

  A:= SelectValueArrayFmt('select code, result_column_name from ud_worksheet where id = %f',
                     [ AUD_Worksheet_ID ]);
  if VarArrayDimCount(A) = 0 then
     EXIT;

  ASourceAttribute := A[ 0 ];
  AResultColumnName:= A[ 1 ];
  AUD_Tables_ID    := IQMS.Common.Usr_Flds.GetUD_Tables_ID( 'WORKSHEET', ASourceAttribute );
  AUD_Cols_ID      := SelectValueFmtAsFloat('select id from ud_cols where ud_tables_id = %f and col_name = ''%s''',
                                [ AUD_Tables_ID, AResultColumnName ]);
  if AUD_Cols_ID = 0 then
     EXIT;

  with self.Create( ATableName, 'WORKSHEET', AParent_ID, ASourceAttribute ) do
  try
    // IsReadOnly := AReadOnly;
    // HelpContext:= AHelpContext;
    if ShowModal = mrOK then
       Result:= SelectValueFmtAsFloat('select nuser from ud_data where ud_cols_id = %f and parent_id = %f', [ AUD_Cols_ID, AParent_ID ]);
  finally
    Free;
  end;
end;

procedure TFrmUsrFldsWS.btnOKClick(Sender: TObject);
begin
  if dbxUD_View.State in [dsEdit, dsInsert] then
  begin
    dbxUD_View.Post;
    if HasCalcFields() then
       PopulateCalcDataSet;
  end;
  ModalResult:= mrOK;
end;


end.
