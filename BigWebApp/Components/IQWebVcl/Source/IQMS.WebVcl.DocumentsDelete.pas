unit IQMS.WebVcl.DocumentsDelete;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Forms,uniGUIFrame,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniCheckBox,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, Vcl.Controls, uniGUIMainModule;

type
  TIQWebDocDelete = class(TUniForm)
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlMain: TUniPanel;
    btnCancel: TUniButton;
    btnOK: TUniButton;
    cbRemoveFromSys: TUniCheckBox;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function GetDocsLink : TFDDataSet;
  public
    { Public declarations }
    property DocsLink: TFDDataSet  read GetDocsLink;
  end;

procedure DoDelDocument;


implementation

{$R *.DFM}

uses
  IQMS.Common.Controls,
  IQMS.WebVcl.Documents,
  IQMS.Common.Dialogs,
  IQMS.Common.NLS,
  IQMS.WebVcl.ResourceStrings;

procedure DoDelDocument;
var
  IQWebDocDelete: TIQWebDocDelete;
begin
  IQWebDocDelete:=TIQWebDocDelete.Create(uniGUIApplication.UniApplication);
  IQWebDocDelete.ShowModal;
end;

procedure TIQWebDocDelete.FormCreate(Sender: TObject);
begin
  // Caption:= 'Del ' + DocsLink.FieldByName('Descrip').asString;
  Caption := Format( IQMS.WebVcl.ResourceStrings.cTXT0000018 {'Delete %s'}, [DocsLink.FieldByName('Descrip').AsString] );
//  IQMS.Common.Controls.ResizeCheckBoxes(Self, PnlMain);
end;

procedure TIQWebDocDelete.FormShow(Sender: TObject);
begin
//  CenterForm(Self);
end;

function TIQWebDocDelete.GetDocsLink : TFDDataSet;
begin
  Result:= TIQWebDocs(Owner).DocsLink;
end;

procedure TIQWebDocDelete.btnOKClick(Sender: TObject);
var
  id:Real;
begin
  with DocsLink do
    if Eof and Bof then raise Exception.Create( IQMS.WebVcl.ResourceStrings.cTXT0000019 {'No documents found.  Cannot delete.'} );

  case cbRemoveFromSys.Checked of
    FALSE: if not IQWarningYN(IQMS.WebVcl.ResourceStrings.cTXT0000020 {'Are you sure you want to delete (detach) this document?'}) then ABORT;
    TRUE : if not IQWarningYN(IQMS.WebVcl.ResourceStrings.cTXT0000021 {'Are you sure you want to remove this document completely from the system?'}) then ABORT;
  end;

  id:= DocsLink.FieldByName('IQ_DOCS_ID').AsFloat;
  DocsLink.Delete;

  if cbRemoveFromSys.Checked then
    with TFDQuery.Create(self) do
    try
      ConnectionName:='IQFD';
      SQL.Add( IQFormat('delete from IQ_DOCS where ID = %f', [ id ]));
      ExecSQL;
    finally
      Free;
    end;
end;

end.

