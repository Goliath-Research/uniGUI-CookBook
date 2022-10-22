unit main_vol;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  System.ImageList,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniLabel,
  uniDBText,
  uniEdit,
  uniDBEdit,
  uniImageList,
  uniMultiItem,
  uniComboBox,
  uniPanel,
  uniSplitter,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniDBComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, IQUniGrid, uniGUIFrame,
  uniImage;

type
  TFrmVolume = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    TblVolume: TFDTable;
    SrcVolume: TDataSource;
    pnlMain: TUniPanel;
    Panel3: TUniPanel;
    DBNavigator: TUniDBNavigator;
    PnlTop: TUniPanel;
    PnlExample: TUniPanel;
    TblVolumeFIELDCALC1: TFMTBCDField;
    TblVolumeFIELDCALC2: TFMTBCDField;
    TblVolumeFIELDCALC3: TFMTBCDField;
    TblVolumeFIELDCALC4: TFMTBCDField;
    TblVolumeFIELDCALC5: TFMTBCDField;
    TblVolumeQUANTITY: TFMTBCDField;
    TblVolumeOPERATION: TStringField;
    TblVolumeDESCR: TStringField;
    TblVolumeSHAPE: TStringField;
    TblVolumeUNITVOLUME: TFMTBCDField;
    GroupBox1: TUniGroupBox;
    sbtnClear: TUniSpeedButton;
    Panel4: TUniPanel;
    Panel6: TUniPanel;
    bbtnOK: TUniBitBtn;
    btnCancel: TUniButton;
    TblVolumeID: TBCDField;
    TblVolumeQINVT_ID: TBCDField;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Splitter1: TUniSplitter;
    Panel1: TUniPanel;
    Splitter3: TUniSplitter;
    ClearValues1: TUniMenuItem;
    N1: TUniMenuItem;
    Contents1: TUniMenuItem;
    Grid: TIQUniGridControl;
    PnlExampleImg: TUniPanel;
    imgExample: TUniImage;
    PnlShape: TUniPanel;
    gbParams: TUniGroupBox;
    PnlDimInner: TUniPanel;
    Splitter5: TUniSplitter;
    Bevel1: TUniPanel;
    PnlDimInnerLeft: TUniPanel;
    PnlShapeLeft02: TUniPanel;
    PnlDimensionNumbers: TUniPanel;
    lblN1: TUniLabel;
    lblN2: TUniLabel;
    lblN3: TUniLabel;
    lblN4: TUniLabel;
    lblN5: TUniLabel;
    Panel5: TUniPanel;
    lbl1: TUniLabel;
    lbl2: TUniLabel;
    lbl3: TUniLabel;
    lbl4: TUniLabel;
    lbl5: TUniLabel;
    PnlShapeLeft01: TUniPanel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    Label7: TUniLabel;
    PnlDimInnerClient: TUniPanel;
    Splitter2: TUniSplitter;
    PnlDimInnerRight: TUniPanel;
    PnlShapeRight01: TUniPanel;
    PnlShapeRight02: TUniPanel;
    lblUM2: TUniLabel;
    lblUM3: TUniLabel;
    lblUM4: TUniLabel;
    lblUM5: TUniLabel;
    cmbUOM: TUniComboBox;
    Panel7: TUniPanel;
    PnlShapeClient01: TUniPanel;
    dbeQty: TUniDBEdit;
    cmbOperation: TUniDBComboBox;
    PnlShapeClient02: TUniPanel;
    edt1: TUniDBEdit;
    edt2: TUniDBEdit;
    edt3: TUniDBEdit;
    edt4: TUniDBEdit;
    edt5: TUniDBEdit;
    Bevel2: TUniPanel;
    PnlNoShape: TUniPanel;
    cmbShapes: TUniDBComboBox;
    TblVolumeSHAPE_ID: TBCDField;
    cmbGridShapes: TUniDBComboBox;
    cmbGridOperation: TUniDBComboBox;
    lblShpVol: TUniDBText;
    lblUOMText: TUniLabel;
    ImageListShapes: TUniImageList;
    shpBorder: TUniPanel;
    Panel2: TUniPanel;
    lblStatus: TUniLabel;
    procedure bbtnClearClick(Sender: TObject);
    procedure cmbUOMChange(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure SrcVolumeDataChange(Sender: TObject; Field: TField);
    procedure TblVolumeBeforePost(DataSet: TDataSet);
    procedure TblVolumeAfterPost(DataSet: TDataSet);
    procedure DoShapeComboChange(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TblVolumeAfterCancel(DataSet: TDataSet);
    procedure TblVolumeNewRecord(DataSet: TDataSet);
    procedure TblVolumeCalcFields(DataSet: TDataSet);
    {TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'TGridDrawState'
    procedure GridCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);}
    procedure DoGridShapeComboChange(Sender: TObject);
    procedure TblVolumeBeforeInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure PnlShapeClient01Resize(Sender: TObject);
    procedure Panel7Resize(Sender: TObject);
  private
    { Private declarations }
    FQinvt_ID: Real;
    procedure EnableDimensionControls(AEnabled: Boolean);
    procedure SetStatusDisplay(AValue: Real);
    procedure Startup;
    procedure SetCaption;
    procedure SetFilter(AQInvt_ID: Real);
    procedure SetImage(AIndex: Integer);
    procedure BuildShapesList; // we control the shapes list here

    function GetUOMText: String;
    procedure SetQInvt_ID(const Value: Real);
  public
    { Public declarations }
    procedure ParamsDisplay(P1, P2, P3, P4, P5: String);
    procedure ParamDisplay(S: string; Lbl: TUniLabel; Edt: TUniDBEdit;
      lblUM, lblN: TUniLabel);

    procedure ShowPropertiesFor(const AIndex: Integer);
    procedure ValidateRequiredFields;

    function CurrentVolume: Real;
    function TotalVolume: Real;
    property QInvt_ID: Real write SetQInvt_ID;
  end;

function GetVolumeFormWorkSheet(var AVolume: Real; AQInvt_ID: Real): Boolean;
function GetVolumeFormWorkSheetEx(var AVolume: Real; AQInvt_ID: Real;
  var AUomIndex: Integer): Boolean;

var
  Current: Real; // Individual part volume

implementation

{$R *.DFM}
{ VOLIMAGE_RES }

uses
  IQMS.Common.Controls,
  IQMS.Common.Graphics,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.NLS,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  vol_rscstr,
  volumecalc;

function GetVolumeFormWorkSheet(var AVolume: Real; AQInvt_ID: Real): Boolean;
var
  LFrm: TFrmVolume;
begin
  LFrm:= TFrmVolume.Create(UniGUIApplication.UniApplication);
  LFrm.QInvt_ID := AQInvt_ID;
  Result := LFrm.ShowModal = mrOK;
  if Result then
    AVolume := LFrm.TotalVolume;
end;

function GetVolumeFormWorkSheetEx(var AVolume: Real; AQInvt_ID: Real;
  var AUomIndex: Integer): Boolean;
var
  LFrm: TFrmVolume;
begin
  LFrm:= TFrmVolume.Create(UniGUIApplication.UniApplication);
  LFrm.QInvt_ID := AQInvt_ID;
  Result := LFrm.ShowModal = mrOK;
  if Result then
    begin
      AVolume := LFrm.TotalVolume;
      AUomIndex := LFrm.cmbUOM.ItemIndex;
    end;
end;

{ TFrmVolume }
procedure TFrmVolume.FormCreate(Sender: TObject);
begin
  CheckVistaAdjustSize([cmbShapes, cmbOperation, edt1, edt2, edt3, edt4, edt5]);
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'ControlType'
  Grid.ControlType.Clear;
  Grid.ControlType.Add('OPERATION;CustomEdit;cmbGridOperation;F');
  Grid.ControlType.Add('SHAPE_ID;CustomEdit;cmbGridShapes;F');}
