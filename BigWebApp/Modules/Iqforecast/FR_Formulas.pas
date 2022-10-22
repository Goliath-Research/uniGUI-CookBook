unit FR_Formulas;

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
  Grids,
  Wwdbigrd,
  Wwdbgrid,
  DBCtrls,
  ExtCtrls,
  DB,
  IQMS.WebVcl.About,
  Menus,
  IQMS.WebVcl.SecurityRegister,
  Buttons,
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
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmFR_Formulas = class(TUniForm)
    Panel1: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    SrcFore_Formula: TDataSource;
    TblFore_Formula: TFDTable;
    TblFore_FormulaID: TBCDField;
    TblFore_FormulaNAME: TStringField;
    TblFore_FormulaDESCRIP: TStringField;
    TblFore_FormulaINFIX: TStringField;
    TblFore_FormulaPOSTFIX: TStringField;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    sbtnAddDefault: TUniSpeedButton;
    SR: TIQWebSecurityRegister;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TblFore_FormulaBeforePost(DataSet: TDataSet);
    procedure sbtnAddDefaultClick(Sender: TObject);
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
  { TODO -oSanketG -cWebConvert : Need to revisit }
  //IQSecIns,
  IQMS.Common.Dialogs;

class procedure TFrmFR_Formulas.DoShowModal;
var
  FrmFR_Formulas: TFrmFR_Formulas;
begin
  FrmFR_Formulas := TFrmFR_Formulas.Create(uniGuiApplication.UniApplication);
  FrmFR_Formulas.ShowModal;
end;

procedure TFrmFR_Formulas.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFR_Formulas.About1Click(Sender: TObject);
begin
  IQAbout1.Execute
end;

procedure TFrmFR_Formulas.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmFR_Formulas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBGrid1 ]);
end;

procedure TFrmFR_Formulas.FormShow(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  { TODO -oSanketG -cWebConvert : Need to revisit dependent on IQSecIns}
  //EnsureSecurityInspectorOnTopOf( self );
end;

procedure TFrmFR_Formulas.TblFore_FormulaBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost(DataSet);
end;

procedure TFrmFR_Formulas.sbtnAddDefaultClick(Sender: TObject);
begin
  if not IQConfirmYN('This option appends default formulas. Please confirm to continue.') then
     EXIT;

  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F1'',  ''%s'')', [ 'Q1'                      , 'Forecast for each future quarter is the same as last quarter'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F2'',  ''%s'')', [ '(Q1+Q2)/2'               , 'Forecast for each future quarter is the average of last two quarters'  ])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F3'',  ''%s'')', [ '(Q1+Q2+Q3)/3'            , 'Forecast for each future quarter is the average of the last 3 quarters'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F4'',  ''%s'')', [ 'Y1/4'                    , 'Forecast for each future quarter is the average of the last 4 quarters'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F5'',  ''%s'')', [ '(Q1+Q1+Q2)/3'            , 'Forecast for each future quarter is weighted toward the last quarter'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F6'',  ''%s'')', [ 'M1'                      , 'Forecast for each quarter is the same as the prior month'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F7'',  ''%s'')', [ 'Q4'                      , 'Forecast for the quarter is the same as the same quarter a year earlier'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F8'',  ''%s'')', [ 'Q4*Q1/Q5'                , 'Same as F7 with growth calculated from comparable quarters'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F9'',  ''%s'')', [ 'Q4*(Q1+Q2)/(Q5+Q6)'      , 'Same as F7 with growth calculated from 2 quarters one year apart']);
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F10'', ''%s'')', [ 'Q4*(Q1+Q2+Q3)/(Q5+Q6+Q7)', 'Same as F7 with growth calculated from 3 quarters one year apart']);
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F11'', ''%s'')', [ 'Q4*(Y1/Y2)'              , 'Same as F7 with growth calculated from yearly growth'])   ;
  ExecuteCommandFmt('insert into fore_formula( infix, name, descrip ) values( ''%s'', ''F12'', ''%s'')', [ 'M1+M2'                   , 'Forecast for each future quarter is the same as the prior two months'])   ;

  Reopen(TblFore_Formula);
end;

end.
