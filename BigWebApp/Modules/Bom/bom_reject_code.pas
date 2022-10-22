unit bom_reject_code;

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
  TFrmBomRejectCode = class(TUniForm)
    Panel1: TUniPanel;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    wwQuery1ID: TBCDField;
    wwQuery1STANDARD_ID: TBCDField;
    wwQuery1REJECT_CODE_ID: TBCDField;
    wwQuery1SEQ: TBCDField;
    wwQuery1Code: TStringField;
    wwQuery1Descrip: TStringField;
    wwDBGrid1: TIQUniGridControl;
    UpdateSQLRejectCode: TFDUpdateSQL;
    wwDBComboDlgCode: TUniEdit;
    PkRejectCode: TIQWebHPick;
    PkRejectCodeREJECT_CODE: TStringField;
    PkRejectCodeATTRIBUTE: TStringField;
    PkRejectCodeEPLANT_ID: TBCDField;
    PkRejectCodeID: TBCDField;
    PkRejectCodePK_HIDE: TStringField;
    sbtnMoveUp: TUniSpeedButton;
    sbtnMoveDown: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    procedure ApplyUpdates(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TNavigateButton not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn); }
    procedure wwQuery1AfterInsert(DataSet: TDataSet);
    procedure wwQuery1BeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgCodeCustomDlg(Sender: TObject);
    procedure sbtnMoveUpClick(Sender: TObject);
    procedure sbtnMoveDownClick(Sender: TObject);
    procedure PkRejectCodeBeforeOpen(DataSet: TDataSet);
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
    class function ReassignSequence( ATableName: string; AStandard_ID, AID: Real; AUpDown: Integer {+1 or -1}): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.MfgShare;

{ TFrmBomRejectCode }



class procedure TFrmBomRejectCode.DoShow(AStandard_ID: Real);
var
  LTFrmBomRejectCode : TFrmBomRejectCode;
begin
  LTFrmBomRejectCode := TFrmBomRejectCode.Create(UniGUIApplication.UniApplication);
  LTFrmBomRejectCode.FStandard_ID:= AStandard_ID;
  LTFrmBomRejectCode.Show;
end;

procedure TFrmBomRejectCode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmBomRejectCode.PkRejectCodeBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  //   ParamByName('mfgcell_id').Value := SelectValueByID('mfgcell_id', 'standard', FStandard_ID);
  AssignQueryParamValue(DataSet, 'mfgcell_id', SelectValueByID('mfgcell_id', 'standard', FStandard_ID));
end;

procedure TFrmBomRejectCode.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  // TFDQuery(DataSet).Params.ParamByName('standard_id').Value := FStandard_ID;
  AssignQueryParamValue(DataSet, 'standard_id', FStandard_ID);
end;

procedure TFrmBomRejectCode.ApplyUpdates(DataSet: TDataSet);
begin
  // IQApplyUpdateToTable(DataSet);

  if TFrmBomRejectCode.ReassignSequence( 'standard_reject_code', FStandard_ID, 0, 0 ) then  // this units
     RefreshDataSetByID( wwQuery1 );
end;

{ TODO -oGPatil -cWebConvert : TNavigateButton not present in UniGui
procedure TFrmBomRejectCode.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;  }

procedure TFrmBomRejectCode.wwQuery1AfterInsert(DataSet: TDataSet);
begin
  wwQuery1STANDARD_ID.asFloat:= FStandard_ID;
  wwQuery1SEQ.asFloat:= 1 + SelectValueFmtAsFloat('select max(seq) from standard_reject_code where standard_id = %f', [ FStandard_ID ]);
end;

procedure TFrmBomRejectCode.wwQuery1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'STANDARD_REJECT_CODE' );
end;

procedure TFrmBomRejectCode.wwQuery1CalcFields(DataSet: TDataSet);
begin
  if wwQuery1REJECT_CODE_ID.asFloat > 0 then
  begin
     wwQuery1Descrip.asString:= SelectValueByID('attribute', 'reject_code', wwQuery1REJECT_CODE_ID.asFloat );
     wwQuery1Code.asString   := SelectValueByID('reject_code', 'reject_code', wwQuery1REJECT_CODE_ID.asFloat );
  end;
end;

procedure TFrmBomRejectCode.wwDBComboDlgCodeCustomDlg(Sender: TObject);
begin
  with PkRejectCode do
    if Execute then
    begin
      wwQuery1.Edit;
      wwQuery1REJECT_CODE_ID.asFloat:= GetValue('ID');
      wwQuery1.Post;
    end;
end;

procedure TFrmBomRejectCode.sbtnMoveUpClick(Sender: TObject);
begin
  TFrmBomRejectCode.ReassignSequence( 'standard_reject_code', FStandard_ID, wwQuery1ID.asFloat, -1 );  // this unit
  RefreshDataSetByID( wwQuery1 );
end;

procedure TFrmBomRejectCode.SetStandard_ID(const Value: Real);
begin
    FStandard_ID := Value;
end;

procedure TFrmBomRejectCode.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);

  Caption:= IQFormat('Reject Code (BOM: %s)', [ SelectValueByID('mfgno', 'standard', FStandard_ID )]);
end;

procedure TFrmBomRejectCode.sbtnMoveDownClick(Sender: TObject);
begin
  TFrmBomRejectCode.ReassignSequence( 'standard_reject_code', FStandard_ID, wwQuery1ID.asFloat, +1 );  // this unit
  RefreshDataSetByID( wwQuery1 );
end;

class function TFrmBomRejectCode.ReassignSequence( ATableName: string; AStandard_ID, AID: Real; AUpDown: Integer {+1 or -1}): Boolean;
begin
  Result:= IQMS.Common.MfgShare.ReassignSequenceOfChildRecords( ATableName, 'standard_id', AStandard_ID, AID, AUpDown );
end;


end.
