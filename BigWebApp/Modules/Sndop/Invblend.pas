unit Invblend;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Mask,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniDBEdit,
  uniButton,
  uniBitBtn,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TInvBlendEdit = class(TUniForm)
    SrcArinvt: TDataSource;
    PnlButtons: TUniPanel;
    bbtnOK: TUniBitBtn;
    bbtnCancel: TUniBitBtn;
    Panel1: TUniPanel;
    Splitter1: TUniSplitter;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    Label5: TUniLabel;
    Label4: TUniLabel;
    dbeClass: TUniDBEdit;
    dbeItemNo: TUniDBEdit;
    dbeRev: TUniDBEdit;
    dbeUnit: TUniDBEdit;
    dbeDescrip: TUniDBEdit;
    DBEdit1: TUniDBEdit;
    Label6: TUniLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ArinvtID:Real;
  end;

implementation

{$R *.DFM}
uses
  IQMS.Common.HelpHook;

procedure TInvBlendEdit.FormShow(Sender: TObject);
begin
  with TFDTable(SrcArinvt.DataSet) do
  begin
    //if (ArinvtID > 0) and ( FindKey( [ ArinvtID ] )) then
    if (ArinvtID > 0) and (Locate( 'ID', ArinvtID, [])) then
       Edit
    else
      Insert;
  end
end;

procedure TInvBlendEdit.FormCreate(Sender: TObject);
begin
  ArinvtID := 0;
end;

procedure TInvBlendEdit.bbtnOKClick(Sender: TObject);
begin
  try
    TFDTable(SrcArinvt.DataSet).Post;
    ArinvtID:= TFDTable(SrcArinvt.DataSet).FieldByName('ID').Value;
  except
    on E:Exception do begin
//      MessageDlg(E.Message, mtError, [mbOK], 0);
      ModalResult:= mrNone;
    end
  end
end;

procedure TInvBlendEdit.bbtnCancelClick(Sender: TObject);
begin
  TFDTable(SrcArinvt.DataSet).Cancel;
  ArinvtID:= 0;
end;

procedure TInvBlendEdit.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmMFG{CHM}, iqhtmQUOTE{HTM} );  {IQMS.Common.HelpHook.pas}
end;

end.

