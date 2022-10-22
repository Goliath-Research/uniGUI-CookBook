unit Mfg_Conv_Def_Uom;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
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
  Data.DB,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  Vcl.StdCtrls;

type
  {Types of UOM}
  TMfgConvUOMType = (uomNone, uomWeight, uomLength, uomTime);

  {TMfgConvUOM}
  TMfgConvUOM = class
    UOM1            : string;              {UOM1/UOM2 represents the units of measurement   }
    UOM1_Type       : TMfgConvUOMType;     {Ex:                                             }
    UOM2            : string;              {Kg               =>  UOM1 = KG   UOM2 = 1       }
    UOM2_Type       : TMfgConvUOMType;     {Feet/Lb          =>  UOM1 = FT   UOM2 = LBS     }
                                           {Net Cycles/Hr    =>  UOM1 = 1    UOM2 = HOUR    }
    constructor Create( ADefaultUOM: string );
    procedure MapUOM( AUOM: string );
  end;

  { TFrmMfgConvDefineUOM }
  TFrmMfgConvDefineUOM = class(TUniForm)
    combUOM1: TUniComboBox;
    combUOM2: TUniComboBox;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label2: TUniLabel;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    procUOM: TFDStoredProc;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    MfgConvUOM: TMfgConvUOM;
    procedure PopulateDropDownBox( combUOM:TUniComboBox; AUOM: string; AUOM_Type: TMfgConvUOMType );
    procedure SetComboBoxesItemIndexTo( AUOM: string );
    procedure SetDefaultUOM(const Value: string);
    procedure SetUserDefinedUOM(const Value: string);
  public
    { Public declarations }

    property DefaultUOM : string write SetDefaultUOM;
    property UserDefinedUOM : string write SetUserDefinedUOM;

    function GetUserDefinedUOM_asString: string;
    function GetUserDefinedFactor: Real;
  end;

