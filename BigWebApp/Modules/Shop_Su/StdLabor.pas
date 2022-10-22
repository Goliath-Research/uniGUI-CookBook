unit StdLabor;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.DBGrids,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Error,
  FireDAC.Phys,
  MainModule,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
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
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu;

type
  TFrmStdLaborHrs = class(TUniForm)
    Panel1: TUniPanel;
    NavMain: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    sbtnAssignHrs: TUniSpeedButton;
    SrcStd_Labor: TDataSource;
    QryStd_Labor: TFDQuery;
    QryStd_LaborMFGTYPE: TStringField;
    QryStd_LaborMFGCELL: TStringField;
    QryStd_LaborSHIFT: TBCDField;
    QryStd_LaborSUN_LABOR_HRS: TFMTBCDField;
    QryStd_LaborMON_LABOR_HRS: TFMTBCDField;
    QryStd_LaborTUE_LABOR_HRS: TFMTBCDField;
    QryStd_LaborWED_LABOR_HRS: TFMTBCDField;
    QryStd_LaborTHU_LABOR_HRS: TFMTBCDField;
    QryStd_LaborFRI_LABOR_HRS: TFMTBCDField;
    QryStd_LaborSAT_LABOR_HRS: TFMTBCDField;
    QryMfgType: TFDQuery;
    QryMfgCell: TFDQuery;
    QryStd_LaborMfgTypeLookup: TStringField;
    QryStd_LaborMfgCellLookUp: TStringField;
    sbtnLoadMfgType: TUniSpeedButton;
    PopupMenu1: TUniPopupMenu;
    PreloadMfgTypesMfgCellsShifts1: TUniMenuItem;
    Assignhourstoashift1: TUniMenuItem;
    QryStd_LaborMFGCELL_ID: TBCDField;
    QryStd_LaborEMP_LEVEL_ID: TBCDField;
    QryEmp_Level: TFDQuery;
    QryStd_LaborEmp_Level_Lookup: TStringField;
    QryLoadMfgTypeCells: TFDQuery;
    sbtnSearch: TUniSpeedButton;
    PkStdLabor: TIQWebHPick;
    PkStdLaborMFGTYPE: TStringField;
    PkStdLaborMFGCELL: TStringField;
    PkStdLaborMFGCELL_ID: TBCDField;
    PkStdLaborSHIFT: TBCDField;
    PkStdLaborEMP_LEVEL_ID: TBCDField;
    PkStdLaborEMP_CODE: TStringField;
    sbtnRollHoursFromTA: TUniSpeedButton;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellID: TBCDField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QryStd_LaborUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

    procedure QryStd_LaborBeforeEdit(DataSet: TDataSet);
    procedure QryStd_LaborBeforePost(DataSet: TDataSet);
    procedure QryStd_LaborMFGTYPEChange(Sender: TField);
    procedure QryStd_LaborMFGCELLChange(Sender: TField);
    procedure sbtnAssignHrsClick(Sender: TObject);
    procedure QryStd_LaborBeforeInsert(DataSet: TDataSet);
    procedure sbtnLoadMfgTypeClick(Sender: TObject);
    { TODO -oysingh -cWebConvert : TnavigateBtn and TGridDrawState not converted to uni component }
  {  procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);    }
    procedure sbtnSearchClick(Sender: TObject);
    procedure sbtnRollHoursFromTAClick(Sender: TObject);
    procedure QryStd_LaborNewRecord(DataSet: TDataSet);
    procedure QryStd_LaborAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    function GetAssignID( AMfgType:string; AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID: Real; AMfgCell: String; ASkipLookup: Boolean = FALSE ): Real;
    procedure UpdateHoursFor( ID: Real; New_MfgType:string; New_MfgCell_id, New_Shift, AWeek_Day, ALabor_Hrs, AEmp_Level_ID: Real );
    procedure DeleteHoursFor( AMfgType:string; AMfgCell_id, AShift, AEmp_Level_ID: Real );
    procedure LoadEmpLevels( AEmpLevels: TStringList );
    function GetStdLaborID( AMfgType:string; AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID: Real ): Real;
  protected
    procedure DoRefresh(Sender: TObject);
  public
    { Public declarations }
    Old_MfgType     : string;
    Old_MfgCell_ID  : Real;
    Old_Shift       : Real;
    Old_Emp_Level_ID: Real;
    Old_MfgCell     : string;
    class procedure DoShow;
  end;

