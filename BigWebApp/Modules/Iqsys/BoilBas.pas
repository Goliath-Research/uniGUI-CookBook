unit BoilBas;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Mask,
  Vcl.Buttons,
  Data.DB,
  Vcl.DBGrids,
  IQMS.WebVcl.Hpick,
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
  uniDBEdit,
  uniPanel,
  uniBasicGrid,
  uniDBGrid,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.Controls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls;

type
  TFrmBoilerPlates = class(TUniForm)
    Panel1: TUniPanel;
    MainNav: TUniDBNavigator;
    Panel2: TUniPanel;
    PageControl1: TUniPageControl;
    TabSheet1: TUniTabSheet;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    dbeID: TUniDBEdit;
    dbeDescription: TUniDBEdit;
    dbcombType: TUniDBComboBox;
    Splitter1: TUniSplitter;
    sbtnSearch: TUniSpeedButton;
    SrcBoiler_Plate: TDataSource;
    TblBoiler_Plate: TFDTable;
    TblBoiler_PlateID: TBCDField;
    TblBoiler_PlateDESCRIP: TStringField;
    TblBoiler_PlateTEXT: TStringField;
    TblBoiler_PlateTYPE: TStringField;
    TabSheet2: TUniTabSheet;
    DBGrid1: TUniDBGrid;
    sbtnToggle: TUniSpeedButton;
    PkBoiler: TIQWebHPick;
    PkBoilerID: TBCDField;
    PkBoilerDESCRIP: TStringField;
    PkBoilerTYPE: TStringField;
    PnlHeader: TUniPanel;
    PnlClient01: TUniPanel;
    PnlLeft01: TUniPanel;
    Splitter2: TUniSplitter;
    PnlClient02: TUniPanel;
    dbreText: TDBRichEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TblBoiler_PlateBeforePost(DataSet: TDataSet);
    procedure TblBoiler_PlateNewRecord(DataSet: TDataSet);
    procedure sbtnToggleClick(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure PkBoilerBeforeOpen(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FType: string;
    procedure AssignFilter;
    procedure SetAType(const Value: string);
  public
    { Public declarations }
    property AType: string write SetAType;
  end;

procedure DoBoilerPlates( AType: string );

implementation
{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  iqsys_rscstr;

procedure DoBoilerPlates( AType: string );
var
  LFrm: TFrmBoilerPlates;
begin
  LFrm:= TFrmBoilerPlates.Create( UniGUIApplication.UniApplication);
  LFrm.AType:= AType;
  LFrm.ShowModal;
end;

procedure TFrmBoilerPlates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmBoilerPlates.AssignFilter;
begin
  with TblBoiler_Plate do
  begin
    Filtered:= FType <> '';
    if Filtered then
       Filter:= Format('TYPE = ''%s''', [ FType ]);
  end;
  if FType <> '' then
     Caption:= Format(iqsys_rscstr.cTXT0000059{'Boiler Plates [Type = %s]'},
      [ FType ]);
end;

procedure TFrmBoilerPlates.TblBoiler_PlateBeforePost(DataSet: TDataSet);
begin
  IQAssignIDBeforePost( DataSet );
end;

procedure TFrmBoilerPlates.TblBoiler_PlateNewRecord(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('type').asString:= FType;
end;

procedure TFrmBoilerPlates.UniFormShow(Sender: TObject);
begin
  IQMS.Common.Controls.AdjustPageControlToParent(PageControl1);
  IQEnableControl( dbcombType, FType = '' );
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
  AssignFilter;
  sbtnToggleClick( NIL );
  IQMS.Common.Screen.ApplySystemFont(self);   // delphi ...
  //WEB_CONVERT dbreText.ParentFont:= TRUE;
end;

procedure TFrmBoilerPlates.sbtnToggleClick(Sender: TObject);
begin
  with PageControl1 do
  if (ActivePage = TabSheet2) or (Sender = NIL) then
  begin
    DBGrid1.DataSource:= NIL;
    ActivePage:= TabSheet1;
  end
  else
  begin
    DBGrid1.DataSource:= SrcBoiler_Plate;
    ActivePage:= TabSheet2;
  end;
end;

procedure TFrmBoilerPlates.SetAType(const Value: string);
begin
  FType:= Value;
end;

procedure TFrmBoilerPlates.sbtnSearchClick(Sender: TObject);
begin
  with PkBoiler do
    if Execute then
      TblBoiler_Plate.Locate( 'ID', GetValue('ID'), []);
end;

procedure TFrmBoilerPlates.PkBoilerBeforeOpen(DataSet: TDataSet);
begin
  with DataSet as TFDQuery do
  begin
    ParamByName('type').asString:= FType;
    if FType = '' then
       ParamByName('select_all').Value := 1
    else
       ParamByName('select_all').Value := 0;
  end;
end;

procedure TFrmBoilerPlates.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmSETUP{CHM}, iqhtmSETUPch4{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.
