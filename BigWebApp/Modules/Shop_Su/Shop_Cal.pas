unit Shop_Cal;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.DBCtrls, //TNavigateBtn
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  MainModule,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, IQUniGrid, uniGUIFrame;

type
  TFrmShopCalendar = class(TUniForm)
    Panel1: TUniPanel;
    SrcV_ShopCalendar: TDataSource;
    QryV_ShopCalendar: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    QryV_ShopCalendarSOURCE: TStringField;
    QryV_ShopCalendarSOURCE_ID: TBCDField;
    QryV_ShopCalendarSHIFT: TBCDField;
    QryV_ShopCalendarSUN_WORKING: TStringField;
    QryV_ShopCalendarMON_WORKING: TStringField;
    QryV_ShopCalendarTUE_WORKING: TStringField;
    QryV_ShopCalendarWED_WORKING: TStringField;
    QryV_ShopCalendarTHU_WORKING: TStringField;
    QryV_ShopCalendarFRI_WORKING: TStringField;
    QryV_ShopCalendarSAT_WORKING: TStringField;
    sbtnAssignDefault: TUniSpeedButton;
    procedure QryV_ShopCalendarBeforeOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
//      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
//      ABrush: TBrush);
    procedure QryV_ShopCalendarAfterScroll(DataSet: TDataSet);
    procedure sbtnAssignDefaultClick(Sender: TObject);
    procedure QryV_ShopCalendarBeforePost(DataSet: TDataSet);
    procedure DoAbortOnBefore(DataSet: TDataSet);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryV_ShopCalendarUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);

    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    FSource   : string;
    FSource_ID: Real;
    FShifts   : Real;
    FDays     : Real;

    procedure AssignDefaultShifts;
    procedure UpdateCaption;
    procedure Validate;
    procedure SetFSource(const Value: string);
    procedure SetFSource_ID(const Value: real);
  public
    { Public declarations }
    property Source : string read FSource write SetFSource;
    property Source_ID : real read FSource_ID write SetFSource_ID;
    class procedure DoShowModal(AOwner: TComponent; ASource: string; ASource_ID: Real);
    class function GetShiftsCount( ASource: string; ASource_ID: Real ): Real;
    class function GetDaysCount( ASource: string; ASource_ID: Real ): Real;
    class procedure DoAssignDefaultShiftSilent(AOwner: TComponent; ASource: string; ASource_ID: Real);
    procedure ClearAssignDefaultShifts;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  Shop_Shr,
  Shop_SU_rscstr;


{ TFrmShopCalendar }

class procedure TFrmShopCalendar.DoShowModal(AOwner: TComponent; ASource: string; ASource_ID: Real);
var
  frm: TFrmShopCalendar;
begin
{AOwner not used}

//  OutputDebugString(PChar(ASource));
//  OutputDebugString(PChar(FloatToStr(ASource_ID)));

  // Shop_SU_rscstr.cRsc0000001 =
  // 'Application Error:  Parent ID is undefined.  Cannot continue.'
  IQAssert( ASource_ID > 0, Shop_SU_rscstr.cRsc0000001);

  // Shop_SU_rscstr.cRsc0000002 =
  // 'The working shifts count is zero (0).  Cannot continue.';
  IQAssert( GetShiftsCount( ASource, ASource_ID ) > 0, Shop_SU_rscstr.cRsc0000002);


  frm:= TFrmShopCalendar.Create(uniGUIApplication.UniApplication);
  frm.Source := ASource;
  frm.Source_ID := ASource_ID;

  frm.ShowModal;

end;

class procedure TFrmShopCalendar.DoAssignDefaultShiftSilent(AOwner: TComponent; ASource: string; ASource_ID: Real);
var
  frm: TFrmShopCalendar;
