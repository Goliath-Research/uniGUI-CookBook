unit IQMS.Common.QC_PkBase;

interface

uses
  Winapi.Windows,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.Search,
//  Vcl.Wwdatsrc,
  FireDAC.Comp.Client,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  System.Classes,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, IQUniGrid, uniGUIFrame;

type
  TFrmQC_PkBase = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    Panel1: TUniPanel;
    wwDataSource1: TDataSource;
    wwQuery1: TFDQuery;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure IQSearch1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.DFM}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm;

procedure TFrmQC_PkBase.FormCreate(Sender: TObject);
begin
  IQSetTablesActive( TRUE, self );
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmQC_PkBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmQC_PkBase.btnOKClick(Sender: TObject);
begin
  if not(wwQuery1.Eof and wwQuery1.Bof) then
     ModalResult:= mrOK
  else
     ModalResult:= mrCancel;
end;

procedure TFrmQC_PkBase.IQSearch1DblClick(Sender: TObject);
begin
  btnOK.Click;
end;

end.
