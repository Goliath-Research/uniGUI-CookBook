unit ict_objects;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  ict_images,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  MainModule,
  UniPanel,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniGUIApplication;

type
  TICT_LocationType = (ltNone, ltCorporate, ltEplant, ltDivision);

  {Linking pipes}
  TThinPipe = class(TUniPanel)
     constructor Create( AOwner: TComponent ); override;
  end;

  {Basic class}
  TICT_Location_Base = class(TSpeedButton)
  private
     function FindParentForm(AControl: TComponent): TUniForm;
     function GetText: string;
     procedure AdjustCaptionFont;
    procedure AssignCaption;
  protected
     FFrameShape  : TUniPanel;
     FResourceImageName: Integer;
     DM_IMAGES: TDM_ICT_IMAGES;
     procedure LoadBitMap; virtual;
     procedure AssignShip_To;

     procedure OnClickNotify( Sender: TObject );
  public
     ICT_Parent  : TICT_Location_Base;
     FFormOwner  : TUniForm;

     FShip_To_ID : Real;
     FCompany    : string;
     FAddr1      : string;
     FAddr2      : string;
     FAddr3      : string;
     FCity       : string;
     FState      : string;
     FCountry    : string;
     FZip        : string;
     FPhone      : string;
     FFax        : string;
     FEPlant_ID  : Real;
     FDivision_ID: Real;
     FArcusto_ID : Real;

     function LeftEx  : Integer;
     function TopEx   : Integer;
     function WidthEx : Integer;
     function HeightEx: Integer;

     constructor Create( AOwner: TComponent; AICT_Parent: TICT_Location_Base ); virtual;
     procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer ); override;
     procedure EmphasizeAppearanceOf( AValue: Boolean );
     property Text: string read GetText;
     procedure AdjustGlyphSize( ARatio: Real );
  end;


  {TICT_Location_General - non division specific - Corporate and EPlant nodes}
  TICT_Location_General = class(TICT_Location_Base)
  private
  public
    RightPipe    : TThinPipe;
    LeftPipe     : TThinPipe;
    DownPipe     : TThinPipe;
    constructor Create( AOwner: TComponent; AICT_Parent: TICT_Location_Base ); override;
  end;


  {TICT_Location_Corporate}
  TICT_Location_Corporate = class(TICT_Location_General)
  protected
  public
     constructor Create( AOwner: TComponent; AICT_Parent: TICT_Location_Base ); override;
  end;


  {TICT_Location_EPlant}
  TICT_Location_EPlant = class(TICT_Location_General)
  protected
  public
     constructor Create( AOwner: TComponent; AICT_Parent: TICT_Location_Base; AEPlant_ID: Real );
  end;


  {TICT_Location_Division}
  TICT_Location_Division = class(TICT_Location_Base)
  protected
  public
     constructor Create( AOwner: TComponent; AICT_Parent: TICT_Location_Base; AEPlant_ID: Real; ADivision_ID: Real );
  end;


implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  System.Variants,
  IQMS.Common.SysShare,
  IQMS.Common.JumpConstants,
  IQMS.Common.Dialogs,
  IQMS.Common.StringUtils,
  IQMS.Common.NLS;

{ TThinPipe }

constructor TThinPipe.Create(AOwner: TComponent);
begin
  inherited;
  Brush.Color:= clBlack;
  Brush.Style:= bsSolid;
  Height     := 4;
  Width      := 0;
end;


{ TICT_Location_Base }

constructor TICT_Location_Base.Create(AOwner: TComponent;  AICT_Parent: TICT_Location_Base);
begin
  FFormOwner:= FindParentForm( AOwner );
  inherited Create( FFormOwner );

  Parent      := TWinControl(AOwner);
  Width       := 126;
  Height      := 126;
  Flat        := TRUE;
  ShowHint    := TRUE;
  Layout      := blGlyphBottom;
  GroupIndex  := 1;
  AllowAllUp  := TRUE;
  OnClick     := OnClickNotify;

  ICT_Parent  := AICT_Parent;

  FFrameShape := TUniPanel.Create( self );
  with FFrameShape do
  begin
    Parent   := self.Parent;
    Width    := 128;
    Height   := 128;
    { TODO -omugdha -cWEBIQ : Undeclared identifier Pen
    Pen.Color:= clGray; }
    SendToBack;
  end;

  DM_IMAGES := TDM_ICT_IMAGES.Create(Self);
  DM_IMAGES.Name := '';

  LoadBitMap;
end;


