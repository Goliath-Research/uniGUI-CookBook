unit IQMS.WebVcl.BookMark;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, DB, Menus, Buttons,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm,
  uniGUIBaseClasses, uniPanel,IQMS.Common.JumpConstants,
  IQMS.WebVcl.Jump, IQMS.Common.Regfrm, uniSpeedButton;
                                                             
type
  TIQWebBookMark = class(TuniSpeedButton)
  strict private

  private
    { Private declarations }
    FJumpTo  : TJumpTo;
    FDataLink: TFieldDataLink;
    FDescripLink: TFieldDataLink;

//    FImage : TImage;
//    FDMTextSource: TDMTextSource;

    FCancelMRUUpdate: Boolean;
    FIsShowing: Boolean;
    FOwnerClassName : string;
    FImage: TImage;

    function  GetDataField:string;
    procedure SetDataField( AValue:string );

    function GetDescripField: string;
    procedure SetDescripField(const Value: string);

    function  GetDataSource : TDataSource;
    procedure SetDataSource( AValue:TDataSource );
    
    function MapJumpCodeToString(AJumpTo: TJumpTo): string;
    function GetBookMarkDescription: string;

    procedure Click(Sender : TObject);
    procedure AddBookmark(aBookmarkType : TWebIQBookmarkType);

  protected
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    
  public   
    { Public }
    constructor Create(AComponent: TComponent); override;
    destructor Destroy; override;
    property CancelMRUUpdate: Boolean read FCancelMRUUpdate write FCancelMRUUpdate;
    property BookMarkDescription: string read GetBookMarkDescription;
    
  published
    { Published declarations }
    property Align;
    property BevelOuter;
    property BevelInner;
    property BorderStyle;
    property Ctl3D;
    property Enabled;
    property Font;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnEnter;
    property OnExit;
    property OnResize;

    property DataField:string        read GetDataField  write SetDataField;
    property DescripField:string     read GetDescripField  write SetDescripField;
    property DataSource:TDataSource  read GetDataSource write SetDataSource;
    property JumpTo : TJumpTo        read FJumpTo write FJumpTo;
    property OwnerClassName : string read FOwnerClassName write FOwnerClassName ;
  end;  

implementation

uses
  TypInfo,
  UniGUIApplication,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.FileUtils,
  IQMS.Common.Miscellaneous,
  IQMS.WebVcl.ResourceStrings,
  IQMS.Common.DataLib,
  IQMS.Common.NLS,
  IQMS.WebVCL.BookMarkLink;

{ TIQWebBookMark }

constructor TIQWebBookMark.Create(AComponent: TComponent);
begin
  inherited;
  Height:= 24;
  Width := 24;
  Caption:= '';
  BevelOuter:= bvNone;
  Hint:= IQMS.WebVcl.ResourceStrings.cTXT0000583; //'Add this record to favorites';
  ShowHint:= TRUE;

// TODO: add image to speed button. How we do this in UniGui we need to verify
//    Center := TRUE;
//    Transparent:= TRUE;
//    Picture.Bitmap.LoadFromResourceName(HInstance, 'BKMRK');


  FJumpTo     := TJumpTo( 0 );
  FDataLink   := TFieldDataLink.Create;
  FDescripLink:= TFieldDataLink.Create;

  OnClick := Click;
end;


destructor TIQWebBookMark.Destroy;
var
  ADescrip: string;
begin
  AddBookmark(TWebIQBookmarkType.History);

  FDataLink.Free;
  FDescripLink.Free;

  inherited Destroy;
end;

procedure TIQWebBookMark.AddBookmark(aBookmarkType : TWebIQBookmarkType);
begin
  if Assigned(Owner) and not FCancelMRUUpdate and Assigned(FDataLink.Field) and Assigned(FDataLink.DataSource) and (FDataLink.Field.asInteger > 0) then
  begin
    IQRegMRUWrite( aBookmarkType,                           {history or favorite}
                   Owner.ClassName,                         {class name of owner where this component was dropped}
                   FDataLink.Field.asInteger,               {target_id }
                   TIQWebJump.GetJumpDescription( JumpTo ), {origin    } {IQMS.WebVcl.Jump.pas}
                   BookMarkDescription );

    if aBookmarkType = TWebIQBookmarkType.Favorites then
      ShowMessage( IQMS.WebVcl.ResourceStrings.cTXT0000584  ); //'Added to favorites!'
  end;
end;

function TIQWebBookMark.GetDataField: string;
begin
  Result:= FDataLink.FieldName;
end;

function TIQWebBookMark.GetDataSource: TDataSource;
begin
  Result:= FDataLink.DataSource;
end;


procedure TIQWebBookMark.SetDataField(AValue: string);
begin
  FDataLink.FieldName:= AValue;
end;

procedure TIQWebBookMark.SetDataSource(AValue: TDataSource);
begin
  FDataLink.DataSource:= AValue;
  FDescripLink.DataSource:= AValue;
end;


function TIQWebBookMark.MapJumpCodeToString( AJumpTo: TJumpTo ): string;
begin
  case AJumpTo of
    jtTooling:  Result := 'Project';
  else
    Result:= Copy( GetEnumName( TypeInfo( TJumpTo ), Ord( AJumpTo )), 3, 255 );
  end;
end;


procedure TIQWebBookMark.Click(Sender : TObject);
const  //http://MyApplicationHost/?Module=ModuleClassName&ID=1
  DeepLinkUrl = '%s/?Module=%s&ID=%s';
var
  DeepLink: string;
  FrmLinkDisplay : TFrmLinkDisplay;
begin
  // Display Dialog with URL
  DeepLink := Format(DeepLinkUrl,
      [UniGUIApplication.UniApplication.UniSession.Host,
       Owner.ClassName,
       FDataLink.Field.AsString]);

  FrmLinkDisplay := TFrmLinkDisplay.Create( uniGUIApplication.UniApplication );
  FrmLinkDisplay.URLDisplay.Text := DeepLink;
  FrmLinkDisplay.ShowModal;
end;

procedure TIQWebBookMark.CMShowingChanged(var Message: TMessage);
begin
  inherited;
  FIsShowing:= Showing;
end;            

function TIQWebBookMark.GetDescripField: string;
begin
  Result:= FDescripLink.FieldName;
end;

procedure TIQWebBookMark.SetDescripField(const Value: string);
begin
  FDescripLink.FieldName:= Value;
end;

function TIQWebBookMark.GetBookmarkDescription: string;
begin
  Result:= '';
  if Assigned(FDescripLink.Field) then
     Result:= Trim(FDescripLink.Field.asString);
end;

end.


 