function DoMfgConvDefineUOM( ADefaultUOM: string; var AUserDefinedUOM: string; var AFactor: Real ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.UOM;

function DoMfgConvDefineUOM( ADefaultUOM: string; var AUserDefinedUOM: string; var AFactor: Real ): Boolean;
var
  LFrmMfgConvDefineUOM : TFrmMfgConvDefineUOM;
begin
  LFrmMfgConvDefineUOM := TFrmMfgConvDefineUOM.Create( uniGUIApplication.UniApplication );

  LFrmMfgConvDefineUOM.DefaultUOM := ADefaultUOM;
  LFrmMfgConvDefineUOM.UserDefinedUOM := AUserDefinedUOM;

  Result:= LFrmMfgConvDefineUOM.ShowModal = mrOK;
  if Result then
  begin
    AUserDefinedUOM:= LFrmMfgConvDefineUOM.GetUserDefinedUOM_asString;
    AFactor        := LFrmMfgConvDefineUOM.GetUserDefinedFactor;
  end;
end;


{ ----------------------------------------------------------------------------- }
{ TMfgConvUOM - aux class to figure out what UOM are involved and calculate the factor}

constructor TMfgConvUOM.Create( ADefaultUOM: string );
begin
  inherited Create;
  UOM1_Type:= uomNone;
  UOM2_Type:= uomNone;
  MapUOM( ADefaultUOM );
end;

procedure TMfgConvUOM.MapUOM( AUOM: string );
   procedure AssignUOMs( AUOM1: string; Type1:TMfgConvUOMType; AUOM2: string; Type2:TMfgConvUOMType );
   begin
     UOM1     := AUOM1;
     UOM1_Type:= Type1;
     UOM2     := AUOM2;
     UOM2_Type:= Type2;
   end;
begin
  // retrieve the english word based on possibly translated AUOM.  english will return english
  AUOM:= SelectValueFmtAsString( 'select nls_appdef_bom.to_english( ''%s'' ) from dual', [ AUOM ] );

  {Mapping uom or a caption to units of measure}
  if      AUOM = 'Units/Cycle'      then  AssignUOMs( '1',      uomNone,   '1',      uomNone   )
  else if AUOM = 'Cycle Time'       then  AssignUOMs( 'SECOND', uomTime,   '1',      uomNone   )
  else if AUOM = 'Cycle Time Hr'    then  AssignUOMs( 'HOUR',   uomTime,   '1',      uomNone   )
  else if AUOM = 'Hours/K-cycles'   then  AssignUOMs( 'HOUR',   uomTime,   '1',      uomNone   )
  else if AUOM = 'Cycles/Hr'        then  AssignUOMs( '1',      uomNone,   'HOUR',   uomTime   )
  else if AUOM = 'Net Cycles/Hr'    then  AssignUOMs( '1',      uomNone,   'HOUR',   uomTime   )
  else if AUOM = 'KGs/K-cycles'     then  AssignUOMs( 'KG',     uomWeight, '1',      uomNone   )
  else if AUOM = 'Lbs/K-cycles'     then  AssignUOMs( 'LBS',    uomWeight, '1',      uomNone   )
  else if AUOM = 'Shot Wt(kgs)'     then  AssignUOMs( 'KG',     uomWeight, '1',      uomNone   )
  else if AUOM = 'Shot Wt(lbs)'     then  AssignUOMs( 'LBS',    uomWeight, '1',      uomNone   )
  else if AUOM = 'Days/K'           then  AssignUOMs( 'DAY',    uomTime,   '1',      uomNone   )
  else if AUOM = 'M/Kg'             then  AssignUOMs( 'M',      uomLength, 'KG',     uomWeight )
  else if AUOM = 'Feet/Lb'          then  AssignUOMs( 'FT',     uomLength, 'LBS',    uomWeight )
  else if AUOM = 'Kgs/Hr'           then  AssignUOMs( 'KG',     uomWeight, 'HOUR',   uomTime   )
  else if AUOM = 'Lbs/Hr'           then  AssignUOMs( 'LBS',    uomWeight, 'HOUR',   uomTime   )
  else if AUOM = 'M/Hr'             then  AssignUOMs( 'M',      uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Feet/Hr'          then  AssignUOMs( 'FT',     uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Cm/Min'           then  AssignUOMs( 'CM',     uomLength, 'MINUTE', uomTime   )
  else if AUOM = 'Inch/Min'         then  AssignUOMs( 'IN',     uomLength, 'MINUTE', uomTime   )
  else if AUOM = 'Net M/Hr'         then  AssignUOMs( 'M',      uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Net Feet/Hr'      then  AssignUOMs( 'FT',     uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Length(M)'        then  AssignUOMs( 'M',      uomLength, '1',      uomNone   )
  else if AUOM = 'Length(ft)'       then  AssignUOMs( 'FT',     uomLength, '1',      uomNone   )
  else if AUOM = 'KGs/K-items'      then  AssignUOMs( 'KG',     uomWeight, '1',      uomNone   )
  else if AUOM = 'Lbs/K-items'      then  AssignUOMs( 'LBS',    uomWeight, '1',      uomNone   )

  else if AUOM = 'Yard/Kg'          then  AssignUOMs( 'YD',     uomLength, 'KG',     uomWeight )
  else if AUOM = 'Yard/Lb'          then  AssignUOMs( 'YD',     uomLength, 'LBS',    uomWeight )
  else if AUOM = 'Yard/Hr'          then  AssignUOMs( 'YD',     uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Yard/Min'         then  AssignUOMs( 'YD',     uomLength, 'MINUTE', uomTime   )
  else if AUOM = 'Net Yard/Hr'      then  AssignUOMs( 'YD',     uomLength, 'HOUR',   uomTime   )
  else if AUOM = 'Length(yd)'       then  AssignUOMs( 'YD',     uomLength, '1',      uomNone   )

  else if AUOM = 'Batch Time'       then  AssignUOMs( 'SECOND', uomTime,   '1',      uomNone   )
  else if AUOM = 'Hours/K-Batches'  then  AssignUOMs( 'HOUR',   uomTime,   '1',      uomNone   )
  else if AUOM = 'Batches/Hr'       then  AssignUOMs( '1',      uomNone,   'HOUR',   uomTime   )

  else
       IQError('Unable to recognize UOM: '+AUOM);
end;


{ ----------------------------------------------------------------------------- }
{ TFrmMfgConvDefineUOM }


procedure TFrmMfgConvDefineUOM.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmMfgConvDefineUOM.FormDestroy(Sender: TObject);
begin
  MfgConvUOM.Free;
end;

procedure TFrmMfgConvDefineUOM.PopulateDropDownBox( combUOM: TUniComboBox; AUOM: string; AUOM_Type: TMfgConvUOMType );
begin
  with combUOM do
  begin
    Items.Clear;
    case AUOM_Type of
      uomWeight: Items.Text:= 'LBS'#13'GR'#13'KG'#13'OZ';
      uomLength: Items.Text:= 'FT'#13'IN'#13'KM'#13'M'#13'CM'#13'YD';
      uomTime  : Items.Text:= 'SECOND'#13'MINUTE'#13'HOUR'#13'DAY';
    else
        Style   := csSimple;
        Text    := AUOM;
        Enabled := FALSE;
    end;
    ItemIndex:= Items.IndexOf( AUOM );
  end;
end;

procedure TFrmMfgConvDefineUOM.SetComboBoxesItemIndexTo( AUOM: string );
var
  U1, U2: string;
  I     : Integer;
  procedure CheckExistsSetTo( UOM: string; combBox: TUniComboBox );
  begin
    with combBox do
    begin
      I:= Items.IndexOf( UOM );
      if I >= 0 then
         ItemIndex:= I;
    end;
  end;
begin
  I := Pos( '/', AUOM );
  if I > 0 then
     begin
       U1:= Copy(AUOM, 1, I-1  );
       U2:= Copy(AUOM, I+1, 255);
     end
  else
     begin
       U1:= AUOM;
       U2:= '';
     end;
  CheckExistsSetTo( U1, combUOM1 );
  CheckExistsSetTo( U2, combUOM2 );
end;

procedure TFrmMfgConvDefineUOM.SetDefaultUOM(const Value: string);
begin
  MfgConvUOM:= TMfgConvUOM.Create( Value );
  PopulateDropDownBox( combUOM1, MfgConvUOM.UOM1, MfgConvUOM.UOM1_Type );
  PopulateDropDownBox( combUOM2, MfgConvUOM.UOM2, MfgConvUOM.UOM2_Type );
  Caption:= Format('Define UOM (default = %s%s)', [ MfgConvUOM.UOM1, IIf( MfgConvUOM.UOM2_Type = uomNone,'', '/'+MfgConvUOM.UOM2) ]);
end;

procedure TFrmMfgConvDefineUOM.SetUserDefinedUOM(const Value: string);
begin
  SetComboBoxesItemIndexTo( Value );
end;

procedure TFrmMfgConvDefineUOM.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

function TFrmMfgConvDefineUOM.GetUserDefinedUOM_asString: string;
begin
  if (MfgConvUOM.UOM1_Type = uomNone) and (MfgConvUOM.UOM2_Type = uomNone) then
     Result:= ''
  else if (MfgConvUOM.UOM2_Type = uomNone) then
     Result:= combUOM1.Text
  else
     Result:= Format( '%s/%s', [ combUOM1.Text, combUOM2.Text ]);
end;

function TFrmMfgConvDefineUOM.GetUserDefinedFactor: Real;
begin
  {
   The factor is calculated in the following way so:
       Default = User_Defined * FACTOR
  }
  if (MfgConvUOM.UOM1_Type = uomNone) and (MfgConvUOM.UOM2_Type = uomNone) then
     Result:= 1

  else if (MfgConvUOM.UOM2_Type = uomNone) then
     Result:= IQConvertUom( 1, combUOM1.Text, MfgConvUOM.UOM1, 0 )

  else if (MfgConvUOM.UOM1_Type = uomNone) then
     Result:= 1 / IQConvertUom( 1, combUOM2.Text, MfgConvUOM.UOM2, 0 )

  else
     Result:= IQConvertUom( 1, combUOM1.Text, MfgConvUOM.UOM1, 0 ) / IQConvertUom( 1, combUOM2.Text, MfgConvUOM.UOM2, 0 )
end;

end.