end;

procedure TFrmVolume.FormShow(Sender: TObject);
var
  AIndex: Integer;
begin
  AIndex := 0;

  if IQRegIntegerScalarRead(self, 'MAIN_VOL_INDEX', AIndex) then
    begin
      cmbUOM.ItemIndex := AIndex;
      cmbUOMChange(nil);
    end;

  // 01/29/2007
  if cmbUOM.ItemIndex = - 1 then
    begin
      cmbUOM.ItemIndex := 0;
      cmbUOMChange(nil);
    end;

  Startup;

  ShowPropertiesFor(TblVolumeSHAPE_ID.AsInteger);
end;

procedure TFrmVolume.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self, Grid, PnlTop, PnlShape,
    PnlExample, PnlDimInnerLeft, PnlDimInnerRight]);

  IQRegIntegerScalarWrite(self, 'MAIN_VOL_INDEX', cmbUOM.ItemIndex);

end;

procedure TFrmVolume.Startup;
begin
  SetFilter(FQinvt_ID);
  SetCaption;
  BuildShapesList;
  ReOpen(TblVolume);
  IQRegFormRead(self, [self, Grid, PnlTop, PnlShape,
    PnlExample, PnlDimInnerLeft, PnlDimInnerRight]);
  SetStatusDisplay(TotalVolume); // shows the total volume of all detail records
  cmbGridShapes.Visible := FALSE;
  cmbGridOperation.Visible := FALSE;
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlShapeClient01);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlShapeClient02);
  IQMS.Common.Controls.AdjustRightAlignedControlsToParent(PnlShapeRight02);