function TICT_Location_Base.FindParentForm( AControl: TComponent ): TUniForm;
begin
  while Assigned( AControl ) do
  begin
    if AControl.Owner is TUniForm then
    begin
      Result:= AControl.Owner as TUniForm;
      EXIT;
    end;
    AControl:= AControl.Owner;
  end;
  raise Exception.CreateFmt('Unable to establish owner for %s of class %s', [ AControl.Name, AControl.ClassName ]);
end;


procedure TICT_Location_Base.LoadBitMap;
begin
  if FResourceImageName = -1 then
  begin
    IQWarning('Resource name is not assigned - unable to load associated picture.');
    EXIT;
  end;
  // 03/27/2014 Load the image from the TImageList owned by the ict_images.pas.
  // This prevents a "too many resources to handle" error in SPC.
  { TODO -omugdha -cWEBIQ : type missmatch in type conversion
  DM_IMAGES.AssignImage(Self, FResourceImageName);    }
  // Glyph.LoadFromResourceName( HInstance, FResourceImageName );
end;


procedure TICT_Location_Base.AssignShip_To;
var
  A: Variant;
begin
  A:= SelectValueArrayFmt( 'select id, attn, addr1, addr2, addr3, city, state, country, zip, phone_number, fax '+
                      '  from ship_to                        '+
                      ' where arcusto_id = %f                '+
                      '   and NVL(eplant_id,0) = NVL(%f, 0)  '+
                      '   and NVL(division_id,0) = NVL(%f,0) ',
                      [ FArcusto_ID, FEPlant_ID, FDivision_ID ]);
  IQAssert( VarArrayDimCount( A ) > 0, IQFormat('Unable to determine ship-to location based on following parameters: arcusto_id = %f, eplant_id = %f, division_id = %f',
                                              [ FArcusto_ID, FEPlant_ID, FDivision_ID ]));

  FShip_To_ID := A[ 0 ];
  FCompany    := A[ 1 ];
  FAddr1      := A[ 2 ];
  FAddr2      := A[ 3 ];
  FAddr3      := A[ 4 ];
  FCity       := A[ 5 ];
  FState      := A[ 6 ];
  FCountry    := A[ 7 ];
  FZip        := A[ 8 ];
  FPhone      := A[ 9 ];
  FFax        := A[10 ];

  AssignCaption;
  AdjustCaptionFont;
end;


procedure TICT_Location_Base.AssignCaption;
begin
  self.Caption:= FCompany;

  if (self.Caption = '') and (FDivision_ID > 0) then
     self.Caption:= ProperCase( SelectValueByID('name', 'division', FDivision_ID ));
end;


procedure TICT_Location_Base.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited SetBounds( ALeft+1, ATop+1, AWidth-2, AHeight-2 );
  if Assigned(FFrameShape) then
     FFrameShape.SetBounds( ALeft, ATop, AWidth, AHeight );
end;

function TICT_Location_Base.HeightEx: Integer;
begin
  Result:= FFrameShape.Height;
end;

function TICT_Location_Base.LeftEx: Integer;
begin
  Result:= FFrameShape.Left;
end;

function TICT_Location_Base.TopEx: Integer;
begin
  Result:= FFrameShape.Top;
end;

function TICT_Location_Base.WidthEx: Integer;
begin
  Result:= FFrameShape.Width;
end;

function TICT_Location_Base.GetText: string;

  procedure Add( AName, AValue: string );
  begin
    if Trim(AValue) > '' then
       Result:= Result + AName + AValue + #13;
  end;

begin
  Result:= '';
  Add('Name: '           , FCompany);
  Add('Address 1: '      , FAddr1  );
  Add('Address 2: '      , FAddr2  );
  Add('Address 3: '      , FAddr3  );
  Add('City: '           , FCity   );
  Add('State/Prov: '     , FState  );
  Add('Country: '        , FCountry);
  Add('Zip/Postal Code: ', FZip    );

  if FEPlant_ID > 0 then
     Add('EPlant ID: ', FloatToStr( FEPlant_ID ));

  if FDivision_ID > 0 then
     Add(CheckReplaceDivisionCaption ('Division: '), SelectValueByID('name', 'division', FDivision_ID ));
end;

procedure TICT_Location_Base.OnClickNotify( Sender: TObject );
begin
  PostMessage( FFormOwner.Handle, iq_Notify, 0, 0);    {IQMS.Common.JumpConstants.pas}
end;

