unit Shop_Hol;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Mask,
  Dateutils,
  Data.DB,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniStatusBar,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, uniGUIFrame, uniDateTimePicker,
  uniDBDateTimePicker, Vcl.Controls;

type
  TShop_Holiday = class(TUniForm)
    StatusBar1: TUniStatusBar;
    DataSource1: TDataSource;
    QryCenters: TFDQuery;
    QryCentersID: TBCDField;
    QryCentersEQNO: TStringField;
    QryCentersCNTR_DESC: TStringField;
    QryCentersCNTR_TYPE: TStringField;
    procSaveToWorkCenter: TFDStoredProc;
    procSaveToDefault: TFDStoredProc;
    SR: TIQWebSecurityRegister;
    QryCentersEPLANT_ID: TBCDField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    GroupBox1: TUniGroupBox;
    Label4: TUniLabel;
    Label5: TUniLabel;
    dateFrom: TUniDBDateTimePicker;
    dateTo: TUniDBDateTimePicker;
    GroupBox2: TUniGroupBox;
    Panel4: TUniPanel;
    chkAllCenters: TUniCheckBox;
    chkDefault: TUniCheckBox;
    Panel5: TUniPanel;
    IQSearch1: TIQUniGridControl;
    QryCentersPK_HIDE: TStringField;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chkAllCentersClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FFromDate, FToDate: TDateTime;
    procedure Validate;
    procedure IterateWorkCenterCreateDownTime;
    procedure AssignWorkCenterDownTime( work_center_id: Real);
    procedure AssignDefaultCalendar( AType, AMFgCell_ID: Real );
    procedure IterateMfgCellsCreateDownTime;
    procedure SetStatus( const AValue: string );
  protected
    property Status:string write SetStatus;
  public
    { Public declarations }
  end;

procedure DoShopHoliday;


implementation

{$R *.DFM}

uses
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
//  IQSecIns,
  Mfg_Modi,
  System.Variants;

procedure DoShopHoliday;
begin
  with TShop_Holiday.Create(uniGUIApplication.UniApplication) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TShop_Holiday.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  dateFrom.Hint:= 'Enter date and time.'#13'Use arrows to move between the date and time segments.';
  dateTo.Hint  := dateFrom.Hint;
  chkAllCentersClick( NIL );
end;

procedure TShop_Holiday.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TShop_Holiday.chkAllCentersClick(Sender: TObject);
begin
  IQSearch1.Enabled:= not chkAllCenters.Checked;
  if chkAllCenters.Checked then
     IQSearch1.DBGrid.Color:= clBtnFace
  else
     IQSearch1.DBGrid.Color:= clWindow;
end;

