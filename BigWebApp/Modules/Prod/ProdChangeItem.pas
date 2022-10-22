unit ProdChangeItem;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ExtCtrls,
  Grids,
  wwDataInspector,
  Mask,
  wwdbedit,
  Wwdotdot,
  Wwdbcomb,
  IQMS.WebVcl.UDComboBox,
  DB,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
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
  uniComboBox,
  uniDBComboBox;

type
  TFrmProdChangeItem = class(TUniForm)
    DI: TwwDataInspector;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    Cancel: TUniButton;
    IQUDComboBoxRev: TIQWebUDComboBox;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    QryArinvtITEMNO: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryClass: TFDQuery;
    QryClassCLASS: TStringField;
    QryClassDESCRIP: TStringField;
    wwDBLookupComboClass: TUniDBLookupComboBox;
    procCloneArinvt: TFDStoredProc;
    procMatSum: TFDStoredProc;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure QryArinvtBeforeOpen(DataSet: TDataSet);
    procedure QryArinvtUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
      AOptions: TFDUpdateRowOptions);

    procedure IQUDComboBoxRevCloseUp(Sender: TUniDBComboBox; Select: Boolean);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FDay_Part_ID: Real;
    FDayProd_ID: Real;
    FMaster_Label_ID: Real;
    FPartno_ID: Real;
    FStandard_ID: Real;
    FDayProdTableName: string;
    FDayPartTableName: string;
    FHist_Illum_RT_ID: Real;
    FHist_Illum_Part_ID_New: Real;
    procedure Validate;
    procedure EnsureArinvtExists;
    procedure EnsurePartnoExists;
    procedure EnsureDay_PartExists;
    procedure EnsureMaterialUsedIsCalculated;
    procedure AssignProdRepInfo;
    procedure EnsureHist_Illum_PartExists;
    procedure MoveQtyBetweenDay_PartUpdateMasterLabel;
    procedure StartUp;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure EnforceUppercase;
    procedure SetArinvt_ID(const Value: Real);
    procedure SetDay_Part_ID(const Value: Real);
    procedure SetMaster_Label_ID(const Value: Real);
    procedure SetPartno_ID(const Value: Real);
  public
    { Public declarations }
    FArinvt_ID_New: Real;
    FPartno_ID_New: Real;
    FDay_Part_ID_New: Real;

    procedure DoShow;
    procedure DoShow_ExA;
    class function Execute(APartno_ID, AMaster_Label_ID, ADay_Part_ID: Real;
      var AArinvt_ID_New: Real): Boolean;

    class function Execute_ExA(AArinvt_ID: Real;
      var AArinvt_ID_New: Real): Boolean;
    property Arinvt_ID: Real write SetArinvt_ID;
    property Partno_ID: Real write SetPartno_ID;
    property Master_Label_ID: Real write SetMaster_Label_ID;
    property Day_Part_ID: Real write SetDay_Part_ID;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.SecurityManager,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs;

{ TFrmProdChangeItem }

class function TFrmProdChangeItem.Execute(APartno_ID, AMaster_Label_ID,
  ADay_Part_ID: Real; var AArinvt_ID_New: Real): Boolean;
var
  LMe: TFrmProdChangeItem;
begin
  LMe := self.Create(uniGUIApplication.UniApplication);
  LMe.Partno_ID := APartno_ID;
  LMe.Master_Label_ID := AMaster_Label_ID;
  LMe.Day_Part_ID := ADay_Part_ID;

  LMe.DoShow;

  Result := (LMe.ModalResult = mrOK);
  if Result then
    AArinvt_ID_New := LMe.FArinvt_ID_New;
end;

class function TFrmProdChangeItem.Execute_ExA(AArinvt_ID: Real;
  var AArinvt_ID_New: Real): Boolean;
var
  LMe: TFrmProdChangeItem;
begin
  LMe := self.Create(UniGUIApplication.UniApplication);
  LMe.Arinvt_ID := AArinvt_ID;

  LMe.DoShow_ExA;

  Result := (LMe.ModalResult = mrOK);
  if Result then
    AArinvt_ID_New := LMe.FArinvt_ID_New;
end;

