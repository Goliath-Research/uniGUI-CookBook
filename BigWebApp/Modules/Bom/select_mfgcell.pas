unit select_mfgcell;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Data.DB,
  FireDAC.Comp.Client,
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
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniRadioButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmSelectMfgCell = class(TUniForm)
    Panel2: TUniPanel;
    Bevel1: TUniPanel;
    rbtnAllCells: TUniRadioButton;
    rbtnOneCell: TUniRadioButton;
    wwDBGrid1: TIQUniGridControl;
    SrcMfgCell: TDataSource;
    QryMfgCell: TFDQuery;
    QryMfgCellMFGCELL: TStringField;
    QryMfgCellMFGTYPE: TStringField;
    QryMfgCellDESCRIP: TStringField;
    QryMfgCellEPLANT_ID: TBCDField;
    QryMfgCellPLANT_NAME: TStringField;
    QryMfgCellMFGCELL_ID: TBCDField;
    Panel1: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryMfgCellBeforeOpen(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure EnableControlsOnForm(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( var AMfgCell_ID: Real ): Boolean;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Controls;

{ TFrmSelectMfgCell }

class function TFrmSelectMfgCell.DoShowModal(var AMfgCell_ID: Real): Boolean;
var
  LFrmSelectMfgCell : TFrmSelectMfgCell;
begin
  LFrmSelectMfgCell := TFrmSelectMfgCell.Create( uniGUIApplication.UniApplication );
  Result:= LFrmSelectMfgCell.ShowModal = mrOK;
  if Result then
  begin
    if LFrmSelectMfgCell.rbtnAllCells.Checked then
       AMfgCell_ID:= 0
    else
       AMfgCell_ID:= LFrmSelectMfgCell.QryMfgCellMFGCELL_ID.asFloat;
  end;
end;

procedure TFrmSelectMfgCell.FormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
  IQSetTablesActive( TRUE, self );
  EnableControlsOnForm(nil);
end;

procedure TFrmSelectMfgCell.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmSelectMfgCell.QryMfgCellBeforeOpen(DataSet: TDataSet);
begin
  IQAssignEPlantFilter( DataSet );
end;

procedure TFrmSelectMfgCell.btnOKClick(Sender: TObject);
begin
  if rbtnOneCell.Checked then
     IQAssert( not(QryMfgCell.Bof and QryMfgCell.Eof), 'No MfgCell is selected.' );
  ModalResult:= mrOK;
end;

procedure TFrmSelectMfgCell.EnableControlsOnForm(Sender: TObject);
begin
  IQEnableControl( wwDBGrid1, rbtnOneCell.Checked );
end;

end.