procedure TShop_Holiday.Validate;
begin
  try
    FFromDate:= dateof(dateFrom.DateTime) + TimeOf(dateFrom.DateTime);  // StrToDateTime( edFrom.Text );
  except
    raise Exception.Create('Invalid ''From'' Date/Time');
  end;

  try
    FToDate:= dateof(dateTo.DateTime) + TimeOf(dateTo.DateTime);  // StrToDateTime( edTo.Text );
  except
    raise Exception.Create('Invalid ''To'' Date/Time');
  end;

  if FFromDate >= FToDate then
    raise Exception.Create('''To'' Date/Time must be greater than ''From'' Date/Time ');

  if not chkAllCenters.Checked and (IQSearch1.DBGrid.SelectedRows.Count = 0) then
     raise Exception.Create('No Work Center is Selected');
end;

procedure TShop_Holiday.SetStatus( const AValue: string );
begin
  StatusBar1.Panels[0].Text:= AValue;
  StatusBar1.Update;
end;

procedure TShop_Holiday.btnOKClick(Sender: TObject);
begin
  Validate;
  IterateWorkCenterCreateDownTime;
  if chkDefault.Checked then
  begin
     AssignDefaultCalendar( 0 { asy_mach}, 0 {mfgcell_id});
     AssignDefaultCalendar( 1,             0 );
     IterateMfgCellsCreateDownTime;
  end;
  Close;
end;

procedure TShop_Holiday.IterateWorkCenterCreateDownTime;
var
  I:Integer;

  procedure ProcessWorkCenter( AWork_Center_ID: Real; AEqno: string);
  begin
    Status:= Format('Processing work center %s, please wait...', [ AEqno ]);
    AssignWorkCenterDownTime( AWork_Center_ID );
  end;

begin
  try
    if chkAllCenters.Checked then
       with TFDQuery.Create(self) do
       try
         Connection:= UniMainModule.FDConnection1;
         SQL.Add('select id, eqno from work_center');
         Open;
         while not Eof do
         begin
           ProcessWorkCenter( FieldByName('id').asFloat, FieldByName('eqno').asString );
           Next;
         end;
       finally
         Free;
       end

    else with IQSearch1 do
       for I:= 0 to DBgrid.SelectedRows.Count - 1 do
       begin
         DataSource.DataSet.GotoBookmark( DBgrid.SelectedRows.Items[ I ]);
         ProcessWorkCenter( DataSource.DataSet.FieldByName('id').asFloat, DataSource.DataSet.FieldByName('eqno').asString );
       end
  finally
    Status:= '';
  end;
end;

procedure TShop_Holiday.IterateMfgCellsCreateDownTime;
var
  I:Integer;
  AAsy_Mach: Real;
begin
  with TFDQuery.Create(self) do
  try
    Connection:= UniMainModule.FDConnection1;
    // SQL.Add('select id, mfgcell, decode(RTrim(mfgtype), ''GENERIC'', 1, 0) as asy_mach, rtrim(mfgtype) as mfgtype from mfgcell');
    SQL.Add('select id, mfgcell, mfg.Like_Generic_ExA (rtrim(mfgtype)) as asy_mach, rtrim(mfgtype) as mfgtype from mfgcell');
    Open;
    while not Eof do
    begin
      Status:= Format('Processing mfgcell %s, please wait...', [ FieldByName('mfgcell').asString]);

      AAsy_Mach:= FieldByName('asy_mach').asFloat;
      if not TMfgModi.IsPredefinedMfgType( FieldByName('mfgtype').asString ) then
         AAsy_Mach:= 1;

      AssignDefaultCalendar( AAsy_Mach,  FieldByName('id').asFloat );
      Next;
    end;
  finally
    Free;
    Status:= '';
  end;
end;

procedure TShop_Holiday.AssignWorkCenterDownTime( work_center_id: Real );
begin
  with procSaveToWorkCenter do
  begin
    Close;
    ParamByName('v_work_cntr_id').Value := work_center_id;
    ParamByName('v_start_time').asDateTime:= FFromDate;
    ParamByName('v_end_time').asDateTime  := FToDate;
    ParamByName('v_day_off_type').Value := 3;        {1 - day off, 2 - shift off, 3 - manual }
    Prepare;
    ExecProc;
  end;
end;

procedure TShop_Holiday.AssignDefaultCalendar( AType, AMFgCell_ID: Real );
begin
  with procSaveToDefault do
  try
    Status:= 'Processing Default Calendar, please wait...';
    Close;
    ParamByName('v_generic').Value      := AType;   {0 - mfg, 1 - assy}
    ParamByName('v_start_time').asDateTime:= FFromDate;
    ParamByName('v_end_time').asDateTime  := FToDate;
    ParamByName('v_day_off_type').Value := 3;       {1 - day off, 2 - shift off, 3 - manual }
    if AMFgCell_ID > 0 then
       ParamByName('v_mfgcell_id').Value:= AMFgCell_ID
    else
       ParamByName('v_mfgcell_id').Clear;
    Prepare;
    ExecProc;
  finally
    Status:= '';
  end;
end;

procedure TShop_Holiday.FormShow(Sender: TObject);
begin
//  EnsureSecurityInspectorOnTopOf( self );
end;

procedure TShop_Holiday.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch5{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