procedure TFrmProdChangeItem.DoShow;
begin
  if FDay_Part_ID > 0 then
    AssignProdRepInfo;
  FArinvt_ID := SelectValueByID('arinvt_id', 'partno', FPartno_ID);
  FStandard_ID := SelectValueByID('standard_id', 'partno', FPartno_ID);

  ShowModal;
end;

procedure TFrmProdChangeItem.DoShow_ExA;
begin
  FStandard_ID := SelectValueByID('standard_id', 'arinvt', FArinvt_ID);
  FPartno_ID := SelectValueFmtAsFloat
    ('select id from partno where standard_id = %f and arinvt_id = %f',
    [FStandard_ID, FArinvt_ID]);

  ShowModal;
end;

procedure TFrmProdChangeItem.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
end;

procedure TFrmProdChangeItem.SetDay_Part_ID(const Value: Real);
begin
  FDay_Part_ID := Value;
end;

procedure TFrmProdChangeItem.SetMaster_Label_ID(const Value: Real);
begin
  FMaster_Label_ID := Value;
end;

procedure TFrmProdChangeItem.SetPartno_ID(const Value: Real);
begin
  FPartno_ID := Value;
end;

procedure TFrmProdChangeItem.StartUp;
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead(self, [self]);
end;

procedure TFrmProdChangeItem.UniFormShow(Sender: TObject);
begin
  StartUp;
end;

procedure TFrmProdChangeItem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmProdChangeItem.AssignProdRepInfo;
begin
  repeat
    FDayProd_ID := SelectValueByID('dayprod_id', 'day_part', FDay_Part_ID);
    if FDayProd_ID > 0 then
    begin
      FDayProdTableName := 'DAYPROD';
      FDayPartTableName := 'DAY_PART';
      BREAK;
    end;

    FDayProd_ID := SelectValueByID('dayprod_id', 'pday_part', FDay_Part_ID);
    if FDayProd_ID > 0 then
    begin
      FDayProdTableName := 'PDAYPROD';
      FDayPartTableName := 'PDAY_PART';
      BREAK;
    end;

    FDayProdTableName := '';
    raise Exception.CreateFmt
      ('Unable to establish production report. Day_Part_ID = %f',
      [FDay_Part_ID]);
  until TRUE;

  FHist_Illum_RT_ID := SelectValueFmtAsFloat
    ('select hist_illum_rt_id from %s where id = %f',
    [FDayProdTableName, FDayProd_ID]);
end;

procedure TFrmProdChangeItem.QryArinvtBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do ParamByName('arinvt_id').asFloat:= FArinvt_ID;
  AssignQueryParamValue(DataSet, 'arinvt_id', FArinvt_ID);
end;

procedure TFrmProdChangeItem.QryArinvtUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction;
  AOptions: TFDUpdateRowOptions);

begin
  // Allow fields to be edited
  AAction := eaApplied;
end;

procedure TFrmProdChangeItem.btnOKClick(Sender: TObject);
var
  DB: TFDConnection;
  AWasInTransaction: Boolean;
begin
  EnforceUppercase;
  Validate;

  DB := UniMainModule.FDConnection1;
  AWasInTransaction := DB.InTransaction;
  try
    if not DB.InTransaction then
      DB.StartTransaction;

    EnsureArinvtExists;

    if FPartno_ID > 0 then
      EnsurePartnoExists;

    if FDay_Part_ID > 0 then
    begin
      EnsureMaterialUsedIsCalculated;
      EnsureDay_PartExists;
      MoveQtyBetweenDay_PartUpdateMasterLabel;
    end;

    if not AWasInTransaction then
      DB.Commit;
    ModalResult := mrOK;
  finally
    if not AWasInTransaction then
      if DB.InTransaction then
        DB.Rollback;
  end;
end;

procedure TFrmProdChangeItem.EnforceUppercase;
begin
  QryArinvt.Edit;
  QryArinvtCLASS.asString := UpperCase(QryArinvtCLASS.asString);
  QryArinvtITEMNO.asString := UpperCase(QryArinvtITEMNO.asString);
  QryArinvtREV.asString := UpperCase(QryArinvtREV.asString);
end;

procedure TFrmProdChangeItem.Validate;
var
  A: Variant;
