unit ShipDays_Ship_To;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  ShipDays,
  Data.DB,
  Vcl.Buttons,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame, uniCheckBox, uniDBCheckBox;

type
  TFrmShipmentDaysShipTo = class(TFrmShipmentDays)
    Label1: TUniLabel;
    Label2: TUniLabel;
    wwComboPreferredShipday: TUniDBComboBox;
    wwDBGrid1: TIQUniGridControl;
    Bevel2: TUniPanel;
    SrcShipToCalendar: TDataSource;
    QryShipToCalendar: TFDQuery;
    QryShipToCalendarID: TBCDField;
    QryShipToCalendarSHIP_TO_ID: TBCDField;
    QryShipToCalendarDESCRIP: TStringField;
    QryShipToCalendarSTART_TIME: TDateTimeField;
    QryShipToCalendarEND_TIME: TDateTimeField;
    UpdateSQL1: TFDUpdateSQL;
    QryShipToCalendarEXCLUDE_TRANSIT: TStringField;
    sbtnRecalcMustShipDate: TUniSpeedButton;
    Bevel3: TUniPanel;
    procedure QryShipToCalendarBeforePost(DataSet: TDataSet);
    procedure ApplyUpdateToTable(DataSet: TDataSet);
    { TODO : TNavigateBtn not converted yet }
  //  procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure btnOKClick(Sender: TObject);
    procedure wwComboPreferredShipdayDropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CheckParentPosted(DataSet: TDataSet);
    procedure sbtnRecalcMustShipDateClick(Sender: TObject);
    procedure wwComboPreferredShipdayChange(Sender: TObject);
  private
    { Private declarations }
    FShip_To_BeforePost: TDataSetNotifyEvent;
    FTblShip_To: TDataSet;
    procedure LocalShipToBeforePost(DataSet: TDataSet);
    procedure ColorPreferredShipDayCheckBox;
    procedure SetTblShip_To(const Value: TDataSet);
  public
    { Public declarations }
    property TblShip_To : TDataSet write SetTblShip_To;
    class procedure DoShowShipmentDays( ATblShip_To: TDataSet );
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  oe_misc,
  UniGUIApplication,
  IQMS.Common.StringUtils;

{ TFrmShipmentDaysShipTo }

class procedure TFrmShipmentDaysShipTo.DoShowShipmentDays(ATblShip_To: TDataSet);
var
  LFrmShipmentDaysShipTo : TFrmShipmentDaysShipTo;
begin
   LFrmShipmentDaysShipTo := TFrmShipmentDaysShipTo.Create( UniGUIApplication.UniApplication );
   with LFrmShipmentDaysShipTo do
   begin
     TblShip_To := ATblShip_To;
     ShowModal;
   end;
end;

procedure TFrmShipmentDaysShipTo.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  if Assigned(DataSource1.DataSet) then
     DataSource1.DataSet.BeforePost:= FShip_To_BeforePost;
  inherited;
end;

procedure TFrmShipmentDaysShipTo.FormShow(Sender: TObject);
begin
  inherited; {nothing}
  FShip_To_BeforePost:= FTblShip_To.BeforePost;
  FTblShip_To.BeforePost:= LocalShipToBeforePost;
  ColorPreferredShipDayCheckBox;
end;

procedure TFrmShipmentDaysShipTo.LocalShipToBeforePost(DataSet: TDataSet);
var
  AShipDays: array[1..7] of Boolean;

  function IsNothingChecked: Boolean;
  var
    I: Integer;
  begin
    for I:= 1 to 7 do if AShipDays[ I ] then
      begin
        Result:= FALSE;
        EXIT;
      end;
    Result:= TRUE;
  end;
