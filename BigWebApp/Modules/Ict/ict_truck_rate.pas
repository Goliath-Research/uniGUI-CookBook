unit ict_truck_rate;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Menus,
  IQMS.WebVcl.About,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Buttons,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmICT_TruckRate = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel13: TUniPanel;
    Panel3: TUniPanel;
    wwDBGridFrom: TIQUniGridControl;
    wwDBGridTo: TIQUniGridControl;
    SrcSource: TDataSource;
    QrySource: TFDQuery;
    QrySourceSOURCE: TStringField;
    QrySourceSOURCE_ID: TBCDField;
    QrySourceNAME: TStringField;
    Panel4: TUniPanel;
    SrcTruckRate: TDataSource;
    QryTruckRate: TFDQuery;
    QryTruckRateID: TBCDField;
    QryTruckRateFROM_SOURCE: TStringField;
    QryTruckRateFROM_SOURCE_ID: TBCDField;
    QryTruckRateTO_SOURCE: TStringField;
    QryTruckRateTO_SOURCE_ID: TBCDField;
    QryTruckRateCOST: TFMTBCDField;
    QryTruckRateEFFECT_DATE: TDateTimeField;
    QryTruckRateDEACTIVE_DATE: TDateTimeField;
    QryTruckRateSOURCE_NAME: TStringField;
    SecurityRegister1: TIQWebSecurityRegister;
    sbHideInactive: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure About1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure QryTruckRateNewRecord(DataSet: TDataSet);
    procedure QryTruckRateBeforePost(DataSet: TDataSet);
    { TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
    procedure wwDBGridToCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);}
    procedure QryTruckRateBeforeOpen(DataSet: TDataSet);
    procedure QrySourceAfterScroll(DataSet: TDataSet);
    procedure sbHideInactiveClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  ict_truck_rate_destination;

{$R *.dfm}


{ TFrmICT_TruckRate }

class procedure TFrmICT_TruckRate.DoShow;
begin
  self.Create(UniGuiApplication.UniApplication ).Show;
end;


procedure TFrmICT_TruckRate.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmICT_TruckRate.About1Click(Sender: TObject);
begin
  IQABout1.Execute
end;

procedure TFrmICT_TruckRate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGridFrom, wwDBGridTo, sbHideInactive ]);
end;


procedure TFrmICT_TruckRate.QryTruckRateBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet, 'truck_rate');
end;

procedure TFrmICT_TruckRate.QryTruckRateNewRecord(DataSet: TDataSet);
var
  ACargo: TTruckDestinationCargo; // ict_truck_rate_destination.pas
begin
  QryTruckRateID.asBcd:= 0;
  QryTruckRateFROM_SOURCE.asString:= QrySourceSOURCE.asString;
  QryTruckRateFROM_SOURCE_ID.asBCD:= QrySourceSOURCE_ID.asBCD;

  ACargo.FromSource:= QryTruckRateFROM_SOURCE.asString;
  ACargo.FromSource_ID:= QryTruckRateFROM_SOURCE_ID.asFloat;

  if not TFrmICT_NewTruckRateDestination.DoShowModal( self, ACargo ) then  // ict_truck_rate_destination.pas
  begin
    DataSet.Cancel;
    ABORT;
  end;

  QryTruckRateTo_SOURCE.asString:= ACargo.ToSource;
  QryTruckRateTO_SOURCE_ID.asBCD:= ACargo.ToSource_ID;

  QryTruckRate.Post;
  QryTruckRate.Refresh;  // make target source name show up
end;


procedure TFrmICT_TruckRate.sbHideInactiveClick(Sender: TObject);
begin
  Reopen(QryTruckRate);
end;

procedure TFrmICT_TruckRate.UniFormShow(Sender: TObject);
begin
  ExecuteCommand('begin truck_misc.populate_truck_rate; end;');

  IQRegFormRead( self, [ self, wwDBGridFrom, wwDBGridTo, sbHideInactive ]);
  IQSetTablesActive( TRUE, self );
end;

{ TODO -oBantuK -cWEB_CONVERT : Undeclared identifier: 'TGridDrawState'
procedure TFrmICT_TruckRate.wwDBGridToCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then
     EXIT;

  with QryTruckRate do
  begin
    if ((Trunc(FieldByName('DEACTIVE_DATE').asDateTime) = 0)  or (Trunc(FieldByName('DEACTIVE_DATE').asDateTime) >= SelectValueAsFloat('select trunc(sysdate) from dual'))) and
       ((Trunc(FieldByName('EFFECT_DATE').asDateTime) = 0)  or (Trunc(FieldByName('EFFECT_DATE').asDateTime) <= SelectValueAsFloat('select trunc(sysdate) from dual'))) then
     begin
        ABrush.Color:= clWhite;
        AFont.Color := clBlack;
     end
     else
     begin
       ABrush.Color:= clBtnFace;
       AFont.Color := clBlack;
     end;
  end;
end;
}

procedure TFrmICT_TruckRate.QrySourceAfterScroll(DataSet: TDataSet);
begin
  QryTruckRate.Close;
  QryTruckRate.Open;
end;

procedure TFrmICT_TruckRate.QryTruckRateBeforeOpen(DataSet: TDataSet);
begin
  // with DataSet as TFDQuery do
  // begin
  //   ParamByName('source').asString:= QrySourceSOURCE.asString;
  //   ParamByName('source_id').asBCD:= QrySourceSOURCE_ID.asFloat;
  //   ParamByName('hide_inactive').asBCD:= IQMS.Common.StringUtils.BoolToNum( sbHideInactive.Down );
  // end;
  AssignQueryParamValue(DataSet, 'source',       QrySourceSOURCE.asString );
  AssignQueryParamValue(DataSet, 'source_id',    QrySourceSOURCE_ID.asFloat );
  AssignQueryParamValue(DataSet, 'hide_inactive',IQMS.Common.StringUtils.BoolToNum( sbHideInactive.Down ));
end;


end.
