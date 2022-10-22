unit Mat_MBatch_Edit;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Mat_edit,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, uniButton, uniBitBtn,
  uniDBCheckBox, uniCheckBox, uniDBComboBox, uniEdit, uniDBEdit, uniGUIClasses,
  uniMultiItem, uniComboBox, uniDBLookupComboBox, uniLabel, uniSplitter,
  System.Classes, Vcl.Forms, uniGUIBaseClasses, uniPanel;

type
  TMatMBatchEdit = class(TMatEdit)
    procedure BitBtnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  add_edit;

procedure TMatMBatchEdit.BitBtnOKClick(Sender: TObject);
begin
  with DataSource1.DataSet do
  begin
    Post;
    Refresh;
  end;

  if chkRFQRequired.Checked then
     Create_RFQ_PlaceHolder_For_Attached_Item( TFDTable(DataSource1.DataSet).FieldByName('id').asFloat {qopmat.id} );

  ModalResult:= mrOK;
end;

end.
