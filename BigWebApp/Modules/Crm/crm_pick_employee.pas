unit crm_pick_employee;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Search,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, IQUniGrid, uniGUIFrame;

type
  TFrmCRMPickEmployee = class(TUniForm)
    PnlGrid: TUniPanel;
    PnlButtons: TUniPanel;
    Grid: TIQUniGridControl;
    SrcData: TDataSource;
    QryData: TFDQuery;
    Panel1: TUniPanel;
    btnOK: TUniBitBtn;
    btnCancel: TUniBitBtn;
    QryDataID: TBCDField;
    QryDataEMPNO: TStringField;
    QryDataFIRST_NAME: TStringField;
    QryDataNICKNAME: TStringField;
    QryDataMIDDLE_NAME: TStringField;
    QryDataLAST_NAME: TStringField;
    QryDataDISPLAY_NAME: TStringField;
    QryDataADDR1: TStringField;
    QryDataCITY: TStringField;
    QryDataSTATE: TStringField;
    QryDataCOUNTRY: TStringField;
    QryDataZIP: TStringField;
    QryDataEMAIL: TStringField;
    QryDataUSER_NAME: TStringField;
    QryDataEPLANT_ID: TBCDField;
    QryDataEPLANT_NAME: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetSelectedEmployees: Variant;
  public
    { Public declarations }
  end;

function DoSelectEmployees: Variant;


implementation

{$R *.dfm}


uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

function DoSelectEmployees: Variant;
begin
  with TFrmCRMPickEmployee.Create(uniGUIApplication.UniApplication) do
    try
      if ShowModal = mrOk then
        Result := GetSelectedEmployees;
    finally
      Release;
    end;
end;

{ TFrmCRMPickEmployee }

procedure TFrmCRMPickEmployee.FormCreate(Sender: TObject);
begin
  ReOpen(QryData); // iqlib
end;

function TFrmCRMPickEmployee.GetSelectedEmployees: Variant;
var
  i, x: Integer;
begin

  // x := 0; // initial
//  wwDBGrid.SelectedList.Count
  if Grid.DBGrid.SelectedRows.Count > 1 then
    begin
      Result := VarArrayCreate([0, Grid.DBGrid.SelectedRows.Count - 1],
        varVariant);
      with Grid.DBGrid, Grid.DBGrid.DataSource.DataSet do
        try
          DisableControls;
          // Cycle selected rows and update the dataset
          for i := 0 to SelectedRows.Count - 1 do
            begin
              GotoBookmark(SelectedRows.Items[i]);
              Freebookmark(SelectedRows.Items[i]);
              Result[i] := QryDataID.AsFloat;
            end;
        finally
          //Javascript alternative to uniDBgrid.UnselectAll
          UniSession.AddJS(Grid.DBGrid.JSName + '.getSelectionModel().deselectAll()');
          EnableControls;
        end;
    end
  else if QryDataID.AsFloat > 0 then
    begin
      Result := VarArrayCreate([0, 0], varVariant);
      Result[0] := QryDataID.AsFloat;
    end;

end;

end.
