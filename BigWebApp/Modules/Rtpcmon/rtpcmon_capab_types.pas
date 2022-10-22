unit rtpcmon_capab_types;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Mask,
  IQMS.WebVcl.Hpick,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, IQUniGrid, Vcl.Controls, uniGUIFrame;

type
  TFrmPCMonCapabTypes = class(TUniForm)
    pnlNav: TUniPanel;
    grdPCMonCapabType: TIQUniGridControl;
    SrcPCMON_CAPAB_TYPE: TDataSource;
    TblPCMON_CAPAB_TYPE: TFDTable;
    TblPCMON_CAPAB_TYPEID: TFMTBCDField;
    TblPCMON_CAPAB_TYPENAME: TStringField;
    TblPCMON_CAPAB_TYPEDESCRIP: TStringField;
    TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE: TStringField;
    TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID: TBCDField;
    TblPCMON_CAPAB_TYPEDisplayChartName: TStringField;
    wwDBComboDlgCommand: TUniEdit;
    TblPCMON_CAPAB_TYPENO_OF_DATA_POINTS: TBCDField;
    TblPCMON_CAPAB_TYPEHIDE_POINT_LABELS: TStringField;
    sbtnSearchDevices: TUniSpeedButton;
    pkCapabilityType: TIQWebHPick;
    pkCapabilityTypeID: TFMTBCDField;
    pkCapabilityTypeNAME: TStringField;
    pkCapabilityTypeDESCRIP: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblPCMON_CAPAB_TYPEBeforePost(DataSet: TDataSet);
    procedure wwDBComboDlgCommandCustomDlg(Sender: TObject);
    procedure TblPCMON_CAPAB_TYPECalcFields(DataSet: TDataSet);
    procedure wwDBComboDlgCommandKeyPress(Sender: TObject; var Key: Char);
    procedure wwDBComboDlgCommandKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnSearchDevicesClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    function PickChartGaugeObject( var AObjectType:String; var AObjectTypeID:Real ):Boolean;
  public
    { Public declarations }
  end;

procedure DoPCMonCapabTypesModal;


implementation

{$R *.dfm}

uses
  IQMS.Common.DotNetCOMInterOp,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure DoPCMonCapabTypesModal;
var
  frm: TFrmPCMonCapabTypes;
begin
  frm := TFrmPCMonCapabTypes.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;


procedure TFrmPCMonCapabTypes.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self, grdPCMonCapabType ] );
end;

procedure TFrmPCMonCapabTypes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, grdPCMonCapabType ] );
//  Action := caFree;
end;

procedure TFrmPCMonCapabTypes.TblPCMON_CAPAB_TYPEBeforePost(  DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet ); {in IQlib}
end;

function TFrmPCMonCapabTypes.PickChartGaugeObject( var AObjectType:String; var AObjectTypeID:Real ):Boolean;
const
  DOTNETDLL = 'IQMS.RTWebChart';
  DOTNETCOMTYPE = 'IQMS.RTWebChart.DisplayPicker';
var
  ADotNetObject: Variant;
  CW: Word;
begin
  DisableFPUExceptions( CW );
  try
    CreateDNetCOM( ADotNetObject, DOTNETDLL, DOTNETCOMTYPE );
    try
      // Initialize current setting
      ADotNetObject.ObjectType  := AObjectType;
      ADotNetObject.ObjectTypeID:= AObjectTypeID;

      Result:= ADotNetObject.PickChartGaugeObject = 1;
      if Result then
      begin
        AObjectType       := ADotNetObject.ObjectType;
        AObjectTypeID     := ADotNetObject.ObjectTypeID;
      end;
    finally
      FreeDNetObject( ADotNetObject );
    end;
  finally
    RestoreFPU( CW );
  end;
end;

procedure TFrmPCMonCapabTypes.sbtnSearchDevicesClick(Sender: TObject);
begin
  with pkCapabilityType do
    if Execute then
       TblPCMON_CAPAB_TYPE.Locate('ID', GetValue('ID'), [ ] );
end;

procedure TFrmPCMonCapabTypes.wwDBComboDlgCommandCustomDlg(Sender: TObject);
var
  AObjectType  : String;
  AObjectTypeID: Real;