end;

procedure TFrmVolume.SetFilter(AQInvt_ID: Real);
begin
  FQinvt_ID := AQInvt_ID;
  TblVolume.Filter := sIIf(FQinvt_ID = 0, 'QINVT_ID = NULL',
    IQFormat('QINVT_ID = %.0f', [FQinvt_ID]));
  TblVolume.Filtered := TRUE; // always filtered
end;

procedure TFrmVolume.SetCaption;
begin
  Caption :=IQMS.Common.Numbers.sIIf(FQinvt_ID = 0,
    vol_rscstr.cTXT000000001 { 'Volume Calculator' } ,
    Format(vol_rscstr.cTXT000000002 { 'Volume Calculator - Item # %s' } ,
    [FloatToStr(SelectValueFmtAsFloat('select itemno from qinvt where id = %f', [FQinvt_ID]))]));
end;

procedure TFrmVolume.ShowPropertiesFor(const AIndex: Integer);
begin
  // Used a couple of ways:
  // ShowPropertiesFor(cmbShapes.ItemIndex);
  // ShowPropertiesFor(TblVolumeSHAPE_ID.AsInteger);

  EnableDimensionControls(AIndex > - 1);
  SetImage(AIndex);
  lblShpVol.Visible := AIndex > 0;
  lblUOMText.Visible := lblShpVol.Visible;

  case AIndex of
    // Custom volume value
    0:
      ParamsDisplay(GetUOMText, '', '', '', '');

    // Cones
    // Cone - Solid
    1:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000012 { 'Height' } , '', '', ''); // Cone - Solid
    // Cone - Hollow
    2:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000012 { 'Height' } ,
        vol_rscstr.cTXT000000013 { 'Wall Thickness' } , '', '');
      // Cone - Hollow
    // Cone - Partial
    3:
      ParamsDisplay(vol_rscstr.cTXT000000010 { 'Base Width' } ,
        vol_rscstr.cTXT000000011 { 'Top Width' } ,
        vol_rscstr.cTXT000000012 { 'Height' } , '', ''); // Cone - Partial

    // Cylinders
    // Cylinder - Solid
    4:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000012 { 'Height' } , '', '', ''); // Cylinder - Solid
    // Cylinder - Through
    5:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000012 { 'Height' } ,
        vol_rscstr.cTXT000000013 { 'Wall Thickness' } , '', '');
      // Cylinder - Through
    // Cylinder with Base
    6:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000012 { 'Height' } ,
        vol_rscstr.cTXT000000013 { 'Wall Thickness' } , '', '');
      // Cylinder - with Base

    // Pyramid
    7:
      ParamsDisplay(vol_rscstr.cTXT000000006 { 'Base Length' } ,
        vol_rscstr.cTXT000000010 { 'Base Width' } ,
        vol_rscstr.cTXT000000012 { 'Height' } , '', ''); // Pyramid

    // Rectangles
    // Rectangle - Solid
    8:
      ParamsDisplay(vol_rscstr.cTXT000000003 { 'Length' } ,
        vol_rscstr.cTXT000000007 { 'Width' } ,
        vol_rscstr.cTXT000000014 { 'Depth' } , '', ''); // Rectangle solid
    // Rectangle with Base
    9:
      ParamsDisplay(vol_rscstr.cTXT000000003 { 'Length' } ,
        vol_rscstr.cTXT000000007 { 'Width' } ,
        vol_rscstr.cTXT000000014 { 'Depth' } ,
        vol_rscstr.cTXT000000013 { 'Wall Thickness' } , '');
      // Rectangle with base
    // Rectange - Through
    10:
      ParamsDisplay(vol_rscstr.cTXT000000003 { 'Length' } ,
        vol_rscstr.cTXT000000007 { 'Width' } ,
        vol_rscstr.cTXT000000014 { 'Depth' } ,
        vol_rscstr.cTXT000000005 { 'Length 2' } ,
        vol_rscstr.cTXT000000009 { 'Width 2' } ); // Rectangle - Through
    // Rectange - Open Ended
    11:
      ParamsDisplay(vol_rscstr.cTXT000000003 { 'Length' } ,
        vol_rscstr.cTXT000000007 { 'Width' } ,
        vol_rscstr.cTXT000000014 { 'Depth' } ,
        vol_rscstr.cTXT000000005 { 'Length 2' } ,
        vol_rscstr.cTXT000000009 { 'Width 2' } ); // Rectangle - Open Ended

    // Spheres
    // Sphere - Solid
    12:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } , '', '', '', '');
      // Sphere
    // Sphere - Hollow
    13:
      ParamsDisplay(vol_rscstr.cTXT000000015 { 'Radius' } ,
        vol_rscstr.cTXT000000013 { 'Wall Thickness' } , '', '', '');
      // Sphere - Hollow

    // Torus
    14:
      ParamsDisplay(vol_rscstr.cTXT000000003 { 'Length' } ,
        vol_rscstr.cTXT000000015 { 'Radius' } , '', '', ''); // Sphere - Hollow

  end; // end case

