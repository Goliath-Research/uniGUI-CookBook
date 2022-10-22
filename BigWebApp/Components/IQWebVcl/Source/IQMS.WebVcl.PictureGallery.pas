unit IQMS.WebVcl.PictureGallery;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Vcl.Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  DB,
  DBCtrls,
  ExtDlgs,
  StdCtrls,
  Buttons,
  ShellAPI,
  ComObj,
  ActiveX,
  ShlObj,
  AxCtrls,
  Menus,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniCheckBox,
  UniImage,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniTimer,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  
  FireDAC.Stan.Option,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.DocumentsCoordinator;

type
  { Forwards }
  TGalleryCaptionBar = class;
  TGalleryImage = class;

  { TIQWebPictureGallery }
  TIQWebPictureGallery = class sealed(TUniControl)
    PnlToolbar: TUniPanel;
    NavImage: TUniDBNavigator;
    PnlCheckbox: TUniPanel;
    chkDefault: TUniDBCheckBox;
    PnlToolbarButtons: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    sbtnFullScreen: TUniSpeedButton;
    sbtnEditDescription: TUniSpeedButton;
    bvTopSpacer: TUniPanel;
    Image: TGalleryImage;
    ImageListCaptionBar: TGalleryCaptionBar;
    PkIQImagesInternal: TIQWebHPick;
    PMain: TUniPopupMenu;
    Add1: TUniMenuItem;
    Remove1: TUniMenuItem;
    Replace1: TUniMenuItem;
    EditDescription1: TUniMenuItem;
    FullScreen1: TUniMenuItem;
    SaveToFile1: TUniMenuItem;
    FDUpdateSQL1: TFDUpdateSQL;
    QryImages: TFDQuery;
    SrcImages: TDataSource;
    procedure DoOnDataChange(Sender: TObject; Field: TField);
    procedure NavImageBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DoSearchClick(Sender: TObject);
    procedure DoFullScreenClick(Sender: TObject);
    procedure DoEditDescriptionClick(Sender: TObject);
    procedure DoAfterDelete(DataSet: TDataSet);
    procedure DoAfterOpen(DataSet: TDataSet);
    procedure DoAfterPost(DataSet: TDataSet);
    procedure DoAfterScroll(DataSet: TDataSet);
    procedure DoBeforeInsert(DataSet: TDataSet);
    procedure PMainPopup(Sender: TObject);
    procedure DoInternalResize(Sender: TUniControl; w,h:integer);
  strict private
    { Private declarations }
    FSourceTableName: string;
    FActive: Boolean;
    FMasterFields: string;
    FMasterID: Integer;
    FTouchScreen: Boolean;
    FReadOnly: Boolean;
    FConnection: TFDConnection;
    FAttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator;
    procedure WMDROPFILES(var Msg: TMessage); message WM_DROPFILES;
    procedure SetControls;
    procedure CheckTouchScreen;
    procedure AssignQuery;
    procedure CreateFields;
    procedure AssignPickList;
    function GetMasterSource: TDataSource;
    procedure SetCounter;
    procedure SetDescription;
    procedure SetMasterSource(const Value: TDataSource);
    procedure SetSourceTableName(const Value: string);
    procedure SetSourceID(const Value: Integer);
    function GetActive: Boolean;
    procedure SetActive(const Value: Boolean);
    function CheckConnected: Boolean;
    function GetSourceID: Integer;
    procedure ConfigUpdateSQL;
    procedure RefreshByID(const AIQImageID: Integer);
    procedure SetReadOnly(const Value: Boolean);
    procedure Add1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure Replace1Click(Sender: TObject);
    procedure SaveToFile1Click(Sender: TObject);
    function GetIQImagesID: Integer;
    function GetSourceTableName: string;
    function GetMasterSourceID: Real;
    procedure SetConnection(const Value: TFDConnection);
    function GetMasterField: TField;
  protected
    { Protected declarations }
    procedure Loaded; override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure LocateDefault;
    procedure Start;
    property IQImagesID: Integer read GetIQImagesID;
    property SourceID: Integer read GetSourceID write SetSourceID;
    procedure Refresh;
    /// <summary>Returns true if images have been attached.</summary>
    function HasImages: Boolean;
    property AttachedDocumentsCoordinator: TIQAttachedDocumentsCoordinator
      read FAttachedDocumentsCoordinator write FAttachedDocumentsCoordinator;
  published
    { Published declarations }
    property Align;
    property Active: Boolean read GetActive write SetActive default False;
    /// <summary>Set the FireDAC connection for the component.</summary>
    property Connection: TFDConnection read FConnection write SetConnection;
    property Enabled;
    /// <summary> Name of the parent Oracle table. </summary>
    property MasterTableName: string read GetSourceTableName
      write SetSourceTableName;
    property ReadOnly: Boolean read FReadOnly write SetReadOnly default False;
    /// <summary> Master field name in the MasterSource dataset. </summary>
    property MasterFields: string read FMasterFields write FMasterFields;
    /// <summary> Master data source. </summary>
    property MasterSource: TDataSource read GetMasterSource
      write SetMasterSource;
    property Visible;
  end;

  { TGalleryImage }
  TGalleryImage = class sealed(TUniControl)
    PnlImage: TUniPanel;
    ImageControl: TUniImage;
    PnlNoImage: TUniPanel;
    procedure DoImageClick(Sender: TObject);
  strict private
    FConnection: TFDConnection;
    function GetDialogFilterString: string;
    function GeTUniImage: TUniImage;
    function LoadImageData(const AIQImageID: Integer;
      var AFileName, AExt: string; var AStream: TMemoryStream): Boolean;
    function FileNameFor(const AIQImageID: Integer): string;
    function AddBaseRecord(const ASource: string; const ASourceID: Integer;
      const AFileName: string; var AIQImageID: Integer): Boolean;
    function ValidImageFile(const AFileName: String): Boolean;
    function DoSelectFileName(var AFileName: string): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ClearImage;
    procedure LoadImageByID(const AIQImageID: Integer);
    function SaveFileAs(const AIQImageID: Integer;
      var ANewFileName: string): Boolean;
    function AddNewImage(const ASource: string; const ASourceID: Integer;
      var AIQImageID: Integer): Boolean;
    function ReplaceImage(const AIQImageID: Integer): Boolean;
    function InserTUniImage(const ASource: string; const ASourceID: Integer;
      const AFileName: String; var AIQImageID: Integer): Boolean;
    function UpdateImage(const AIQImageID: Integer;
      const AFileName: String): Boolean;
    function IsImageLoaded: Boolean;
    procedure CheckValidImageFile(const AFileName: String);
    procedure SetControls;
    procedure ShowFullScreen;
  published
    property Connection: TFDConnection read FConnection write FConnection;
    property Image: TUniImage read GeTUniImage;
  end;

  { TIQImageListCaptionScrollDirection }
  TIQImageListCaptionScrollDirection = (ilcsExpanding, ilcsCollapsing);

  { TGalleryCaptionBar }
  TGalleryCaptionBar = class sealed(TUniControl)
    PnlCarrier: TUniPanel;
    bvLeft: TUniControl;
    lblImageCount: TUniLabel;
    bvCenter: TUniControl;
    lblCaption: TUniLabel;
    bvRight: TUniControl;
    ScrollTimer: TUniTimer;
    procedure DoScrollTimerTimer(Sender: TObject);
  strict private
    { Private declarations }
    FImageCount: Integer;
    FImageNumber: Integer;
    FCaption: string;
    FScrollDirection: TIQImageListCaptionScrollDirection;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SeTUniImageCounTUniLabel;
    procedure SeTUniImageCount(const Value: Integer);
    procedure SetCaption(const Value: string);
    procedure SeTUniImageNumber(const Value: Integer);
    procedure SetStartPos;
    procedure SetKeepPos;
    procedure ScrollIntoView;
    function GetMaxTextHeight: Integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure Start;
    procedure AdjustAfterResize;
  published
    { Published declarations }
    property ImageNumber: Integer read FImageNumber write SeTUniImageNumber;
    property ImageCount: Integer read FImageCount write SeTUniImageCount;
    property Caption: string read FCaption write SetCaption;
  end;

implementation

