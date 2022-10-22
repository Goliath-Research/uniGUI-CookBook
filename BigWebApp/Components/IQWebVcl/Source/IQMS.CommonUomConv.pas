unit IQMS.CommonUomConv;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox;

type
  TFrmConvertUOM = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Bevel1: TUniPanel;
    Label1: TUniLabel;
    edFrom: TUniEdit;
    Label2: TUniLabel;
    edTo: TUniEdit;
    EdConvFrom: TUniEdit;
    cbTarget: TUniDBComboBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTargetChange(Sender: TObject);
    procedure edFromChange(Sender: TObject);
  protected
    procedure cbTargetChange2(Sender: TObject);
    procedure edFromChange2(Sender: TObject);
  private
    { Private declarations }
    procedure Populate_Weight;
    procedure Populate_Length;
    procedure Populate_Time;
    procedure Populate_Volume;
    procedure Populate_Custom_Uom;
    procedure Populate_Custom_Uom2;
  public
    { Public declarations }
    FValue:Real;
    FArinvt_ID: Real;
    FArinvtUOM, FTarget:String;
    constructor Create(ASource, ATarget:String; var AValue:Real; AType:String; AArinvt_ID: Real );
    constructor Create_PO_Receiving(APO_Detail_Id:Real; var AValue:Real);
  end;

function IQGetConvertedUOM_PO_Receiving(APO_Detail_Id:Real; var AValue:Real):Boolean;
function IQGetConvertedUOM(ASource, ATarget:String; var AValue:Real; AType:String; AArinvt_ID: Real ):Boolean;



implementation

uses
  IQMS.Common.RegFrm,
  IQMS.Common.UOM,
  IQMS.Common.NLS,
  IQMS.Common.ResStrings,
  IQMS.Common.DataLib;

{$R *.DFM}


function IQGetConvertedUOM_PO_Receiving(APO_Detail_Id:Real; var AValue:Real):Boolean;
begin
  with TFrmConvertUOM.Create_PO_Receiving(APO_Detail_Id, AValue) do
  try
    if ShowModal <> mrOk then
      Result := False
    else
    begin
      AValue := FValue;
      Result := True;
    end;
  finally
    Free;
  end;
end;


function IQGetConvertedUOM(ASource, ATarget:String; var AValue:Real; AType:String; AArinvt_ID: Real ):Boolean;
begin
  with TFrmConvertUOM.Create(ASource, ATarget, AValue, AType, AArinvt_ID) do
  try
    if ShowModal <> mrOk then
      Result := False
    else
    begin
      AValue := FValue;
      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TFrmConvertUOM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

constructor TFrmConvertUOM.Create_PO_Receiving(APO_Detail_Id:Real; var AValue:Real);
var
  ASource, ATarget:String;
begin
  inherited Create(uniGUIApplication.UniApplication);
  IQRegFormRead( self, [self]);
  FArinvt_ID := SelectValueFmtAsFloat('select arinvt_id from po_detail where id = %f', [APO_Detail_Id]);
  ATarget    := SelectValueFmtAsString('select unit from po_detail where id = %f', [APO_Detail_Id]);
  FTarget := ATarget;
  ASource    := SelectValueFmtAsString('select unit from arinvt where id = %f', [FArinvt_ID]);
  FArinvtUOM := ASource;
  FValue    := IQConvertUom( AValue, ASource, ATarget, FArinvt_ID ); {in IQMS.Common.UOM.pas}

  EdConvFrom.Text := ATarget;
  EdConvFrom.ReadOnly := True;

  EdFrom.Text := FloatToStr(AValue);
  EdTo.Text   := FloatToStr(FValue);

  // IQMS.Common.ResStrings.cTXT0000445 = 'Enter Quantity';
  Label1.Caption := IQMS.Common.ResStrings.cTXT0000445;
  // IQMS.Common.ResStrings.cTXT0000446 = 'Received Quantity';
  Label2.Caption := IQMS.Common.ResStrings.cTXT0000446;

  Populate_Custom_Uom2;
  cbTarget.OnChange := cbTargetChange2;
  edFrom.OnChange   := edFromChange2;

  cbTarget.ItemIndex := cbTarget.Items.IndexOf(FTarget);
//  cbTarget.ItemIndex := cbTarget.Items.IndexOf(FArinvtUOM);
  cbTargetChange2(nil);
end;


