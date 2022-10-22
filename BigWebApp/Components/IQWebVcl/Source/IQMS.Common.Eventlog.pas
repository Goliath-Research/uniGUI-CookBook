unit IQMS.Common.Eventlog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.RepDef,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniPanel,
  uniDateTimePicker,
  uniSplitter,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMemo, uniDBMemo, IQMS.WebVcl.TinyMCE,
  uniMainMenu, IQUniGrid, uniGUIFrame, uniComboBox, uniDBComboBox;

type
  TEvent_Log = class(TUniForm)
    SrcEventLog: TDataSource;
    PrintDialog1: TPrintDialog;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Splitter1: TUniSplitter;
    pnlGrid: TUniPanel;
    Panel5: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    bbtnPrint: TUniSpeedButton;
    sbtnPurge: TUniSpeedButton;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    Label1: TUniLabel;
    wwDBLookupComboClass: TUniDBLookupComboBox;
    Label2: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    DateTimePicker2: TUniDateTimePicker;
    btnApply: TUniButton;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    IQRepDef1: TIQWebRepDef;
    QryEventLog: TFDQuery;
    wwQuery1: TFDQuery;
    wwQuery1CLASS: TStringField;
    PrinterSetupDialog1: TPrinterSetupDialog;
    QryEventLogID: TBCDField;
    QryEventLogEVENT_TIME: TDateTimeField;
    QryEventLogUSERID: TStringField;
    QryEventLogCLASS: TStringField;
    SrcBlobText: TDataSource;
    QryBlobText: TFDQuery;
    QryBlobTextTEXT: TMemoField;
    wwDBGrid1: TIQUniGridControl;
    ImageList1: TUniImageList;
    Bevel1: TUniPanel;
    Bevel2: TUniPanel;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    IQWebTinyMCE1: TIQWebTinyMCE;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnPrintClick(Sender: TObject);
    procedure sbtnPurgeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure wwDBGrid1TitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure wwDBLookupComboClassChange(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
  private
    { Private declarations }
    FDescOrder: Boolean;
    procedure PrepareQuery;
  public
    { Public declarations }
    constructor Create( const AClass: string );
  end;

procedure ShowEventLog;
procedure ShowEventLogClassOf( const AClass: string );

implementation

{$R *.DFM}

uses
  IQMS.Common.DATESDLG,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

procedure ShowEventLog;
begin
  TEvent_Log.Create(  '' ).Show;
end;

procedure ShowEventLogClassOf( const AClass: string );
begin
  TEvent_Log.Create(  AClass ).Show;
end;

constructor TEvent_Log.Create( const AClass: string );
var
  EventLogClass: string;
  Date1 : TDateTime;
  Date2 : TDateTime;
begin
  inherited Create( uniGUIApplication.UniApplication );
  IQSetTablesActive( TRUE, self );
  IQRegFormRead(self, [ self ]);

  FDescOrder:= TRUE;
  IQRegBooleanScalarRead( self, 'DescOrder', FDescOrder );

  EventLogClass:= AClass;
  if EventLogClass = '' then
    IQRegStringScalarRead( self, 'EventLogClass', EventLogClass );

  wwDBLookupComboClass.DataSource.DataSet.FieldByName(wwDBLookupComboClass.DataField).AsString:= EventLogClass;

  Date1:= Date;
  IQRegDateTimeScalarRead( self, 'Date1', Date1 );
  DateTimePicker1.DateTime:= Date1;

  Date2:= Date;
  IQRegDateTimeScalarRead( self, 'Date2', Date2 );
  DateTimePicker2.DateTime:= Date2;

  btnApplyClick( NIL );
end;

procedure TEvent_Log.btnApplyClick(Sender: TObject);
begin
  pnlGrid.Enabled:= TRUE;
  wwDBGrid1.Color:= clWindow;
  PrepareQuery;
end;

procedure TEvent_Log.PrepareQuery;
begin
  with QryEventLog do
  try
//    wwDBGrid1.DBGrid.SelectedRows.Clear;
    Close;
    SQL.Clear;
    SQL.Add('select id, event_time, userid, class from eventlog');

    {Class}
    if wwDBLookupComboClass.Text = '' then
      SQL.Add('where class is NULL')
    else
      SQL.Add(Format('where class = ''%s''', [ wwDBLookupComboClass.Text ]));

    {Date}
    SQL.Add(Format('  and event_time between to_date(''%s'', ''MM/DD/YYYY'') and to_date(''%s'', ''MM/DD/YYYY HH24:MI:SS'')',
                   [FormatDateTime( 'mm/dd/yyyy', DateTimePicker1.DateTime),
                    FormatDateTime( 'mm/dd/yyyy hh:nn:ss', Trunc(DateTimePicker2.DateTime) + 1 - 1/86400) ]));
    {Order}
    if FDescOrder then
       SQL.Add('order by event_time desc')
    else
       SQL.Add('order by event_time');

  finally
    Open;
  end;

  Reopen(QryBlobText);
end;

procedure TEvent_Log.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self ]);
  IQRegStringScalarWrite  ( self, 'EventLogClass', wwDBLookupComboClass.Text );
  IQRegDateTimeScalarWrite( self, 'Date1',         DateTimePicker1.DateTime );
  IQRegDateTimeScalarWrite( self, 'Date2',         DateTimePicker2.DateTime );
  IQRegBooleanScalarWrite ( self, 'DescOrder',     FDescOrder );
