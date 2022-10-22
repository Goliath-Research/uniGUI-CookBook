unit RBom_Cost_Param;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniRadioGroup,
  uniDBRadioGroup,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniPanel, System.Classes;

type
  TFrmRBomCostParam = class(TUniForm)
    PageControl1: TUniPageControl;
    tabGeneral: TUniTabSheet;
    TblQParams: TFDTable;
    SrcQParams: TDataSource;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    DBEdit1: TUniDBEdit;
    TblQParamsMARKUP_IS_POINTS: TStringField;
    TblQParamsQUOTE_DECIMAL: TBCDField;
    UniRadioGroup1: TUniRadioGroup;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure TblQParamsAfterOpen(DataSet: TDataSet);
    procedure UniRadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShowModal;
  end;

implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs;

class procedure TFrmRBomCostParam.DoShowModal;
var
  frm: TFrmRBomCostParam;
begin
  frm := TFrmRBomCostParam.Create(uniGUIApplication.UniApplication);
  frm.ShowModal;
end;

procedure TFrmRBomCostParam.FormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
end;

procedure TFrmRBomCostParam.TblQParamsAfterOpen(DataSet: TDataSet);
begin
  if TblQParams.FieldByName('MARKUP_IS_POINTS').AsString = 'N' then
    UniRadioGroup1.ItemIndex := 0;
  if TblQParams.FieldByName('MARKUP_IS_POINTS').AsString = 'Y' then
    UniRadioGroup1.ItemIndex := 1;

end;

procedure TFrmRBomCostParam.UniRadioGroup1Click(Sender: TObject);
begin
  TblQParams.Edit;
end;

procedure TFrmRBomCostParam.btnOKClick(Sender: TObject);
begin
  if TblQParams.State in [dsEdit, dsInsert] then
    case UniRadioGroup1.ItemIndex of
      0: TblQParams.FieldByName('MARKUP_IS_POINTS').AsString := 'N';
      1: TblQParams.FieldByName('MARKUP_IS_POINTS').AsString := 'Y';
    end; // case

  TblQParams.CheckBrowseMode;
  ModalResult := mrOK;
end;

procedure TFrmRBomCostParam.btnCancelClick(Sender: TObject);
begin
  if TblQParams.State in [dsEdit, dsInsert] then
    if IQConfirmYN('Save changes before exit?') then
      btnOKClick(nil);
  ModalResult := mrOK;
end;

end.