uses
  IQMS.Common.EditMemoStr,
  IQMS.Common.ImagePreviewPopup,
  IQMS.Common.ApplicationSet,
  IQMS.WebVcl.Blob,
  IQMS.Common.Choose,
  IQMS.Common.Controls,
  IQMS.Common.FileUtils,
//  IQFullScreen,
  IQMS.Common.Graphics,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  Math,
  IQMS.Common.PanelMsg,
  IQMS.Common.TableSequence,
  IQMS.WebVcl.ResourceStrings;

const
  c_dialog_default_ext = '.bmp';
  c_dialog_filter =
    'All (*.jpg;*.jpeg;*.bmp;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.emf;*.' +
    'wmf|JPEG Image File (*.jpg;*.jpeg)|*.jpg;jpeg|Bitmaps (*.bmp)|*.' +
    'bmp|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf';
  c_caption_bar_base_height = 20;

{$REGION 'TGalleryImage'}
  { TGalleryImage }

constructor TGalleryImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Width := 200;
  Height := 200;

  PnlImage := TUniPanel.Create(Self);
  with PnlImage do
    begin
      Parent := Self;
      Tag := 1999;
      Align := alClient;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      Color := clAppWorkSpace;
      ParentBackground := False;
      TabOrder := 2;
      ShowCaption := False;
    end;

  ImageControl := TUniImage.Create(Self);
  with ImageControl do
    begin
      Parent := PnlImage;
      Align := alClient;
      Center := True;
      Proportional := True;
      // Note:  To be the most flicker-free, set owner form
      // DoubleBuffered to True also.
      DoubleBuffered := True;
      OnClick := DoImageClick;
    end;

  PnlNoImage := TUniPanel.Create(Self);
  with PnlNoImage do
    begin
      Parent := PnlImage;
      Tag := 1999;
      Align := alClient;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      // IQMS.WebVcl.ResourceStrings.cTXT0000445 = 'No image loaded.';
      Caption := IQMS.WebVcl.ResourceStrings.cTXT0000445;
      Font.Color := clWhite;
      ParentColor := True;
      ShowCaption := True;
    end;

  SetControls;
end;

procedure TGalleryImage.DoImageClick(Sender: TObject);
begin
  if Assigned(Image.Picture) then
    ShowImagePreviewPopup( Image);
end;

procedure TGalleryImage.ClearImage;
begin
  PnlNoImage.Visible := True;
  ImageControl.Visible := False;
  ImageControl.Picture.Bitmap := nil;
end;

function TGalleryImage.GetDialogFilterString: string;
begin
  { 'All (*.jpg;*.jpeg;*.bmp;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.emf;*.' +
    'wmf|JPEG Image File (*.jpg;*.jpeg)|*.jpg;jpeg|Bitmaps (*.bmp)|*.' +
    'bmp|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf' }
  Result := IQMS.WebVcl.ResourceStrings.cTXT0000444;

  if Result = '' then
    Result := c_dialog_filter;
end;

function TGalleryImage.GeTUniImage: TUniImage;
begin
  Result := ImageControl;
end;

function TGalleryImage.FileNameFor(const AIQImageID: Integer): string;
begin
  if Assigned(Connection) then
    with TFDQuery.Create(NIL) do
      try
        Connection := Self.Connection;
        SQL.Add('SELECT image_filename');
        SQL.Add('  FROM iq_images');
        SQL.Add(Format(' WHERE id = %d', [AIQImageID]));
        Open;
        Result := Fields[0].AsString;
      finally
        Free;
      end;
end;

procedure TGalleryImage.LoadImageByID(const AIQImageID: Integer);
var
  AFileName, AExt: String;
  AMemoryStream: TMemoryStream;
  ABlobSize: Integer;
  ABytesArray: array of Byte;
  APicture: TPicture;
  AOleGraphic: TOleGraphic; // AxCtrls.pas
  ABitmap: TBitMap;
  AMetaFile: TMetafile;
begin
  // First, clear the image
  Image.Picture.Bitmap := NIL;

  APicture := TPicture.Create;
  try
    ABitmap := TBitMap.Create;
    try
      AMemoryStream := TMemoryStream.Create;
      try
        if LoadImageData(AIQImageID, AFileName, AExt, AMemoryStream) then
          begin
            // Attempt to load the image by type
            if CompareText(AExt, '.BMP') = 0 then
              Image.Picture.Bitmap.LoadFromStream(AMemoryStream)
            else if CompareText(AExt, '.WMF') = 0 then
              begin
                // meta files
                AMetaFile := TMetafile.Create;
                try
                  AMetaFile.LoadFromStream(AMemoryStream);
                  // Draw the metafile in the Bitmap's canvas
                  with ABitmap do
                    begin
                      Height := AMetaFile.Height;
                      Width := AMetaFile.Width;
                      Canvas.Draw(0, 0, AMetaFile);
                    end;
                  Image.Picture.Assign(ABitmap);
                finally
                  FreeAndNil(AMetaFile);
                end;
              end
            else
              begin
                AOleGraphic := TOleGraphic.Create;
                try
                  AOleGraphic.LoadFromStream(AMemoryStream);
                  APicture.Assign(AOleGraphic);
                  // Try converting image to bitmap
                  try
                    ABitmap.Assign(APicture.Graphic);
                    Image.Picture.Assign(APicture.Bitmap);
                  except
                    // Image didn't support conversion to TBitmap
                    // Draw image on bitmap instead
                    ABitmap.Width := APicture.Graphic.Width;
                    ABitmap.Height := APicture.Graphic.Height;
                    ABitmap.Canvas.Draw(0, 0, APicture.Graphic);
                    Image.Picture.Assign(ABitmap);
                  end;
                finally
                  FreeAndNil(AOleGraphic);
                end;
              end;
          end;
      finally
        if Assigned(AMemoryStream) then
          FreeAndNil(AMemoryStream);
      end;
    finally
      if Assigned(ABitmap) then
        FreeAndNil(ABitmap);
    end;
  finally
    if Assigned(APicture) then
      FreeAndNil(APicture);
  end;
  SetControls;
end;

function TGalleryImage.LoadImageData(const AIQImageID: Integer;
  var AFileName, AExt: string; var AStream: TMemoryStream): Boolean;
var
  ABlobSize: Integer;
  ABytesArray: array of Byte;
begin
  Result := False;
  if Assigned(AStream) and Assigned(Connection) then
    with TFDQuery.Create(NIL) do
      try
        Connection := Self.Connection;
        SQL.Add('SELECT image, image_filename');
        SQL.Add('  FROM iq_images');
        SQL.Add(Format(' WHERE id = %d', [AIQImageID]));
        Open;
        AFileName := Fields[1].AsString;
        AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
        if (Fields[0] is TBlobField) then
          begin
            (Fields[0] as TBlobField).SaveToStream(AStream);
            ABlobSize := AStream.Size;
            if ABlobSize > 0 then
              begin
                SetLength(ABytesArray, ABlobSize);
                AStream.WriteBuffer(ABytesArray[0], ABlobSize);
                AStream.Position := 0;
                Result := True;
              end;
          end;
      finally
        Free;
      end;
end;

function TGalleryImage.SaveFileAs(const AIQImageID: Integer;
  var ANewFileName: string): Boolean;
var
  AMemoryStream: TMemoryStream;
  AIndex: Integer;
  AFileName, AExt: string;
begin
  // TSavePictureDialog is declared in ExtDlgs.pas
  with TSavePictureDialog.Create(nil) do
    try
      DefaultExt := c_dialog_default_ext;
      Filter := GetDialogFilterString;

      FileName := ExtractFileName(FileNameFor(AIQImageID));
      if Execute then
        begin
          ANewFileName := FileName;
          AMemoryStream := TMemoryStream.Create;
          try
            if LoadImageData(AIQImageID, AFileName, AExt, AMemoryStream) then
              begin
                AMemoryStream.SaveToFile(FileName);
                // IQMS.WebVcl.ResourceStrings.cTXT0000446 = 'Image File Created';
                // IQMS.WebVcl.ResourceStrings.cTXT0000447 = 'What do you want to do?';
                // IQMS.WebVcl.ResourceStrings.cTXT0000448 = 'Open image file';
                // IQMS.WebVcl.ResourceStrings.cTXT0000449 = 'Open file location';
                if DoChoose(IQMS.WebVcl.ResourceStrings.cTXT0000446,
                  IQMS.WebVcl.ResourceStrings.cTXT0000447, [IQMS.WebVcl.ResourceStrings.cTXT0000448,
                  IQMS.WebVcl.ResourceStrings.cTXT0000449],
                  0,
                  AIndex) then
                  case AIndex of
                    0:
                      IQMS.Common.Miscellaneous.ExecuteProgram(FileName);
                    1:
                      IQMS.Common.Miscellaneous.ExecuteProgram(ExtractFilePath(FileName));
                  end;
              end;
          finally
            FreeAndNil(AMemoryStream);
          end;
        end;
    finally
      Free;
    end;