begin
  AObjectType  := TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE.asString;
  AObjectTypeID:= TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID.asFloat;
  if not PickChartGaugeObject( {var}AObjectType, {var}AObjectTypeID ) then
    EXIT;

  with TblPCMON_CAPAB_TYPE do
  if not (State in [ dsInsert, dsEdit ]) then Edit;

  TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE.asString:= AObjectType;
  TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID.asFloat   := AObjectTypeID;
end;

procedure TFrmPCMonCapabTypes.TblPCMON_CAPAB_TYPECalcFields(DataSet: TDataSet);
var
  AName: String;
begin
  AName:= '';

  if TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE.asString = 'GAUGE' then
    begin
      case TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID.AsInteger of
        0: AName:= 'Circular Gauge';
        1: AName:= 'Linear Gauge';
        2: AName:= 'Digital Gauge';
        3: AName:= 'State Indicator Gauge';
      end;
    end

  else if TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE.asString = 'CHART' then
    begin
      // commented charts are not supported with simple x,y coordinates
      case TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID.AsInteger of
        0: AName:= 'Bar Chart';
        1: AName:= 'Stacked Bar Chart';
        2: AName:= 'Full Stacked Bar Chart';
        3: AName:= 'Pie Chart';
        4: AName:= 'Doughnut Chart';
        5: AName:= 'Point Chart';
        //6: AName:= 'Bubble Chart';
        7: AName:= 'Line Chart';
        8: AName:= 'Step Line Chart';
        9: AName:= 'Spline Chart';
        10: AName:= 'Area Chart';
        11: AName:= 'Spline Area Chart';
        12: AName:= 'Stacked Area Chart';
        13: AName:= 'Stacked Spline Area Chart';
        14: AName:= 'Full Stacked Area Chart';
        15: AName:= 'Full Stacked Spline Area Chart';
        //16: AName:= 'Stock Chart';
        //17: AName:= 'Candle Stick Chart';
        //18: AName:= 'Side By Side Range Bar Chart';
        //19: AName:= 'Range Bar Chart';
        //20: AName:= 'Side By Side Gantt Chart';
        //21: AName:= 'Gantt Chart';
        //22: AName:= 'Polar Point Chart';
        //23: AName:= 'Polar Line Chart';
        //24: AName:= 'Polar Area Chart';
        25: AName:= 'Radar Point Chart';
        26: AName:= 'Radar Line Chart';
        27: AName:= 'Radar Area Chart';
        28: AName:= 'Bar 3D Chart';
        29: AName:= 'Stacked Bar 3D Chart';
        30: AName:= 'Full Stacked Bar 3D Chart';
        31: AName:= 'Manhattan Bar Chart';
        32: AName:= 'Pie 3D Chart';
        33: AName:= 'Doughnut 3D Chart';
        34: AName:= 'Line 3D Chart';
        35: AName:= 'Step Line 3D Chart';
        36: AName:= 'Area 3D Chart';
        37: AName:= 'Stacked Area 3D Chart';
        38: AName:= 'Full Stacked Area 3D Chart';
        39: AName:= 'Spline 3D Chart';
        40: AName:= 'Spline Area 3D Chart';
        41: AName:= 'Stacked Spline Area 3D Chart';
        42: AName:= 'Full Stacked Spline Area 3D Chart';
      end;
    end;

  TblPCMON_CAPAB_TYPEDisplayChartName.asString:= AName;
end;


procedure TFrmPCMonCapabTypes.wwDBComboDlgCommandKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #8 then
    Key:= #0;
end;

procedure TFrmPCMonCapabTypes.wwDBComboDlgCommandKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not (Key in [ VK_DELETE, VK_BACK ]) then
  begin
    Key:= 0;
    EXIT;
  end;

  if not (TblPCMON_CAPAB_TYPE.State in [dsEdit, dsInsert]) then
    TblPCMON_CAPAB_TYPE.Edit;

  TblPCMON_CAPAB_TYPEDisplayChartName.Clear;
  TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_ID.Clear;
  TblPCMON_CAPAB_TYPEDISPLAY_OBJECT_TYPE.Clear;
end;

end.