end;

procedure TFrmVolume.ParamsDisplay(P1: String; P2: String; P3: String;
  P4: String; P5: String);
begin
  ParamDisplay(P1, lbl1, edt1, NIL, lblN1);
  ParamDisplay(P2, lbl2, edt2, lblUM2, lblN2);
  ParamDisplay(P3, lbl3, edt3, lblUM3, lblN3);
  ParamDisplay(P4, lbl4, edt4, lblUM4, lblN4);
  ParamDisplay(P5, lbl5, edt5, lblUM5, lblN5);
end;

procedure TFrmVolume.ParamDisplay(S: string; Lbl: TUniLabel; Edt: TUniDBEdit;
  lblUM, lblN: TUniLabel);
begin
  if Lbl <> NIL then
    with Lbl do
      begin
        Caption := S;
        Update;
        Visible := S > '';
      end;

  if Edt <> NIL then
    Edt.Visible := S > '';

  if lblUM <> NIL then
    with lblUM do
      begin
        Update;
        Visible := S > '';
      end;

  if lblN <> NIL then
    with lblN do
      begin
        Update;
        Visible := S > '';
      end;

end;

procedure TFrmVolume.ValidateRequiredFields;
begin
  // Check whether the required fields have been filled.  If not, inform user.
  If (dbeQty.Text = '') then
    raise Exception.Create
      (vol_rscstr.cTXT000000019 { 'Please enter a quantity.' } );
  if edt1.Visible and (edt1.Text = '') then
    raise Exception.CreateFmt
      (vol_rscstr.cTXT000000020 { 'Please enter a value for %s.' } ,
      [lbl1.Caption]);
  if edt2.Visible and (edt2.Text = '') then
    raise Exception.CreateFmt
      (vol_rscstr.cTXT000000020 { 'Please enter a value for %s.' } ,
      [lbl2.Caption]);
  if edt3.Visible and (edt3.Text = '') then
    raise Exception.CreateFmt
      (vol_rscstr.cTXT000000020 { 'Please enter a value for %s.' } ,
      [lbl3.Caption]);
  if edt4.Visible and (edt4.Text = '') then
    raise Exception.CreateFmt
      (vol_rscstr.cTXT000000020 { 'Please enter a value for %s.' } ,
      [lbl4.Caption]);
  if edt5.Visible and (edt5.Text = '') then
    raise Exception.CreateFmt
      (vol_rscstr.cTXT000000020 { 'Please enter a value for %s.' } ,
      [lbl5.Caption]);
end;

function TFrmVolume.CurrentVolume: Real;
{ Return volume of current component }
var
  a, b, c, d, e, q: Real;
