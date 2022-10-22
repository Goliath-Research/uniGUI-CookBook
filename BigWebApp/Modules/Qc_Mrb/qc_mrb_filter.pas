unit qc_mrb_filter;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  wf_filter,
  Data.DB,
  wf_const,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniGUIApplication,
  uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  uniComboBox, uniDBComboBox, uniButton;

type
  TFrmWorkflowFilterMRB = class(TFrmWorkflowFilter)
    t: TUniGroupBox;
    rbtnVendAll: TUniRadioButton;
    rbtnVendOne: TUniRadioButton;
    wwDBLookupComboVendor: TUniDBLookupComboBox;
    QryVendor: TFDQuery;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    QryVendorID: TBCDField;
    SrcQryArcusto: TDataSource;
    SrcQryVendor: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlVendDropDown(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVars(AFilter: TWorkflowFilter); override;
  public
    { Public declarations }
    procedure AssignFilter(var AFilter: TWorkflowFilter); override;
    class function DoModify(var AFilter: TWorkflowFilter): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Controls;

{ TFrmWorkflowFilterMRB }

procedure TFrmWorkflowFilterMRB.AssignFilter(var AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    if rbtnVendAll.Checked then
      Vendor_ID := 0
    else
      Vendor_ID := QryVendorID.asFloat;
  end;
end;

class function TFrmWorkflowFilterMRB.DoModify(var AFilter
  : TWorkflowFilter): Boolean;
var
  LFrmWorkflowFilterMRB: TFrmWorkflowFilterMRB;
begin
  LFrmWorkflowFilterMRB := TFrmWorkflowFilterMRB.Create
    (uniGUIApplication.UniApplication);
  Result := LFrmWorkflowFilterMRB.ShowModal = mrOK;
  if Result then
    LFrmWorkflowFilterMRB.AssignFilter(AFilter);

end;

procedure TFrmWorkflowFilterMRB.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    rbtnVendAll.Checked := Vendor_ID <= 0;
    rbtnVendOne.Checked := Vendor_ID > 0;
    if rbtnVendOne.Checked then
      with wwDBLookupComboVendor do
      begin
        { TODO -omugdha -cWebConvert : TuniDBLookupCombo does not contain lookup value and performSearch LookupValue := SelectValueByID('vendorno', 'vendor', Vendor_ID);
        PerformSearch;
        }
      end;
  end;
end;

procedure TFrmWorkflowFilterMRB.btnOKClick(Sender: TObject);
begin
  if rbtnVendOne.Checked and (wwDBLookupComboVendor.Text = '') then
    raise Exception.Create('Vendor is not selected');

  inherited;
end;

procedure TFrmWorkflowFilterMRB.EnableControlVendDropDown(Sender: TObject);
begin
  IQEnableControl(wwDBLookupComboVendor, rbtnVendOne.Checked);
end;

end.