end;

function TGalleryImage.IsImageLoaded: Boolean;
begin
  Result := not Image.Picture.Bitmap.Empty;
end;

procedure TGalleryImage.SetControls;
begin
  PnlNoImage.Visible := not IsImageLoaded;
  Image.Visible := not PnlNoImage.Visible;
end;

procedure TGalleryImage.ShowFullScreen;
var
  ev: TNotifyEvent;
begin
  // Full Screen
  if Assigned(Image) and IsImageLoaded then
    try
      ev := Image.OnClick;
      Image.OnClick := nil;
//      IQFullScreen.DoFullScreen(Self, Image.Parent, Image);
    finally
      Image.OnClick := ev;
    end;
end;

function TGalleryImage.AddBaseRecord(const ASource: string;
  const ASourceID: Integer; const AFileName: string;
  var AIQImageID: Integer): Boolean;
var
  ASeq: Integer;
  AIsDefault: String[1];
  ADefaultDescrip: string;
begin
  // Add the base record without adding the image.  The IMAGE field will
  // be NULL after this function is complete.
  Result := False;
  if (ASource > '') and (ASourceID > 0) then
    try
      AIQImageID := GetNextID('iq_images');
      ASeq := SelectValueFmtAsInteger(
        'SELECT MAX(seq)'#13 +
        '  FROM iq_images'#13 +
        ' WHERE source = ''%s'' and source_id = %d',
        [ASource, ASourceID]) + 1;
      if ASeq = 1 then
        AIsDefault := 'Y'
      else
        AIsDefault := 'N';
      ADefaultDescrip := ExtractFileName(AFileName);
      ExecuteCommandFmt(
        'INSERT INTO iq_images(id,'#13 +
        '                      source,'#13 +
        '                      source_id,'#13 +
        '                      seq,'#13 +
        '                      descrip,'#13 +
        '                      image,'#13 +
        '                      isdefault,'#13 +
        '                      created,'#13 +
        '                      createdby)'#13 +
        '    VALUES (%d, ''%s'', %d, %d, ''%s'', EMPTY_BLOB(), ''%s'','#13 +
        '            SYSDATE, iqms.misc.getusername)',
        [AIQImageID, ASource, ASourceID, ASeq, FixStr(ADefaultDescrip),
        AIsDefault]);
      Result := True;
    except
      on E: Exception do
        // IQMS.WebVcl.ResourceStrings.cTXT0000450 = 'Error inserting image record:';
        raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000450 + #13 + E.Message);
    end;
end;

function TGalleryImage.AddNewImage(const ASource: string;
  const ASourceID: Integer; var AIQImageID: Integer): Boolean;
var
  AFileName: string;
begin
  if DoSelectFileName(AFileName) then
    begin
      CheckValidImageFile(AFileName);
      Result := InserTUniImage(ASource, ASourceID, AFileName, AIQImageID);
    end;
end;

function TGalleryImage.ReplaceImage(const AIQImageID: Integer): Boolean;
var
  AFileName: string;
begin
  // IQMS.WebVcl.ResourceStrings.cTXT0000451 = 'Replace current image?';
  if (AIQImageID > 0) and IQConfirmYN(IQMS.WebVcl.ResourceStrings.cTXT0000451) then
    begin
      if DoSelectFileName(AFileName) then
        begin
          CheckValidImageFile(AFileName);
          Result := UpdateImage(AIQImageID, AFileName);
        end;
    end;
end;

procedure TGalleryImage.CheckValidImageFile(const AFileName: String);
begin
  if not ValidImageFile(AFileName) then
    // IQMS.WebVcl.ResourceStrings.cTXT0000452 = 'Unsupported image file type.  Cannot add:';
    raise Exception.Create(IQMS.WebVcl.ResourceStrings.cTXT0000452 + #13 +
      AFileName);
end;

function TGalleryImage.ValidImageFile(const AFileName: String): Boolean;
var
  AExt: String;
begin
  AExt := Trim(UpperCase(ExtractFileExt(AFileName)));
  Result := IQMS.Common.StringUtils.StrInList(AExt, ['.JPG', '.JPEG', '.BMP', '.EMF', '.WMF']);
end;

function TGalleryImage.DoSelectFileName(var AFileName: string): Boolean;
begin
  with TOpenPictureDialog.Create(nil) do
    try
      DefaultExt := c_dialog_default_ext;
      Filter := GetDialogFilterString;
      Result := Execute;
      if Result then
        AFileName := FileName;
    finally
      Free;
    end;
end;

function TGalleryImage.InserTUniImage(const ASource: string;
  const ASourceID: Integer; const AFileName: String;
  var AIQImageID: Integer): Boolean;
begin
  // Initialize result
  Result := False;
  if (ASource > '') and (ASourceID > 0) then
    begin
      // Add the base record.  This does not add the image yet.
      Result := AddBaseRecord(ASource, ASourceID, AFileName, AIQImageID);
      // If we successfully add the base record, update the image.
      if Result then
        Result := UpdateImage(AIQImageID, AFileName);
    end;
end;

function TGalleryImage.UpdateImage(const AIQImageID: Integer;
  const AFileName: String): Boolean;
var
  AMemoryStream: TMemoryStream;
  // bmp: TBitMap;
  AFileNameToSave: String;
  AOriginalBmp, AThumbnail: TBitMap;
  hMsg: TPanelMesg;
