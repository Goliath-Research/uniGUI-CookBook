unit FaClass;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Wwdatsrc,
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
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmClassLives = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Panel1: TUniPanel;
    Grid: TIQUniGridControl;
    Nav: TUniDBNavigator;
    SrcClass: TDataSource;
    TblClass: TFDTable;
    TblClassID: TBCDField;
    TblClassASSET_CLASS: TStringField;
    TblClassDESCRIP: TStringField;
    TblClassCLASS_LIFE: TBCDField;
    TblClassGDS: TBCDField;
    TblClassADS: TBCDField;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    ImportUpdatetheClassLivesTable1: TUniMenuItem;
    OpenDialog1: TOpenDialog;
    Panel2: TUniPanel;
    Contents1: TUniMenuItem;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblClassBeforePost(DataSet: TDataSet);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ImportUpdatetheClassLivesTable1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoShowFaClass();

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  IQMS.Common.Dialogs,
  IQMS.Common.HelpHook;
{$R *.DFM}

procedure DoShowFaClass();
var
  LFrmClassLives : TFrmClassLives;
begin
  LFrmClassLives := TFrmClassLives.Create(uniGUIApplication.UniApplication);
end;

procedure TFrmClassLives.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self, Grid ]);
end;

procedure TFrmClassLives.TblClassBeforePost(DataSet: TDataSet);
begin
  if (TblClassASSET_CLASS.asString = '')
    and (TblClassDESCRIP.asString = '')
    and (TblClassCLASS_LIFE.asFloat = 0)
    and (TblClassGDS.asFloat = 0)
    and (TblClassADS.asFloat = 0)
    and (TblClass.State in [dsInsert])
  then
  begin
    TblClass.Cancel;
    Abort;
  end;
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmClassLives.UniFormCreate(Sender: TObject);
begin
 IQRegFormRead( Self, [ Self, Grid ]);
  IQSetTablesActive( True, self );
end;

procedure TFrmClassLives.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmClassLives.About1Click(Sender: TObject);
begin
 IqAbout1.Execute;
end;

procedure TFrmClassLives.ImportUpdatetheClassLivesTable1Click( Sender: TObject);
var
  ANumber:Real;
  AStart:Boolean;
  AClassLife, AGds, AAds:Real;
  AStr:String;
  ADescrip, AssetClass:String;
  AId:Real;
  AQry:TFDQuery;
  AUpdated, AAdded:Integer;
  aPath:String;
  AConn: TFDConnection;

begin
  if not OpenDialog1.Execute then Exit;

  AUpdated := 0;
  AAdded   := 0;


  AQry := TFDQuery.Create(self);

  with AQry do
  try
    aPath := ExtractFilePath( UpperCase(OpenDialog1.FileName) );
    { TODO -omugdha -cWEBIQ : Undeclared identifier: 'GetDBFConnection'
    AConn := GetDBFConnection( aPath ); }
    AConn.Connected := true;

    AQry.Connection := AConn;

//    DataBaseName:= ExtractFilePath( UpperCase(OpenDialog1.FileName) );
    Sql.Add(Format('select n1, n2, n3, n4, n5 from %s', [UpperCase(ExtractFileName(OpenDialog1.FileName))]));
    Open;
    AStart := False;

    while not AStart do
    try
      ANumber := StrToFloat(FieldByName('n1').asString);
      AStart := True;
    except
      Next;
      if eof then
        exception.create('Nothing to process');
    end;


    while not eof do
    begin
      ADescrip := '';
      AssetClass := FieldByName('n1').asString;
      repeat
        ADescrip := ADescrip + FieldByName('n2').asString + ' ';
        if FieldByName('n3').asString <> '' then
        begin
          AStr := Strtran(FieldByName('n3').asString, '*', '');
          try
            AClassLife := StrToFloat(AStr);
          except
            AClassLife := 0;
          end;
        end;
        if FieldByName('n4').asString <> '' then
        begin
          AStr := Strtran(FieldByName('n4').asString, '*', '');
          try
            AGds := StrToFloat(AStr);
          except
            AGds := 0;
          end;
        end;
        if FieldByName('n5').asString <> '' then
        begin
          AStr := Strtran(FieldByName('n5').asString, '*', '');
          try
            AAds := StrToFloat(AStr);
          except
            AAds := 0;
          end;
        end;
        Next;
      until (FieldByName('n1').asString <> '') or eof;

      AId :=  SelectValueFmtAsFloat('select id from FA_MACRS_CLASS_LIFE where asset_class = ''%s''', [AssetClass]);

      if AId <> 0 then
      begin
        ExecuteCommandFmt('update FA_MACRS_CLASS_LIFE set descrip = SubStr(''%s'', 1, 500), class_life = %f, gds = %f, ads = %f where id = %f',
                  [ADescrip, AClassLife, AGds, AAds, AId]);
        Inc(AUpdated);
      end
      else
      begin
        ExecuteCommandFmt('insert into FA_MACRS_CLASS_LIFE (asset_class, descrip, class_life, gds, ads) ' +
                  '  values (''%s'', SubStr(''%s'', 1, 500), %f, %f, %f)',
                  [AssetClass, ADescrip, AClassLife, AGds, AAds]);
        Inc(AAdded);
      end;

      Panel2.Caption := Format('%d records added, %d records updated', [AAdded, AUpdated]);
      Application.processmessages;
    end;
  finally
    Free;
  end;

  TblClass.Refresh;
  IqConfirm('Table updated');
  Panel2.Caption := '';

end;

procedure TFrmClassLives.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmClassLives.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmFA{CHM}, iqhtmFA{HTM} )  {IQMS.Common.HelpHook.pas}
end;

end.

