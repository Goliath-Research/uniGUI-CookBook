unit ship_trailer;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.SecurityRegister,
  Vcl.Wwdatsrc,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmShipTrailer = class(TUniForm)
    wwDBGrid1: TIQUniGridControl;
    SrcTrailer: TDataSource;
    QryTrailer: TFDQuery;
    QryTrailerID: TBCDField;
    QryTrailerSEQ: TBCDField;
    QryTrailerDESCRIP: TStringField;
    QryTrailerWIDTH: TFMTBCDField;
    QryTrailerHEIGHT: TFMTBCDField;
    QryTrailerLENGTH: TFMTBCDField;
    QryTrailerMAX_WEIGHT: TFMTBCDField;
    UpdateSQLTrailer: TFDUpdateSQL;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryTrailerVolume: TFloatField;
    QryTrailerGAP_PERCENT: TBCDField;
    QryTrailerEPLANT_ID: TBCDField;
    QryEPlant: TFDQuery;
    QryEPlantID: TBCDField;
    QryEPlantDESCRIP: TStringField;
    QryTrailerEPlant: TStringField;
    wwDBComboDlgEPlant: TUniEdit;
    Contents1: TUniMenuItem;
    QryTrailerDIM_UOM: TStringField;
    comboDimensionUOM: TUniDBComboBox;
    QryTrailerWEIGHT_UOM: TStringField;
    wwDBComboBoxWeightUOM: TUniDBComboBox;
    SR: TIQWebSecurityRegister;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryTrailerBeforePost(DataSet: TDataSet);
    procedure QryTrailerNewRecord(DataSet: TDataSet);
    //procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QryTrailerCalcFields(DataSet: TDataSet);
    //procedure wwDBGrid1CalcCellColors(Sender: TObject; Field: TField;
    //  State: TGridDrawState; Highlight: Boolean; AFont: TFont;
    //  ABrush: TBrush);
    procedure wwDBComboDlgEPlantCustomDlg(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  { TODO -ombaral -cWebConvert : Dependent files will be included when ready
  IQSecIns,
  //SetPlant,
  }
  IQMS.Common.HelpHook;

{ TForm1 }

class procedure TFrmShipTrailer.DoShowModal;
var
   lFrmShipTrailer : TFrmShipTrailer;
begin
  lFrmShipTrailer :=TFrmShipTrailer.Create(uniGUIApplication.UniApplication);
  lFrmShipTrailer.ShowModal;

end;


procedure TFrmShipTrailer.FormShow(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmShipTrailer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmShipTrailer.QryTrailerBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet, 'TRAILER' );
end;

procedure TFrmShipTrailer.QryTrailerNewRecord(DataSet: TDataSet);
begin
  QryTrailerSEQ.asFloat:= SelectValueAsFloat('select max(seq) from trailer') + 1;
end;
{
procedure TFrmShipTrailer.CheckRefresh(Sender: TObject; Button: TNavigateBtn);
begin
  IQCheckRefresh(Sender, Button);
end;
}
procedure TFrmShipTrailer.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmShipTrailer.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmShipTrailer.QryTrailerCalcFields(DataSet: TDataSet);
begin
  QryTrailerVolume.asFloat:= QryTrailerWIDTH.asFloat * QryTrailerHEIGHT.asFloat * QryTrailerLENGTH.asFloat;
end;
{
procedure TFrmShipTrailer.wwDBGrid1CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if Field.ReadOnly then
     ABrush.Color:= clBtnFace;
end;
}

procedure TFrmShipTrailer.wwDBComboDlgEPlantCustomDlg(Sender: TObject);
begin
  //DoChangePlantID( self, QryTrailer );  {SetPlant.pas}
end;

procedure TFrmShipTrailer.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext( self.HelpContext );
end;

procedure TFrmShipTrailer.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP {CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
