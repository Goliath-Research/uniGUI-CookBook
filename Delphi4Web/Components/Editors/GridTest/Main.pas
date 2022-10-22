unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIFrame, D4W.HyperGrid,
  DB, Datasnap.DBClient, uniGUIBaseClasses, uniImageList, uniPanel,
  uniPageControl, uniEdit, uniDBGrid, uniMultiItem, uniComboBox, uniDBComboBox,
  D4WEditor, uniCheckBox, uniDBCheckBox, uniMemo, uniSpinEdit,
  D4WEditorRegDlg, uniDateTimePicker;

type
  TMainForm = class(TUniForm)
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1OrderNo: TFloatField;
    ClientDataSet1CustNo: TFloatField;
    ClientDataSet1SaleDate: TDateTimeField;
    ClientDataSet1ShipDate: TDateTimeField;
    ClientDataSet1EmpNo: TIntegerField;
    ClientDataSet1ShipToContact: TStringField;
    ClientDataSet1ShipToAddr1: TStringField;
    ClientDataSet1ShipToAddr2: TStringField;
    ClientDataSet1ShipToCity: TStringField;
    ClientDataSet1ShipToState: TStringField;
    ClientDataSet1ShipToZip: TStringField;
    ClientDataSet1ShipToCountry: TStringField;
    ClientDataSet1ShipToPhone: TStringField;
    ClientDataSet1ShipVIA: TStringField;
    ClientDataSet1PO: TStringField;
    ClientDataSet1Terms: TStringField;
    ClientDataSet1PaymentMethod: TStringField;
    ClientDataSet1ItemsTotal: TCurrencyField;
    ClientDataSet1TaxRate: TFloatField;
    ClientDataSet1Freight: TCurrencyField;
    ClientDataSet1AmountPaid: TCurrencyField;
    ClientDataSet2: TClientDataSet;
    ClientDataSet2Name: TStringField;
    DataSource2: TDataSource;
    ClientDataSet2ID: TStringField;
    D4WGrid1: TD4WHyperGrid;
    procedure D4WGrid1D4WEditor1Change(Sender: TObject);
    procedure D4WGrid1D4WEditor1CloseUp(Sender: TObject);
    procedure D4WGrid1Create(Sender: TObject);
    procedure D4WGrid1D4WEditor1Select(Sender: TObject);
    procedure D4WGrid1DBGridAfterLoad(Sender: TUniDBGrid);
    procedure D4WGrid1D4WEditor2Exit(Sender: TObject);
    procedure D4WGrid1ABCDDropDown(Sender: TObject);
    procedure D4WGrid1D4WPanel4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  published
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.D4WGrid1ABCDDropDown(Sender: TObject);
begin
//
end;

procedure TMainForm.D4WGrid1Create(Sender: TObject);
begin
//
end;

procedure TMainForm.D4WGrid1DBGridAfterLoad(Sender: TUniDBGrid);
begin
//
end;

procedure TMainForm.D4WGrid1D4WEditor1Change(Sender: TObject);
begin
  Caption := (Sender as TUniFormControl).Text;
end;

procedure TMainForm.D4WGrid1D4WEditor1CloseUp(Sender: TObject);
begin
  ShowMessage('CU');
end;

procedure TMainForm.D4WGrid1D4WEditor1Select(Sender: TObject);
begin
//
end;

procedure TMainForm.D4WGrid1D4WEditor2Exit(Sender: TObject);
begin
//
end;

procedure TMainForm.D4WGrid1D4WPanel4Click(Sender: TObject);
begin
//
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
