unit IQMS.Common.Auxequip;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,
  Data.DB,
  Vcl.dbctrls,
  IQMS.WebVcl.Search,
  Vcl.Buttons,
  Vcl.Menus,
  IQMS.WebVcl.About,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniPanel,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu, uniComboBox, uniDBComboBox,
  IQUniGrid, uniGUIFrame, Vcl.Controls;

type
  TFrmIQAuxEquip = class(TUniForm)
    PnlMain: TUniPanel;
    SrcAux: TDataSource;
    QryAux: TFDQuery;
    QryAuxAUX_DESC: TStringField;
    QryAuxAUX_RATE: TBCDField;
    QryAuxHOW_MANY: TBCDField;
    QryAuxDIVISION_ID: TBCDField;
    QryAuxEPLANT_ID: TBCDField;
    QryAuxID: TBCDField;
    UpdateSQLAux: TFDUpdateSQL;
    pnlAuxNav: TUniPanel;
    NavMain: TUniDBNavigator;
    Panel6: TUniPanel;
    Grid: TIQUniGridControl;
    cmbDivision: TUniDBLookupComboBox;
    QryDivisionLookup: TFDQuery;
    QryDivisionLookupNAME: TStringField;
    QryDivisionLookupDESCRIP: TStringField;
    QryDivisionLookupID: TBCDField;
    QryAuxEPLANT_NAME: TStringField;
    QryAuxDIVISION_NAME: TStringField;
    cmbEPlant: TUniEdit;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Close1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    sbtnAuxTooling: TUniSpeedButton;
    procedure DoAfterPost(DataSet: TDataSet);
    procedure DoAssignEPlantFilter(DataSet: TDataSet);
    procedure DoBeforePost(DataSet: TDataSet);
    procedure DoChangeEplant(Sender: TObject);
    procedure NavMainBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SrcAuxDataChange(Sender: TObject; Field: TField);
    procedure cmbDivisionDropDown(Sender: TObject);
    procedure cmbDivisionCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure Close1Click(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure sbtnAuxToolingClick(Sender: TObject);
  private
    { Private declarations }
    procedure ForceValue( AField: TField; AValue: String );
  public
    { Public declarations }
  end;

  procedure DoAuxEquip;


implementation

{$R *.DFM}

uses
  IQMS.Common.BomAuxTool,
  IQMS.Common.Controls,
  IQMS.Common.HelpHook,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.COmmon.SetPlant;

procedure DoAuxEquip;
begin
     TFrmIQAuxEquip.Create(uniGUIApplication.UniApplication).Show;
end;

{ TFrmAuxEquip }

procedure TFrmIQAuxEquip.FormCreate(Sender: TObject);
begin
     IQRegFormRead( Self, [ Self, Grid.DBGrid ] ); // IQMS.Common.RegFrm.pas
     ReOpen(QryAux);  // pas
     ReOpen(QryDivisionLookup);
     cmbDivision.Visible := FALSE; // hide grid control
     cmbEPlant.Visible   := FALSE; // hide grid control
end;

procedure TFrmIQAuxEquip.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IQRegFormWrite( Self, [ Self, Grid.DBGrid ] ); // IQMS.Common.RegFrm.pas
end;

procedure TFrmIQAuxEquip.DoAfterPost(DataSet: TDataSet);
begin
  FDManager.FindConnection('IQFD').ApplyUpdates( [ TFDQuery(DataSet) ]);
end;

procedure TFrmIQAuxEquip.DoAssignEPlantFilter(DataSet: TDataSet);
begin
    IQAssignEPlantFilter( DataSet );  {pas}
    DataSet.Filtered := ( DataSet.Filter > '' );
end;

procedure TFrmIQAuxEquip.DoBeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ID').AsFloat = 0 then
     DataSet.FieldByName('ID').AsFloat:= GetNextID('AUX');
end;

procedure TFrmIQAuxEquip.DoChangeEplant(Sender: TObject);
begin
  DoChangePlantID(  QryAux ); // IQMS.COmmon.SetPlant.pas
end;

procedure TFrmIQAuxEquip.NavMainBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbRefresh then
  begin
     RefreshDataSetByID( TUniDBNavigator(Sender).DataSource.DataSet );
     ABORT;
  end;
end;

procedure TFrmIQAuxEquip.SrcAuxDataChange(Sender: TObject; Field: TField);
begin
     if ( QryAux.State in [ dsEdit, dsInsert ] ) and ( Field <> NIL ) then
        begin
             if ( Field.FieldName = 'EPLANT_ID' ) then
                ForceValue( QryAuxEPLANT_NAME, SelectValueFmtAsString( 'select name from eplant where id = %.0f',[Field.AsFloat] ));
        end;
end;

procedure TFrmIQAuxEquip.ForceValue(AField: TField; AValue: String);
var AIsRO: Boolean;
begin
     try
        AIsRO := AField.ReadOnly;
        AField.ReadOnly := FALSE;
        AField.AsString := AValue;
     finally
        AField.ReadOnly := AIsRO;
     end;
end;

procedure TFrmIQAuxEquip.cmbDivisionDropDown(Sender: TObject);
begin
     ReOpen( QryDivisionLookup );
end;

procedure TFrmIQAuxEquip.cmbDivisionCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
     if ( LookupTable = NIL ) or ( FillTable = NIL ) then Exit;

     if modified then
        begin
             // Make sure the "FillTable" (DataSet that is being filled with
             // the lookup value) is in edit mode.
             if not ( FillTable.State in [ dsEdit, dsInsert ] ) then
                FillTable.Edit;

             // Apply the ID Value in the Lookup dataset, to the Fill Table
             FillTable.FieldByName( 'DIVISION_ID' ).AsFloat := LookupTable.FieldByName('ID').AsFloat;

             // Apply the string value from the lookup dataset
             // to the Fill Table field that contains the display text
             FillTable.FieldByName( 'DIVISION_NAME' ).AsString :=  LookupTable.FieldByName('NAME').AsString;

             // Finally, update the combo box display text
             cmbDivision.Text :=  LookupTable.FieldByname('NAME').AsString;
        end;

end;

procedure TFrmIQAuxEquip.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmIQAuxEquip.Contents1Click(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmPM, iqhtmPM);  // IQMS.Common.HelpHook.pas
  IQHelp.HelpContext(1013985);
end;

procedure TFrmIQAuxEquip.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmIQAuxEquip.sbtnAuxToolingClick(Sender: TObject);
begin
  QryAux.CheckBrowseMode;
  TFrmBomAuxTool.DoShowModal(  QryAuxID.asFloat ); {bom_aux_tool.pas}
  RefreshDataSetByID(QryAux);
end;

end.
