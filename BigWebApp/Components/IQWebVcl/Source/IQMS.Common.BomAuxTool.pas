unit IQMS.Common.BomAuxTool;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.SecurityRegister,
  IQMS.Common.JumpConstants,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmBomAuxTool = class(TUniForm)
    wwDBGrid: TIQUniGridControl;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    UpdateSQL1: TFDUpdateSQL;
    wwQuery1ID: TBCDField;
    wwQuery1PMEQMT_ID: TBCDField;
    wwQuery1AUX_ID: TBCDField;
    wwQuery1Eqno: TStringField;
    wwQuery1Descrip: TStringField;
    wwDBComboDlg1: TUniEdit;
    PkEQMT: TIQWebHPick;
    PkEQMTID: TBCDField;
    PkEQMTEQNO: TStringField;
    PkEQMTDESCRIP: TStringField;
    PkEQMTCLASS: TStringField;
    PkEQMTLOCATION: TStringField;
    PkEQMTEPLANT_ID: TBCDField;
    PkEQMTPK_HIDE: TStringField;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQuery1BeforeOpen(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : There is no equivalent UNI component for TNavigateBtn
      procedure NavMainBeforeAction(Sender: TObject;
      Button: TNavigateBtn); }
    procedure wwQuery1BeforePost(DataSet: TDataSet);
    procedure wwQuery1CalcFields(DataSet: TDataSet);
    procedure wwDBComboDlg1CustomDlg(Sender: TObject);
    procedure wwQuery1NewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FAux_ID: Real;
    procedure AssignCaption;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure AddMultiplePmEqmt;
    procedure SetAux_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShowModal(AAux_ID: Real);
    property Aux_ID: Real write SetAux_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  // WEB_CONVERT IQSecIns,
  IQMS.Common.Controls;

{ TFrmBomAuxTooling }

class procedure TFrmBomAuxTool.DoShowModal(AAux_ID: Real);
var
  LMe: TFrmBomAuxTool;
begin
  IQAssert(AAux_ID > 0, 'Undefined Auxiliary ID.');
  LMe := Self.Create(uniGUIApplication.UniApplication);
  LMe.Aux_ID := AAux_ID;
  LMe.ShowModal;
end;

procedure TFrmBomAuxTool.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(Self, [Self, wwDBGrid])
end;

procedure TFrmBomAuxTool.AssignCaption;
begin
  Caption := Format('Auxiliary Equipment ''%s'' Associated Tools',
    [Trim(SelectValueByID('aux_desc', 'aux', FAux_ID))]);
end;

procedure TFrmBomAuxTool.wwQuery1BeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // ParamByName('aux_id').Value := FAux_ID;
  AssignQueryParamValue(DataSet, 'aux_id', FAux_ID);
end;

{ TODO -oBantuK -cWEB_CONVERT : There is no equivalent UNI component for TNavigateBtn
  procedure TFrmBomAuxTool.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
  begin
  IQCheckRefresh(Sender, Button);

  if Button = nbInsert then
  begin
  PostMessage( Handle, iq_Notify, 1, 0 );
  ABORT;
  end;
  end; }

procedure TFrmBomAuxTool.wwQuery1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'AUX_PMEQMT');
end;

procedure TFrmBomAuxTool.wwQuery1CalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if wwQuery1PMEQMT_ID.asFloat = 0 then
    EXIT;

  A := SelectValueArrayFmt('select eqno, descrip from pmeqmt where id = %f',
    [wwQuery1PMEQMT_ID.asFloat]);
  if VarArrayDimCount(A) = 0 then
    EXIT;

  wwQuery1Eqno.asString := A[0];
  wwQuery1Descrip.asString := A[1];
end;

procedure TFrmBomAuxTool.wwDBComboDlg1CustomDlg(Sender: TObject);
begin
  with PkEQMT do
    if Execute then
    begin
      wwQuery1.Edit;
      wwQuery1PMEQMT_ID.asFloat := GetValue('ID');
    end;
end;

procedure TFrmBomAuxTool.wwQuery1NewRecord(DataSet: TDataSet);
begin
  wwQuery1AUX_ID.asFloat := FAux_ID;
end;

procedure TFrmBomAuxTool.FormShow(Sender: TObject);
begin
  IQSetTablesActiveEx(TRUE, Self, '');
  IQRegFormRead(Self, [Self, wwDBGrid]);
  AssignCaption;
  { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'EnsureSecurityInspectorOnTopOf'
    EnsureSecurityInspectorOnTopOf( self ); }
end;

procedure TFrmBomAuxTool.IQNotify(var Msg: TMessage);
begin
  case Msg.WParam of
    1:
      AddMultiplePmEqmt;
  end;
end;

procedure TFrmBomAuxTool.SetAux_ID(const Value: Real);
begin
  FAux_ID := Value;
end;

procedure TFrmBomAuxTool.AddMultiplePmEqmt;
var
  I: Integer;
begin
  with PkEQMT do
    if ExecuteEx('ID') then
      for I := 0 to ResultList.Count - 1 do
        if SelectValueFmtAsFloat
          ('select id from aux_pmeqmt where aux_id = %f and pmeqmt_id = %s',
          [FAux_ID, ResultList[I]]) = 0 then
        begin
          wwQuery1.Insert;
          wwQuery1.FieldByName('pmeqmt_id').asString := ResultList[I];
          wwQuery1.Post;
        end;
end;

end.
