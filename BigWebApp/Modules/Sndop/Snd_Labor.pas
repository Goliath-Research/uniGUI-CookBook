unit Snd_Labor;

(*UG_rem_AMB*)
{ TODO 1 -oABiery -cUX : TSecurityRegister issues ConnectionName not defined error on form load }
interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame, Vcl.Controls;

type
  TFrmSndOp_Labor = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    wwSrcSndOp_Labor: TDataSource;
    wwQrySndOp_Labor: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    wwQrySndOp_LaborID: TBCDField;
    wwQrySndOp_LaborEMP_LEVEL_ID: TBCDField;
    wwQrySndOp_LaborOPERATOR: TBCDField;
    wwQrySndOp_LaborCode: TStringField;
    wwQrySndOp_LaborDescrip: TStringField;
    wwQrySndOp_LaborLabor_Rate: TFloatField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    wwQryLookupCode: TFDQuery;
    wwQryLookupCodeID: TBCDField;
    wwQryLookupCodeCODE: TStringField;
    wwQryLookupCodeDESCRIP: TStringField;
    wwQryLookupDescrip: TFDQuery;
    wwQryLookupDescripID: TBCDField;
    wwQryLookupDescripCODE: TStringField;
    wwQryLookupDescripDESCRIP: TStringField;
    wwDBLookupCombo2: TUniDBLookupComboBox;
    UpdateSQL1: TFDUpdateSQL;
    wwQrySndOp_LaborSNDOP_ID: TBCDField;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wwQrySndOp_LaborAfterPost(DataSet: TDataSet);
    (*UG_rem_AMB
   { TODO 1 -oABiery -cUX : Color code grid }
    The TUniGridControl component currently does not support the
    OnDrawColumnCell event, where coloring is applied in uniGUI*)
    procedure wwQrySndOp_LaborNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure wwQrySndOp_LaborCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FSndOp_ID: Real;
    FReadOnly : Boolean;
  protected
    procedure DefaultStartUp;
  public
    { Public declarations }
    property SndOp_ID : Real read FSndOP_ID write FSndOp_ID;
    property IsReadOnly  : Boolean read FReadOnly write FReadOnly;
    class procedure DoShowExA( AOwner: TComponent; ASndOp_ID: Real; AReadOnly: Boolean );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  (*UG_rem_AMB*)
//  IQSecIns,
  IQMS.Common.JumpConstants,
  Variants,
  sndop_rscstr;

class procedure TFrmSndOp_Labor.DoShowExA( AOwner: TComponent; ASndOp_ID: Real; AReadOnly: Boolean );
var
  aFrmSndOp_Labor : TFrmSndOp_Labor;
begin
  IQAssert( ASndOp_ID > 0, sndop_rscstr.cTXT0000001 {'Process number is not assigned.'} );

  aFrmSndOp_Labor := TFrmSndOp_Labor.Create(AOwner);
  aFrmSndOp_Labor.SndOp_ID:= ASndOp_ID;
  aFrmSndOp_Labor.IsReadOnly:= AReadOnly;
  aFrmSndOp_Labor.ShowModal;
end;

{ TFrmSndOp_Labor }


procedure TFrmSndOp_Labor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSndOp_Labor.FormShow(Sender: TObject);
begin
(*UG_rem_AMB*)
//  EnsureSecurityInspectorOnTopOf( self );
  with wwQrySndOp_Labor do
  begin
    Close;
    UpdateOptions.ReadOnly:= IsReadOnly; //or not SR.ReadWrite['wwQrySndOp_Labor'];
    ParamByName('id').Value := SndOp_ID;
    Open;
  end;
  IQSetTablesActiveEx( TRUE, self, sndop_rscstr.cTXT0000050 {'Accessing database.  Please wait.'} );

  DefaultStartUp;
end;

procedure TFrmSndOp_Labor.DefaultStartUp;
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmSndOp_Labor.wwQrySndOp_LaborAfterPost(DataSet: TDataSet);
var
  ID: Real;
begin
  //try
  //  TFDQuery( DataSet ).DataBase.ApplyUpdates( [ TFDQuery( DataSet ) ]);
  //except on E:Exception do
  //  TFDQuery( DataSet ).CancelUpdates;
  //end;

  (*UG_rem_AMB
    This functionality not yet supported in webiq*)
//  if Owner is TUniForm then
//  begin
//     // PostMessage( TForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );
//     if Assigned( DataSet.FindField('ID')) then ID:= DataSet.FieldByName('ID').asFloat else ID:= 0;
//
//     SendMessage( TUniForm(Owner).Handle, iq_RefreshDataSets, 0, 0 );
//
//     if ID > 0 then DataSet.Locate('ID', ID, []);
//  end;
end;

procedure TFrmSndOp_Labor.wwQrySndOp_LaborCalcFields(DataSet: TDataSet);
var
  A: Variant;
begin
  if wwQrySndOp_LaborEMP_LEVEL_ID.asFloat > 0 then
  begin
    A:= SelectValueArrayFmt( 'select code, descrip, labor_rate from emp_level where id = %f',
                                 [ wwQrySndOp_LaborEMP_LEVEL_ID.asFloat ]);
    if VarArrayDimCount( A ) > 0 then
    begin
      // wwQrySndOp_LaborCode.asString := A[0];
      // wwQrySndOp_LaborDescrip.asString := A[1];
      wwQrySndOp_LaborLabor_Rate.asString := A[2];
    end;
  end;
end;

procedure TFrmSndOp_Labor.wwQrySndOp_LaborNewRecord(DataSet: TDataSet);
begin
  if CompareText( self.ClassName, 'TFrmQSndOp_Labor') = 0 then
     wwQrySndOp_LaborID.asFloat:= GetNextID('QSNDOP_LABOR')
  else
     wwQrySndOp_LaborID.asFloat:= GetNextID('SNDOP_LABOR');

  if Assigned(wwQrySndOp_Labor.DataSource) and Assigned(wwQrySndOp_Labor.DataSource.DataSet) then
     wwQrySndOp_LaborSNDOP_ID.asFloat:= wwQrySndOp_Labor.DataSource.DataSet.FieldByName('ID').asFloat

  else if FSndOp_ID > 0 then
     wwQrySndOp_LaborSNDOP_ID.asFloat:= FSndOp_ID
end;


end.