begin
  // Update the IMAGE BLOB field.
  Result := False;
  if (AIQImageID > 0) and FileExists(AFileName) then
    try
      hMsg := hPleaseWait('Loading image.  Please wait...');
      try
        AMemoryStream := TMemoryStream.Create;
        try
          // bmp := IQMS.Common.Graphics.LoadGraphicsFile(AFileName);
          // Image.Picture.Bitmap := bmp;
          AMemoryStream.LoadFromFile(AFileName);
          // Get the file name string to save to the database
          AFileNameToSave := AFileName;
          if Length(AFileNameToSave) > 255 then
            AFileNameToSave := IQMS.Common.FileUtils.ShortDirectoryAndFileName(AFileName);
          if Length(AFileNameToSave) > 255 then
            AFileNameToSave := ExtractFileName(AFileName);
          if Length(AFileNameToSave) > 255 then
            AFileNameToSave := '';

          // Save the image BLOB
          TIQWebBlob.SaveBlob('image',
            'iq_images',
            AIQImageID,
            AMemoryStream); // iqblob
          // Update the original file name
          ExecuteCommandParam('UPDATE iq_images '#13 +
            '   SET image_filename = :IMAGE_FILENAME '#13 +
            ' WHERE id = :ID',
            ['IMAGE_FILENAME;S', 'ID;I'],
            [AFileNameToSave, AIQImageID]);

          // Get thumbnail
          AOriginalBmp := TBitMap.Create;
          try
            IQMS.Common.Graphics.LoadGraphicFileAsBitmap(AFileName, AOriginalBmp);
            AThumbnail := TBitMap.Create;
            try
              IQMS.Common.Graphics.MakeThumbNail(AOriginalBmp, AThumbnail, 96);
              AThumbnail.SaveToStream(AMemoryStream);
              TIQWebBlob.SaveBlob('thumbnail',
                'iq_images',
                AIQImageID,
                AMemoryStream); // iqblob
            finally
              FreeAndNil(AThumbnail);
            end;
          finally
            FreeAndNil(AOriginalBmp);
          end;

          Result := True;
        finally
          if Assigned(AMemoryStream) then
            FreeAndNil(AMemoryStream);
        end;
      finally
        if Assigned(hMsg) then
          FreeAndNil(hMsg);
      end;
    except
      on E: Exception do
        raise Exception.Create('Error updating image:'#13 + E.Message);
    end;
end;

{$ENDREGION 'TGalleryImage'}

{$REGION 'TGalleryCaptionBar'}

{ TGalleryCaptionBar }

constructor TGalleryCaptionBar.Create(AOwner: TComponent);
var
  ASelf: TGalleryCaptionBar;
begin
  inherited Create(AOwner);

  ASelf := Self;

  // Default control size and position
  Width := 429;
  Height := c_caption_bar_base_height;

  // Carrier panel
  PnlCarrier := TUniPanel.Create(Self);
  with PnlCarrier do
    begin
      Parent := ASelf;
      Align := alClient;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      Caption := '';
      Color := clBlack;
      DoubleBuffered := True;
      ParentBackground := False;
      ParentDoubleBuffered := False;
      ShowCaption := False;
      StyleElements := [];
    end;

  bvLeft := TUniControl.Create(Self);
  with bvLeft do
    begin
      Parent := PnlCarrier;
      Align := alLeft;
      // Shape := bsSpacer;
      Width := 8;
    end;

  lblImageCount := TUniLabel.Create(Self);
  with lblImageCount do
    begin
      Parent := PnlCarrier;
      AlignWithMargins := True;
      Align := alLeft;
      Width := 60;
      AutoSize := True;
      Caption := '';
      Font.Color := clWhite;
      ParentFont := False;
    end;

  bvCenter := TUniControl.Create(Self);
  with bvCenter do
    begin
      Parent := PnlCarrier;
      Left := lblImageCount.Left + lblImageCount.Width;
      Width := 8;
      Align := alLeft;
      // Shape := bsSpacer;
    end;

  lblCaption := TUniLabel.Create(Self);
  with lblCaption do
    begin
      Parent := PnlCarrier;
      AlignWithMargins := True;
      AutoSize := False;
      Align := alClient;
      Caption := 'Caption text';
//      EllipsisPosition := epEndEllipsis;
      Font.Color := clWhite;
      ParentFont := False;
      Alignment := taCenter;
    end;

  bvRight := TUniControl.Create(Self);
  with bvRight do
    begin
      Parent := PnlCarrier;
      Align := alRight;
      // Shape := bsSpacer;
      Width := 8;
    end;

  ScrollTimer := TUniTimer.Create(Self);
  with ScrollTimer do
    begin
      Enabled := False;
      Interval := 380;
      OnTimer := DoScrollTimerTimer;
    end;

  Start;

end;

procedure TGalleryCaptionBar.CreateWindowHandle(
  const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);

  // Ensure controls are positioned correctly
  bvLeft.Left := 0;
  lblImageCount.Left := bvLeft.Left + bvLeft.Width;
  bvCenter.Left := lblImageCount.Left + lblImageCount.Width;
  lblCaption.Left := bvCenter.Left + bvCenter.Width;
  bvRight.Left := ClientWidth;

end;

procedure TGalleryCaptionBar.CMMouseEnter(var Message: TMessage);
begin
  if Assigned(ScrollTimer) then
    begin
      ScrollTimer.Enabled := False;
      FScrollDirection := ilcsExpanding;
      ScrollTimer.Enabled := True;
    end;
end;

procedure TGalleryCaptionBar.CMMouseLeave(var Message: TMessage);
begin
  if Assigned(ScrollTimer) then
    begin
      ScrollTimer.Enabled := False;
      FScrollDirection := ilcsCollapsing;
      ScrollTimer.Enabled := True;
    end;
end;

procedure TGalleryCaptionBar.AdjustAfterResize;
begin
  SetKeepPos;
end;

procedure TGalleryCaptionBar.DoScrollTimerTimer(Sender: TObject);
begin
  ScrollTimer.Enabled := False;
  ScrollIntoView;
end;

function TGalleryCaptionBar.GetMaxTextHeight: Integer;
var
  ARect: TRect;
  AText: string;
begin
  // Populate TRect
  ARect.Left := 0;
  ARect.Right := lblCaption.Width;
  ARect.Top := 0;
  ARect.Bottom := 0;

  // Set word wrap before getting the TRect value
//  lblCaption.WordWrap := True;

  // Get the TRect of wrapped text
  AText := lblCaption.Caption;
//  lblCaption.Canvas.TextRect( { var } ARect, { var } AText,
//    [tfCalcRect, tfWordBreak]);

  // Get target label height
  Result := Math.Min(80, ARect.Bottom);
end;

procedure TGalleryCaptionBar.ScrollIntoView;
var
  AHeight: Integer;
begin
  if (FScrollDirection = ilcsExpanding) then
    begin
      AHeight := GetMaxTextHeight;
      if AHeight > 13 then
        Inc(AHeight, 8)
      else
        Exit;
      Height := AHeight;
      SetKeepPos;
    end
  else
    begin
      Self.SetStartPos;
//      lblCaption.WordWrap := False;
    end;
end;

procedure TGalleryCaptionBar.SeTUniImageCounTUniLabel;
begin
  if not (csLoading in ComponentState) and
    not (csDestroying in ComponentState) and
    Assigned(lblImageCount) then
    lblImageCount.Caption := Format('%d/%d',
      [FImageNumber, FImageCount]);
end;

procedure TGalleryCaptionBar.SeTUniImageCount(const Value: Integer);
begin
  FImageCount := Value;
  SeTUniImageCounTUniLabel;
end;

procedure TGalleryCaptionBar.SeTUniImageNumber(const Value: Integer);
begin
  FImageNumber := Value;
  SeTUniImageCounTUniLabel;
end;

procedure TGalleryCaptionBar.SetKeepPos;
begin
  if Assigned(Owner) and (Owner is TIQWebPictureGallery) then
    begin
      Left := 0;
      Top := TIQWebPictureGallery(Owner).ClientHeight - Height;
      Width := TIQWebPictureGallery(Owner).ClientWidth;
    end;
end;

procedure TGalleryCaptionBar.SetStartPos;
begin
  if Assigned(ScrollTimer) and Assigned(lblCaption) then
    begin
      ScrollTimer.Enabled := False;
      FScrollDirection := ilcsCollapsing;
//      lblCaption.WordWrap := False;
      Height := c_caption_bar_base_height;
      Left := 0;
      if Assigned(Parent) then
        begin
          Top := Parent.ClientHeight - Height;
          Width := Parent.ClientWidth;
        end
      else
        Width := 248;
    end;
end;

procedure TGalleryCaptionBar.Start;
begin
  SetStartPos;
  SeTUniImageCounTUniLabel;
end;

procedure TGalleryCaptionBar.SetCaption(const Value: string);
begin
  FCaption := Value;
  if Assigned(lblCaption) then
    lblCaption.Caption := Value;
end;

{$ENDREGION 'TGalleryCaptionBar'}

{$REGION 'TIQWebPictureGallery'}

{ TIQWebPictureGallery }

constructor TIQWebPictureGallery.Create(AOwner: TComponent);

  procedure _AssignMenuItem(const APopupMenu: TUniPopupMenu; AMenuObject: TUniMenuItem;
    const AMenuName, AMenuCaption: string; AClickEvent: TNotifyEvent;
    const ABreak: Boolean = False);
  var
    AN1: TUniMenuItem;
  begin
    AMenuObject := TUniMenuItem.Create(Self);
    AMenuObject.Name := AMenuName;
    AMenuObject.Caption := AMenuCaption;
    AMenuObject.OnClick := AClickEvent;
    APopupMenu.Items.Add(AMenuObject);
    if ABreak then
      begin
        AN1 := TUniMenuItem.Create(Self);
        AN1.Caption := '-';
        APopupMenu.Items.Add(AN1);
      end;
  end;

begin
  inherited Create(AOwner);

  FSourceTableName := '';
  FMasterID := 0;
  MasterFields := 'ID';

  Height := 250;
  Width := 482;
  // BevelInner := bvNone;
  // BevelOuter := bvNone;
  // BorderStyle := bsNone;
  // Caption := '';
  // ShowCaption := False;

  PnlToolbar := TUniPanel.Create(Self);
  with PnlToolbar do
    begin
      Parent := Self;
      Name := 'PnlToolbar';
      Align := alTop;
      Top := 0;
      Height := 27;
      BevelInner := bvLowered;
      BevelOuter := bvNone;
      ParentBackground := False;
      ShowCaption := False;
      Tag := 1999;
    end;

  PnlToolbarButtons := TUniPanel.Create(Self);
  with PnlToolbarButtons do
    begin
      Parent := PnlToolbar;
      Name := 'PnlToolbarButtons';
      Align := alLeft;
      Tag := 1999;
      Width := 76;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      ParentBackground := False;
      ShowCaption := False;
    end;

  sbtnSearch := TUniSpeedButton.Create(Self);
  with sbtnSearch do
    begin
      Parent := PnlToolbarButtons;
      Name := 'sbtnSearch';
      Left := 0;
      Top := 0;
      Width := 25;
      Height := 25;
      Hint := 'Search';
      Glyph.LoadFromResourceName(HInstance, 'PKLIST');
      ShowHint := True;
      OnClick := DoSearchClick;
    end;

  sbtnFullScreen := TUniSpeedButton.Create(Self);
  with sbtnFullScreen do
    begin
      Parent := PnlToolbarButtons;
      Name := 'sbtnFullScreen';
      Left := 25;
      Top := 0;
      Width := 25;
      Height := 25;
      Hint := 'Full screen';
      Glyph.LoadFromResourceName(HInstance, 'FULLSCRN');
      ShowHint := True;
      OnClick := DoFullScreenClick;
    end;

  sbtnEditDescription := TUniSpeedButton.Create(Self);
  with sbtnEditDescription do
    begin
      Parent := PnlToolbarButtons;
      Name := 'sbtnEditDescription';
      Left := 50;
      Top := 0;
      Width := 25;
      Height := 25;
      Hint := 'Edit description';
      ShowHint := True;
      Glyph.LoadFromResourceName(HInstance, 'CMNTEDT');
      OnClick := DoEditDescriptionClick;
    end;

  PnlCheckbox := TUniPanel.Create(Self);
  with PnlCheckbox do
    begin
      Parent := PnlToolbar;
      Name := 'PnlCheckbox';
      Align := alLeft;
      Left := PnlToolbarButtons.Width + 1;
      BevelInner := bvNone;
      BevelOuter := bvNone;
      ShowCaption := False;
    end;

  chkDefault := TUniDBCheckBox.Create(Self);
  with chkDefault do
    begin
      Parent := PnlCheckbox;
      Name := 'chkDefault';
      Left := 8;
      Top := 4;
      Width := 97;
      Caption := 'Default';
      ValueChecked := 'Y';
      ValueUnchecked := 'N';
    end;

  NavImage := TUniDBNavigator.Create(Self);
  with NavImage do
    begin
      Parent := PnlToolbar;
      Name := 'NavImage';
      Align := alRight;
      VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete,
        nbPost, nbCancel, nbRefresh];