begin
  if DataSet.FieldByName('preferred_ship_day').asInteger in [ 1..7 ] then
     begin
       AShipDays[ 1 ]:= DataSet.FieldByName('sun_ship').asString = 'Y';
       AShipDays[ 2 ]:= DataSet.FieldByName('mon_ship').asString = 'Y';
       AShipDays[ 3 ]:= DataSet.FieldByName('tue_ship').asString = 'Y';
       AShipDays[ 4 ]:= DataSet.FieldByName('wed_ship').asString = 'Y';
       AShipDays[ 5 ]:= DataSet.FieldByName('thu_ship').asString = 'Y';
       AShipDays[ 6 ]:= DataSet.FieldByName('fri_ship').asString = 'Y';
       AShipDays[ 7 ]:= DataSet.FieldByName('sat_ship').asString = 'Y';

       {check if nothing selected default ship days to M-F}
       if IsNothingChecked then
       begin
         AShipDays[ 2 ]:= TRUE;
         AShipDays[ 3 ]:= TRUE;
         AShipDays[ 4 ]:= TRUE;
         AShipDays[ 5 ]:= TRUE;
         AShipDays[ 6 ]:= TRUE;
       end;

       case DataSet.FieldByName('preferred_ship_day').asInteger of
         1: IQAssert( AShipDays[ 1 ], 'Unable to accept Sunday as preferred shipping day - check valid shipping days');
         2: IQAssert( AShipDays[ 2 ], 'Unable to accept Monday as preferred shipping day - check valid shipping days');
         3: IQAssert( AShipDays[ 3 ], 'Unable to accept Tuesday as preferred shipping day - check valid shipping days');
         4: IQAssert( AShipDays[ 4 ], 'Unable to accept Wednesday as preferred shipping day - check valid shipping days');
         5: IQAssert( AShipDays[ 5 ], 'Unable to accept Thursday  as preferred shipping day - check valid shipping days');
         6: IQAssert( AShipDays[ 6 ], 'Unable to accept Friday as preferred shipping day - check valid shipping days');
         7: IQAssert( AShipDays[ 7 ], 'Unable to accept Saturday as preferred shipping day - check valid shipping days');
       end;
     end

  else if DataSet.FieldByName('preferred_ship_day').asInteger <> 0 then
     raise Exception.Create('Invalid preferred shipping day specified');  // s/n happen

  if Assigned( FShip_To_BeforePost ) then
     FShip_To_BeforePost( DataSet );
end;

procedure TFrmShipmentDaysShipTo.QryShipToCalendarBeforePost(DataSet: TDataSet);
var
  S: string;
begin
  inherited;  {nothing}

  if DataSet.FieldByName('id').asFloat = 0 then
     DataSet.FieldByName('id').asFloat:= GetNextID('ship_to_calendar');

  if DataSet.FieldByName('ship_to_id').asFloat = 0 then
     DataSet.FieldByName('ship_to_id').asFloat:= DataSource1.DataSet.FieldByName('id').asFloat;

  {validate interval}
  IQAssert( DataSet.FieldByName('START_TIME').asDateTime < DataSet.FieldByName('END_TIME').asDateTime, 'Invalid ''From'' - ''To'' period specified' );

  {start_time within other period}
  S:= SelectValueFmtAsString('select descrip from ship_to_calendar where ship_to_id = %f and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'') between start_time+1/86400 and end_time-1/86400 and rownum < 2 and id <> %f',
                   [ DataSet.FieldByName('ship_to_id').asFloat,
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('START_TIME').asDateTime ),
                     DataSet.FieldByName('ID').asFloat ]);
  IQAssert( S = '', Format('Crossreference is detected: off period ''%s'' start time is within ''%s'' period', [ DataSet.FieldByName('DESCRIP').asString, S ]));

  {end_time within other period}
  S:= SelectValueFmtAsString('select descrip from ship_to_calendar where ship_to_id = %f and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'') between start_time+1/86400 and end_time-1/86400 and rownum < 2 and id <> %f',
                   [ DataSet.FieldByName('ship_to_id').asFloat,
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('END_TIME').asDateTime ),
                     DataSet.FieldByName('ID').asFloat ]);
  IQAssert( S = '', Format('Crossreference is detected: off period ''%s'' end time is within ''%s'' period', [ DataSet.FieldByName('DESCRIP').asString, S ]));

  {start_time of other period within current period}
  S:= SelectValueFmtAsString('select descrip from ship_to_calendar where ship_to_id = %f and start_time between '+
                   '       to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')+1/86400 and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')-1/86400 and id <> %f',
                   [ DataSet.FieldByName('ship_to_id').asFloat,
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('START_TIME').asDateTime ),
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('END_TIME').asDateTime ),
                     DataSet.FieldByName('ID').asFloat ]);
  IQAssert( S = '', Format('Crossreference is detected: off period ''%s'' start time is within ''%s'' period', [ S, DataSet.FieldByName('DESCRIP').asString ]));

  {end_time of other period within current period}
  S:= SelectValueFmtAsString('select descrip from ship_to_calendar where ship_to_id = %f and end_time between '+
                   '       to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')+1/86400 and to_date(''%s'', ''mm/dd/yy hh24:mi:ss'')-1/86400 and id <> %f',
                   [ DataSet.FieldByName('ship_to_id').asFloat,
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('START_TIME').asDateTime ),
                     FormatDateTime( 'mm/dd/yyyy hh:nn:ss', DataSet.FieldByName('END_TIME').asDateTime ),
                     DataSet.FieldByName('ID').asFloat ]);
  IQAssert( S = '', Format('Crossreference is detected: off period ''%s'' end time is within ''%s'' period', [ S, DataSet.FieldByName('DESCRIP').asString ]));

