unit ProdEmp;

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
  Emphours,
  Db,
  Wwdatsrc,
  StdCtrls,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  ExtCtrls,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniListBox,
  uniGUIApplication,
  uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  Bde.DBTables, vcl.wwtable, uniComboBox, uniDBComboBox, IQUniGrid, uniGUIFrame,
  uniButton, uniPanel;

type
  TFrmProdEmpHours = class(TFrmEmpHours)
    tblRtEmpHrsLabor_Description: TStringField;
    wwDBLookupComboLaborCode: TUniDBLookupComboBox;
    wwQryMasterLaborLookup: TFDQuery;
    wwQryMasterLaborLookupID2: TBCDField;
    wwQryMasterLaborLookupCODE: TStringField;
    wwQryMasterLaborLookupDESCRIP: TStringField;
    tblRtEmpHrsMASTER_LABOR_ID: TBCDField;
    tblRtEmpHrsLabor_Code: TStringField;
    SR: TIQWebSecurityRegister;
    tblRtEmpHrsTA_LABOR_ID: TBCDField;
    procedure tblRtEmpHrsBeforePost(DataSet: TDataSet);
    procedure TblRtEmpHrsNewRecord(DataSet: TDataSet);
    procedure gridEmpCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    procedure AssignEPlantFilter(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckAbortOnSourceIsTA(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure AssignCaption; override;
    procedure AssignParentFieldName; override;
  public
    { Public declarations }
  end;

procedure DoProdEmpHours(AID: Real);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.Common.HelpHook
  { TODO -omugdha -cWebConvert : Dependency
  ,IQSecIns }
  ;

procedure DoProdEmpHours(AID: Real);
var
  LFrmProdEmpHours: TFrmProdEmpHours;
begin
  LFrmProdEmpHours := TFrmProdEmpHours.Create(uniGUIApplication.UniApplication);
  LFrmProdEmpHours.ID := AID;
  LFrmProdEmpHours.ShowModal;

end;

procedure TFrmProdEmpHours.AssignParentFieldName;
begin
  FParentFieldName := 'DAYPROD_ID';
end;

procedure TFrmProdEmpHours.AssignCaption;
begin
  with TFDQuery.Create(self) do
    try
      Connection := UniMainModule.FDConnection1;
      SQL.Add(IQFormat
        ('select h.eqno, h.mfgno from dayprod, hist_illum_rt h where dayprod.id = %f and dayprod.hist_illum_rt_id = h.id',
        [FID]));
      Open;
      Caption := Format('Employee hours for Work Center %s, Mfg# %s',
        [Fields[0].asString, Fields[1].asString]);
    finally
      Free;
    end;
end;

procedure TFrmProdEmpHours.tblRtEmpHrsBeforePost(DataSet: TDataSet);
begin
  // inherited;
  IQAssignIDBeforePost(DataSet);
  tblRtEmpHrs.FieldByName('DAYPROD_ID').AsBCD := FID;
  { TODO -omugdha -cWebConvert : Dependency
  CheckEmpStatus;
  }
end;

procedure TFrmProdEmpHours.TblRtEmpHrsNewRecord(DataSet: TDataSet);
begin
  // inherited;   overwrite inherited

  // FieldByName('prod_hrs').asFloat:= SelectValueFmtAsFloat('select d.prod_hrs * NVL(s.operator, 1)       '+
  // ' from dayprod d, hist_illum_rt h, standard s '+
  // ' where d.id = %f and h.id = d.hist_illum_rt_id and h.standard_id = s.id(+) ',
  // [ FID ]);

  // with DataSet do
  // FieldByName('prod_hrs').asFloat:= SelectValueFmtAsFloat('select d.prod_hrs from dayprod d where d.id = %f', [ FID ]);

  { May-06-03 }
  with DataSet do
    FieldByName('prod_hrs').AsBCD := SelectValueFmtAsFloat
      ('select d.prod_hrs * NVL(h.operator, 1)       ' +
      ' from dayprod d, hist_illum_rt h              ' +
      ' where d.id = %f and h.id = d.hist_illum_rt_id', [FID]);
end;

procedure TFrmProdEmpHours.gridEmpCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited; { nothing }

  if not Highlight and not Field.ReadOnly then
    ABrush.Color := clWindow;

  if tblRtEmpHrsTA_LABOR_ID.asFloat > 0 then
    AFont.Color := clGray;
end;

procedure TFrmProdEmpHours.AssignEPlantFilter(DataSet: TDataSet);
const
  INCLUDE_NULL_EPLANT = TRUE;
begin
  // inherited;
  IQAssignEPlantFilter(DataSet, INCLUDE_NULL_EPLANT);
  with DataSet do
    if Filter > '' then
      Filter := Filter + ' and (PK_HIDE = NULL or PK_HIDE = ''N'')'
    else
      Filter := 'PK_HIDE = NULL or PK_HIDE = ''N''';
end;

procedure TFrmProdEmpHours.FormActivate(Sender: TObject);
begin
  inherited;
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmPROD_REP { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmProdEmpHours.FormShow(Sender: TObject);
begin
  inherited;
  { TODO -omugdha -cWebConvert : Dependency
  EnsureSecurityInspectorOnTopOf(self);
  }
end;

procedure TFrmProdEmpHours.CheckAbortOnSourceIsTA(DataSet: TDataSet);
begin
  if tblRtEmpHrsTA_LABOR_ID.asFloat > 0 then
    raise Exception.Create
      ('This record was created by T&A system - no modifications are allowed.');
  inherited;
end;

end.
