// Ship Via Maintenance = Sales & Distribution
unit ShipViaMaintenance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBNavigator, uniButton, uniPanel, uniCheckBox,
  uniDBCheckBox, uniBitBtn, uniSpeedButton, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniEdit, uniDBEdit, uniSplitter, uniLabel,
  uniBasicGrid, uniDBGrid, uniPageControl, Vcl.Menus, uniMainMenu,
  uniGUIBaseClasses, uniImageList,
  ShipViaMaintenance_DM, IQUniGrid, IQUniEditor, IQUniEditorDlg,
  IQUniEditorDlgPickDataSet, System.Actions, Vcl.ActnList,
  IQWeb.Session.RegServices;

type
  TUniShipViaMaintenance = class(TUniFrame, IIQLocatable)
    UniContainerPanel1: TUniContainerPanel;
    UniMainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    New1: TUniMenuItem;
    ShippingHolidays1: TUniMenuItem;
    ShippingTrailersContainers1: TUniMenuItem;
    Reports1: TUniMenuItem;
    Print1: TUniMenuItem;
    PrinterSetup1: TUniMenuItem;
    Help1: TUniMenuItem;
    Contents1: TUniMenuItem;
    About1: TUniMenuItem;
    IQUniGridControl1: TIQUniGridControl;
    ActionList1: TActionList;
    Action1: TAction;
    FreightPicker: TIQUniEditorDlgPickDataSet;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure UniSpeedButtonSearchClick(Sender: TObject);
    procedure FreightPickerDialogResult(Sender: TObject;
      Intf: IIQEditorDialog; var Handled: Boolean);
  private
    { Private declarations }
    procedure LocateID(aID : integer);
  public
    { Public declarations }
  end;

implementation

uses
  Main;

{$R *.dfm}

procedure TUniShipViaMaintenance.LocateID(aID: integer);
begin
  SVM_DM.dsFreight.DataSet.Locate('ID', aID, []);
end;

procedure TUniShipViaMaintenance.UniFrameCreate(Sender: TObject);
begin
  SVM_DM.Initialize;
end;

procedure TUniShipViaMaintenance.UniFrameDestroy(Sender: TObject);
begin
  SVM_DM.Finalize;
end;

procedure TUniShipViaMaintenance.UniSpeedButtonSearchClick(Sender: TObject);
begin
  with SVM_DM do
    if QryFreight.RecordCount > 0 then
      FreightPicker.Text := QryFreightID.AsString;

  FreightPicker.ExecTrigger(1);
end;

procedure TUniShipViaMaintenance.FreightPickerDialogResult(
  Sender: TObject; Intf: IIQEditorDialog; var Handled: Boolean);
begin
  if Intf.DialogResult = mrOK then
  begin
    SVM_DM.QryFreight.Locate('ID', Intf.DialogValue, []);

    Handled := true;
  end;
end;

initialization
  RegisterClass(TUniShipViaMaintenance);

end.