end;

procedure TFrmShipmentDaysShipTo.ApplyUpdateToTable(DataSet: TDataSet);
begin
{
  try
    FDManager.FindConnection('IQFD').ApplyUpdates([ TFDQuery( DataSet )]);
  except on E: Exception do
    begin
      TFDQuery(DataSet).CancelUpdates;
      IQError( E.Message );
      ABORT;
    end;
  end;
}
end;

{ TODO : TNavigateBtn not converted yet }
{procedure TFrmShipmentDaysShipTo.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
    RefreshDataSetByID( TFDQuery(TUniDBNavigator(Sender).DataSource.DataSet));
    ABORT;
  end;
end;   }

procedure TFrmShipmentDaysShipTo.btnOKClick(Sender: TObject);
begin
  QryShipToCalendar.CheckBrowseMode;
  inherited;
end;

procedure TFrmShipmentDaysShipTo.wwComboPreferredShipdayDropDown(Sender: TObject);
begin
  with wwComboPreferredShipday do
  begin
    Items.Clear;

    if chkSun.Checked then Items.Add( 'Sunday'#9'1'   );
    if chkMon.Checked then Items.Add( 'Monday'#9'2'   );
    if chkTue.Checked then Items.Add( 'Tuesday'#9'3'  );
    if chkWed.Checked then Items.Add( 'Wednesday'#9'4');
    if chkThu.Checked then Items.Add( 'Thursday'#9'5' );
    if chkFri.Checked then Items.Add( 'Friday'#9'6'   );
    if chkSat.Checked then Items.Add( 'Saturday'#9'7' );

    if Items.Count = 0 then
    begin
      // Items.Add( 'Sunday'#9'1'   );
      Items.Add( 'Monday'#9'2'   );
      Items.Add( 'Tuesday'#9'3'  );
      Items.Add( 'Wednesday'#9'4');
      Items.Add( 'Thursday'#9'5' );
      Items.Add( 'Friday'#9'6'   );
      // Items.Add( 'Saturday'#9'7' );
    end;

    { TODO : method not declared for TUniDBComboBox }
    //ApplyList;
  end;
end;

procedure TFrmShipmentDaysShipTo.ColorPreferredShipDayCheckBox;

  procedure ResetCheckBoxesColor;
  begin
    chkSun.Font.Color:= clBlack;
    chkMon.Font.Color:= clBlack;
    chkTue.Font.Color:= clBlack;
    chkWed.Font.Color:= clBlack;
    chkThu.Font.Color:= clBlack;
    chkFri.Font.Color:= clBlack;
    chkSat.Font.Color:= clBlack;
  end;

begin
  ResetCheckBoxesColor;

  if Assigned( DataSource1.DataSet ) then
     case DataSource1.DataSet.FieldByName('preferred_ship_day').asInteger of
       1: chkSun.Font.Color:= clRed;
       2: chkMon.Font.Color:= clRed;
       3: chkTue.Font.Color:= clRed;
       4: chkWed.Font.Color:= clRed;
       5: chkThu.Font.Color:= clRed;
       6: chkFri.Font.Color:= clRed;
       7: chkSat.Font.Color:= clRed;
     end;
end;

procedure TFrmShipmentDaysShipTo.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Assigned( DataSource1.DataSet ) and (Field = DataSource1.DataSet.FieldByName('preferred_ship_day')) then
  begin
    ColorPreferredShipDayCheckBox;
  end;
end;

procedure TFrmShipmentDaysShipTo.CheckParentPosted(DataSet: TDataSet);
begin
  if Assigned( DataSource1.DataSet ) then DataSource1.DataSet.CheckBrowseMode;
end;

procedure TFrmShipmentDaysShipTo.sbtnRecalcMustShipDateClick(Sender: TObject);
begin
  inherited; {nothing}
  ConfirmRecalcOEMustShipDate; {oe_misc.pas}
end;

procedure TFrmShipmentDaysShipTo.SetTblShip_To(const Value: TDataSet);
begin
  FTblShip_To := Value;
end;

procedure TFrmShipmentDaysShipTo.wwComboPreferredShipdayChange(Sender: TObject);
begin
  inherited;

  {delphi is losing it...}
  DataSource1.DataSet.Edit;
  if wwComboPreferredShipday.ItemIndex > -1 then
     DataSource1.DataSet.FieldByName('preferred_ship_day').AsFloat:= StrToFloat(GetToken( wwComboPreferredShipday.Items[ wwComboPreferredShipday.ItemIndex ], #9, 2 ))
  else
     DataSource1.DataSet.FieldByName('preferred_ship_day').Clear;
end;

end.


