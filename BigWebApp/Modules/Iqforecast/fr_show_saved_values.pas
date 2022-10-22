{10-08-2012 we used to compare hist forecasts but since we now support unlimited concurrent forecasts swtiched to compare current forecasts}
unit fr_show_saved_values;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  DB,
  Wwdatsrc,
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  ExtCtrls,
  IQMS.Common.JumpConstants,
  wwDataInspector,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Phys,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmForecastShowSavedValues = class(TUniForm)
    Panel2: TUniPanel;
    SrcForeHist: TDataSource;
    QryForeHist: TFDQuery;
    QryForeHistID: TBCDField;
    QryForeHistNAME: TStringField;
    QryForeHistQTY: TFMTBCDField;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    SrcHeader: TDataSource;
    QryHeader: TFDQuery;
    QryHeaderITEMNO: TStringField;
    QryHeaderDESCRIP: TStringField;
    QryHeaderMM_YY: TStringField;
    IQSearch1: TIQUniGridControl;
    QryForeHistKIND: TStringField;
    wwDataInspector1: TwwDataInspector;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryForeHistBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure IQRefreshDataSets( var Msg: TMessage ); message iq_RefreshDataSets;
  public
    { Public declarations }
    class procedure DoShow();
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  ForeMain;

{ TFrmForecastShowSavedValues }

procedure TFrmForecastShowSavedValues.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  if Owner is TFrmForecastMain then
     TFrmForecastMain(self.Owner).ShowingSavedForecastsValue:= TRUE;
end;

procedure TFrmForecastShowSavedValues.UniFormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

class procedure TFrmForecastShowSavedValues.DoShow();
var
  I: Integer;
  AForm: TUniForm;
  FrmForecastShowSavedValues: TFrmForecastShowSavedValues;
begin
  AForm:= NIL;

  { TODO -oSanketG -cWebConvert : Need to revisit : [dcc32 Error] fr_show_saved_values.pas(112): E2010 Incompatible types: 'TForm' and 'TFrmForecastShowSavedValues',
  [dcc32 Error] fr_show_saved_values.pas(112): E2003 Undeclared identifier: 'AOwner'}

  {for I:= Screen.FormCount - 1 downto 0 do
    if (Screen.Forms[ I ] is TFrmForecastShowSavedValues) and ( TUniForm(Screen.Forms[ I ]).Owner = AOwner ) then
    begin
      AForm:= Screen.Forms[ I ];
      BREAK;
    end;}

  if Assigned( AForm ) then
     //PostMessage( Aform.Handle, iq_RefreshDataSets, 0, 0 )
  else
  begin
     FrmForecastShowSavedValues := TFrmForecastShowSavedValues.Create( uniGuiApplication.UniApplication );
     FrmForecastShowSavedValues.Show;
  end;
end;

procedure TFrmForecastShowSavedValues.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmForecastShowSavedValues.IQRefreshDataSets(var Msg: TMessage);
begin
  RefreshDataSetByID(QryForeHist);
end;

procedure TFrmForecastShowSavedValues.QryForeHistBeforeOpen(DataSet: TDataSet);
begin
//  with QryForeHist do
//  begin
//    ParamByName('arinvt_id').asFloat:= TFrmForecastMain(self.Owner).QryForecast.FieldByName('ARINVT_ID').asFloat;
//    ParamByName('MM').asInteger     := TFrmForecastMain(self.Owner).GetActiveFieldMM;
//    ParamByName('YY').asInteger     := TFrmForecastMain(self.Owner).GetActiveFieldYY;
//  end;

  AssignQueryParamValue(QryForeHist, 'arinvt_id', TFrmForecastMain(self.Owner).QryForecast.FieldByName('ARINVT_ID').asFloat);
  AssignQueryParamValue(QryForeHist, 'MM', TFrmForecastMain(self.Owner).GetActiveFieldMM);
  AssignQueryParamValue(QryForeHist, 'YY', TFrmForecastMain(self.Owner).GetActiveFieldYY);

  with QryHeader do
  begin
    Close;
//    ParamByName('arinvt_id').asFloat:= TFrmForecastMain(self.Owner).QryForecast.FieldByName('ARINVT_ID').asFloat;
//    ParamByName('MM_YY').asString   := TFrmForecastMain(self.Owner).GetActiveFieldDispalyLabel;


    AssignQueryParamValue(QryHeader, 'arinvt_id', TFrmForecastMain(self.Owner).QryForecast.FieldByName('ARINVT_ID').asFloat);
    AssignQueryParamValue(QryHeader, 'MM_YY', TFrmForecastMain(self.Owner).GetActiveFieldDispalyLabel);
    Open;
  end;
end;

procedure TFrmForecastShowSavedValues.FormDestroy(Sender: TObject);
begin

  if Owner is TFrmForecastMain then
     TFrmForecastMain(self.Owner).ShowingSavedForecastsValue:= FALSE;
end;

end.
