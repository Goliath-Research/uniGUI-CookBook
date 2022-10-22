unit SI_Dialog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  dll96v1,
  ILDibCls,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniRadioButton,
  uniEdit,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniStatusBar,
  uniGroupBox,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniProgressBar, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniDBComboBox;

type
  TScanParamCargo = record
    {input params}
    Doc_Library_ID   : Real;
    CanChangeLib     : Boolean;

    {input/output params}
    FileName         : string;
  end;

  TFrmScanImageDialog = class(TUniForm)
    btnOK: TUniButton;
    btnCancel: TUniButton;
    SaveDialog1: TSaveDialog;
    ilStatus: TUniStatusBar;
    ilProgress: TUniProgressBar;
    QryDoc_Library: TFDQuery;
    QryDoc_LibraryID: TBCDField;
    QryDoc_LibraryDESCRIP: TStringField;
    QryDoc_LibraryPATH: TStringField;
    QryDoc_LibraryTYPE: TStringField;
    GroupBox1: TUniGroupBox;
    Label10: TUniLabel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    cboxScanAs: TUniComboBox;
    wwDBComboDlgFileName: TUniEdit;
    wwDBLookupComboLibrary: TUniDBLookupComboBox;
    GroupBox2: TUniGroupBox;
    rbtnSingle: TUniRadioButton;
    rbtnMulti: TUniRadioButton;
    edPages: TUniEdit;
    chkUsePageCount: TUniCheckBox;
    chkUseTimeOut: TUniCheckBox;
    edTimeOut: TUniEdit;
    Bevel1: TUniPanel;
    Label3: TUniLabel;
    Bevel2: TUniPanel;
    Label4: TUniLabel;
    chkScanBothSides: TUniCheckBox;
    QryDoc_LibraryDESCRIP2: TStringField;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    srcDocLibrary: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure wwDBComboDlgFileNameCustomDlg(Sender: TObject);
    procedure wwDBLookupComboLibraryCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure ChangeScanSource(Sender: TObject);
    procedure edPagesEnter(Sender: TObject);
    procedure ChangeHowToFinishScan(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FDoc_Library_ID_Default: Real;
    FRequested_FileName: string;
    FParams: TScanParamCargo;
    procedure InitParams;
    procedure Validate;
    function GetScanRes: Integer;
    procedure SingleScanToFile;
    function GetBWTifComp: TTiffCompression;
    function GetClrTifComp: TTiffCompression;
    procedure Prepare;
    procedure Unprepare;
    function GetNewFileName(ADirName: string): string;
    function GetDirNameFromLibrary(ADoc_Library_ID: Real): string;
    procedure ValidateExtraMultiScan;
    function GetPixType: Integer;
    procedure MultiScanToFile;
    procedure SetParams(const Value: TScanParamCargo);
  public
    { Public declarations }
    FScanParamCargo: TScanParamCargo;

    // support for multipage
    PagesRequested: Integer;
    PagesScanned  : Integer;
    IsCallBackInProgress: Boolean;
    RequestedTimeOut: Integer;


    property Params : TScanParamCargo write SetParams;
    class function DoShowModal( var AParams: TScanParamCargo ): Boolean;
    procedure ImageScanProgress(Sender: TObject; Progress: Smallint; PMessage: string; var CancelProcess: Boolean);
    function IsBasedOnPageCount: Boolean;
    function IsBasedOnTimeOut: Boolean;
    property ScanRes   : Integer read GetScanRes;
    property BWTifComp : TTiffCompression read GetBWTifComp;
    property ClrTifComp: TTiffCompression read GetClrTifComp;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.Miscellaneous,
  IQMS.Common.DataLib,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Sequence,
  IQMS.Common.StringUtils,
  //qc_doc_share,
  IQMS.Common.Controls,
  IQMS.Qc_Doc.qc_doc_share;



{Single scan callback function}
function ProgressCallBack( Progress : SmallInt; VObject : Longint): SmallInt; CDECL; export;
var
 ACancel : Boolean;
 ACaller : TFrmScanImageDialog;
begin
  Result:=1;
  if VObject <> 0 then
  begin
    ACaller:= TFrmScanImageDialog( VObject );

    if ACaller.rbtnSingle.Checked then
       ACaller.ImageScanProgress( TObject(VObject), Progress, LowerCase( ILProgressMessage ), ACancel)

    else if ACaller.IsBasedOnPageCount then
       ACaller.ImageScanProgress( TObject(VObject), Trunc(ACaller.PagesScanned / ACaller.PagesRequested * 100), LowerCase( ILProgressMessage ), ACancel)

    else if ACaller.IsBasedOnTimeOut then
       ACaller.ImageScanProgress( TObject(VObject), ACaller.PagesScanned, LowerCase( ILProgressMessage ), ACancel);

    if ACancel then
       Result:= 0;
  end;
end;


{Multipage scan callback function}
function TwainMultiPageDibCall(HDIB : Thandle; d_object: Longint): Smallint; CDECL; export;
var
   My_Tc     : TTiffCompression;
   Resolution: SmallInt;
   ACaller   : TFrmScanImageDialog;
begin
   if d_object = 0 then
   begin
     Result:=0;
     EXIT;
   end;

   ACaller:= TFrmScanImageDialog( d_object );
   ACaller.IsCallBackInProgress:= TRUE;

   My_Tc:= sFAXCCITT4;
   Resolution:= 1;
   case ACaller.cboxScanAs.ItemIndex of
     0: begin
           Resolution:= 1;
           My_Tc:= sFAXCCITT4;
        end;
     1: begin
           Resolution:= 8;
           My_Tc:= sPACKBITS;
        end;
     2: begin
           Resolution:= 8;
           My_Tc:= sPACKBITS;
        end;
     3: begin
           Resolution:= ACaller.ScanRes;
           My_Tc:= sPACKBITS;
        end;
   end;

   Inc( ACaller.PagesScanned );

   {Save it to a tiff file}
   PutTifFileDib( ACaller.FScanParamCargo.FileName,
                  GetTiffCompression(My_Tc),
                  TRUE,                           // append to tiff image
                  Resolution,
                  HDIB,
                  d_object,
                  ProgressCallBack );

   {Unlock DIB Handle and Free Memory of DIB}
   if (GMEM_LOCKCOUNT AND GlobalFlags(HDIB) > 0) then
       GlobalUnlock(HDIB);
   GlobalFree(HDIB);


   if ACaller.IsBasedOnTimeOut then
      ACaller.IsCallBackInProgress:= TRUE
   else
      ACaller.IsCallBackInProgress:= ACaller.PagesScanned < ACaller.PagesRequested;

   // TwainForm.ProgressBar1.Position:=0;
   Result:=1;
end;


{ TFrmScanImageDialog }

class function TFrmScanImageDialog.DoShowModal(var AParams: TScanParamCargo): Boolean;
var
  LFrmScanImageDialog : TFrmScanImageDialog;
begin
  LFrmScanImageDialog := TFrmScanImageDialog.Create(uniGUIApplication.UniApplication);
  with LFrmScanImageDialog do
  begin
    Params := AParams;
    FScanParamCargo:= AParams;
    FDoc_Library_ID_Default:= EnsureDefaultLibraryIDExists  {qc_doc_share};

    if FScanParamCargo.FileName > '' then
     FRequested_FileName:= ChangeFileExt( Trim(FScanParamCargo.FileName), '.tiff' );

    Result:= ShowModal = mrOK;

    if Result then
       AParams:= FScanParamCargo;

  end;
end;



procedure TFrmScanImageDialog.FormShow(Sender: TObject);
begin
  IQRegFormRead( self, [ self, chkScanBothSides ]);
end;

procedure TFrmScanImageDialog.FormClose(Sender: TObject; var Action: TCloseAction);
var
   AIntValue: Integer;
begin

  IQRegFormWrite( self, [ self, chkScanBothSides ]);

  // Time Out Value
  try
    AIntValue:= StrToInt(edTimeOut.Text);
    IQRegIntegerScalarWrite( self, 'TimeOut', AIntValue );
  except
    // walk away
  end;

  // Scan Source
  if rbtnSingle.Checked then AIntValue:= 0 else AIntValue:= 1;
  IQRegIntegerScalarWrite( self, 'Source', AIntValue );

  // How to finish scan
  if chkUsePageCount.Checked then AIntValue:= 0 else AIntValue:= 1;
  IQRegIntegerScalarWrite( self, 'FinishScan', AIntValue );
end;

procedure TFrmScanImageDialog.InitParams;
var
  ADirName : string;
  AFileName: string;
  AIntValue: Integer;
begin
  //cboxBWCompress.ItemIndex := 2;
  //cboxCLRCompress.ItemIndex:= 2;
  cboxScanAs.ItemIndex     := 0;

  if FScanParamCargo.Doc_Library_ID = 0 then
     FScanParamCargo.Doc_Library_ID:= FDoc_Library_ID_Default;

  wwDBLookupComboLibrary.ListField:= FloatToStr( FScanParamCargo.Doc_Library_ID );
  { TODO -omugdha -cWebConvert : Undeclared identifier: 'PerformSearch'
  wwDBLookupComboLibrary.PerformSearch;                                 }

  {Folder}
  ADirName:= GetDirNameFromLibrary( FScanParamCargo.Doc_Library_ID );

  {assign output name}
  wwDBComboDlgFileName.Text:= GetNewFileName( ADirName );

  {other settings}
  wwDBLookupComboLibrary.Enabled:= FScanParamCargo.CanChangeLib;

  // check boxes and edits
  if not IQRegIntegerScalarRead( self, 'Source', AIntValue ) then
     AIntValue:= 0;
  rbtnSingle.Checked:= AIntValue = 0;
  rbtnMulti.Checked := AIntValue = 1;

  if not IQRegIntegerScalarRead( self, 'FinishScan', AIntValue ) then
     AIntValue:= 0;
  chkUsePageCount.Checked:= AIntValue = 0;
  chkUseTimeOut.Checked  := AIntValue = 1;

  if not IQRegIntegerScalarRead( self, 'TimeOut', AIntValue ) then
     AIntValue:= 0;
  edTimeOut.Text:= IntToStr(AIntValue);

  {enable/disable check boxes and edits}
  ChangeScanSource(nil);
end;

function TFrmScanImageDialog.GetNewFileName( ADirName: string ): string;
begin
  ADirName:= IncludeTrailingBackslash( ADirName );

  if Trim(FRequested_FileName) = '' then
     Result:= ADirName + Format('scan_%s.tiff', [ LPadZero( FloatToStr(GetNextSequenceNumber('S_SCAN_IMAGE')), 10 )])  {this sequence is created on fly}
  else
     Result:= ADirName + Trim(FRequested_FileName);
end;

function TFrmScanImageDialog.GetDirNameFromLibrary( ADoc_Library_ID: Real ): string;
begin
  IQAssert( ADoc_Library_ID > 0, 'Invalid library ID = 0 specified'); {s/n happen}
  if ADoc_Library_ID = FDoc_Library_ID_Default then
     begin
       Result:= IQGetLocalHomePath + 'scan_image\';
       ForceDirectories( Result );
     end
  else
     Result:= IncludeTrailingBackslash( SelectValueByID('path', 'doc_library', ADoc_Library_ID ));
end;

procedure TFrmScanImageDialog.wwDBLookupComboLibraryCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
var
  ADirName: string;
begin
  if not Modified then EXIT;

  {Library, Path}
  ADirName:= GetDirNameFromLibrary( QryDoc_LibraryID.asFloat );

  {File Name}
  wwDBComboDlgFileName.Text:= GetNewFileName( ADirName );
end;

procedure TFrmScanImageDialog.wwDBComboDlgFileNameCustomDlg( Sender: TObject);
begin
  with SaveDialog1 do
  begin
    InitialDir:= SelectValueByID('path', 'doc_library', QryDoc_LibraryID.asFloat );  // ExtractFileDir( wwDBComboDlgFileName.Text );
    if Execute then
       wwDBComboDlgFileName.Text:= FileName;
  end;
end;

procedure TFrmScanImageDialog.btnOKClick(Sender: TObject);
begin
  Validate;
  if rbtnMulti.Checked then
     ValidateExtraMultiScan;
  Prepare;

  try
    if rbtnSingle.Checked then
       SingleScanToFile
    else
       MultiScanToFile;

    ModalResult:= mrOK;
  finally
    Unprepare;
  end;
end;

procedure TFrmScanImageDialog.Validate;
var
  ADirName: string;
begin
  IQAssert( wwDBComboDlgFileName.Text > '', 'File name must be assigned.' );

  ADirName:= IncludeTrailingBackslash( ExtractFileDir( wwDBComboDlgFileName.Text ));
  IQAssert( DirectoryExists( ADirName ), Format('Directory %s does not exist.', [ ADirName ]));

  if (QryDoc_LibraryID.asFloat <> FDoc_Library_ID_Default) and (SelectValueByID('path', 'doc_library', QryDoc_LibraryID.asFloat) > '') then
     IQAssert( CompareText(ExpandUNCFileName(ADirName), GetDirNameFromLibrary( QryDoc_LibraryID.asFloat )) = 0, 'File directory must match the library path'); {s/n happpen}
end;


procedure TFrmScanImageDialog.ValidateExtraMultiScan;
begin
  if chkUsePageCount.Checked then
     begin
        PagesRequested:= StrToIntDef(edPages.Text, 0);
        IQAssert( PagesRequested > 0, 'Invalid number of pages. Number of pages to be scanned must be greater than zero.');
     end
  else if chkUseTimeOut.Checked then
     begin
        RequestedTimeOut:= StrToIntDef(edTimeOut.Text, 0);
        IQAssert( RequestedTimeOut > 0, 'Invalid Time Out. Time out must be greater than zero.');
     end
  else
     raise Exception.Create('Invalid request - please select either ''Use Page Count'' or ''Use Time Out'' and try again.');
end;


procedure TFrmScanImageDialog.Prepare;
begin
  FScanParamCargo.Doc_Library_ID:= QryDoc_LibraryID.asFloat;
  FScanParamCargo.FileName      := wwDBComboDlgFileName.Text;

  DeleteFile( FScanParamCargo.FileName );
  ilProgress.Visible:= not IsBasedOnTimeOut;
  ilStatus.Panels.Items[1].Text:= 'Scanning ...';
  Application.ProcessMessages;
end;

procedure TFrmScanImageDialog.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  InitParams;
end;

procedure TFrmScanImageDialog.Unprepare;
begin
  ilProgress.Visible:= FALSE;
end;

function TFrmScanImageDialog.GetScanRes: Integer;
begin
  Result:= cboxScanAs.ItemIndex shl 2;
  if Result = 0  then Result:= 1;
  if Result = 12 then Result:= 24;
end;

function TFrmScanImageDialog.GetBWTifComp: TTiffCompression;
begin
  // case cboxBWCompress.ItemIndex of
  //      0: Result:= sCCITT;
  //      1: Result:= sFAXCCITT3;
  //      2: Result:= sFAXCCITT4;
  // end;
  Result:= sFAXCCITT4;
end;

function TFrmScanImageDialog.GetClrTifComp: TTiffCompression;
begin
  // case cboxCLRCompress.ItemIndex of
  //      0: Result:= sNONE;
  //      1: Result:= sLZW;
  //      2: Result:= sPACKBITS;
  // end;
  Result:= sPACKBITS;
end;

procedure TFrmScanImageDialog.SetParams(const Value: TScanParamCargo);
begin
  FScanParamCargo := Value;
end;

procedure TFrmScanImageDialog.SingleScanToFile;
var
  MyPixType   : Integer;
  Fi          : Integer;
  hPal        : HPalette;
  hDIB        : THandle;
  IL          : ILTDib;             // ILDibCls.pas
  TifComp     : TTiffCompression;   // dll96v1.pas
begin
  // Don't use global palette
  hPal     := 0;
  MyPixType:= TW_BW;

  // Execute the twain manager
  if ScanTwainDib( Handle, ScanRes, 0, 0, hPal, @hDIB, LongInt(self), ProgressCallBack ) then
  try
     IL:= ILTDib.Create;                                                        // Create a dib class
     IL.DibBitmap:= PBitmapInfo(GlobalLock(HDib));                              // Assign the dib to the class

     // Get the tiff compression
     if IL.Bits > 2 then                                                        // we have a gray or color image
       TifComp:= ClrTifComp
     else                                                                       // we have a Black and White image
       TifComp:= BWTifComp;

     // Write the dib to the file
     if not PutTifFileDib( FScanParamCargo.FileName,                            // Filename
                           GetTiffCompression( TifComp ),                       // Compression
                           FALSE,                                               // TiffAppend
                           IL.Bits,                                             // Resolution
                           HDIB,                                                // HDIB
                           LongInt(Self),                                       // v_object
                           ProgressCallBack ) then                              // FCallBack
        raise Exception.CreateFmt( 'Unable to save image to %s.'#13#13'Scanner Error: %s', [ FScanParamCargo.FileName, DLL96V1.LastErrorString ]);
  finally
     IL.Free;
  end;
end;


procedure TFrmScanImageDialog.ImageScanProgress( Sender: TObject; Progress: Smallint; PMessage: string; var CancelProcess: Boolean);
begin
  CancelProcess:= False;

  if IsBasedOnTimeOut then
  begin
     ilStatus.Panels.Items[0].Text:= Format('Pages scanned: %s', [ IntToStr(Progress)]);
     ilStatus.Panels.Items[1].Text:= PMessage;
     Application.ProcessMessages;
     EXIT;
  end;

  {Process the First call}
  if Progress < 2 then
  begin
     ilProgress.Position:= 0;
     ilStatus.Panels.Items[1].Text:= PMessage;
     Application.ProcessMessages;
  end;

  {Process the Last call}
  if Progress = 100  then
  begin
     ilProgress.Position:= 0;
     ilStatus.Panels.Items[1].Text:= '';
     Application.ProcessMessages;
     EXIT;
  end;

  {Some speed improvement when only processing each fifth call}
  if Progress > ilProgress.Position + 5 then
  begin
     ilProgress.Position:= Progress;
     ilStatus.Panels.Items[1].Text := PMessage;
     Application.ProcessMessages;
   end;
end;

function TFrmScanImageDialog.GetPixType: Integer;
begin
 case cboxScanAs.ItemIndex of
      0: Result:= TW_BW;
      1: Result:= TW_GRAY;
      2: Result:= TW_PALETTE;
      3: Result:= TW_RGB;
 end;
end;


procedure TFrmScanImageDialog.MultiScanToFile;
var
  AMyPixType  : Integer;
  AResolution : Integer;
  AFlags      : Integer;
  APaperSize  : Integer;
  AOrientation: Integer;
  AUnits      : Integer;
  ABitmap     : TBitmap;
  AStartTime  : TDateTime;
  APages      : Integer;
begin
  AResolution := ScanRes;
  AMyPixType  := GetPixType;

  if chkScanBothSides.Checked then
     // AFlags:= TW_SHOWUI or TW_USEADF or TW_SCANDUPLEX
     AFlags:= TW_USEADF or TW_SCANDUPLEX
  else
     AFlags:= TW_USEADF;

  APaperSize  := TWSS_USLETTER;
  AUnits      := TWUN_INCHES;
  AOrientation:= TWOR_ROT0;

  ABitmap:= TBitmap.Create;
  try
    {Reset in callback}
    IsCallBackInProgress:= FALSE;
    PagesScanned:= 0;
    APages:= iIIf( IsBasedOnTimeOut, 1000, PagesRequested );


    if not LowLevelDibScanEnhanced(ABitmap,               {Return bitmap if scanning 1 page without Twain callback}
                                   0,                     {Left in Inches or Centimeter depending on country}
                                   0,                     {Top  in Inches or Centimeter depending on country}
                                   0,                     {Right in Inches or Centimeter depending on country}
                                   0,                     {Bottom in Inches or Centimeter depending on country}
                                   200,                   {dpi resolution}
                                   AResolution,           {Resolution  1,0,8,16,24}
                                   0,                     {Dither 0 or 1}
                                   200,                   {Brightness 0-255}
                                   200,                   {Contrast  0-255}
                                   128,                   {Threshold 0-255}
                                   AUnits,
                                   APaperSize,
                                   AOrientation,
                                   0,                     {Rotation}
                                   APages,                {Pages}
                                   AMyPixType,            {PixTypes}
                                   AFlags,                {Flags  TW_USEADF w/o TW_SHOWUI to show user interface}
                                   TwainMultiPageDibCall, {TWAINCallBackFunction for multiple pages  }
                                   nil,                   {TWainCallBackFunction for progress bar etc}
                                   LongInt(Self))         {Pointer of the calling object}   then
       raise Exception.CreateFmt( 'Unable to save image to %s.'#13#13'Scanner Error: %s', [ FScanParamCargo.FileName, DLL96V1.LastErrorString ]);

  finally
    AStartTime:= Now;

    if IsBasedOnTimeOut then
       while Now - AStartTime < fMin( RequestedTimeOut, 15 * 60 ) / 86400 do    {wait until timeout - max at 15 minutes}
         Application.ProcessMessages
    else
       while IsCallBackInProgress and (Now - AStartTime < 5 * 60 / 86400 ) do   {wait until callback is finished - give it 5 minutes}
         Application.ProcessMessages;

    ABitmap.Free;
  end;
end;

procedure TFrmScanImageDialog.ChangeScanSource(Sender: TObject);
begin
  IQMS.Common.Controls.IQEnableControl( chkUsePageCount, rbtnMulti.Checked );
  IQMS.Common.Controls.IQEnableControl( chkUseTimeOut,   rbtnMulti.Checked );
  IQMS.Common.Controls.IQEnableControl( chkScanBothSides,rbtnMulti.Checked );

  ChangeHowToFinishScan(NIL);
end;

procedure TFrmScanImageDialog.edPagesEnter(Sender: TObject);
begin
  edPages.SelectAll;
end;

procedure TFrmScanImageDialog.ChangeHowToFinishScan(Sender: TObject);
begin
  if Sender = chkUsePageCount then
     chkUseTimeOut.Checked:= not chkUsePageCount.Checked
  else if Sender = chkUseTimeOut then
     chkUsePageCount.Checked:= not chkUseTimeOut.Checked;

  IQMS.Common.Controls.IQEnableControl( edPages,   chkUsePageCount.Enabled and chkUsePageCount.Checked );
  IQMS.Common.Controls.IQEnableControl( edTimeOut, chkUseTimeOut.Enabled   and chkUseTimeOut.Checked );
end;

function TFrmScanImageDialog.IsBasedOnPageCount: Boolean;
begin
  Result:= chkUsePageCount.Checked;
end;

function TFrmScanImageDialog.IsBasedOnTimeOut: Boolean;
begin
  Result:= rbtnMulti.Checked and not IsBasedOnPageCount;
end;

end.