//      Flat := True;
//      BeforeAction := NavImageBeforeAction;
    end;

  bvTopSpacer := TUniPanel.Create(Self);
  with bvTopSpacer do
    begin
      Parent := Self;
      Name := 'bvTopSpacer';
      Align := alTop;
      Top := PnlToolbar.Height + 1;
      Height := 3;
//      Shape := bsSpacer;
    end;

  Image := TGalleryImage.Create(Self);
  with Image do
    begin
      Parent := Self;
      Name := 'TGalleryImage';
      Align := alTop;
      Top := PnlToolbar.Top + PnlToolbar.Height + bvTopSpacer.Height + 1;
    end;

  ImageListCaptionBar := TGalleryCaptionBar.Create(Self);
  with ImageListCaptionBar do
    begin
      Parent := Self;
      Name := 'ImageListCaptionBar';
      Align := alNone;
      ImageCount := 0;
      Caption := '';
      Left := 0;
    end;

  PkIQImagesInternal := TIQWebHPick.Create(Self);
  PMain := TUniPopupMenu.Create(Self);
  PMain.Name := 'PMain';
  _AssignMenuItem(PMain, Add1, 'Add1', 'Add', Add1Click);
  _AssignMenuItem(PMain, Remove1, 'Remove1', 'Remove', Remove1Click);
  _AssignMenuItem(PMain, Replace1, 'Replace1', 'Replace', Replace1Click);
  _AssignMenuItem(PMain, EditDescription1, 'EditDescription1',
    'Edit Description', DoEditDescriptionClick, True);
  _AssignMenuItem(PMain, FullScreen1, 'FullScreen1', 'Full Screen',
    DoFullScreenClick, True);
  _AssignMenuItem(PMain, SaveToFile1, 'SaveToFile1', 'Save to File',
    SaveToFile1Click);
  Image.PopupMenu := PMain;

  FDUpdateSQL1 := TFDUpdateSQL.Create(Self);
  FDUpdateSQL1.Name := 'FDUpdateSQL1';
  QryImages := TFDQuery.Create(Self);
  QryImages.Name := 'QryImages';
  SrcImages := TDataSource.Create(Self);
  SrcImages.Name := 'SrcImages';
  SrcImages.DataSet := QryImages;
  SrcImages.OnDataChange := DoOnDataChange;
  NavImage.DataSource := SrcImages;
  chkDefault.DataSource := SrcImages;
  chkDefault.DataField := 'ISDEFAULT';

  OnResize := DoInternalResize;

end;

procedure TIQWebPictureGallery.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);

  Start;

end;

procedure TIQWebPictureGallery.Loaded;
begin
  inherited;
  Refresh;
end;

procedure TIQWebPictureGallery.Start;
begin
  CheckTouchScreen;
  SetControls;
  if Assigned(ImageListCaptionBar) then
    ImageListCaptionBar.Start;
  DoInternalResize(Self,0,0);
  if not (csDesigning in ComponentState) then
    DragAcceptFiles(Self.Handle, True);
end;

procedure TIQWebPictureGallery.CheckTouchScreen;
begin
  if IQMS.Common.ApplicationSet.IsTouchScreen then
    begin
      PnlToolbar.Height := 42;
      sbtnSearch.Width := 40;
      sbtnSearch.Height := 40;
      sbtnFullScreen.Width := 40;
      sbtnFullScreen.Height := 40;
      sbtnEditDescription.Width := 40;
      sbtnEditDescription.Height := 40;
      PnlToolbarButtons.Width := 121;
      IQMS.Common.Controls.StackUpControlsLeft(0, 0, [sbtnSearch, sbtnFullScreen,
        sbtnEditDescription]);
      IQMS.Common.Controls.CenterControlsVertInWindowA(PnlCheckbox);
//      IQMS.Common.Controls.AutoSizeNavBar(NavImage);
    end;
end;

procedure TIQWebPictureGallery.DoInternalResize(Sender: TUniControl; w,h:integer);
begin
  if Assigned(ImageListCaptionBar) then
    ImageListCaptionBar.AdjustAfterResize;
  if Assigned(Image) then
    Image.Height := ClientHeight - c_caption_bar_base_height -
      PnlToolbar.Height - bvTopSpacer.Height;
end;

procedure TIQWebPictureGallery.DoOnDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(QryImages) and QryImages.Active then
    begin
      if Assigned(FAttachedDocumentsCoordinator) then
        FAttachedDocumentsCoordinator.UpdateImageExistsIndicator(Self,
          not (QryImages.Bof and QryImages.Eof));
    end;
end;

procedure TIQWebPictureGallery.WMDROPFILES(var Msg: TMessage);
var
  i, ACount, AIndex, ASize: Integer;
  PName: PChar;
  AFileName: String;
  AIQImageID: Integer;