constructor TFrmConvertUOM.Create(ASource, ATarget:String; var AValue:Real; AType:String; AArinvt_ID: Real );
begin
  inherited Create(uniGUIApplication.UniApplication);
  IQRegFormRead( self, [self]);
  FArinvt_ID:= AArinvt_ID;
  FValue    := IQConvertUom( AValue, ASource, ATarget, AArinvt_ID ); {in IQMS.Common.UOM.pas}

  EdConvFrom.Text := ASource;
  EdConvFrom.ReadOnly := True;

  EdFrom.Text := FloatToStr(FValue);

  // 12/11/2015 (Byron, EIQ-9773) Use "Enter Quantity" always
  // IQMS.Common.ResStrings.cTXT0000445 = 'Enter Quantity';
  Label1.Caption := IQMS.Common.ResStrings.cTXT0000445;
  // Label1.Caption := Format(IQMS.Common.ResStrings.cTXT0000249 {'Enter %s'}, [ProperCase(AType)]);
  // Label2.Caption := Format('System %s', [ProperCase(AType)]);
  Label2.Caption := IQMS.Common.ResStrings.cTXT0000250; // 'System UOM'

  if      AType = 'WEIGHT' then Populate_Weight
  else if AType = 'LENGTH' then Populate_Length
  else if AType = 'TIME'   then Populate_Time
  else if AType = 'VOLUME' then Populate_Volume;

  Populate_Custom_Uom;

  cbTarget.ItemIndex := cbTarget.Items.IndexOf(ATarget);
  cbTargetChange(nil);
end;

procedure TFrmConvertUOM.cbTargetChange(Sender: TObject);
begin
  EdTo.Text:= Format('%.6f', [IQConvertUom( StrToFloat(EdFrom.Text), cbTarget.Text, EdConvFrom.Text, FArinvt_ID )]); {in IQMS.Common.UOM.pas}
end;

procedure TFrmConvertUOM.btnOKClick(Sender: TObject);
begin
  FValue:= IQConvertUom( StrToFloat(EdFrom.Text), cbTarget.Text, EdConvFrom.Text, FArinvt_ID, FALSE ); {in IQMS.Common.UOM.pas}
  ModalResult:= mrOk
end;

procedure TFrmConvertUOM.Populate_Weight;
begin
 with cbTarget.Items do
 begin
   Add('GR');
   Add('KG');
   Add('LBS');
   Add('OZ');
 end;
end;

procedure TFrmConvertUOM.Populate_Length;
begin
 with cbTarget.Items do
 begin
   Add('CM');
   Add('FT');
   Add('IN');
   Add('KM');
   Add('M');
   Add('YD');
 end;
end;

procedure TFrmConvertUOM.Populate_Time;
begin
 with cbTarget.Items do
 begin
   Add('DAY');
   Add('HOUR');
   Add('MINUTE');
   Add('SECOND');
 end;
end;

procedure TFrmConvertUOM.Populate_Volume;
begin
 with cbTarget.Items do
 begin
   Add('GAL');
   Add('LTR');
   Add('PINT');
   Add('QRT');
 end;
end;

procedure TFrmConvertUOM.Populate_Custom_Uom;
begin
 if FArinvt_ID > 0 then
    with TFDQuery.Create(self) do
    try
      ConnectionName := 'IQFD';
      SQL.Add(IQFormat('select uom from arinvt_uom_conv where arinvt_id = %f', [ FArinvt_ID ]));
      Open;
      while not Eof do
      begin
        cbTarget.Items.Add( Fields[ 0 ].asString );
        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmConvertUOM.Populate_Custom_Uom2;
begin
 if FArinvt_ID > 0 then
    with TFDQuery.Create(self) do
    try
      ConnectionName := 'IQFD';
      SQL.Add(IQFormat('select uom from (select uom from arinvt_uom_conv where arinvt_id = %f ' +
                       ' union select ''%s'' from dual union select ''%s'' from dual) order by uom', [ FArinvt_ID, FArinvtUOM, FTarget ]));
      Open;
      while not Eof do
      begin
        cbTarget.Items.Add( Fields[ 0 ].asString );
        Next;
      end;
    finally
      Free;
    end;
end;

procedure TFrmConvertUOM.edFromChange(Sender: TObject);
begin
  if edFrom.Text <> '' then
    cbTargetChange(nil);
end;

procedure TFrmConvertUOM.edFromChange2(Sender: TObject);
begin
  if edFrom.Text <> '' then
    cbTargetChange2(nil);
end;


procedure TFrmConvertUOM.cbTargetChange2(Sender: TObject);
var
  AValue:Real;
begin
  AValue := IQConvertUom( StrToFloat(EdFrom.Text), cbTarget.Text, FArinvtUOM, FArinvt_ID, false ); {in IQMS.Common.UOM.pas}
  AValue := IQConvertUom( AValue, FArinvtUOM, FTarget, FArinvt_ID, false ); {in IQMS.Common.UOM.pas}
  FValue := AValue;
  EdTo.Text:= Format('%.6f', [AValue]);
end;

end.
