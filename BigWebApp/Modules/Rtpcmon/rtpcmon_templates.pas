unit rtpcmon_templates;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Mask,
  Vcl.Buttons,
  Data.DB,
  rtpcmon_DM,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  uniDBCheckBox,
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, uniMainMenu, IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmDeviceTemplate = class(TUniForm)
    pnlDeviceToolbar: TUniPanel;
    sbtnSearchDeviceTemplates: TUniSpeedButton;
    Bevel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    pnlDeviceCapabilities: TUniPanel;
    gbxCapabilities: TUniGroupBox;
    grdDeviceCapabilites: TIQUniGridControl;
    wwDBComboDlgCapabType: TUniEdit;
    wwDBComboDlgResultPrefix: TUniEdit;
    wwDBComboDlgCommand: TUniEdit;
    wwDBComboDlgResultPostfix: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Export1: TUniMenuItem;
    wwDBComboDlgPacketHeader: TUniEdit;
    pnlDeviceInfo: TUniPanel;
    lblDeviceName: TUniLabel;
    edDeviceName: TUniDBEdit;
    pctrlDevice: TUniPageControl;
    tabProtocol: TUniTabSheet;
    tabOfflineCommand: TUniTabSheet;
    Label2: TUniLabel;
    Label1: TUniLabel;
    cmbOfflineCommand: TUniEdit;
    cmbOfflineResponse: TUniEdit;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    ImportTemplates1: TUniMenuItem;
    Settings1: TUniMenuItem;
    N1: TUniMenuItem;
    ServerDirectorySetup1: TUniMenuItem;
    TabSheet2: TUniTabSheet;
    DBCheckBox2: TUniDBCheckBox;
    DBCheckBox1: TUniDBCheckBox;
    Splitter1: TUniSplitter;
    DBCheckBox3: TUniDBCheckBox;
    wwDBComboDlgResponseAck: TUniEdit;
    IQAbout1: TIQWebAbout;
    cmbProtocol: TUniDBComboBox;
    Panel2: TUniPanel;
    pctrlCapab: TUniPageControl;
    tabCapabProtocol: TUniTabSheet;
    tabCapabCustom: TUniTabSheet;
    wwDBGrid1: TIQUniGridControl;
    cmbCommandName: TUniDBComboBox;
    procedure Close1Click(Sender: TObject);
    procedure wwDBComboDlgCapabTypeCustomDlg(Sender: TObject);
    procedure wwDBComboDlgASCIICustomDlg(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure ImportTemplates1Click(Sender: TObject);
    procedure ServerDirectorySetup1Click(Sender: TObject);
    procedure sbtnSearchDeviceTemplatesClick(Sender: TObject);
    procedure cmbEditASCIICustomDlg(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbCommandNameEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbCommandNameCloseUp(Sender: TUniDBComboBox;
      Select: Boolean);
    procedure UniFormSubmit(Sender: TObject);
  private
    { Private declarations }
    DM:TDM_RTPCMon;
    procedure XMLTemplate(AImport: Boolean; AFilename: String);
    function GetLocalDir: String;
    function GetUNCDir: String;
    procedure LoadProtocolCombo;
    procedure srcPCMonDeviceDataChange(Sender: TObject; Field: TField);
  public
    { Public declarations }
    class procedure Execute;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DotNetCOMShared,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  OraDirectorySetup,
  { TODO : pw_chardlg has a no web convert }
 // pw_chardlg,
  rtpcmon_rscstr,
  rtpcmon_share,
  System.Math;

class procedure TFrmDeviceTemplate.Execute;
var
  LFrmDeviceTemplate : TFrmDeviceTemplate;
begin
  LFrmDeviceTemplate := TFrmDeviceTemplate.Create(UniGUIApplication.UniApplication);
  LFrmDeviceTemplate.Show;
end;

procedure TFrmDeviceTemplate.FormCreate(Sender: TObject);
begin
  DM:= TDM_RTPCMon.Create( self );
  AdjustPageControlToParent(pctrlCapab);
end;

procedure TFrmDeviceTemplate.Close1Click(Sender: TObject);
begin
  self.Close;
end;

procedure TFrmDeviceTemplate.wwDBComboDlgCapabTypeCustomDlg(
  Sender: TObject);
begin
  with DM, pkPCMonCapabType do
    if Execute then
      begin
        with tblPCMON_DEV_CAPAB_TMPL do
          if not (State in [dsEdit, dsInsert]) then
            Edit;

        tblPCMON_DEV_CAPAB_TMPLPCMON_CAPAB_TYPE_ID.asFloat:= GetValue( 'ID' );
      end;
end;

procedure TFrmDeviceTemplate.wwDBComboDlgASCIICustomDlg(
  Sender: TObject);
var
  ResultValue:string;
begin
  if Sender is TUniEdit then with Sender as TUniEdit do
  begin
    { TODO : TwwDBComboDlg being converted to TUniEdit while parsing. Got to discuss }
    //ResultValue:= DataSource.DataSet.FieldByName(DataField).AsString;

    { TODO : pw_chardlg has a no web convert }
    (*if not DoPWChar( self, 100, {var}ResultValue ) then
      EXIT;   *)

    { TODO : TwwDBComboDlg being converted to TUniEdit while parsing. Got to discuss }
   { if not (DataSource.State in [dsEdit, dsInsert]) then
      DataSource.Edit;

    DataSource.DataSet.FieldByName(DataField).AsString:= ResultValue;  }
  end;
end;

procedure TFrmDeviceTemplate.Export1Click(Sender: TObject);
begin
{ TODO : IQMS.Common.StringUtils does not contain a member Trim }
 { // 'UNC Directory setting is not configured!'
  IQAssert( IQMS.Common.StringUtils.Trim(GetUNCDir) <> '', rtpcmon_rscstr.cTXT0000009 );
  // 'Local Directory setting is not configured!'
  IQAssert( IQMS.Common.StringUtils.Trim(GetLocalDir) <> '', rtpcmon_rscstr.cTXT00000010 );
 }
  with SaveDialog1 do
    if Execute then
      XMLTemplate( False, FileName );
end;

procedure TFrmDeviceTemplate.ImportTemplates1Click(Sender: TObject);
begin
 { TODO : IQMS.Common.StringUtils does not contain a member Trim }
 { // 'UNC Directory setting is not configured!'
  IQAssert( IQMS.Common.StringUtils.Trim(GetUNCDir) <> '', rtpcmon_rscstr.cTXT0000009 );
  // 'Local Directory setting is not configured!'
  IQAssert( IQMS.Common.StringUtils.Trim(GetLocalDir) <> '', rtpcmon_rscstr.cTXT00000010 );
  }
  with OpenDialog1 do
    if Execute then
      XMLTemplate( True, FileName );
end;

function TFrmDeviceTemplate.GetUNCDir:String;
begin
  Result:= SelectValueAsString('select rtpcmon_unc_dir from iqsys2 where rownum < 2');
end;

function TFrmDeviceTemplate.GetLocalDir:String;
begin
  Result:= SelectValueAsString('select rtpcmon_local_dir from iqsys2 where rownum < 2');
end;

procedure TFrmDeviceTemplate.XMLTemplate(AImport:Boolean; AFilename:String);
var
  AUNCDir,
  ALocalDir, AOraDirXML, AUNCFile:String;
  AType:Integer;
begin
  DM.tblPCMON_DEVICE_TEMPLATE.CheckBrowseMode;
  DM.tblPCMON_DEV_CAPAB_TMPL.CheckBrowseMode;

  AUNCDir     := GetUNCDir;
  ALocalDir   := GetLocalDir;
  AOraDirXML  := 'DIR_RTPCMON_TEMPLATE';
  AUNCFile    := AUNCDir + '\' + ExtractFileName( AFilename );

  ForceDirectories( AUNCDir );

  ExecuteCommandFmt( 'create or replace directory %s as ''%s''', [ AOraDirXML, ALocalDir ] );

  try
    if AImport then
      begin
        if FileExists( AUNCFile ) then
          DeleteFile( AUNCFile );

        // 'Unable to delete file "%s"!'
        IQAssert( not FileExists( AUNCFile ),
                  Format( rtpcmon_rscstr.cTXT0000008, [ AUNCFile ] ) );

        CopyFile( PChar(AFilename), PChar(AUNCFile), False );

        ExecuteCommandFmt( 'begin pcmon_misc.XML_IMPORT(''%s'', ''%s''); end;',
                   [ ExtractFileName(AFilename), AOraDirXML ] );

        DM.tblPCMON_DEVICE_TEMPLATE.Refresh;
        DM.tblPCMON_DEV_CAPAB_TMPL.Refresh;

        // 'Import Completed!'
        IQInformation( rtpcmon_rscstr.cTXT0000011 );
      end
    else
      begin
        ExecuteCommandFmt( 'begin pcmon_misc.XML_EXPORT(''%s'', ''%s''); end;',
                   [ AFilename, AOraDirXML ] );

        if FileExists( AUNCFile ) then
          DeleteFile( AFilename );

        CopyFile( PChar(AUNCFile), PChar(AFilename), False );

        // 'Export Completed!'
        IQInformation( rtpcmon_rscstr.cTXT0000007 );

        DeleteFile( AUNCFile );

        // 'Unable to delete file "%s"!'
        IQAssert( not FileExists( AUNCFile ),
                  Format( rtpcmon_rscstr.cTXT0000008, [ AUNCFile ] ) );
      end;
  finally
    ExecuteCommandFmt( 'drop directory %s', [ AOraDirXML ] );
  end;
end;

procedure TFrmDeviceTemplate.ServerDirectorySetup1Click(Sender: TObject);
begin
  TFrmOraDirectorySetup.Execute('rtpcmon_unc_dir', 'rtpcmon_local_dir' );
end;

procedure TFrmDeviceTemplate.sbtnSearchDeviceTemplatesClick(
  Sender: TObject);
begin
  with DM.pkPCMonDeviceTemplate do
    if Execute then
      DM.tblPCMON_DEVICE_TEMPLATE.Locate('ID', GetValue('ID'), []);
end;

procedure TFrmDeviceTemplate.cmbEditASCIICustomDlg(Sender: TObject);
var
  ResultValue:string;
begin
{ TODO : IQMS.Common.StringUtils does not contain a member Trim }
(*  if Sender is TUniEdit then with Sender as TUniEdit do
  begin
    ResultValue:= DataSource.DataSet.FieldByName(DataField).AsString;
    if not DoPWChar( self, 100, {var}ResultValue ) then
      EXIT;

    if not (DataSource.State in [dsEdit, dsInsert]) then
      DataSource.Edit;

    DataSource.DataSet.FieldByName(DataField).AsString:= ResultValue;
  end;     *)
end;

procedure TFrmDeviceTemplate.srcPCMonDeviceDataChange(Sender: TObject; Field: TField);
begin
  if not Assigned(DM) then
    EXIT;

  if DM.tblPCMON_DEVICE_TEMPLATEPROTOCOL.asString = ''
  then pctrlCapab.ActivePage:= tabCapabCustom
  else pctrlCapab.ActivePage:= tabCapabProtocol;
end;

procedure TFrmDeviceTemplate.UniFormSubmit(Sender: TObject);
begin
  DM.Name:= '';

  LoadProtocolCombo;

  DM.srcPCMON_DEVICE_TEMPLATE.OnDataChange:= srcPCMonDeviceDataChange;

  IQSetTablesActive( TRUE, DM );
end;

procedure TFrmDeviceTemplate.LoadProtocolCombo;
var
  AFiles:TStringList;
  i,
  ACapab,
  AGetCapabilityCount:Integer;
  ACapabName:String;
begin

  AFiles:= TStringList.Create;
  try
    cmbProtocol.Items.Clear;
    FindFiles( IQMS.Common.Miscellaneous.IQGetLocalHomePath, 'RT*Device.dll', AFiles, false {ASearchSubdir} );

    for i:= 0 to AFiles.Count - 1 do
    try
      if 0 = CompareStr( Uppercase( FileNameNoExt( AFiles[i] )           ),
                         UpperCase( FileNameNoExt( 'RTGenericDevice.dll' ) ) ) then
        Continue;

        with TWebIQDotNetApplication.CreateEx( self,
                                          FileNameNoExt( AFiles[i] ),
                                          Format( C_Pluggins_Namespace, [ FileNameNoExt( AFiles[i] ) ] ) ) do // declared in IQMS.Common.DotNetCOMShared.pas
        try
          if not Connect then
            Continue;

          // 'V30 Protocol Based Device' + #9 + 'RTV30Device'
          if Server.GetProtocolFriendlyName = ''
          then ACapabName:= Server.GetProtocolName +#9+Server.GetProtocolName
          else ACapabName:= Server.GetProtocolFriendlyName +#9+Server.GetProtocolName;

          cmbProtocol.Items.Add(ACapabName);
        finally
          Free;
        end;

    except on E:Exception do
      IQError( Format( 'Error Loading RT Pluggin "%s"!', [ AFiles[i] ] ) );
    end;

  finally
    FreeAndNil( AFiles );
    cmbProtocol.Items.Add( 'Custom'#9'');
  end;
end;


procedure TFrmDeviceTemplate.cmbCommandNameEnter(Sender: TObject);
var
  AFiles:TStringList;
  i,
  ACapab,
  AGetCapabilityCount:Integer;
  ACapabName,
  ADefaultUOM:String;
begin
  AFiles:= TStringList.Create;
  try
    ClearStringsOfObjects( cmbCommandName.Items );
    cmbCommandName.Items.Clear;

    FindFiles( IQMS.Common.Miscellaneous.IQGetLocalHomePath, 'RT*Device.dll', AFiles, false {ASearchSubdir} );

    for i:= 0 to AFiles.Count - 1 do
      if 0 = CompareStr( Uppercase( FileNameNoExt( AFiles[i] )          ),
                         UpperCase( DM.tblPCMON_DEVICE_TEMPLATEPROTOCOL.AsString ) )
      then
        try

           with TWebIQDotNetApplication.CreateEx( self,
                                             FileNameNoExt( AFiles[i] ),
                                             Format( C_Pluggins_Namespace, [ FileNameNoExt( AFiles[i] ) ] ) ) do // declared in IQMS.Common.DotNetCOMShared.pas
           try
             if Connect then
             begin
               AGetCapabilityCount:= Server.GetCapabilityCount;
               for ACapab:= 1 to AGetCapabilityCount do
               begin
                 ACapabName := Server.GetCapabilityNameByIndex( ACapab );
                 ADefaultUOM:= Server.GetUOM( ACapab );
                 //cmbCommandName.Items.Add( ACapabName );
                 cmbCommandName.Items.AddObject( ACapabName,
                                                 TCapabInfoCargo.Create( ACapabName,
                                                                         ADefaultUOM ) );
               end;
             end;
           finally
             Free;
           end;

        except on E:Exception do
          IQError( Format('Error loading commands from %s pluggin!', [ AFiles[i] ] ) );
        end;

  finally
    FreeAndNil( AFiles );
  end;
end;

procedure TFrmDeviceTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ClearStringsOfObjects( cmbCommandName.Items );

  if Assigned(DM) and Assigned(DM.srcPCMonDevice.OnDataChange) then
    DM.srcPCMonDevice.OnDataChange:= nil;
end;

procedure TFrmDeviceTemplate.cmbCommandNameCloseUp(Sender: TUniDBComboBox;
  Select: Boolean);
var
  ACapabInfo:TCapabInfoCargo;
begin
  if not Select then EXIT;

  with cmbCommandName do if ItemIndex > -1 then
  begin
    ACapabInfo:= cmbCommandName.Items.Objects[ ItemIndex ] as TCapabInfoCargo;
    if Assigned( ACapabInfo ) and (cmbCommandName.Text <> ACapabInfo.DefaultUOM) then
    begin
      if not (DM.tblPCMON_DEV_CAPAB_TMPL.State in [ dsEdit, dsInsert ] ) then
        DM.tblPCMON_DEV_CAPAB_TMPL.Edit;

      DM.tblPCMON_DEV_CAPAB_TMPLUOM.asString:= ACapabInfo.DefaultUOM;
    end;
  end;
end;

end.