begin
  // Do not allow if not in edit mode.
  if not Add1.Visible or
    not Add1.Enabled or
    ReadOnly then
    Exit;

  // This method enables drag and drop with the Windows Explorer
  inherited;
  {
    if not iqchoose.DoChoose(Self,
    'Add Image',
    'What do you want to do?',
    ['Add new image','Update current image'],
    0, AIndex) then
    Exit;
  }
  AIndex := 0;
  ACount := DragQueryFile(Msg.WParam, $FFFFFFFF, PName, 255);

  // IQMS.WebVcl.ResourceStrings.cTXT0000453 = 'Add Image';
  // IQMS.WebVcl.ResourceStrings.cTXT0000454 = 'Do you want to add or replace an image?';
  // IQMS.WebVcl.ResourceStrings.cTXT0000455 = 'Add a new image';
  // IQMS.WebVcl.ResourceStrings.cTXT0000456 = 'Update the current image';
  if not (QryImages.BOF and QryImages.EOF) and (ACount = 1) and
    not DoChoose( IQMS.WebVcl.ResourceStrings.cTXT0000453, IQMS.WebVcl.ResourceStrings.cTXT0000454,
    [IQMS.WebVcl.ResourceStrings.cTXT0000455, IQMS.WebVcl.ResourceStrings.cTXT0000456],
    0, AIndex) then
    Exit;

  for i := 0 to (ACount - 1) do
    begin
      ASize := DragQueryFile(Msg.WParam, i, nil, 0) + 1;
      PName := StrAlloc(ASize);
      DragQueryFile(Msg.WParam, i, PName, ASize);
      AFileName := StrPas(PName);

      Image.CheckValidImageFile(AFileName);
      // Add the file
      case AIndex of
        0:
          Image.InserTUniImage(MasterTableName, SourceID, AFileName, AIQImageID);
        1:
          Image.UpdateImage(Self.IQImagesID, AFileName);
      end;
      StrDispose(PName);
    end;
  DragFinish(Msg.WParam);

  // Refresh
  case AIndex of
    0:
      RefreshByID(AIQImageID);
    1:
      Refresh;
  end;
end;

procedure TIQWebPictureGallery.ConfigUpdateSQL;
begin
  if Assigned(Connection) then
    with FDUpdateSQL1 do
      begin
        Connection := Self.Connection;
        InsertSQL.Text :=
          'INSERT INTO iq_images(id,'#13 +
          '                      source,'#13 +
          '                      source_id,'#13 +
          '                      seq,'#13 +
          '                      descrip,'#13 +
          '                      image_filename,'#13 +
          '                      isdefault,'#13 +
          '                      created,'#13 +
          '                      createdby)'#13 +
          '    VALUES (:NEW_ID,'#13 +
          '            :NEW_SOURCE,'#13 +
          '            :NEW_SOURCE_ID,'#13 +
          '            :NEW_SEQ,'#13 +
          '            :NEW_DESCRIP,'#13 +
          '            :NEW_IMAGE_FILENAME,'#13 +
          '            :NEW_ISDEFAULT,'#13 +
          '            :NEW_CREATED,'#13 +
          '            :NEW_CREATEDBY)';
        ModifySQL.Text :=
          'UPDATE iq_images'#13 +
          '   SET id = :NEW_ID,'#13 +
          '       source = :NEW_SOURCE,'#13 +
          '       source_id = :NEW_SOURCE_ID,'#13 +
          '       seq = :NEW_SEQ,'#13 +
          '       descrip = :NEW_DESCRIP,'#13 +
          '       image_filename = :NEW_IMAGE_FILENAME,'#13 +
          '       isdefault = :NEW_ISDEFAULT,'#13 +
          '       created = :NEW_CREATED,'#13 +
          '       createdby = :NEW_CREATEDBY'#13 +
          ' WHERE id = :OLD_ID';
        DeleteSQL.Text :=
          'DELETE FROM iq_images'#13 +
          'WHERE id = :OLD_ID';
        FetchRowSQL.Text :=
          'SELECT id,'#13 +
          '       source,'#13 +
          '       source_id,'#13 +
          '       seq,'#13 +
          '       descrip,'#13 +
          '       image_filename,'#13 +
          '       isdefault,'#13 +
          '       created,'#13 +
          '       createdby'#13 +
          '  FROM iq_images'#13 +
          ' WHERE id = :ID';
      end;
end;

procedure TIQWebPictureGallery.AssignPickList;
var
  AMasterSourceID: Real;
  i: Integer;

  procedure _EvalField(AField: TField; AFieldName, ADisplayLabel: string;
    AVisible: Boolean = True);
  begin
    if CompareText(AField.FieldName, AFieldName) = 0 then
      begin
        AField.DisplayLabel := ADisplayLabel;
        AField.Origin := AFieldName;
        AField.DisplayWidth := Length(ADisplayLabel) + 2;
        AField.Visible := AVisible;
      end;
  end;

begin
  // Get the master ID value.  It is assumed to be a number.
  AMasterSourceID := GetMasterSourceID;

  // Create the pick list SQL
  with PkIQImagesInternal do
    begin
      Connection := Self.Connection;
      SQL.Clear;
      // Clear field list
      PkIQImagesInternal.Fields.Clear;
      PkIQImagesInternal.FieldDefs.Clear;
      SQL.Add('SELECT id,');
      SQL.Add('       seq,');
      SQL.Add('       descrip,');
      SQL.Add('       isdefault,');
      SQL.Add('       created,');
      SQL.Add('       createdby');
      SQL.Add('  FROM iq_images');
      SQL.Add(Format(' WHERE source = ''%s'' AND', [MasterTableName]));
      SQL.Add(Format('       source_id = %.0f', [AMasterSourceID]));
      // IQMS.WebVcl.ResourceStrings.cTXT0000460 = 'Select Image';
      Title := IQMS.WebVcl.ResourceStrings.cTXT0000460;
      Touchscreen := IQMS.Common.ApplicationSet.IsTouchScreen;
    end;

  // Field definition
  PkIQImagesInternal.FieldDefs.Update;
  for i := 0 to PkIQImagesInternal.FieldDefs.Count - 1 do
    PkIQImagesInternal.FieldDefs[i].CreateField(PkIQImagesInternal);

  // Field captions and origin
  for i := 0 to PkIQImagesInternal.FieldCount - 1 do
    begin
      // procedure _EvalField(AField: TField; AFieldName, ADisplayLabel: string; AVisible: Boolean);
      _EvalField(PkIQImagesInternal.Fields[i], 'ID', 'ID', False);
      // IQMS.WebVcl.ResourceStrings.cTXT0000461 = 'Image #';
      _EvalField(PkIQImagesInternal.Fields[i], 'SEQ',
        IQMS.WebVcl.ResourceStrings.cTXT0000461);
      // IQMS.WebVcl.ResourceStrings.cTXT0000087 = 'Description';
      _EvalField(PkIQImagesInternal.Fields[i], 'DESCRIP',
        IQMS.WebVcl.ResourceStrings.cTXT0000087);
      // IQMS.WebVcl.ResourceStrings.cTXT0000462 = 'Is Default?';
      _EvalField(PkIQImagesInternal.Fields[i], 'ISDEFAULT',
        IQMS.WebVcl.ResourceStrings.cTXT0000462);
      // IQMS.WebVcl.ResourceStrings.cTXT0000463 = 'Added'
      _EvalField(PkIQImagesInternal.Fields[i], 'CREATED',
        IQMS.WebVcl.ResourceStrings.cTXT0000463);
      // IQMS.WebVcl.ResourceStrings.cTXT0000464 = 'Added By'
      _EvalField(PkIQImagesInternal.Fields[i], 'CREATEDBY',
        IQMS.WebVcl.ResourceStrings.cTXT0000464);
    end;
end;

procedure TIQWebPictureGallery.AssignQuery;
var
  AField: TField;
begin
  if not Assigned(Connection) then
    begin
      // Message to developer
      IQMS.Common.Dialogs.IQError('Please assign the Connection property.');
      Exit;
    end;
  AField := GetMasterField;
  if QryImages.Active then
    QryImages.Close;
  QryImages.Connection := Self.Connection;
  QryImages.UpdateObject := FDUpdateSQL1;
  QryImages.AfterDelete := DoAfterDelete;
  QryImages.AfterOpen := DoAfterOpen;
  QryImages.AfterPost := DoAfterPost;
  QryImages.AfterScroll := DoAfterScroll;
  QryImages.BeforeInsert := DoBeforeInsert;
  if (MasterTableName > '') then
    begin
      QryImages.Connection := Self.Connection;
      QryImages.SQL.Clear;
      QryImages.SQL.Add('  SELECT id,');
      QryImages.SQL.Add('         source,');
      QryImages.SQL.Add('         source_id,');
      QryImages.SQL.Add('         seq,');
      QryImages.SQL.Add('         descrip,');
      QryImages.SQL.Add('         image_filename,');
      QryImages.SQL.Add('         isdefault,');
      QryImages.SQL.Add('         created,');
      QryImages.SQL.Add('         createdby');
      QryImages.SQL.Add('    FROM iq_images');
      QryImages.SQL.Add(Format('   WHERE source = ''%s'' AND',
        [MasterTableName]));
      QryImages.SQL.Add(Format('         source_id = :%s', [MasterFields]));
      QryImages.SQL.Add('ORDER BY seq');
      if Assigned(AField) then
        QryImages.ParamByName(MasterFields).DataType := AField.DataType
      else
        QryImages.ParamByName(MasterFields).DataType := ftFloat;
      QryImages.FetchOptions.AssignedValues := [evCache];
      QryImages.FetchOptions.Cache := [fiBlobs, fiMeta];
      QryImages.UpdateOptions.AssignedValues :=
        [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode,
        uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable];
      QryImages.UpdateOptions.RefreshMode := rmManual;
      QryImages.UpdateOptions.CheckRequired := False;
      QryImages.UpdateOptions.CheckReadOnly := False;
      QryImages.UpdateOptions.CheckUpdatable := False;
      QryImages.UpdateOptions.UpdateTableName := 'IQ_IMAGES';
      QryImages.UpdateOptions.KeyFields := 'ID';
      CreateFields;
      ConfigUpdateSQL;
    end;