begin
  if ASource_ID = 0 then EXIT;
  if GetShiftsCount( ASource, ASource_ID ) = 0 then EXIT;

  frm:= TFrmShopCalendar.Create(uniGUIApplication.UniApplication);
  frm.Source := ASource;
  frm.Source_ID := ASource_ID;
  frm.ClearAssignDefaultShifts;
end;

class function TFrmShopCalendar.GetShiftsCount(ASource: string; ASource_ID: Real): Real;
begin
  if ASource = Shop_Shr.PARAMS then
     Result:= SelectValueAsFloat('select shifts from params')
  else if ASource = Shop_Shr.MFGCELL_PARAM then
     Result:= SelectValueFmtAsFloat('select shifts from mfgcell_param where id = %f', [ ASource_ID ])
  else if ASource = Shop_Shr.WORK_CENTER then
     Result:= SelectValueFmtAsFloat('select shifts from work_center where id = %f', [ ASource_ID ])
  else if ASource = Shop_Shr.TOOL_PARAMS then
     Result:= SelectValueFmtAsFloat('select shifts from tool_params where id = %f', [ ASource_ID ])
  else
     raise Exception.CreateFmt('Inalid parameter source = %s in call to Shop Calendar', [ ASource ]);
end;

class function TFrmShopCalendar.GetDaysCount(ASource: string;  ASource_ID: Real): Real;
begin
  if ASource = Shop_Shr.PARAMS then
     begin
       if ASource_ID = 1 then
          Result:= SelectValueAsFloat('select mfg_days_week from params')
       else if ASource_ID = 2 then
          Result:= SelectValueAsFloat('select assy_days_week from params')
     end

  else if ASource = Shop_Shr.MFGCELL_PARAM then
     Result:= SelectValueFmtAsFloat('select mfg_days_week from mfgcell_param where id = %f', [ ASource_ID ])

  else if ASource = Shop_Shr.WORK_CENTER then
     Result:= SelectValueFmtAsFloat('select mfg_days_week from work_center where id = %f', [ ASource_ID ])

  else if ASource = Shop_Shr.TOOL_PARAMS then
     Result:= SelectValueFmtAsFloat('select days_week from tool_params where id = %f', [ ASource_ID ])

  else
    // Note:  do not translate.  This message is for developers (and testing).
    raise Exception.CreateFmt(
      'Application Error:  Invalid "source" parameter (%s) in call to ' +
      'Shop Calendar.', [ ASource ]);
end;


procedure TFrmShopCalendar.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
//  Action:= caFree;
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmShopCalendar.QryV_ShopCalendarBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('source').asString  := FSource;
  //   ParamByName('source_id').asFloat:= FSource_ID;
  // end;
  AssignQueryParamValue(DataSet, 'source', FSource);
  AssignQueryParamValue(DataSet, 'source_id', FSource_ID);
end;

