unit EmpHours;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Db,
  Wwtable,
  Wwdatsrc,
  DBCtrls,
  StdCtrls,
  ExtCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
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
  uniButton,
  uniDBNavigator, Bde.DBTables, uniComboBox, uniDBComboBox, IQUniGrid,
  uniGUIFrame;

type
  TFrmEmpHours = class(TUniForm)
    srcRtEmpHrs: TDataSource;
    tblRtEmpHrs: TwwTable;
    tblRtEmpHrsPR_EMP_ID: TFloatField;
    tblRtEmpHrsPROD_HRS: TFloatField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnClose: TUniButton;
    gridEmp: TIQUniGridControl;
    tblPrEmp: TwwTable;
    tblPrEmpEMPNO: TStringField;
    tblPrEmpFIRST_NAME: TStringField;
    tblPrEmpMIDDLE_NAME: TStringField;
    tblPrEmpLAST_NAME: TStringField;
    tblPrEmpID: TFloatField;
    tblRtEmpHrsEmpNo: TStringField;
    tblRtEmpHrsFirst: TStringField;
    tblRtEmpHrsMiddle: TStringField;
    tblRtEmpHrsLast: TStringField;
    wwDBLookupCombo1: TUniDBLookupComboBox;
    SrcTblPR_EMP: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure tblRtEmpHrsBeforePost(DataSet: TDataSet);
    procedure wwDBLookupCombo1DropDown(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    procedure SetID(const Value: Real);
    { Private declarations }
  protected 
    FId:Real;
    FParentFieldName: string;
    procedure AssignCaption; virtual;
    procedure AssignParentFieldName; virtual;
    procedure AddParentFieldName;
  public
    { Public declarations }
    property ID : Real write SetID;

  end;

procedure DoEmpHours(AId:Real);

implementation
{$R *.DFM}
uses
  IQMS.Common.RegFrm,
  IQMS.Common.DataLib;

procedure DoEmpHours(AId:Real);
var
  LFrmEmpHours : TFrmEmpHours;
begin
  LFrmEmpHours := TFrmEmpHours.Create(uniGUIApplication.UniApplication);
  LFrmEmpHours.ID :=  AId;
  LFrmEmpHours.ShowModal;
end;

procedure TFrmEmpHours.AssignParentFieldName;
begin
  FParentFieldName:= 'HIST_ILLUM_RT_ID';
end;    

procedure TFrmEmpHours.AddParentFieldName;
begin
  tblRtEmpHrs.Close;
  with TFloatField.Create(self) do
  begin
    FieldName := FParentFieldName;
    DataSet   := tblRtEmpHrs;
  end;
  tblRtEmpHrs.IndexFieldNames:= FParentFieldName;
end;

procedure TFrmEmpHours.AssignCaption;
begin
  Caption := Format('Employee hours for %s', [SelectValueFmtAsString('select eqno from hist_illum_rt where id = %f', [FId])]);
end;

procedure TFrmEmpHours.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self, gridEmp]);
end;

procedure TFrmEmpHours.SetID(const Value: Real);
begin
  FID := Value;
end;

procedure TFrmEmpHours.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self, gridEmp]);
end;

procedure TFrmEmpHours.btnCloseClick(Sender: TObject);
begin
  tblRtEmpHrs.CheckBrowseMode;
  ModalResult := mrOk;
end;

procedure TFrmEmpHours.tblRtEmpHrsBeforePost(DataSet: TDataSet);
begin
  tblRtEmpHrs.FieldByName('HIST_ILLUM_RT_ID').asFloat := FId;
end;

procedure TFrmEmpHours.UniFormShow(Sender: TObject);
begin
  AssignParentFieldName;
  AddParentFieldName;
  IQSetTablesActive( True, self);
  tblRtEmpHrs.SetRange( [ FId ], [ FId ] );
  AssignCaption;
end;

procedure TFrmEmpHours.wwDBLookupCombo1DropDown(Sender: TObject);
begin
  tblPrEmp.IndexFieldNames := 'EMPNO';
end;

end.
