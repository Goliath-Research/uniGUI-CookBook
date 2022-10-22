unit qc_dev_wf_filter;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  wf_filter,
  Db,
  StdCtrls,
  uniGUIApplication,
  wf_const,
  FireDAC.Comp.Client,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniGroupBox,
  uniMultiItem,
  uniListBox,
  uniDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  uniComboBox, uniDBComboBox, uniButton;

type
  TFrmWorkflowFilterDev = class(TFrmWorkflowFilter)
    GroupBox3: TUniGroupBox;
    rbtnVendAll: TUniRadioButton;
    rbtnVendOne: TUniRadioButton;
    wwDBLookupComboVendor: TUniDBLookupComboBox;
    QryVendor: TFDQuery;
    QryVendorID: TBCDField;
    QryVendorVENDORNO: TStringField;
    QryVendorCOMPANY: TStringField;
    DataSource2: TDataSource;
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlVendDropDown(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVars( AFilter: TWorkflowFilter ); override;
  public
    { Public declarations }
    procedure AssignFilter( var AFilter: TWorkflowFilter ); override;
    class function DoModify( var AFilter: TWorkflowFilter ): Boolean;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib;

{ TFrmWorkflowFilterDev }

class function TFrmWorkflowFilterDev.DoModify( var AFilter: TWorkflowFilter ): Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
  begin
    Filter:=AFilter;
    Result:= ShowModal = mrOK;
    if Result then
       AssignFilter( AFilter );
  end;
end;



procedure TFrmWorkflowFilterDev.InitVars(AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    rbtnVendAll.Checked:= Vendor_ID <= 0;
    rbtnVendOne.Checked:= Vendor_ID > 0;
    if rbtnVendOne.Checked then with wwDBLookupComboVendor do
    begin
      ItemIndex:= items.IndexOf(SelectValueByID( 'vendorno', 'vendor', Vendor_ID ));
    end;
  end;
end;

procedure TFrmWorkflowFilterDev.btnOKClick(Sender: TObject);
begin
  if rbtnVendOne.Checked and (wwDBLookupComboVendor.Text = '') then
     raise Exception.Create('Vendor is not selected');

  inherited;
end;

procedure TFrmWorkflowFilterDev.EnableControlVendDropDown(Sender: TObject);
begin
  IQEnableControl( wwDBLookupComboVendor, rbtnVendOne.Checked );
end;

procedure TFrmWorkflowFilterDev.AssignFilter(var AFilter: TWorkflowFilter);
begin
  inherited;

  with AFilter do
  begin
    if rbtnVendAll.Checked then
       Vendor_ID:= 0
    else
       Vendor_ID:= QryVendorID.asFloat;
  end;
end;

end.
