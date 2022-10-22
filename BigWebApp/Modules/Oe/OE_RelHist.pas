unit OE_RelHist;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Wwdatsrc,
  Vcl.Menus,
{ TODO -oGPatil -cWebConvert : Dependency
  IQMS.Common.UserMessages,  }
  IQMS.WebVcl.About,
  IQMS.WebVcl.RepDef,
  Vcl.Buttons,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  Data.db,
  MainModule,
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniBasicGrid,
  uniStringGrid,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, uniMainMenu;

type
  TFrmOEReleaseHistory = class(TUniForm)
    Panel1: TUniPanel;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Contents1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    PrinterSetupDialog1: TPrinterSetupDialog;
    sbtnFilter: TUniSpeedButton;
    Grid: TUniStringGrid;
    Panel2: TUniPanel;
    Shape3: TUniPanel;
    sbtnRefresh: TUniSpeedButton;
    Bevel1: TUniPanel;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure sbtnFilterClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);  }
    procedure sbtnRefreshClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOrd_Detail_ID: Real;
    FFrom     : TDateTime;
    FTo       : TDateTime;
    FAOrd_Detail_ID: Real;
    procedure PopulateGrid;
    procedure PopulatePromiseDatesList( AListPromiseDates: TStringList );
    procedure IQAfterShowMessage( var Msg: TMessage ); {message iq_AfterShowMessage;}
    procedure AssignCaption;
    procedure ClearGrid;
    procedure InitializeGrid( AListPromiseDates: TStringList );
    procedure LoadGrid( AListPromiseDates: TStringList );
    procedure SetAOrd_Detail_ID(const Value: Real);
  public
    { Public declarations }
    property Ord_Detail_ID: Real write SetAOrd_Detail_ID;
  end;

procedure DoShowReleasesHistoryLog( AOrd_Detail_ID: Real );

implementation

{$R *.DFM}

uses
  IQMS.Common.DATESDLG,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg;

procedure DoShowReleasesHistoryLog( AOrd_Detail_ID: Real );
var
  LFrmOEReleaseHistory : TFrmOEReleaseHistory;
begin
    LFrmOEReleaseHistory := TFrmOEReleaseHistory.Create(UniGUIApplication.UniApplication);
    LFrmOEReleaseHistory.Ord_Detail_ID := AOrd_Detail_ID;
    LFrmOEReleaseHistory.Show;
end;

procedure TFrmOEReleaseHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
  IQRegDateTimeScalarWrite( self, 'FFrom', FFrom );
  IQRegDateTimeScalarWrite( self, 'FTo', FTo );
end;

procedure TFrmOEReleaseHistory.AssignCaption;
begin
  Caption:= IQFormat('%s Release Quantity History %s - %s',
                    [ SelectValueFmtAsString('select RTrim(NVL(a.itemno, d.misc_item)) from ord_detail d, arinvt a where d.id = %f and d.arinvt_id = a.id(+)', [ FOrd_Detail_ID ]),
                      DateToStr( FFrom ),
                      DateToStr( FTo ) ]);
end;

procedure TFrmOEReleaseHistory.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmOEReleaseHistory.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmOEReleaseHistory.IQAfterShowMessage( var Msg: TMessage );
begin
  PopulateGrid;
end;

procedure TFrmOEReleaseHistory.PopulateGrid;
var
  AListPromiseDates: TStringList;
  hMsg : TPanelMesg;
  I    : Integer;
begin
  hMsg:= hPleaseWait('');
  try
    {first - populate table WORK_REL_HIST}
    hMsg.Mesg:= 'Evaluating history data ...';
    ExecuteCommandFmt('begin OE_Rel.Assign_Hist( %f ); end;',  [ FOrd_Detail_ID ]);

    AListPromiseDates:= TStringList.Create;
    try
      {Populate list of all promise dates sorted in desc order}
      hMsg.Mesg:= 'Loading promise date list ...';
      PopulatePromiseDatesList( AListPromiseDates );

      {captions of the grid}
      hMsg.Mesg:= 'Initializing grid ...';
      InitializeGrid( AListPromiseDates );

      hMsg.Mesg:= 'Loading data into grid ...';
      LoadGrid( AListPromiseDates );

    finally
      AListPromiseDates.Free;
    end;
  finally
    hMsg.Free;
  end;
end;

procedure TFrmOEReleaseHistory.PopulatePromiseDatesList( AListPromiseDates: TStringList );
var
  I: Integer;
  X: Real;
begin
  with TFDQuery.Create(NIL) do
  try
    Connection := UniMainModule.FDConnection1;
    SQL.Add(IQFormat('select distinct h.promise_date '+
                     '  from work_rel_hist h         '+
                     ' where h.ord_detail_id = %f    '+
                     ' order by promise_date desc    ',
                     [ FOrd_Detail_ID ]));
    Open;
    while not Eof do
    begin
      {Append to list}
      I:= AListPromiseDates.Add( FloatToStr( FieldByName('promise_date').asDateTime ));

      {Do we have this release? 1 - Yes, 0 - No}
      X:= SelectValueFmtAsFloat('select 1 from releases                               '+
                    ' where ord_detail_id = %f                            '+
                    '   and promise_date = to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')',
                    [  FOrd_Detail_ID,
                       FormatDateTime('mm/dd/yyyy hh:nn:ss', StrToFloat(AListPromiseDates[ I ])) ]);

      AListPromiseDates.Objects[ I ]:= Pointer(Trunc(X));

      Next;
    end;
  finally
    Free; // free TFDQuery
  end;
end;

procedure TFrmOEReleaseHistory.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmOEReleaseHistory.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmOEReleaseHistory.sbtnFilterClick(Sender: TObject);
var
  AFrom: TDateTime;
  ATo  : TDateTime;