begin
  IQAssert(Trim(QryArinvtCLASS.asString) > '', 'Class must be entered');
  IQAssert(Trim(QryArinvtITEMNO.asString) > '', 'Item must be entered');
  IQAssert(Trim(QryArinvtDESCRIP.asString) > '', 'Description must be entered');

  A := SelectValueArrayFmt
    ('select rtrim(class), rtrim(itemno) as itemno, rtrim(rev) as rev from arinvt where id = %f',
    [FArinvt_ID]);

  IQAssert((A[0] <> Trim(QryArinvtCLASS.asString)) or
    (A[1] <> Trim(QryArinvtITEMNO.asString)) or
    (A[2] <> Trim(QryArinvtREV.asString)),
    'Unable to create new item - one or more key fields such as class, item# or rev must be changed.');
end;

procedure TFrmProdChangeItem.EnsureArinvtExists;
begin
  FArinvt_ID_New := SelectValueFmtAsFloat
    ('select id from arinvt where class = ''%s'' and itemno = ''%s'' and NVL(rtrim(rev),''*'') = NVL(rtrim(''%s''),''*'') and misc.eplant_filter(eplant_id) = 1',
    [QryArinvtCLASS.asString, FixStr(QryArinvtITEMNO.asString),
    FixStr(QryArinvtREV.asString)]);
  if FArinvt_ID_New > 0 then
    EXIT;

  with procCloneArinvt do
  begin
    ParamByName('v_old_arinvt').asFloat := FArinvt_ID;
    ParamByName('v_class').asString := QryArinvtCLASS.asString;
    ParamByName('v_itemno').asString := QryArinvtITEMNO.asString;
    ParamByName('v_rev').asString := QryArinvtREV.asString;
    if SecurityManager.EPlant_ID_AsFloat > 0 then
      ParamByName('v_eplant_id').asFloat := SecurityManager.EPlant_ID_AsFloat
    else
      ParamByName('v_eplant_id').Clear;
    ExecProc;
    FArinvt_ID_New := ParamByName('result').asFloat;
  end;
end;

procedure TFrmProdChangeItem.EnsurePartnoExists;
var
  A: Variant;
  AStdCav: Real;
  APtwtDisp: Real;
  APartno_ID_Orig: Real;
begin
  FPartno_ID_New := SelectValueFmtAsFloat
    ('select id from partno where arinvt_id = %f and standard_id = %f',
    [FArinvt_ID_New, FStandard_ID]);
  if FPartno_ID_New > 0 then
    EXIT;

  A := SelectValueArrayFmt('select stdcav, ptwt_disp from partno where id = %f',
    [FPartno_ID]);
  IQAssert(VarArrayDimCount(A) > 0, Format('Invalid Partno ID = %.0f',
    [FPartno_ID]));
  AStdCav := A[0];
  APtwtDisp := A[1];

  // AMfg_Seq:= 1 + SelectValueFmtAsFloat('select max(mfg_seq) from partno where standard_id = %f', [ FStandard_ID ]);

  FPartno_ID_New := GetNextID('partno');
  ExecuteCommandFmt('insert into partno                  ' +
    '     ( id, standard_id, arinvt_id,  ' +
    '       stdcav, actcav, ptwt_disp )  ' +
    'values(%f, %f, %f, %f, 0, %.6f   )  ', [FPartno_ID_New, FStandard_ID,
    FArinvt_ID_New, AStdCav, APtwtDisp]);

  { try finding the original partno and attach the same sndops }
  APartno_ID_Orig := SelectValueFmtAsFloat
    ('select id from partno where standard_id = %f and actcav is not null order by id',
    [FStandard_ID]);
  if APartno_ID_Orig = 0 then
    EXIT;

  ExecuteCommandFmt('insert into ptoper      ' + '     ( partno_id,       ' +
    '       sndop_id,        ' + '       arinvt_id,       ' +
    '       opseq,           ' + '       cycletm,         ' +
    '       login_required,  ' + '       logout_required, ' +
    '       cycletm_disp,    ' + '       overlap_hrs,     ' +
    '       multiples,       ' + '       scrap,           ' +
    '       scrap_disp,      ' + '       uom )            ' +
    'select                  ' + '       %f,              ' +
    '       sndop_id,        ' + '       arinvt_id,       ' +
    '       opseq,           ' + '       cycletm,         ' +
    '       login_required,  ' + '       logout_required, ' +
    '       cycletm_disp,    ' + '       overlap_hrs,     ' +
    '       multiples,       ' + '       scrap,           ' +
    '       scrap_disp,      ' + '       uom              ' +
    ' from  ptoper           ' + 'where  partno_id = %f   ',
    [FPartno_ID_New, APartno_ID_Orig]);

  { Aug-01-2006 set flag in standard }
  ExecuteCommandFmt
    ('update standard set use_single_part_cost_calc = ''Y'' where id = %f',
    [FStandard_ID]);