procedure DoSetStdLaborHrs;

Const
  MAX_REAL = 999999999;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.InputQuery,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.PanelMsg,
  System.Variants;

class procedure TFrmStdLaborHrs.DoShow;
var
  LFrmStdLaborHrs : TFrmStdLaborHrs;
begin
  LFrmStdLaborHrs := TFrmStdLaborHrs.Create(UniGUIApplication.UniApplication);
  LFrmStdLaborHrs.Show;
end;

procedure DoSetStdLaborHrs;
begin
  TFrmStdLaborHrs.DoShow;
end;

procedure TFrmStdLaborHrs.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, DBGrid1 ]);
  IQSetTablesActive( TRUE, self );
  { TODO -oysingh -cWebConvert : Sending uni ccomponent, but it will only accept a non uni component. Component is navigator }
  //IQMS.Common.Controls.ResizeNavBar(NavMain);
end;

procedure TFrmStdLaborHrs.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, DBGrid1 ]);
end;

procedure TFrmStdLaborHrs.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { TODO -oysingh -cWebConvert : Property For TUniDBGrid SelectedField not defined }
  {if Key = VK_DELETE then
     if Assigned(DBGrid1.SelectedField) then with QryStd_Labor do
     begin
       Edit;
       if DBGrid1.SelectedField.FieldKind = fkLookup then
          FieldByName( DBGrid1.SelectedField.KeyFields ).Clear
       else
          DBGrid1.SelectedField.Clear;
       Key:= 0;
     end; }
end;

procedure TFrmStdLaborHrs.QryStd_LaborUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

var
  New_MfgType     : string;
  New_MfgCell_ID  : Real;
  New_Shift       : Real;
  I               : Integer;
  ID              : Real;
  ALabor_Hrs      : Real;
  New_Emp_Level_ID: Real;
  New_MfgCell     : string;
begin
  if not (ARequest in [arUpdate, arInsert, arDelete]) then
  begin
    AAction:= eaDefault;
    EXIT;
  end;

  with ASender do
  begin
    New_MfgType     := FieldByName('mfgtype').asString;
    New_MfgCell_id  := FieldByName('mfgcell_id').asFloat;
    New_Shift       := FieldByName('shift').asFloat;
    New_Emp_Level_ID:= FieldByName('emp_level_id').asFloat;
    New_MfgCell     := SelectValueById('mfgcell', 'mfgcell', QryMfgCellID.AsFloat);
  end;

  with ASender do
    if ARequest = arDelete then
       DeleteHoursFor( Old_MfgType, Old_MfgCell_Id, Old_Shift, Old_Emp_Level_ID )
    else
       for I:= 1 to 7 do
       begin
         if ARequest = arUpdate then
            ID:= GetAssignID( Old_MfgType, Old_MfgCell_id, Old_Shift, I, Old_Emp_Level_ID, Old_MfgCell, FALSE )
         else if ARequest = arInsert then
            ID:= GetAssignID( New_MfgType, New_MfgCell_id, New_Shift, I, New_Emp_Level_ID, New_MfgCell, TRUE );  {TRUE = skip lookup and always insert new record. This way unique constraint will be kept up}
         case I of
           1: ALabor_Hrs:= FieldByName('sun_labor_hrs').asFloat;
           2: ALabor_Hrs:= FieldByName('mon_labor_hrs').asFloat;
           3: ALabor_Hrs:= FieldByName('tue_labor_hrs').asFloat;
           4: ALabor_Hrs:= FieldByName('wed_labor_hrs').asFloat;
           5: ALabor_Hrs:= FieldByName('thu_labor_hrs').asFloat;
           6: ALabor_Hrs:= FieldByName('fri_labor_hrs').asFloat;
           7: ALabor_Hrs:= FieldByName('sat_labor_hrs').asFloat;
         end;
         UpdateHoursFor( ID, New_MfgType, New_MfgCell_id, New_Shift, I, ALabor_Hrs, New_Emp_Level_ID );
       end;
  AAction := eaApplied;