begin
  AFrom:= FFrom;
  ATo  := FTo;

  if TFrmDatesDialog.GetDatesDialog( AFrom, ATo ) then
  begin
    IQAssert( ATo - AFrom <= 365, 'Date range cannot exceed 365 days');

    FFrom:= AFrom;
    FTo  := ATo;
    AssignCaption;
    PopulateGrid;
  end;
end;

procedure TFrmOEReleaseHistory.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmSALES_ORDER{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOEReleaseHistory.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmOEReleaseHistory.ClearGrid;
begin
(* TODO -oGPatil -cWebConvert : TUniStringGrid does not contain Cols and Rows
  with Grid do while RowCount > 2 do
  begin
    Rows[ RowCount - 1 ].Clear;
    RowCount:= RowCount - 1;
  end;
  Grid.Rows[ 0 ].Clear;
  Grid.Rows[ 1 ].Clear;    *)
end;

procedure TFrmOEReleaseHistory.InitializeGrid( AListPromiseDates: TStringList );
var
  I: Integer;
begin
  ClearGrid;
(* TODO -oGPatil -cWebConvert : TUniStringGrid does not contain Cols and Rows
  with Grid do
  try

    Rows[ 0 ].BeginUpdate;

    RowCount:= 2;
    ColCount:= AListPromiseDates.Count + 1;

    Cells[ 0, 0 ]:= 'Time Stamp';

    for I:= 1 to AListPromiseDates.Count do
    begin
      Cells[ I, 0 ]  := DateTimeToStr( StrToFloat(AListPromiseDates[ I-1 ]));
      Objects[ I, 0 ]:= AListPromiseDates.Objects[ I-1 ];                 {Do we have this release? 1 - Yes, 0 - No}
    end;
  finally
    Rows[ 0 ].EndUpdate;
  end;  *)
end;

procedure TFrmOEReleaseHistory.LoadGrid( AListPromiseDates: TStringList );
var
  AQry: TFDQuery;

  procedure InitilaizeQuery;
  begin
     with AQry do
     begin
       Connection := UniMainModule.FDConnection1;
       SQL.Add(         'select time_stamp, promise_date, sum(quan) as quan ');
       SQL.Add(IQFormat('  from                                             '+
                        '       work_rel_hist                               '+
                        ' where                                             '+
                        '       ord_detail_id = %f                          '+
                        '   and time_stamp between :date1                   '+
                        '                      and :date2                   '+
                        ' group by                                          '+
                        '       time_stamp, promise_date                    '+
                        ' order by                                          '+
                        '       time_stamp desc,                            '+
                        '       promise_date desc                           ',
                        [ FOrd_Detail_ID ]));

       {Reset params}
       Params.Clear;
       Params.CreateParam( ftDateTime, 'Date1', ptInput ).asDateTime:= FFrom;
       Params.CreateParam( ftDateTime, 'Date2', ptInput ).asDateTime:= FTo;
       Open;
     end;
  end;

  procedure AddToGrid( ATime_Stamp, APromise_Date: TDateTime; AQuan: Real );
  var
    I: Integer;
    J: Integer;
  begin
    with Grid do
    begin
(* TODO -oGPatil -cWebConvert : TUniStringGrid does not contain Cols and Rows
      {row}
      I:= Cols[ 0 ].IndexOf( DateTimeToStr( ATime_Stamp ));
      if I < 0 then
      begin
        I:= Grid.RowCount - 1;
        Cells[ 0, I ]:= DateTimeToStr( ATime_Stamp );  {Time_Stamp}
        RowCount:= RowCount + 1;
      end;

      {col}
      J:= Rows[ 0 ].IndexOf( DateTimeToStr( APromise_Date ));
 *)
      if (J >= 0) and (I >= 0) then
         Cells[ J, I ]:= FloatToStr( StoF(Cells[ J, I ], 0) + AQuan );
    end;
  end;

begin
  AQry:= TFDQuery.Create(NIL);
  try
    InitilaizeQuery;
    with AQry do while not Eof do
    begin
      Application.ProcessMessages;

      AddToGrid( FieldByName('time_stamp').asDateTime,
                 FieldByName('promise_date').asDateTime,
                 FieldByName('quan').asFloat );

      Next;
    end;
  finally
    AQry.Free;
  end;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmOEReleaseHistory.GridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ACol < 1) then EXIT;

  if LongInt( Grid.Objects[ ACol, 0 ]) = 0 then
     Grid.Canvas.Font.Color:= clGray
  else if gdSelected in State then
     begin
       Grid.Canvas.Font.Color := clBlack;
       Grid.Canvas.Brush.Color:= clWindow;
     end
  else
     Grid.Canvas.Font.Color:= clBlack;

  Grid.Canvas.FillRect( Rect );
  InflateRect( Rect, -2, -2 );
  Grid.Canvas.TextRect( Rect, Rect.left, Rect.top, Grid.cells[ ACol, ARow ]);
end;     }

procedure TFrmOEReleaseHistory.sbtnRefreshClick(Sender: TObject);
begin
  PopulateGrid;
end;

procedure TFrmOEReleaseHistory.SetAOrd_Detail_ID(const Value: Real);
begin
  FAOrd_Detail_ID := Value;
end;

procedure TFrmOEReleaseHistory.UniFormCreate(Sender: TObject);
begin

  {Restore settings}
  IQRegFormRead( self, [ self ]);

  FFrom:= Date-30;
  IQRegDateTimeScalarRead( self, 'FFrom', FFrom );

  FTo:= FFrom + 180;
  IQRegDateTimeScalarRead( self, 'FTo', FTo );

  AssignCaption;

//  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
end;

end.