end;

procedure TFrmProdChangeItem.EnsureMaterialUsedIsCalculated;
begin
  { calc mat used if they haven't yet }
  if SelectValueFmtAsString('select status from %s where id = %f',
    [FDayProdTableName, FDayProd_ID]) <> 'C' then
    with procMatSum do
    begin
      ParamByName('v_dayprod_id').asFloat := FDayProd_ID;
      ExecProc;
    end;

  { freeze future calcs }
  ExecuteCommandFmt('update %s set freeze_calc = ''Y'' where id = %f',
    [FDayProdTableName, FDayProd_ID]);
end;

procedure TFrmProdChangeItem.EnsureDay_PartExists;
begin
  EnsureHist_Illum_PartExists;

  FDay_Part_ID_New := SelectValueFmtAsFloat
    ('select id from %s where dayprod_id = %f and hist_illum_part_id = %f ',
    [FDayPartTableName, FDayProd_ID, FHist_Illum_Part_ID_New]);
  if FDay_Part_ID_New > 0 then
  begin
    ExecuteCommandFmt
      ('update %s set actcav = 1 where id = %f and NVL(actcav,0) = 0',
      [FDayPartTableName, FDay_Part_ID_New]); { ensure actcav = 1 }
    EXIT;
  end;

  FDay_Part_ID_New := GetNextID('day_part');
  ExecuteCommandFmt
    ('insert into day_part( id, dayprod_id, hist_illum_part_id, actcav ) ' +
    'values( %f, %f, %f, 1 )', [FDay_Part_ID_New, FDayProd_ID,
    FHist_Illum_Part_ID_New]);
end;

procedure TFrmProdChangeItem.EnsureHist_Illum_PartExists;
begin
  FHist_Illum_Part_ID_New := SelectValueFmtAsFloat
    ('select id from hist_illum_part where hist_illum_rt_id = %f and partno_id = %f',
    [FHist_Illum_RT_ID, FPartno_ID_New]);
  if FHist_Illum_Part_ID_New > 0 then
    EXIT;

  FHist_Illum_Part_ID_New := GetNextID('illum_part'); { note ILLUM_PART }
  ExecuteCommandFmt('insert into hist_illum_part         ' +
    '       (id, hist_illum_rt_id, class, itemno, rev, descrip, descrip2, stdcav, actcav, ptwt, partno_id, pt_cost, pt_price ) '
    + 'select %f,                          ' +
    '       %f,                          ' + // hist_illum_rt_id,
    '       arinvt.class,                ' +
    '       arinvt.itemno,               ' +
    '       arinvt.rev,                  ' +
    '       arinvt.descrip,              ' +
    '       arinvt.descrip2,             ' +
    '       partno.stdcav,               ' +
    '       partno.actcav,               ' +
    '       partno.ptwt,                 ' +
    '       partno.id,                   ' +
    '       arinvt.std_cost,             ' +
    '       arinvt.std_price             ' +
    '  from partno, arinvt               ' +
    ' where partno.standard_id = %f      ' + // standard_id
    '   and partno.arinvt_id = arinvt.id ' +
    '   and arinvt.id = %f               ', [FHist_Illum_Part_ID_New,
    FHist_Illum_RT_ID, FStandard_ID, FArinvt_ID_New]);

end;

procedure TFrmProdChangeItem.MoveQtyBetweenDay_PartUpdateMasterLabel;
var
  AQty: Real;
  A: Variant;
begin
  AQty := SelectValueByID('qty', 'master_label', FMaster_Label_ID);

  { Nov-14-2005. Day_Part is added DISPO_FLOOR_QTY_OUT. The purpose of this field is to hold qty
    that has been moved to another day_part for given dayprod record. Then we do OUT transaction
    using this qty. Note that when user changes grade/item we decrement good_pts and floor dispo qty
    for the source day part and increment good_pts of the target day_part. We also increase the
    floor_dispo_qty_out of the source day_part. }

  // update day_part - original + new record
  ExecuteCommandFmt
    ('declare                                                                           '
    + '  v_qty_out              number::= %.6f;                                          '
    + '  v_day_part_id          number::= %f;                                            '
    + '  v_day_part_rec         day_part%%rowtype;                                       '
    + '  v_floor_dispo_qty      number::= 0;                                             '
    + '  v_floor_dispo_qty_out  number::= 0;                                             '
    + '  v_day_part_id_new      number::= %f;                                            '
    + 'begin                                                                             '
    + '  select * into v_day_part_rec from %s where id = v_day_part_id;                  '
    + '  if v_day_part_rec.floor_dispo_qty > 0 then                                      '
    + '     v_floor_dispo_qty_out::= v_qty_out;                                          '
    + '  end if;                                                                         '
    +

    { update source day_part }
    '  update %s                                                                       '
    + '     set floor_dispo_qty     = greatest( 0, NVL(floor_dispo_qty,0) - v_qty_out ), '
    + '         good_pts            = NVL(good_pts,0) - v_qty_out,                       '
    + '         floor_dispo_qty_out = v_floor_dispo_qty_out                              '
    + '   where id = v_day_part_id;                                                      '
    +

    { update target day_part }
    '  update %s                                                                       '
    + '     set good_pts = NVL(good_pts,0) + v_qty_out                                   '
    + '   where id = v_day_part_id_new;                                                  '
    +

    { now try to update dispo_floor_qty if they move back into the day_part }
    '  select * into v_day_part_rec from %s where id = v_day_part_id_new;              '
    + '  if v_day_part_rec.floor_dispo_qty_out > 0 then                                  '
    + '     v_floor_dispo_qty::= least( v_day_part_rec.floor_dispo_qty_out, v_qty_out);  '
    + '     update %s                                                                    '
    + '        set floor_dispo_qty = NVL(floor_dispo_qty,0) + v_floor_dispo_qty,         '
    + '            floor_dispo_qty_out = NVL(floor_dispo_qty_out,0) - v_floor_dispo_qty  '
    + '      where id = v_day_part_id_new;                                               '
    + '  end if;                                                                         '
    +

    { if good_pts is 0 then turn actcav = 0 that will make this day_part hidden }
    '  update %s set actcav = 0                                                        '
    + '  where id = v_day_part_id                                                        '
    + '    and NVL(good_pts,0) = 0                                                       '
    + '    and NVL(floor_dispo_qty,0) = 0                                                '
    + '    and NVL(floor_dispo_qty_out,0) = 0;                                           '
    + 'end; ', [AQty, FDay_Part_ID, FDay_Part_ID_New, FDayPartTableName,
    FDayPartTableName, FDayPartTableName, FDayPartTableName, FDayPartTableName,
    FDayPartTableName]);

  ExecuteCommandFmt('update master_label set day_part_id = %f where id = %f',
    [FDay_Part_ID_New, FMaster_Label_ID]);

  A := SelectValueArrayFmt
    ('select itemno, rev, class, descrip, descrip2 from arinvt where id = %f',
    [FArinvt_ID_New]);
  if VarArrayDimCount(A) > 0 then
    ExecuteCommandFmt('update master_label        ' +
      '   set arinvt_id = %.0f,   ' + '       itemno    = ''%s'', ' +
      '       rev       = ''%s'', ' + '       class     = ''%s'', ' +
      '       descrip   = ''%s'', ' + '       descrip2  = ''%s''  ' +
      ' where id = %f             ', [FArinvt_ID_New, FixStr(A[0]),
      FixStr(A[1]), FixStr(A[2]), FixStr(A[3]), FixStr(A[4]),
      FMaster_Label_ID]);
end;

procedure TFrmProdChangeItem.IQUDComboBoxRevCloseUp(Sender: TUniDBComboBox;
  Select: Boolean);
begin
  if not Select then
    EXIT;

  with Sender do
    if (ItemIndex > -1) and (Length(Items[ItemIndex]) > 15) then
      PostMessage(self.Handle, iq_Notify, 0, 0);
  { IQMS.Common.JumpConstants.pas }
end;

procedure TFrmProdChangeItem.IQNotify(var Msg: TMessage);
begin
  IQWarning(
    'Please note the Revision field can be only 15 chars long - any extra characters will be truncated.')
end;

end.
