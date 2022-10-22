unit IQMS.WebVcl.Repdeffr;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Vcl.DBGrids,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniPageControl;

type
  TFrmRepDefFormulasDataEntry = class(TUniForm)
    DataSource1: TDataSource;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet2: TUniTabSheet;
    DBGrid1: TUniDBGrid;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    btnClear: TUniButton;
    Bevel1: TUniPanel;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
    FOnBeforeInsert: TDataSetNotifyEvent;
    procedure BeforeInsert(DataSet:TDataSet);
    function GetRepDef_Formulas: TFDTable;
    procedure AssignFormValue( AValue: string );
  public
    { Public declarations }
    constructor Create( ADataSet:TDataSet );
    property RepDef_Formulas: TFDTable read GetRepDef_Formulas;
  end;

var
  FrmRepDefFormulasDataEntry: TFrmRepDefFormulasDataEntry;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.WebVcl.RepDef,
  IQMS.Common.RegFrm,
  IQMS.Common.RepFunc,
  IQMS.WebVcl.ResourceStrings;

constructor TFrmRepDefFormulasDataEntry.Create(  ADataSet:TDataSet );
begin
  inherited Create(UniApplication);
//  PopupParent:= TUniForm(AOwner);
  DataSource1.DataSet:= ADataSet;
  DataSource1.DataSet.Open;
  DataSource1.DataSet.First;

  FOnBeforeInsert:= DataSource1.DataSet.BeforeInsert;
  FOnBeforeInsert:= BeforeInsert;

//  dbGrid1.SelectedIndex:= 1;

  IQRegFormRead( self, [self]);
end;

procedure TFrmRepDefFormulasDataEntry.BeforeInsert(DataSet:TDataSet);
begin
  System.SysUtils.ABORT;
end;

procedure TFrmRepDefFormulasDataEntry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataSource1.DataSet.BeforeInsert:= FOnBeforeInsert;
  IQRegFormWrite( self, [self]);
end;

procedure TFrmRepDefFormulasDataEntry.FormResize(Sender: TObject);
begin
  if (Width < 295) or (Height < 185) then
  begin
    OnResize:= NIL;
    SetBounds( Left, Top, 295, 185);
    OnResize:= FormResize;
  end;
  with dbGrid1 do
    Columns[ 1 ].Width:= ClientWidth - Columns[ 0 ].Width - 2;
end;

function TFrmRepDefFormulasDataEntry.GetRepDef_Formulas: TFDTable;
begin
  Result:= TFrmRepDef(Owner).RepDef_Formulas;
end;

procedure TFrmRepDefFormulasDataEntry.btnOKClick(Sender: TObject);
begin
  if RepDef_Formulas.State in [dsEdit, dsInsert] then
     RepDef_Formulas.Post;
  ModalResult:= mrOK;
end;

procedure TFrmRepDefFormulasDataEntry.btnCancelClick(Sender: TObject);
begin
  try
    if RepDef_Formulas.State in [dsEdit, dsInsert] then
       RepDef_Formulas.Cancel;
  finally
    ModalResult:= mrCancel;
  end;
end;

procedure TFrmRepDefFormulasDataEntry.btnClearClick(Sender: TObject);
begin
  if IQWarningYN( IQMS.WebVcl.ResourceStrings.cTXT0000253 {'Are you sure you want to clear variables?'} ) then
    with RepDef_Formulas do
    begin
       ExecuteCommand( Format('update repdef_formulas set FORM_VALUE = NULL where APP_ID = ''%s'' and REPNAME = ''%s'' ' ,
              [ FieldByName('APP_ID').AsString, FieldByName('REPNAME').asString ]));
       Refresh;
    end;
end;

procedure TFrmRepDefFormulasDataEntry.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (Key = VK_RETURN) and (ActiveControl = dbGrid1) then      { it is a TDBGrid }
//    with TUniDBGrid(ActiveControl) do
//      if Selectedindex = (Columns.Count - 1) then             { increment the field }
//      begin
//         DataSource.DataSet.Next;
//         if DataSource.DataSet.Eof then
//            SelectNext(Screen.ActiveControl, TRUE, TRUE)
//         else
//            Selectedindex:= 1;
//      end
//      else
//         SelectedIndex:= SelectedIndex + 1
end;

procedure TFrmRepDefFormulasDataEntry.DBGrid1EditButtonClick(Sender: TObject);
var
  S     : string;
  AValue: string;
begin
  S:= RepDef_Formulas.FieldByName('FUNC_NAME').asString;

  if (S = 'REP_DEF_GET_GLPERIOD') then REP_DEF_GET_GLPERIOD( AValue )
  else if (S = 'REP_DEF_GET_PR_EMP_EARNINGS_DATE') then REP_DEF_GET_PR_EMP_EARNINGS_DATE( AValue );

  if AValue <> '' then
     AssignFormValue( AValue );
end;

procedure TFrmRepDefFormulasDataEntry.DBGrid1CellClick(Column: TUniDBGridColumn);
begin
//  if (Column.FieldName = 'FORM_VALUE') and (RepDef_Formulas.FieldByName('FUNC_NAME').asString > '') then
//     Column.ButtonStyle:= cbsEllipsis
//  else
//     Column.ButtonStyle:= cbsNone
end;

procedure TFrmRepDefFormulasDataEntry.AssignFormValue( AValue: string );
begin
  with RepDef_Formulas do
  begin
    Edit;
    FieldByName('FORM_VALUE').asString:= AValue;
    TFrmRepDef(Owner).RepDef_FormulasFORM_VALUESetText( FieldByName('FORM_VALUE'), AValue );
  end;
end;

procedure TFrmRepDefFormulasDataEntry.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  with DBGrid1 do
//    if (Key = VK_DOWN) and (ssAlt in Shift) and (SelectedIndex > -1) and (Columns[ SelectedIndex ].ButtonStyle = cbsEllipsis) then
//    begin
//      DBGrid1EditButtonClick( DBGrid1 );
//      Key:= 0;
//    end;
end;

end.