procedure TFrmShopCalendar.AssignDefaultShifts;

  procedure DeleteShiftsOverMax;
  begin
    ExecuteCommandFmt('delete from shop_calendar where source = ''%s'' and source_id = %f and shift > %f', [ FSource, FSource_ID, FShifts ]);
  end;

  procedure Ensure7x3Exists;
  begin
    ExecuteCommandFmt('declare                                                   '+
              '  v_source      varchar2(30)::= ''%s'';                   '+
              '  v_source_id   number::= %f;                             '+
              '  I             number;                                   '+
              '  J             number;                                   '+
              '  v_tmp         number;                                   '+
              'begin                                                     '+
              '  for I in 1..7 loop                                      '+
              '    for J in 1..4 loop                                    '+
              '      begin                                               '+
              '        select 1 into v_tmp from shop_calendar            '+
              '         where source = v_source                          '+
              '            and source_id = v_source_id                   '+
              '            and week_day = I                              '+
              '            and shift = J;                                '+
              '      exception when NO_DATA_FOUND then                   '+
              '        insert into shop_calendar                         '+
              '                  ( source,                               '+
              '                    source_id,                            '+
              '                    week_day,                             '+
              '                    shift,                                '+
              '                    working )                             '+
              '            values( v_source, v_source_id, I, J, ''N'' ); '+
              '      end;                                                '+
              '    end loop;                                             '+
              '  end loop;                                               '+
              'end;                                                      ',
              [ FSource, FSource_ID ]);
  end;

  procedure AssignDefaultWorkingDays;
  begin
    ExecuteCommandFmt('declare                                                           '+
              '  v_source      varchar2(30)::= ''%s'';                           '+
              '  v_source_id   number::= %f;                                     '+
              '  v_days        number::= %f;                                     '+
              '  v_shifts      number::= %f;                                     '+
              '                                                                  '+
              '  I             number;                                           '+
              '  J             number;                                           '+
              '  v_count       number;                                           '+
              'begin                                                             '+
              '  for J in 1..v_shifts                                            '+
              '  loop                                                            '+
                    {do we have anything assigned}
              '     select count(*) into v_count from shop_calendar              '+
              '      where source = v_source and source_id = v_source_id         '+
              '        and shift = J and working = ''Y'';                        '+

              '     if NVL(v_count,0) <> v_days then                             '+
                    {first reset all to not working}
              '        for I in 1..7                                             '+
              '        loop                                                      '+
              '          update shop_calendar set working = ''N''                '+
              '           where source = v_source and source_id = v_source_id    '+
              '             and shift = J and week_day = I;                      '+
              '        end loop;                                                 '+
                    {now assign working days}
              '        for I in 1..v_days                                        '+
              '        loop                                                      '+
              '          update shop_calendar set working = ''Y''                '+
              '           where source = v_source and source_id = v_source_id    '+
              '             and shift = J and week_day = decode( I, 7, 1, I+1);  '+
              '        end loop;                                                 '+
              '     end if;                                                      '+
              '  end loop;                                                       '+
              'end;                                                              ',
              [ FSource,
                FSource_ID,
                FDays,
                FShifts ]);
  end;

begin
  DeleteShiftsOverMax;
  Ensure7x3Exists;
  AssignDefaultWorkingDays;
end;


procedure TFrmShopCalendar.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmShopCalendar.UniFormShow(Sender: TObject);
begin
  FShifts   := GetShiftsCount( FSource, FSource_ID );
  FDays     := GetDaysCount( FSource, FSource_ID );

  UpdateCaption;
  AssignDefaultShifts;
end;

procedure TFrmShopCalendar.UpdateCaption;
begin
  if FSource = Shop_Shr.PARAMS then
     begin
       if FSource_ID = 1 then
         // Shop_SU_rscstr.cRsc0000003 = 'Default Mfg Shop Calendar';
         Caption:= Shop_SU_rscstr.cRsc0000003
       else if FSource_ID = 2 then
         // Shop_SU_rscstr.cRsc0000004 = 'Default Generic Shop Calendar';
         Caption:= Shop_SU_rscstr.cRsc0000004
    end
  else if FSource = Shop_Shr.MFGCELL_PARAM then
    // Shop_SU_rscstr.cRsc0000005 = '%s Shop Calendar';
    Caption:= Format(Shop_SU_rscstr.cRsc0000005, [ SelectValueFmtAsString('select iqcalendar.get_mfgcell_param_origin_desc( %f ) from dual', [ FSource_ID ])])

  else if FSource = Shop_Shr.WORK_CENTER then
    // Shop_SU_rscstr.cRsc0000005 = '%s Shop Calendar';
    Caption:= Format(Shop_SU_rscstr.cRsc0000005, [ SelectValueFmtAsString('select rtrim(eqno) from work_center where id = %f', [ FSource_ID ])])

  else if FSource = Shop_Shr.TOOL_PARAMS then
    // Shop_SU_rscstr.cRsc0000006 = 'Project Manager Calendar';
    Caption:= Shop_SU_rscstr.cRsc0000006;