procedure TICT_Location_Base.EmphasizeAppearanceOf (AValue: Boolean);
begin
  // Font.Style:= Font.Style + [ fsBold ];
  if AValue then
     begin
       Font.Color:= clNavy;
       { TODO -omugdha -cWEBIQ : Undeclared identifier Pen
       FFrameShape.Pen.Color:= clBlue;  }
     end
  else
     begin
       Font.Color:= clBlack;
       { TODO -omugdha -cWEBIQ : Undeclared identifier Pen
       FFrameShape.Pen.Color:= clGray;   }
     end;

  AdjustCaptionFont;
end;

procedure TICT_Location_Base.AdjustGlyphSize(ARatio: Real);
var
  B: TBitMap;
  R: TRect;
begin
  // 03/27/2014 Load the image from the TImageList owned by the ict_images.pas.
  // This prevents a "too many resources to handle" error in SPC.
  B:= TBitMap.Create;
  try
    //B.LoadFromResourceName( HInstance, FResourceImageName );
    DM_IMAGES.AssignImage(B, FResourceImageName);
    R.Left  := 0;
    R.Top   := 0;
    R.Right := Round(B.Width * ARatio);
    R.Bottom:= Round(B.Height * ARatio);

    self.Glyph.Width := R.Right;
    self.Glyph.Height:= R.Bottom;

    self.Glyph.Canvas.StretchDraw( R, B );
  finally
    B.Free;
  end;

  AdjustCaptionFont;
end;

procedure TICT_Location_Base.AdjustCaptionFont;

  procedure AssignFont( AName: string; ASize:Integer );
  begin
  Font.Name:= AName;
  Font.Size:= ASize;
  Canvas.Font.Name:= Font.Name;
  Canvas.Font.Size:= Font.Size;
  Update;
  end;

begin
  AssignFont( 'MS Sans Serif', 8 );
  if (Canvas.TextWidth( Caption ) > ClientWidth ) then
  begin
    AssignFont( 'Small Fonts', 7 );
    while (Canvas.TextWidth( Caption ) > ClientWidth) and (Font.Size > 2) do
      AssignFont( 'Small Fonts', Font.Size - 1 );
  end;
end;

{ TICT_Location_General }

constructor TICT_Location_General.Create(AOwner: TComponent;  AICT_Parent: TICT_Location_Base);
begin
  inherited Create( AOwner, AICT_Parent );

  {thin black line to link objects}
  RightPipe:= TThinPipe.Create( self );
  RightPipe.Parent:= self.Parent;

  LeftPipe:= TThinPipe.Create( self );
  LeftPipe.Parent:= self.Parent;

  DownPipe:= TThinPipe.Create( self );
  DownPipe.Parent:= self.Parent;
end;



{ TICT_Location_Corporate }

constructor TICT_Location_Corporate.Create(AOwner: TComponent; AICT_Parent: TICT_Location_Base);
begin
  FResourceImageName:= ict_images.imageICT_Corporate; // 'CORPORATE';
  inherited Create( AOwner, AICT_Parent );
  FArcusto_ID:= SelectValueAsFloat( 'select iqsys.arcusto_id_intercomp from iqsys, arcusto where iqsys.arcusto_id_intercomp = arcusto.id');
  AssignShip_To;
end;


{ TICT_Location_EPlant }

constructor TICT_Location_EPlant.Create(AOwner: TComponent;  AICT_Parent: TICT_Location_Base; AEPlant_ID: Real);
begin
  FResourceImageName:= ict_images.imageICT_EPlant; //'EPLANT';
  inherited Create( AOwner, AICT_Parent );
  FEPlant_ID := AEPlant_ID;
  FArcusto_ID:= SelectValueFmtAsFloat( 'select eplant.arcusto_id_intercomp from eplant, arcusto where eplant.arcusto_id_intercomp = arcusto.id and eplant.id = %f', [ FEPlant_ID ]);
  AssignShip_To;
end;


{ TICT_Location_Division }

constructor TICT_Location_Division.Create(AOwner: TComponent;  AICT_Parent: TICT_Location_Base; AEPlant_ID, ADivision_ID: Real);
begin
  FResourceImageName:= ict_images.imageICT_Division; // 'DIVISION';
  inherited Create( AOwner, AICT_Parent );
  FEPlant_ID  := AEPlant_ID;
  FDivision_ID:= ADivision_ID;
  if AEPlant_ID > 0 then
     FArcusto_ID := SelectValueFmtAsFloat( 'select eplant.arcusto_id_intercomp from eplant, arcusto where eplant.arcusto_id_intercomp = arcusto.id and eplant.id = %f', [ FEPlant_ID ])
  else
     FArcusto_ID:= SelectValueAsFloat( 'select iqsys.arcusto_id_intercomp from iqsys, arcusto where iqsys.arcusto_id_intercomp = arcusto.id');
  AssignShip_To;
end;


end.