begin
  with TblVolume do
    begin
      a := FieldByName('FIELDCALC1').AsFloat;
      b := FieldByName('FIELDCALC2').AsFloat;
      c := FieldByName('FIELDCALC3').AsFloat;
      d := FieldByName('FIELDCALC4').AsFloat;
      e := FieldByName('FIELDCALC5').AsFloat;
      q := FieldByName('QUANTITY').AsFloat;
    end;

  ValidateRequiredFields;

  // Assign formula and validate required fields based on what is selected in the combo box
  // 01/29/2007 Must check TblVolumeSHAPE_ID
  case TblVolumeSHAPE_ID.AsInteger of
    0:
      Result := (q * a); // Custom volume value
    1:
      Result := Cone_Solid(q, a, b); // Cone - Solid
    2:
      Result := Cone_Hollow(q, a, b, c); // Cone - Hollow
    3:
      Result := Cone_Partial(q, a, b, c); // Cone - Partial
    4:
      Result := Cyl_Solid(q, a, b); // Cylinder - Solid
    5:
      Result := Cyl_Through(q, a, b, c); // Cylinder - Through
    6:
      Result := Cyl_Base(q, a, b, c); // Cylinder with Base
    7:
      Result := Pyramid_Solid(q, a, b, c); // Pyramid
    8:
      Result := Rec_Solid(q, a, b, c); // Rectangle - Solid
    9:
      Result := Rec_Base(q, a, b, c, d); // Rectangle with Base
    10:
      Result := Rec_Through(q, a, b, c, d, e); // Rectange - Through
    11:
      Result := Rec_OpenEnded(q, a, b, c, d, e); // Rectange - Open Ended
    12:
      Result := Sphere(q, a); // Sphere - Solid
    13:
      Result := Sphere_Hollow(q, a, b); // Sphere - Hollow
    14:
      Result := Torus(q, a, b); // Sphere - Hollow
  end; // end case statement

  // NOTE:  We do NOT convert CM and IN values.
  // CM=(value in IN) * (0.061).

  // Make the volume value negative if necessary.
  Result := IQMS.Common.Numbers.fIIf(TblVolumeOPERATION.AsString = '-',
    - (Result), Result);
end;

function TFrmVolume.TotalVolume: Real;
// Find sum of volume by scanning the recordset and adding the volume values.
begin
  if FQinvt_ID = 0 then
    Result := SelectValueAsFloat
      ('select sum(unitvolume) from volume_dtl where qinvt_id is NULL')
  else
    Result := SelectValueFmtAsFloat
      ('select sum(unitvolume) from volume_dtl where qinvt_id = %.0f',
      [FQinvt_ID]);
end;

procedure TFrmVolume.bbtnClearClick(Sender: TObject);
begin
  Application.ProcessMessages;

  // Clear the edit boxes.
  if IQConfirmYN(vol_rscstr.cTXT000000021 { 'Clear values?' } ) = FALSE then
    Exit;

  with TblVolume do
    begin
      if not (State in [dsEdit, dsInsert]) then
        Edit;
      FieldByName('FIELDCALC1').Clear;
      FieldByName('FIELDCALC2').Clear;
      FieldByName('FIELDCALC3').Clear;
      FieldByName('FIELDCALC4').Clear;
      FieldByName('FIELDCALC5').Clear;
      FieldByName('QUANTITY').Clear;
      FieldByName('OPERATION').AsString := '+';
      lblStatus.Caption := '';
    end;
end;

procedure TFrmVolume.cmbUOMChange(Sender: TObject);
{ Change the unit of measure }
var
  strUM: String;
begin
  Application.ProcessMessages;

  strUM := cmbUOM.Text;

  // Change the labels
  // lblUM1.Caption := strUM;
  lblUM2.Caption := strUM;
  lblUM3.Caption := strUM;
  lblUM4.Caption := strUM;
  lblUM5.Caption := strUM;

  // For the user defined volume, change the label accordingly
  if TblVolumeSHAPE_ID.AsInteger = 0 Then
    ParamsDisplay(GetUOMText, '', '', '', '');

  // Set status bar text
  SetStatusDisplay(TotalVolume);

  // label on the graphic
  lblUOMText.Caption := GetUOMText;

end;

procedure TFrmVolume.bbtnOKClick(Sender: TObject);
begin
  // Close this dialog and apply total part volume to quotation
  TblVolume.CheckBrowseMode;
  ModalResult := mrOK;
end;

procedure TFrmVolume.SrcVolumeDataChange(Sender: TObject; Field: TField);
begin
  if Showing then
    ShowPropertiesFor(TblVolumeSHAPE_ID.AsInteger);