end;
{
procedure TFrmShopCalendar.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if QryV_ShopCalendarSHIFT.asFloat > FShifts then
     ABrush.Color:= clBtnFace;
end;
}


procedure TFrmShopCalendar.QryV_ShopCalendarAfterScroll(DataSet: TDataSet);
begin
  QryV_ShopCalendarSUN_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarMON_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarTUE_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarWED_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarTHU_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarFRI_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
  QryV_ShopCalendarSAT_WORKING.ReadOnly:= QryV_ShopCalendarSHIFT.asFloat > FShifts;
end;

procedure TFrmShopCalendar.sbtnAssignDefaultClick(Sender: TObject);
begin
  // Shop_SU_rscstr.cRsc0000007 =
  // 'This option resets working days and shifts to default ' +
  //  'values. Are you sure you want to continue?';
  if not IQConfirmYN(Shop_SU_rscstr.cRsc0000007) then
    EXIT;

  ClearAssignDefaultShifts;

  Reopen(QryV_ShopCalendar);
end;


procedure TFrmShopCalendar.SetFSource(const Value: string);
begin
  FSource := Value;
end;

procedure TFrmShopCalendar.SetFSource_ID(const Value: real);
begin
  FSource_ID := Value;
end;

procedure TFrmShopCalendar.ClearAssignDefaultShifts;
begin
  {first get rid of everything for this source + source_id}
  ExecuteCommandFmt('delete from shop_calendar where source = ''%s'' and source_id = %f', [ FSource, FSource_ID ]);

  {now add back the default}
  AssignDefaultShifts;
end;


procedure TFrmShopCalendar.QryV_ShopCalendarBeforePost(DataSet: TDataSet);
begin
  Validate;
end;


procedure TFrmShopCalendar.Validate;
var
  N: Integer;
begin
  N:= 0;
  if QryV_ShopCalendarSUN_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarMON_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarTUE_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarWED_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarTHU_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarFRI_WORKING.asString = 'Y' then Inc(N);
  if QryV_ShopCalendarSAT_WORKING.asString = 'Y' then Inc(N);

  // Shop_SU_rscstr.cRsc0000008 =
  // 'Incorrect number of working days (%d) specified. Number of ' +
  //  'working days should be %.f';
  IQAssert( N = FDays, Format(Shop_SU_rscstr.cRsc0000008, [ N, FDays ]));
end;

procedure TFrmShopCalendar.DoAbortOnBefore(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmShopCalendar.ApplyUpdate(DataSet: TDataSet);
begin
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
end;

procedure TFrmShopCalendar.QryV_ShopCalendarUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);

var
  I         : Integer;
  AID       : Real;
  AIsWorking: string;
begin

  for I:= 1 to 7 do
  begin
    case I of
      1: AIsWorking:= QryV_ShopCalendarSUN_WORKING.asString;
      2: AIsWorking:= QryV_ShopCalendarMON_WORKING.asString;
      3: AIsWorking:= QryV_ShopCalendarTUE_WORKING.asString;
      4: AIsWorking:= QryV_ShopCalendarWED_WORKING.asString;
      5: AIsWorking:= QryV_ShopCalendarTHU_WORKING.asString;
      6: AIsWorking:= QryV_ShopCalendarFRI_WORKING.asString;
      7: AIsWorking:= QryV_ShopCalendarSAT_WORKING.asString;
    end;
    ExecuteCommandFmt('update shop_calendar    '+
              '   set working = ''%s'' '+
              ' where source = ''%s''  '+
              '   and source_id = %f   '+
              '   and week_day = %d    '+
              '   and shift = %f       ',
              [ AIsWorking,
                FSource,
                FSource_ID,
                I,
                QryV_ShopCalendarSHIFT.asFloat ]);
  end;

  AAction := eaApplied;
end;



procedure TFrmShopCalendar.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet), 'shift');
    ABORT;
  end;
end;



end.
