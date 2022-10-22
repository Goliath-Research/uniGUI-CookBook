unit inv_trans_staging_params;

interface

uses
  Winapi.Windows,
  System.Classes,
  Vcl.Forms,
  FireDAC.Comp.Client,
  Data.DB,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniDBCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniPageControl;

type
  TFrmInvTransStagingParams = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    pgctrlMain: TUniPageControl;
    TabSheet1: TUniTabSheet;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDUpdateSQL1: TFDUpdateSQL;
    FDQuery1HARD_ALLOC_RAW_MAT_DIRECT_MOVE: TStringField;
    Panel4: TUniPanel;
    DBCheckBox1: TUniDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

{ TFrmInvTransStagingParams }

procedure TFrmInvTransStagingParams.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvTransStagingParams.btnOKClick(Sender: TObject);
begin
  FDQuery1.CheckBrowseMode;
  Close;
end;

class procedure TFrmInvTransStagingParams.DoShow;
var
  frm: TFrmInvTransStagingParams;
begin
  frm := TFrmInvTransStagingParams.Create(uniGUIApplication.UniApplication);
  frm.Show;
end;

procedure TFrmInvTransStagingParams.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmInvTransStagingParams.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  IQRegFormRead( self, [ self ]);
  IQMS.Common.Controls.AdjustPageControlToParent( pgctrlMain );
end;

end.