end;

procedure TFrmVolume.TblVolumeBeforePost(DataSet: TDataSet);
begin
  // Update the recordset.  The status bar shows the total volume.
  IQAssignIDBeforePost(DataSet);
  with TblVolume do
    begin
      TblVolumeUNITVOLUME.AsFloat := CurrentVolume;
      if FQinvt_ID = 0 then
        TblVolumeQINVT_ID.Clear
      else
        TblVolumeQINVT_ID.AsFloat := FQinvt_ID;
    end;
end;

procedure TFrmVolume.TblVolumeAfterPost(DataSet: TDataSet);
begin
  SetStatusDisplay(TotalVolume); // shows total volume for all detail records
end;

procedure TFrmVolume.DoShapeComboChange(Sender: TObject);
var
  AIndex: Integer;
begin
  Application.ProcessMessages;
  // wait for default process to complete before evaluating
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'Value'
  if not IQMS.Common.Numbers.IsStringValidInteger(cmbShapes.Value, AIndex) then
    AIndex := - 1;}
  ShowPropertiesFor(AIndex);
end;

procedure TFrmVolume.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmVolume.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmQUOTE { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmVolume.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmVolume.EnableDimensionControls(AEnabled: Boolean);
begin
  imgExample.Visible := AEnabled;
  // IQEnableControl(cmbUOM, AEnabled and (TblVolume.Bof and TblVolume.Eof));
  IQEnableControl(cmbUOM, AEnabled);
  IQEnableControl(cmbOperation, AEnabled);
  IQEnableControl(dbeQty, AEnabled);
  IQEnableControl(edt1, AEnabled);
  IQEnableControl(edt2, AEnabled);
  IQEnableControl(edt3, AEnabled);
  IQEnableControl(edt4, AEnabled);
  IQEnableControl(edt5, AEnabled);
  PnlNoShape.Left := 0;
  PnlNoShape.Width := gbParams.Width;
  PnlNoShape.Top := PnlShapeClient01.Height - 1;
  PnlNoShape.Height := PnlShapeClient02.Height + 3;
  PnlNoShape.Visible := not AEnabled;
  if PnlNoShape.Visible then
    PnlNoShape.BringToFront;
end;

procedure TFrmVolume.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext);
end;

procedure TFrmVolume.SetStatusDisplay(AValue: Real);
begin
  // Update the status bar with the new value
  lblStatus.Caption :=
    Format(vol_rscstr.cTXT000000022 { 'Total volume (%s): %.8f' } ,
    [GetUOMText, AValue]);
end;

procedure TFrmVolume.SetImage(AIndex: Integer);
begin
  imgExample.Visible := (AIndex > 0);
  if imgExample.Visible then
    // imgExample.Picture.Bitmap.LoadFromResourceName(hInstance, ARscName);
    IQMS.Common.Graphics.LoadBitmapFromImageList(ImageListShapes, AIndex - 1, imgExample);
end;

procedure TFrmVolume.SetQInvt_ID(const Value: Real);
begin
  FQinvt_ID:= Value;
end;

procedure TFrmVolume.TblVolumeAfterCancel(DataSet: TDataSet);
begin
  ShowPropertiesFor(TblVolumeSHAPE_ID.AsInteger);
end;

procedure TFrmVolume.TblVolumeNewRecord(DataSet: TDataSet);
begin
  TblVolumeID.AsLargeInt := GetNextID('VOLUME_DTL');
  TblVolumeSHAPE_ID.AsInteger := - 1;
  TblVolumeQUANTITY.AsFloat := 1;
  TblVolumeOPERATION.AsString := '+';
  if FQinvt_ID > 0 then
    TblVolumeQINVT_ID.AsFloat := FQinvt_ID;
  lblShpVol.Visible := FALSE;
  lblUOMText.Visible := lblShpVol.Visible;

  // 01/29/2007 added "if"
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'DropDown'
  if TblVolumeSHAPE_ID.IsNull then
    cmbShapes.DropDown;} // drop down the list for a new record
end;