end;

procedure TFrmStdLaborHrs.DeleteHoursFor( AMfgType:string; AMfgCell_id, AShift, AEmp_Level_ID: Real );
begin
  if AMfgCell_id = 0 then
     ExecuteCommandFmt('delete from std_labor where mfgtype = ''%s'' and mfgcell_ID is NULL and shift = %f and emp_level_id = %f',
               [FixStr(AMfgType), AShift, AEmp_Level_ID ])
  else
     ExecuteCommandFmt('delete from std_labor where mfgtype = ''%s'' and mfgcell_ID = %f and shift = %f and emp_level_id = %f',
               [FixStr(AMfgType), AMfgCell_id, AShift, AEmp_Level_ID ]);
end;

function TFrmStdLaborHrs.GetStdLaborID( AMfgType:string; AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID: Real ): Real;
begin
  if AMfgCell_id = 0 then
     Result:= SelectValueFmtAsFloat('select ID from std_labor where mfgtype = ''%s'' and mfgcell_id is NULL and shift = %f and week_day = %f and emp_level_id = %f', [ FixStr(AMfgType), AShift, AWeek_Day, AEmp_Level_ID ])
  else
     Result:= SelectValueFmtAsFloat('select ID from std_labor where mfgtype = ''%s'' and mfgcell_id = %f and shift = %f and week_day = %f and emp_level_id = %f',[ FixStr(AMfgType), AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID ]);
end;

function TFrmStdLaborHrs.GetAssignID( AMfgType:string; AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID: Real; AMfgCell: String; ASkipLookup: Boolean = FALSE ): Real;
var
  ID: Real;
begin
  if not ASkipLookup then
     ID:= GetStdLaborID( AMfgType, AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID );

  if ASkipLookup or (ID = 0) then
  begin
    ID:= GetNextID( 'std_labor' );
    //ExecuteCommandFmt( 'insert into std_labor( id, mfgtype, mfgcell_id, shift, week_day, emp_level_id ) ' +
    //           'values (%f, ''%s'', Decode(%f, 0, null, %f), %f, %f, %f )',
    //           [ ID, AMfgType, AMfgCell_id, AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID ]);
    ExecuteCommandParam( 'insert into std_labor                                             '+
                         '       ( id, mfgtype, mfgcell_id, shift, week_day, emp_level_id, mfgcell ) '+
                         'values                                                            '+
                         '       ( :ID, :MFGTYPE, IQMS.Common.Miscellaneous.zero_as_null(:MFGCELL_ID), :SHIFT, :WEEK_DAY, :EMP_LEVEL_ID, :MFGCELL )',
                         ['ID;F',
                          'MFGTYPE',
                          'MFGCELL_ID;F',
                          'SHIFT;F',
                          'WEEK_DAY;F',
                          'EMP_LEVEL_ID;F',
                          'MFGCELL'],
                         [ ID, AMfgType, AMfgCell_id, AShift, AWeek_Day, AEmp_Level_ID, AMfgCell]);
  end;

  Result:= ID;
end;