end;

procedure TEvent_Log.bbtnPrintClick(Sender: TObject);
var
  I : integer;
begin
  if not PrintDialog1.Execute then EXIT;

  with wwDBGrid1.DBGrid, QryEventLog do
  begin
    DisableControls;
    try
      for I:= 0 to SelectedRows.Count - 1 do
      begin
        GotoBookmark( SelectedRows.Items[ I ]);
        IQWebTinyMCE1.Text:=IQWebTinyMCE1.Text+( Format('%s Event Log', [ FieldByName('event_time').asString ]));
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TEvent_Log.sbtnPurgeClick(Sender: TObject);
var
  FFrom, FTo: TDateTime;
  S         : string;
begin
  FFrom:= Date - 180;
  FTo  := Date - 90;

  if TFrmDatesDialog.GetDatesDialog( FFrom, FTo ) then
  begin
    S:= Format('delete from eventlog where event_time between to_date(''%s'', ''MM/DD/YYYY'') and to_date(''%s'', ''MM/DD/YYYY HH24:MI:SS'') ',
               [ FormatDateTime( 'MM/DD/YYYY', FFrom ), FormatDateTime( 'mm/dd/yyyy hh:nn:ss', Trunc(FTo) + 1 - 1/86400 )]);

    if wwDBLookupComboClass.Text = '' then
      S:= S + ' and class is NULL'
    else
      S:= S + Format(' and class = ''%s''', [ wwDBLookupComboClass.Text ]);

    ExecuteCommand(  S );

    btnApplyClick( NIL );
  end;
end;

procedure TEvent_Log.FormActivate(Sender: TObject);
begin
  if wwDBLookupComboClass.Text = 'NET CHANGE' then
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmWORKORDER{HTM} )
  else
     IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TEvent_Log.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TEvent_Log.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TEvent_Log.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TEvent_Log.wwDBGrid1TitleButtonClick(Sender: TObject; AFieldName: String);
begin
  if CompareText( AFieldName, 'event_time' ) = 0 then
  begin
    FDescOrder:= not FDescOrder;
    btnApplyClick( NIL );
  end;
end;


procedure TEvent_Log.wwDBLookupComboClassChange(Sender: TObject);
begin
  pnlGrid.Enabled:= FALSE;
  wwDBGrid1.Color:= clBtnFace;

  if wwDBLookupComboClass.Text = 'NET CHANGE' then
     begin
       IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmWORKORDER{HTM} );
       self.HelpContext:= self.HelpContext  //  1027914;
     end
  else
     begin
       IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmRT{HTM} );  {IQMS.Common.HelpHook.pas}
       self.HelpContext:= self.HelpContext  // 05-06-2011 1024163;
     end;
end;

procedure TEvent_Log.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TEvent_Log.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

end.