function TFrmVolume.GetUOMText: String;
begin
  // NOTE:  We do not save the UOM value to the database.  If the user
  // calculated values in cubic inches, and somebody changes the UOM
  // combo box to show centimeters, then the volume result will be
  // inaccurate.  This is a design flaw from the start, which
  // we haven't bothered to fix yet.
  case cmbUOM.ItemIndex of
    0:
      Result := vol_rscstr.cTXT000000016; { 'Cubic inches' }
    1:
      Result := vol_rscstr.cTXT000000017; { 'Cubic centimeters' }
    2:
      Result := vol_rscstr.cTXT000000042; { 'Cubic millimeters.' }
  end;
end;

procedure TFrmVolume.TblVolumeCalcFields(DataSet: TDataSet);
begin
  lblUOMText.Caption := GetUOMText;
end;

(* TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'TGridDrawState'
procedure TFrmVolume.GridCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  { if Highlight then Exit;
    if (UpperCase(Field.FieldName) <> 'DESCR') or
    (UpperCase(Field.FieldName) <> 'QUANTITY') or
    (UpperCase(Field.FieldName) <> 'UNITVOLUME') then
    ABrush.Color := clBtnFace; }
end;
*)

procedure TFrmVolume.DoGridShapeComboChange(Sender: TObject);
var
  AIndex: Integer;
begin
  Application.ProcessMessages;
  // wait for default process to complete before evaluating
  { TODO -oBantuK -cWEB_CONVERT : E2003 Undeclared identifier: 'Value'
  if not IQMS.Common.Numbers.IsStringValidInteger(cmbGridShapes.Value, AIndex) then
    AIndex := - 1;}
  ShowPropertiesFor(AIndex);
end;

procedure TFrmVolume.BuildShapesList;
var
  AList: TStringList; // temporary holder
begin
  if TblVolume.Active then
    TblVolume.Close;

  try
    AList := TStringList.Create;
    AList.Add(vol_rscstr.cTXT000000023 + #9'0'); // 'Custom Volume Value'
    AList.Add(vol_rscstr.cTXT000000024 + #9'1'); // 'Cone - Solid'
    AList.Add(vol_rscstr.cTXT000000025 + #9'2'); // 'Cone - Hollow'
    AList.Add(vol_rscstr.cTXT000000026 + #9'3'); // 'Cone - Partial'
    AList.Add(vol_rscstr.cTXT000000027 + #9'4'); // 'Cylinder - Solid'
    AList.Add(vol_rscstr.cTXT000000028 + #9'5'); // 'Cylinder - Thru'
    AList.Add(vol_rscstr.cTXT000000029 + #9'6'); // 'Cylinder - with Base'
    AList.Add(vol_rscstr.cTXT000000030 + #9'7'); // 'Pyramid'
    AList.Add(vol_rscstr.cTXT000000031 + #9'8'); // 'Rectangle - Solid'
    AList.Add(vol_rscstr.cTXT000000032 + #9'9'); // 'Rectangle - with Base'
    AList.Add(vol_rscstr.cTXT000000033 + #9'10'); // 'Rectangle - Thru'
    AList.Add(vol_rscstr.cTXT000000034 + #9'11'); // 'Rectangle - Open Ended'
    AList.Add(vol_rscstr.cTXT000000035 + #9'12'); // 'Sphere - Solid'
    AList.Add(vol_rscstr.cTXT000000036 + #9'13'); // 'Sphere - Hollow'
    AList.Add(vol_rscstr.cTXT000000037 + #9'14'); // 'Torus'

    // Add shape list to the form combo box
    cmbShapes.Items.Clear;
    cmbShapes.Items.AddStrings(AList);

    // Add shape list to the grid combo box
    cmbGridShapes.Items.Clear;
    cmbGridShapes.Items.AddStrings(AList);

  finally
    if Assigned(AList) then
      FreeAndNil(AList);
  end;
end;

procedure TFrmVolume.TblVolumeBeforeInsert(DataSet: TDataSet);
begin
  // If the combo box is not focused BEFORE we insert, and the user clicks
  // it, then the Insert operation will be cancelled.
  if cmbShapes.CanFocus then
    cmbShapes.SetFocus;
end;

procedure TFrmVolume.PnlShapeClient01Resize(Sender: TObject);
begin
  IQMS.Common.Controls.RefreshComponents([cmbOperation, cmbShapes], 2, NIL);
end;

procedure TFrmVolume.Panel7Resize(Sender: TObject);
begin
  IQMS.Common.Controls.RefreshComponents([cmbOperation, cmbShapes], 2, NIL);
end;

end.