end;

procedure TIQWebPictureGallery.CreateFields;
var
  i: Integer;
begin
  QryImages.FieldDefs.Update;
  { Physical fields }
  for i := 0 to QryImages.FieldDefs.Count - 1 do
    QryImages.FieldDefs[i].CreateField(QryImages);
end;

procedure TIQWebPictureGallery.DoAfterDelete(DataSet: TDataSet);
begin
  IQMS.Common.TableSequence.ReSequence('iq_images', ['source', 'source_id'],
    [MasterTableName, SourceID]);
  Refresh;
end;

procedure TIQWebPictureGallery.DoAfterOpen(DataSet: TDataSet);
begin
  Image.LoadImageByID(IQImagesID);
  SetControls;
end;

procedure TIQWebPictureGallery.DoAfterPost(DataSet: TDataSet);
begin
  if (QryImages.FieldByName('ISDEFAULT').AsString = 'Y') then
    begin
      ExecuteCommandFmt(
        'UPDATE iq_images SET isdefault = NULL ' +
        'WHERE source = ''%s'' AND source_id = %d AND id <> %d',
        [MasterTableName, SourceID, IQImagesID]);
      Refresh;
    end;
end;

procedure TIQWebPictureGallery.DoAfterScroll(DataSet: TDataSet);
begin
  if Assigned(Image) then
    begin
      Image.LoadImageByID(IQImagesID);
      SetControls;
    end;
end;

procedure TIQWebPictureGallery.DoBeforeInsert(DataSet: TDataSet);
var
  AID: Integer;
begin
  // The insertion process is handled here, in a function.  Prompt the
  // user, insert the image, refesh the data, and display it.
  if Image.AddNewImage(MasterTableName, SourceID, AID) then
    RefreshByID(AID);
  // Handled; just abort.
  SysUtils.Abort;
end;

procedure TIQWebPictureGallery.PMainPopup(Sender: TObject);
begin
  Add1.Enabled := not ReadOnly;
  Remove1.Enabled := not ReadOnly and (IQImagesID > 0);
  Replace1.Enabled := not ReadOnly and (IQImagesID > 0);
  EditDescription1.Enabled := not ReadOnly and (IQImagesID > 0);
  FullScreen1.Enabled := Image.IsImageLoaded;
  SaveToFile1.Enabled := Image.IsImageLoaded;
end;

procedure TIQWebPictureGallery.DoEditDescriptionClick(Sender: TObject);
var
  s: string;
begin
  if not CheckConnected or not Assigned(QryImages) and QryImages.Active then
    Exit;

  s := QryImages.FieldByName('DESCRIP').AsString;

  if ReadOnly then
    begin
      // IQMS.WebVcl.ResourceStrings.cTXT0000087 = 'Description';
      IQMS.Common.EditMemoStr.DoViewMemoStr( s, IQMS.WebVcl.ResourceStrings.cTXT0000087);
      Exit;
    end;

  // IQMS.WebVcl.ResourceStrings.cTXT0000457 = 'Edit Description';
  if IQMS.Common.EditMemoStr.DoEditMemoStr( s, QryImages.FieldByName('DESCRIP').Size,
    IQMS.WebVcl.ResourceStrings.cTXT0000457) then
    begin
      ExecuteCommandParam('UPDATE iq_images ' +
        'SET descrip = :DESCRIP WHERE id = :ID', ['DESCRIP', 'ID;F'],
        [s, QryImages.FieldByName('ID').AsInteger]);
      Refresh;
    end;
end;

procedure TIQWebPictureGallery.DoSearchClick(Sender: TObject);
begin
  // Show pick list
  AssignPickList;
  with PkIQImagesInternal do
    if Execute then
      QryImages.Locate('ID', Variants.VarAsType(GetValue('ID'),
        varInteger), []);
end;

procedure TIQWebPictureGallery.DoFullScreenClick(Sender: TObject);
begin
  // Full Screen
  if Assigned(Image) then
    Image.ShowFullScreen;
end;

procedure TIQWebPictureGallery.Add1Click(Sender: TObject);
begin
  if Assigned(NavImage) then
   NavImage.DataSource.DataSet.Insert;
end;

procedure TIQWebPictureGallery.Remove1Click(Sender: TObject);
begin
  if Assigned(NavImage) then
   NavImage.DataSource.DataSet.delete;
end;

procedure TIQWebPictureGallery.Replace1Click(Sender: TObject);
begin
  if Assigned(Image) and Assigned(QryImages) then
    begin
      Image.ReplaceImage(QryImages.FieldByName('ID').AsInteger);
      Refresh;
    end;
end;

procedure TIQWebPictureGallery.LocateDefault;
var
  AID: Real;
begin
  // Set the switch
  if not Assigned(QryImages) or not Assigned(Connection) or
    not Connection.Connected then
    Exit;

  // Ensure dataset is active
  if not QryImages.Active then
    QryImages.Open;

  // Get the default
  AID := SelectValueFmt(
    'SELECT id'#13 +
    '  FROM iq_images'#13 +
    ' WHERE source = ''%s'' AND'#13 +
    '       source_id = %.0f AND'#13 +
    '       NVL(isdefault, ''N'') = ''Y'' AND'#13 +
    '       ROWNUM < 2',
    [MasterTableName, SourceID]);

  // If no default, get the first record
  if AID = 0 then
    AID := SelectValueFmt(
      'SELECT id'#13 +
      '  FROM (  SELECT id'#13 +
      '            FROM iq_images'#13 +
      ' WHERE source = ''%s'' AND'#13 +
      '       source_id = %.0f AND'#13 +
      '        ORDER BY id)'#13 +
      ' WHERE ROWNUM < 2',
      [MasterTableName, SourceID]);
  // Locate it
  if AID > 0 then
    QryImages.Locate('ID', AID, []);
end;

procedure TIQWebPictureGallery.SaveToFile1Click(Sender: TObject);
var
  AFileName: string;
begin
  if Assigned(Image) and Assigned(QryImages) then
    Image.SaveFileAs(QryImages.FieldByName('ID').AsInteger, { var } AFileName);
end;

procedure TIQWebPictureGallery.NavImageBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
  // IQMS.WebVcl.ResourceStrings.cTXT0000465 = 'Delete image?';
  IQCheckDelete(Sender, Button, IQMS.WebVcl.ResourceStrings.cTXT0000465);
end;

procedure TIQWebPictureGallery.Refresh;
begin
  if not CheckConnected or not Assigned(QryImages) then
    Exit;

  if QryImages.SQL.Count = 0 then
    AssignQuery;

  if (MasterTableName > '') then
    RefreshDataSetByID(QryImages)
  else
    QryImages.Close;

  SetControls;
end;

procedure TIQWebPictureGallery.RefreshByID(const AIQImageID: Integer);
begin
  if not CheckConnected or not Assigned(QryImages) or not Assigned(Connection)
  then
    Exit;

  try
    QryImages.DisableControls;
    QryImages.Close;
    QryImages.Open;
    QryImages.Locate('ID', AIQImageID, []);
  finally
    QryImages.EnableControls;
  end;
end;

function TIQWebPictureGallery.GetActive: Boolean;
begin
  Result := FActive;
end;

