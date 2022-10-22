unit bom_down_code;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmBomDownTimeCode = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1STANDARD_ID: TBCDField;
    wwQuery1DOWN_CODE: TStringField;
    wwQuery1SEQ: TBCDField;
    wwQuery1Descrip: TStringField;
    UpdateSQLDowmTimeCode: TFDUpdateSQL;
    wwDBComboDlgCode: TUniEdit;
    PkDownCode: TIQWebHPick;
    PkDownCodeDOWN_CODE: TStringField;
    PkDownCodeDOWN_DESCRIP: TStringField;
    PkDownCodeEPLANT_ID: TBCDField;
    PkDownCodePK_HIDE: TStringField;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1AfterInsert(DataSet: TDataSet);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);   }
    procedure wwQuery1BeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgCodeCustomDlg(Sender: TObject);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure wwQuery1CalcFields(DataSet: TDataSet);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FSTandard_ID: Real;
    procedure SetStandard_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(AStandard_ID: Real );
    property Standard_ID : Real write SetStandard_ID;
  end;

implementation

{$R *.dfm}

uses
  bom_reject_code,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{ TFrmBomDownTimeCode }

class procedure TFrmBomDownTimeCode.DoShow(AStandard_ID: Real);
var
  LFrmBomDownTimeCode : TFrmBomDownTimeCode;
begin
  LFrmBomDownTimeCode := TFrmBomDownTimeCode.Create(UniGUIApplication.UniApplication);
  LFrmBomDownTimeCode.FStandard_ID:= AStandard_ID;
  LFrmBomDownTimeCode.Show;
end;

procedure TFrmBomDownTimeCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmBomDownTimeCode.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).Params.ParamByName('standard_id').Value := FStandard_ID;
  AssignQueryParamValue(DataSet, 'standard_id', FStandard_ID);
end;

procedure TFrmBomDownTimeCode.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);

  if TFrmBomRejectCode.ReassignSequence( 'standard_down_code', FStandard_ID, 0, 0 ) then  // bom_reject_code.pas
     RefreshDataSetByID( wwQuery1 );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmBomDownTimeCode.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;  }

procedure TFrmBomDownTimeCode.wwQuery1AfterInsert(DataSet: TDataSet);
begin
  wwQuery1STANDARD_ID.asFloat:= FStandard_ID;
  wwQuery1SEQ.asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from standard_down_code where standard_id = %f', [ FStandard_ID ]);
end;

procedure TFrmBomDownTimeCode.wwQuery1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'STANDARD_DOWN_CODE' );
end;

procedure TFrmBomDownTimeCode.wwQuery1CalcFields(DataSet: TDataSet);
begin
  if wwQuery1DOWN_CODE.asString <> '' then
     wwQuery1Descrip.asString:= SelectValueFmtAsString('select down_descrip from down_code where down_code = ''%s''', [ FixStr(wwQuery1DOWN_CODE.asString)]);
end;

procedure TFrmBomDownTimeCode.wwDBComboDlgCodeCustomDlg(Sender: TObject);
begin
  with PkDownCode do
    if Execute then
    begin
       wwQuery1.Edit;
       wwQuery1DOWN_CODE.asString:= GetValue('down_code');
       wwQuery1.Post;
    end;
end;

procedure TFrmBomDownTimeCode.sbtnMoveUpClick(Sender: TObject);
begin
  TFrmBomRejectCode.ReassignSequence( 'standard_down_code', FStandard_ID, wwQuery1ID.asFloat, -1 );  // bom_reject_code.pas
  RefreshDataSetByID( wwQuery1 );
end;

procedure TFrmBomDownTimeCode.SetStandard_ID(const Value: Real);
begin
  FStandard_ID := Value;
end;

procedure TFrmBomDownTimeCode.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  Caption:= IQFormat('Downtime Codes (BOM: %s)', [ SelectValueByID('mfgno', 'standard', FStandard_ID )]);
end;

procedure TFrmBomDownTimeCode.sbtnMoveDownClick(Sender: TObject);
begin
  TFrmBomRejectCode.ReassignSequence( 'standard_down_code', FStandard_ID, wwQuery1ID.asFloat, +1 );  // bom_reject_code.pas
  RefreshDataSetByID( wwQuery1 );
end;

end.