procedure TFrmStdLaborHrs.UpdateHoursFor( ID: Real; New_MfgType:string; New_MfgCell_id, New_Shift, AWeek_Day, ALabor_Hrs, AEmp_Level_ID: Real );
begin
  ExecuteCommandFmt( 'update std_labor         '+
             '   set mfgtype = ''%s'', '+
             '       mfgcell_id = Decode(%f, 0, null, %f), '+
             '       shift = %f,       '+
             '       labor_hrs = %f,   '+
             '       week_day = %f,    '+
             '       emp_level_id = %f '+
             ' where ID = %f           ',
             [ FixStr(New_MfgType), New_MfgCell_id, New_MfgCell_id, New_Shift, ALabor_Hrs, AWeek_Day, AEmp_Level_ID, ID ]);
end;

procedure TFrmStdLaborHrs.QryStd_LaborAfterPost(DataSet: TDataSet);
begin
  try
    QryStd_Labor.ApplyUpdates();
    QryStd_Labor.CommitUpdates;
  except on E:Exception do
    begin
      IQError(E.Message);
      QryStd_Labor.Close;
      QryStd_Labor.Open;
      Abort
    end;
  end;
end;

procedure TFrmStdLaborHrs.QryStd_LaborBeforeEdit(DataSet: TDataSet);
begin
  with QryStd_Labor do
    if State = dsBrowse then
    begin
      Old_MfgType     := FieldByName('mfgtype').asString;
      Old_MfgCell_id  := FieldByName('mfgcell_id').asFloat;
      Old_Shift       := FieldByName('shift').asFloat;
      Old_Emp_Level_ID:= FieldByName('emp_level_id').asFloat;
      Old_MfgCell     := FieldByName('mfgcell').asString;
    end;
end;

procedure TFrmStdLaborHrs.QryStd_LaborBeforeInsert(DataSet: TDataSet);
begin
  with QryStd_Labor do
    if State = dsBrowse then
    begin
      Old_MfgType     := '';
      Old_MfgCell_ID  := 0;
      Old_Shift       := 0;
      Old_Emp_Level_ID:= 0;
    end;
end;

procedure TFrmStdLaborHrs.QryStd_LaborBeforePost(DataSet: TDataSet);
var
  AQryResult : variant;
  {
    EIQ-12091
    Function name : IsCompositeKeyModifed
    Description   : Function checked if composite keys are changed or not. If changed then it goes for post the changes and
                    if values are not Unique then we raise our own exception.
  }
  function L_IsCompositeKeyModifed: Boolean;
  begin
     if VarSameValue(QryStd_LaborMFGTYPE.OldValue, QryStd_LaborMFGTYPE.NewValue)  AND
        VarSameValue(QryStd_LaborMFGCELL_ID.OldValue, QryStd_LaborMFGCELL_ID.NewValue) AND
        VarSameValue(QryStd_LaborEMP_LEVEL_ID.OldValue, QryStd_LaborEMP_LEVEL_ID.NewValue) AND
        VarSameValue(QryStd_LaborSHIFT.OldValue, QryStd_LaborSHIFT.NewValue) then
        Result := False
     else
        Result := True;
  end;

  function L_BuildSQL(AField: TField): string;
  begin
     if AField.IsNull then
        Result := AField.FieldName + ' IS NULL '
     else
        begin
          case AField.DataType of
            ftString : Result := AField.FieldName + ' = ' +'''' + AField.AsString + '''';
            ftInteger : Result := AField.FieldName + ' = ' + IntToStr(AField.AsInteger) ;
            ftFloat : Result := AField.FieldName + ' = ' + FloatToStr(AField.AsFloat) ;
            ftBCD : Result := AField.FieldName + ' = '+ FloatToStr(AField.AsFloat) ;
          end;
        end;

  end;