function TIQWebPictureGallery.GetIQImagesID: Integer;
begin
  if Assigned(QryImages) and QryImages.Active then
    Result := QryImages.FieldByName('ID').AsInteger
  else
    Result := 0;
end;

procedure TIQWebPictureGallery.SetActive(const Value: Boolean);
begin
  // Do not set active if not connected (Byron)
  if not CheckConnected or not Assigned(QryImages) then
    Exit;

  // Developer messages:
  // A FireDAC connection must be assigned.
  if not Assigned(Connection) then
    begin
      IQMS.Common.Dialogs.IQError('Please assign the Connection property.');
      Exit;
    end;
  // A source table name must be assigned
  if (FSourceTableName = '') then
    begin
      IQMS.Common.Dialogs.IQError('Please set the MasterTableName property.');
      Exit;
    end;
  // A source table field name must be assigned
  if (FMasterFields = '') then
    begin
      IQMS.Common.Dialogs.IQError('Please set the MasterFields property.');
      Exit;
    end;

  // If requested Active = True, and the dataset is
  // already active, then exit early.  It is unnecessary to
  // refresh.
  if Value = QryImages.Active then
    begin
      // Fire data source change to refresh AttachedDocumentsCoordinator
      DoOnDataChange(SrcImages, nil);
      Exit;
    end;

  if not QryImages.Active and Value then
    AssignQuery;

  QryImages.Active := Value;

  if (csLoading in ComponentState) then
    FActive := Value
  else
    FActive := QryImages.Active;

  // Fire data source change to refresh AttachedDocumentsCoordinator
  DoOnDataChange(SrcImages, nil);
end;

function TIQWebPictureGallery.CheckConnected: Boolean;
begin
  // 10/25/2013 Added ComponentState check (Byron)
  Result := not (csLoading in ComponentState) and IQMS.Common.Miscellaneous.EnsureConnectionExists and
    Assigned(Connection) and Connection.Connected;
end;

procedure TIQWebPictureGallery.SetConnection(const Value: TFDConnection);
begin
  FConnection := Value;
  Image.Connection := FConnection;
end;

procedure TIQWebPictureGallery.SetControls;
begin
  if not (csLoading in ComponentState) then
    begin
      IQMS.Common.Controls.ResizeCheckBoxes(IQMS.Common.Controls.GetOwnerForm(Self), PnlCheckbox);
      PnlCheckbox.Width := chkDefault.Left + chkDefault.Width + 2;
      if Assigned(Image) then
        Image.SetControls;
      SetCounter;
      SetDescription;
      if ReadOnly then
        begin
        end;
    end;
end;

procedure TIQWebPictureGallery.SetCounter;
var
  AMax: Integer;
begin
  if not CheckConnected or not Assigned(Connection) then
    Exit;

  if Assigned(QryImages) and Assigned(ImageListCaptionBar) and
    (MasterTableName > '') and (SourceID > 0) and QryImages.Active then
    begin
      ImageListCaptionBar.ImageCount := SelectValueFmtAsInteger(
        'SELECT MAX(seq)'#13 +
        '  FROM iq_images'#13 +
        ' WHERE source = ''%s'' AND source_id = %d',
        [MasterTableName, SourceID]);
      ImageListCaptionBar.ImageNumber := QryImages.FieldByName('SEQ').AsInteger;
    end;
end;

procedure TIQWebPictureGallery.SetDescription;
begin
  if not CheckConnected then
    Exit;

  if Assigned(QryImages) and Assigned(ImageListCaptionBar) then
    begin
      if (MasterTableName > '') and (SourceID > 0) and QryImages.Active then
        ImageListCaptionBar.Caption := QryImages.FieldByName('DESCRIP')
          .AsString;
    end;
end;

function TIQWebPictureGallery.GetMasterField: TField;
begin
  if Assigned(MasterSource) and
    Assigned(MasterSource.DataSet) and
    (MasterFields > '') then
    Result := MasterSource.DataSet.FindField(MasterFields);
end;

function TIQWebPictureGallery.GetMasterSource: TDataSource;
begin
  if Assigned(QryImages) then
    Result := QryImages.MasterSource
  else
    Result := nil;
end;

procedure TIQWebPictureGallery.SetMasterSource(const Value: TDataSource);
var
  ADataSet: TDataSet;
begin
  if Assigned(QryImages) then
    QryImages.MasterSource := Value;

  if Assigned(QryImages.MasterSource) and Assigned(QryImages.MasterSource.DataSet) then
    ADataSet := QryImages.MasterSource.DataSet
  else
   ADataSet := nil;

  if Assigned(ADataSet) and (FSourceTableName = '') then
    begin
      if ADataSet is TFDTable then
        FSourceTableName:= TFDTable(ADataSet).TableName
      else if ADataSet is TFDQuery then
        FSourceTableName:= TFDQuery(ADataSet).UpdateOptions.UpdateTableName;
    end;
end;

function TIQWebPictureGallery.GetMasterSourceID: Real;
var
  AField: TField;
begin
  Result := 0;
  if Assigned(Self.MasterSource) and Assigned(Self.MasterSource.DataSet) then
    try
      AField := Self.MasterSource.DataSet.FindField(MasterFields);
      if Assigned(AField) then
        Result := AField.AsFloat;
    except
      Result := 0;
    end;
end;

procedure TIQWebPictureGallery.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;

  IQMS.Common.Controls.IQEnableControl([chkDefault], not FReadOnly);

  if FReadOnly then
    begin
      sbtnEditDescription.Glyph.LoadFromResourceName(HInstance, 'CMNT');
      NavImage.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
    end
  else
    begin
      sbtnEditDescription.Glyph.LoadFromResourceName(HInstance, 'CMNTEDT');
      NavImage.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert,
        nbDelete, nbPost, nbCancel, nbRefresh];
    end;
//  IQMS.Common.Controls.AutoSizeNavBar(NavImage);
  SetControls;
end;

procedure TIQWebPictureGallery.SetSourceTableName(const Value: string);
begin
  FSourceTableName := UpperCase(Trim(Value));
end;

function TIQWebPictureGallery.GetSourceID: Integer;
begin
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and
    (MasterFields <> '') then
    Result := MasterSource.DataSet.FieldByName(MasterFields).AsInteger
  else
    Result := FMasterID;
end;

function TIQWebPictureGallery.GetSourceTableName: string;
begin
  Result := UpperCase(Trim(FSourceTableName));
end;

procedure TIQWebPictureGallery.SetSourceID(const Value: Integer);
begin
  // This method added so that the source/source_id could be
  // set manually without connecting a datasource to this component.
  // The calling form can set all properties except MasterSource, and
  // then set the Source_ID in an event (such as TDataChangeEvent).
  // This is required when working with DBExpress source datasets.

  // If the master source is assigned, then assume we have a datasource
  // connected; we don't need to set the source ID value, since it comes
  // from the datasource.
  if Assigned(MasterSource) and Assigned(MasterSource.DataSet) and
    (MasterFields > '') then
    Exit;

  // Set the private variable which will be referenced in GetSource_ID.
  FMasterID := Trunc(Value);

  // Apply the value to the dataset parameter, and then refresh the data.
  if Assigned(QryImages) and
    (QryImages.Params.FindParam(MasterFields) <> nil) then
    begin
      QryImages.ParamByName(MasterFields).AsInteger := Trunc(Value);
      Refresh;
    end;
end;

function TIQWebPictureGallery.HasImages: Boolean;
var
  AMasterSourceID: Real;
begin
  Result := False;
  if (MasterTableName > '') and CheckConnected then
    begin
      // Get the master ID value.  It is assumed to be a number.
      AMasterSourceID := GetMasterSourceID;
      with TFDQuery.Create(nil) do
        try
          Connection := Self.Connection;
          SQL.Add('SELECT COUNT( * )');
          SQL.Add('  FROM DUAL');
          SQL.Add(' WHERE EXISTS (SELECT NULL');
          SQL.Add('                 FROM iq_images');
          SQL.Add(Format('                WHERE source = ''%s'' AND',
            [MasterTableName]));
          SQL.Add(Format('                      source_id = %.0f)',
            [AMasterSourceID]));
          Open;
          Result := Fields[0].AsInteger > 0;
        finally
          Free;
        end;
    end;
end;

{$ENDREGION 'TIQWebPictureGallery'}

end.
