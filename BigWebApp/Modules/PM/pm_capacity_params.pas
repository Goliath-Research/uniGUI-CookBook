unit pm_capacity_params;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
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
  uniEdit,
  uniDBEdit,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  { TFrmPM_Capacity_Params }
  TFrmPM_Capacity_Params = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    GroupBox1: TUniGroupBox;
    Label4: TUniLabel;
    Label5: TUniLabel;
    DBEdit3: TUniDBEdit;
    DBEdit4: TUniDBEdit;
    SrcParams: TDataSource;
    TblParams: TFDTable;
    TblParamsPM_CAPACITY_AVAIL_THRESHOLD: TBCDField;
    TblParamsPM_CAPACITY_BOOKED_THRESHOLD: TBCDField;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure Validate;
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal: Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  pm_rscstr;

class function TFrmPM_Capacity_Params.DoShowModal: Boolean;
var
  LFrmPM_Capacity_Params : TFrmPM_Capacity_Params;
begin
  LFrmPM_Capacity_Params := TFrmPM_Capacity_Params.Create(UniGUIApplication.UniApplication);
  Result := LFrmPM_Capacity_Params.ShowModal = mrOK;
end;

procedure TFrmPM_Capacity_Params.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmPM_Capacity_Params.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmPM_Capacity_Params.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPM_Capacity_Params.btnOKClick(Sender: TObject);
begin
  if TblParams.State in [dsEdit, dsInsert] then
    begin
      Validate;
      TblParams.Post;
    end;
  ModalResult := mrOK;
end;

procedure TFrmPM_Capacity_Params.Validate;
begin
  // pm_rscstr.cTXT0000365 = 'Please enter a value greater than zero for Available Threshold.';
  IQAssert(TblParamsPM_CAPACITY_AVAIL_THRESHOLD.asFloat >= 0,
    pm_rscstr.cTXT0000365);
  // pm_rscstr.cTXT0000366 = 'Please enter a value greater than zero for Booked Threshold.';
  IQAssert(TblParamsPM_CAPACITY_BOOKED_THRESHOLD.asFloat >= 0,
    pm_rscstr.cTXT0000366);
end;

end.