begin

  with QryStd_Labor do
  begin
    AQryResult :=  SelectValue('SELECT ' +
                                  '1 count ' +
                               'FROM ' +
                                  'std_labor ' +
                               'WHERE ' +
                                  L_BuildSQL(QryStd_LaborMFGTYPE) + ' AND ' +
                                  L_BuildSQL(QryStd_LaborMFGCELL_ID) + ' AND ' +
                                  L_BuildSQL(QryStd_LaborEMP_LEVEL_ID) + ' AND ' +
                                  L_BuildSQL(QryStd_LaborSHIFT) + ' AND ' +
                                  'ROWNUM < 2');

    if not VarIsNull(AQryResult) and L_IsCompositeKeyModifed then
    begin
        raise Exception.Create('Unique Key Violation.'#13#10'A record with those values already exists. Cannot post changes.');
    end;
    IQAssert( FieldByName('Shift').asInteger in [1,2,3,4], 'Shift# must be between 1 to 4');
    IQAssert( FieldByName('emp_level_id').asFloat > 0, 'Employee level must be assigned');
  end;
end;

procedure TFrmStdLaborHrs.QryStd_LaborMFGTYPEChange(Sender: TField);
begin
  QryStd_LaborMFGCell.OnChange:= NIL;
  try
    QryStd_LaborMFGCell_ID.Clear;
  finally
    QryStd_LaborMFGCell.OnChange:= QryStd_LaborMFGCELLChange;
  end;
end;

procedure TFrmStdLaborHrs.QryStd_LaborNewRecord(DataSet: TDataSet);
begin
  QryStd_LaborMFGTYPE.Clear;
  QryStd_LaborMFGCELL.Clear;
  QryStd_LaborSHIFT.Clear;
  QryStd_LaborMFGCELL_ID.Clear;
  QryStd_LaborEMP_LEVEL_ID.Clear;
end;

procedure TFrmStdLaborHrs.QryStd_LaborMFGCELLChange(Sender: TField);
begin
  QryStd_LaborMFGTYPE.OnChange:= NIL;
  try
    if QryStd_LaborMFGCELL_ID.asString = '' then
       QryStd_LaborMFGTYPE.Clear
    else
       QryStd_LaborMFGTYPE.asString:= SelectValueFmtAsString('select mfgtype from mfgcell where ID = %f ', [ QryStd_LaborMFGCELL_ID.asFloat ]);
  finally
    QryStd_LaborMFGTYPE.OnChange:= QryStd_LaborMFGTYPEChange;
  end;
end;

procedure TFrmStdLaborHrs.sbtnAssignHrsClick(Sender: TObject);
var
  S   : string;
  AHrs: Real;
begin
  if IQInputQuery( 'Shift labor hours', 'Enter labor hours', S ) and ( Trim( S ) <> '' ) then
  begin
    AHrs:= StrToFloat( S );
    if MAX_REAL < AHrs  then
      raise Exception.Create('Sorry, that number cannot fit in the field.  Please enter a number within the acceptable range.');

    with QryStd_Labor do
    begin
      Edit;
      FieldByName('sun_labor_hrs').asFloat:= AHrs;
      FieldByName('mon_labor_hrs').asFloat:= AHrs;
      FieldByName('tue_labor_hrs').asFloat:= AHrs;
      FieldByName('wed_labor_hrs').asFloat:= AHrs;
      FieldByName('thu_labor_hrs').asFloat:= AHrs;
      FieldByName('fri_labor_hrs').asFloat:= AHrs;
      FieldByName('sat_labor_hrs').asFloat:= AHrs;
      Post;
    end;
  end;
end;


procedure TFrmStdLaborHrs.DoRefresh(Sender: TObject);
var
  AMfgType: string;
  AMfgCell_ID: Real;
  AShift  : Integer;
  AEmp_Level_ID: Real;
  Located : Boolean;
begin
  with QryStd_Labor do
  try
    AMfgType     := FieldByName('mfgtype').asString;
    AMfgCell_ID  := FieldByName('mfgcell_id').asFloat;
    AShift       := FieldByName('shift').asInteger;
    AEmp_Level_ID:= FieldByName('Emp_Level_ID').asInteger;
    DisableControls;
    Close;
  finally
    Open;
    EnableControls;

    if AMfgCell_ID <> 0 then
       // Located:= Locate( 'MFGTYPE;MFGCELL_ID;SHIFT;EMP_LEVEL_ID', VarArrayOf([ PadR(AMfgType, 10), AMfgCell_ID, AShift, AEmp_Level_ID ]), [])
       Located:= Locate( 'MFGTYPE;MFGCELL_ID;SHIFT;EMP_LEVEL_ID', VarArrayOf([ AMfgType, AMfgCell_ID, AShift, AEmp_Level_ID ]), [])
    else
       // Located:= Locate( 'MFGTYPE;MFGCELL_ID;SHIFT;EMP_LEVEL_ID', VarArrayOf([ PadR(AMfgType,10), NULL, AShift, AEmp_Level_ID ]), []);
       Located:= Locate( 'MFGTYPE;MFGCELL_ID;SHIFT;EMP_LEVEL_ID', VarArrayOf([ AMfgType, NULL, AShift, AEmp_Level_ID ]), []);

    if not Located then
       IQWarning(IQFormat( 'Failed to refresh using the following criteria:'#13'MfgType = %s'#13'MfgCell_id = %0.f'#13'Shift = %d'#13'Emp_Level_ID = %.0f',
                         [ AMfgType, AMfgCell_id, AShift, AEmp_Level_ID ]));
  end;
end;

procedure TFrmStdLaborHrs.sbtnLoadMfgTypeClick(Sender: TObject);
var
  Shifts: Integer;
  I, J, K: Integer;
  AEmpLevels: TStringList;
  hMsg: TPanelMesg;

  function CheckMfgcellScheduleHasShift( AShift: Real ): Boolean;
  begin
    Result:= (QryLoadMfgTypeCells.FieldByName('mfgcell_param_id').asFloat = 0)
             or
             (QryLoadMfgTypeCells.FieldByName('mfgcell_specific_shifts').asFloat >= AShift);
  end;

begin
  AEmpLevels:= TStringList.Create;
  hMsg:= hPleaseWait('');
  try
      LoadEmpLevels( AEmpLevels );
      IQAssert( AEmpLevels.Count > 0, 'You must assign employee levels master list. Use System tab, Parameters, Employee Level option' );

      Reopen(QryLoadMfgTypeCells);
      with QryLoadMfgTypeCells do
      try
        if Eof then
        begin
          IQConfirm('Your STD labour contains all possible combinations of mfgtypes and mfgcells.'#13'Nothing needs to be added');
          EXIT;
        end;

        Shifts:= Trunc(SelectValueAsFloat('select shifts from params'));

        while not Eof do
        begin
          for I:= 1 to Shifts do
            for J:= 1 to 7 do
              for K:= 0 to AEmpLevels.Count - 1 do
              try

                hMsg.Mesg:= IQFormat('%s %s, Shift %d, Emp Level %s ...',
                                     [ FixStr(Trim(Fields[ 0 ].asString)),  {mfgtype}
                                       FixStr(Trim(Fields[ 1 ].asString)),  {cell}
                                       I,                           {shift}
                                       AEmpLevels[ K ] ]);          {level}

                if ( GetStdLaborID( Fields[ 0 ].asString,
                                    Fields[ 2 ].asFloat,
                                    I,
                                    J,
                                    StrToFloat( AEmpLevels[ K ] )) = 0)
                     and
                     CheckMfgcellScheduleHasShift( I ) then

                  ExecuteCommandFmt('insert into std_labor( mfgtype, mfgcell_id, shift, week_day, emp_level_id ) values( ''%s'', Decode(%f, 0, null, %f), %d, %d, %s)',
                             [ FixStr(Fields[ 0 ].asString),
                               Fields[ 2 ].asFloat,
                               Fields[ 2 ].asFloat,
                               I,
                               J,
                               AEmpLevels[ K ] ]);
              except on E: EFDDBEngineException do with E as EFDDBEngineException do {s/n happen}
                if Errors[ ErrorCount - 1 ].ErrorCode = 1 then ;       {combination exists - do nothing}
              end;
          Next;
        end;

        QryStd_Labor.Close;
        QryStd_Labor.Open;
      finally
        // Free;
        QryLoadMfgTypeCells.Close;
      end;
  finally
    hMsg.Free;
    AEmpLevels.Free;
  end;
end;

procedure TFrmStdLaborHrs.LoadEmpLevels( AEmpLevels: TStringList );
begin
  AEmpLevels.Clear;
  with TFDQuery.Create(self) do
  try
    Connection:= UniMainModule.FDConnection1;
    SQL.Add('select id from emp_level order by id');
    Open;
    while not Eof do
    begin
      AEmpLevels.Add( FieldByName('ID').asString );
      Next;
    end;
  finally
    Free;
  end;
end;
 { TODO -oysingh -cWebConvert : TnavigateBtn and TGridDrawState not converted to uni component }
{procedure TFrmStdLaborHrs.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State)
     and StrInList( Copy(Column.FieldName, 1, 4), [ 'MON_', 'TUE_', 'WED_', 'THU_', 'FRI_', 'SAT_', 'SUN_' ])
     and (Column.Field.AsFloat = 0) then
    DBGrid1.Canvas.Font.Color:= clSilver;

  DBGrid1.DefaultDrawColumnCell( Rect, DataCol, Column, State );
end;

procedure TFrmStdLaborHrs.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
 if Button = nbRefresh then
    begin
      DoRefresh(Sender);
      System.SysUtils.Abort;
    end;
end;            }


procedure TFrmStdLaborHrs.sbtnSearchClick(Sender: TObject);

  procedure LocateRecord( AMfgtype: string; AMfgcell_ID, AShift, AEmp_Level_ID: Real );
  begin
    with QryStd_Labor do
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if (FieldByName('MFGTYPE').asString = AMfgtype)
           and
           (FieldByName('MFGCELL_ID').asFloat = AMfgcell_ID)
           and
           (FieldByName('SHIFT').asFloat = AShift)
           and
           (FieldByName('EMP_LEVEL_ID').asFloat = AEmp_Level_ID ) then
          EXIT;

        Next;
      end;
    finally
      EnableControls;
    end;

    IQWarning(Format('Unable to locate combination of mfgtype = %s, mfgcell_id = %.0f, shift = %.0f, emp level id = %.0f',
                     [ FixStr(AMfgtype), AMfgcell_ID, AShift, AEmp_Level_ID ]))
  end;

begin
  with PkStdLabor do
    if Execute then
       LocateRecord( GetValue('MFGTYPE'), GetValue('MFGCELL_ID'), GetValue('SHIFT'), GetValue('EMP_LEVEL_ID'));
end;

procedure TFrmStdLaborHrs.sbtnRollHoursFromTAClick(Sender: TObject);
begin
  inherited;  // n
  if (QryStd_LaborMFGTYPE.asString = '') or (QryStd_LaborEMP_LEVEL_ID.asFloat = 0) then
     EXIT;

  if not IQConfirmYN('Assign current week standard labor hours based on Time & Attendance Calendar?') then
     EXIT;

  ExecuteCommandFmt('begin                                               '+
            '  assy1_misc.assign_snd_labor_week_from_ta( ''%s'', '+   // v_mfgtype
            '                                            ''%s'', '+   // v_mfgcell_id
            '                                            %f,     '+   // v_emp_level_id
            '                                            %f );   '+   // v_shift
            '                                                    '+
            'end;                                                ',
            [ FixStr(QryStd_LaborMFGTYPE.asString),
              QryStd_LaborMFGCELL_ID.asString,
              QryStd_LaborEMP_LEVEL_ID.asFloat,
              QryStd_LaborSHIFT.asFloat ]);
  { TODO -oysingh -cWebConvert : TUniDBnavigator does not have a method BtnClick }
  //NavMain.BtnClick(nbRefresh);
end;

end.
