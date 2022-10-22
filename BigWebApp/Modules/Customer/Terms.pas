unit Terms;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.RepDef,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu;

type
  TnACKUniDBGrid=class(TUniDBGrid)
  public
    property Currcol;
  end;

  TFrmTerms = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    DBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    Table1: TFDTable;
    IQAbout1: TIQWebAbout;
    PrinterSetupDialog1: TPrinterSetupDialog;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Report1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQRepDef1: TIQWebRepDef;
    Table1ID: TBCDField;
    Table1DAYS: TBCDField;
    Table1DISCOUNT: TBCDField;
    Table1DISCOUNT_DAYS: TBCDField;
    SR: TIQWebSecurityRegister;
    Contents1: TUniMenuItem;
    Table1BASED_ON: TStringField;
    Table1END_OF_MONTH: TStringField;
    Table1DAY_OF_MONTH: TBCDField;
    Bevel1: TUniPanel;
    Table1DESCRIPTION: TStringField;
    Table1PK_HIDE: TStringField;
    Table1CASH_IN_ADVANCE: TStringField;
    procedure Table1BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrinterSetup1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    select : String;
    FSaveBeforePost: TDataSetNotifyEvent;
    FQry:TDataSet;
    FOnFilterRecord:TFilterRecordEvent;
    function GetDataSet:TDataSet;
    procedure SetDataSet( ADataSet:TDataSet);
    { Private declarations }
  public
    { Public declarations }
    property DataSet:TDataSet read GetDataSet write SetDataSet;
  end;

procedure DoTerms(ADataSet:TDataSet );
procedure DoTermsQry(ADataSet:TDataSet);

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.HelpHook;

procedure DoTerms(ADataSet:TDataSet);
var
  LFrmTerms : TFrmTerms;
begin
  LFrmTerms := TFrmTerms.Create(UniGUIApplication.UniApplication);
  with LFrmTerms do
  begin
    if Assigned(ADataSet) then
       DataSet:= ADataSet;
    FOnFilterRecord := DataSet.OnFilterRecord;
    DataSet.OnFilterRecord := nil;
    if DataSet.State <> dsBrowse then
       DataSet.Open;
    FSaveBeforePost:= DataSet.BeforePost;
    DataSet.BeforePost:= Table1BeforePost;
    if DataSet is TFDTable then with DataSet as TFDTable do
    begin
      UpdateOptions.UpdateMode:= upWhereKeyOnly;
      Refresh;
    end;
    LFrmTerms.Show;
  end;
end;

procedure DoTermsQry(ADataSet:TDataSet);
var
  LFrmTerms : TFrmTerms;
begin
  LFrmTerms := TFrmTerms.Create(UniGUIApplication.UniApplication);
  with LFrmTerms do
  begin
    FQry := ADataSet;
    Table1.Open;
    LFrmTerms.Show;
  end;
end;

(*constructor TFrmTerms.CreateQry( AOwner:TComponent; ADataSet:TDataSet );
begin
  inherited Create( AOwner );
  FQry := ADataSet;
  Table1.Open;
end;

constructor TFrmTerms.Create( AOwner:TComponent; ADataSet:TDataSet );
begin
  inherited Create( AOwner );
  if Assigned(ADataSet) then
     DataSet:= ADataSet;
  FOnFilterRecord := DataSet.OnFilterRecord;
  DataSet.OnFilterRecord := nil;
  if DataSet.State <> dsBrowse then
     DataSet.Open;
  FSaveBeforePost:= DataSet.BeforePost;
  DataSet.BeforePost:= Table1BeforePost;
  if DataSet is TFDTable then with DataSet as TFDTable do
  begin
    UpdateOptions.UpdateMode:= upWhereKeyOnly;
    Refresh;
  end;
end;       *)

procedure TFrmTerms.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [self]);
end;

procedure TFrmTerms.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FQry <> nil then Reopen(TFDQuery(FQry));
    IQRegFormWrite( self, [self]);
    DataSet.BeforePost:= FSaveBeforePost;
    DataSet.OnFilterRecord := FOnFilterRecord;
end;

function TFrmTerms.GetDataSet:TDataSet;
begin
  Result:= DataSource1.DataSet;
end;

procedure TFrmTerms.SetDataSet( ADataSet:TDataSet);
begin
  DataSource1.DataSet:= ADataSet;
end;

procedure TFrmTerms.Table1BeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmTerms.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmTerms.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmTerms.PrinterSetup1Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TFrmTerms.Print1Click(Sender: TObject);
begin
  IQRepDef1.Execute;
end;

procedure TFrmTerms.FormActivate(Sender: TObject);
begin
//  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
  IQHelp.AssignHTMLFile( iqchmACCT{CHM}, iqhtmSETUP{HTM} );  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmTerms.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( 1093271 );
end;

{procedure TFrmTerms.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with DBGrid1 do
    if (Key = VK_DELETE) then
    begin
      if Columns[ SelectedIndex ].FieldName = 'BASED_ON' then
      begin
        DataSet.Edit;
        DataSet.FieldByName('BASED_ON').Clear;
        Key:= 0;
      end
      else if Columns[ SelectedIndex ].FieldName = 'END_OF_MONTH' then
      begin
        DataSet.Edit;
        DataSet.FieldByName('END_OF_MONTH').Clear;
        Key:= 0;
      end
    end;
end;    }

procedure TFrmTerms.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  with TnACKUniDBGrid(DBGrid1) do
    if (Key = VK_DELETE) then
    begin
      if Columns[ Currcol ].FieldName = 'BASED_ON' then
      begin
        DataSet.Edit;
        DataSet.FieldByName('BASED_ON').Clear;
        Key:= 0;
      end
      else if Columns[ Currcol ].FieldName = 'END_OF_MONTH' then
      begin
        DataSet.Edit;
        DataSet.FieldByName('END_OF_MONTH').Clear;
        Key:= 0;
      end
    end;
end;

end.
