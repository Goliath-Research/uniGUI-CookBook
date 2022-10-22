unit IQMS.Common.PrnOtherAttachments;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Mask,
  Data.DB,
  Datasnap.DBClient,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniDBNavigator, IQUniGrid, uniGUIFrame, uniFileUpload;

type
  TFrmPrnOtherAttachments = class(TUniForm)
    Panel1: TUniPanel;
    DBNavigator1: TUniDBNavigator;
    SrcAttachment: TDataSource;
    cdsAttachment: TClientDataSet;
    wwDBComboDlgFileName: TUniEdit;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel4: TUniPanel;
    wwDBGrid1: TIQUniGridControl;
    Bevel1: TUniPanel;
    UniFileUpload1: TUniFileUpload;
    procedure wwDBComboDlgFileNameCustomDlg(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsAttachmentBeforeDelete(DataSet: TDataSet);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFileUpload1Completed(Sender: TObject; AStream: TFileStream);
  private
    procedure LoadFrom(AFileList: TStringList);
    procedure SetFileList(const AFileList: TStringList);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( AOwner: TComponent; var AFileList: TStringList ): Boolean;
    procedure SaveTo(AFileList: TStringList);
    property FileList:TStringList Write SetFileList;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs;

class function TFrmPrnOtherAttachments.DoShowModal( AOwner: TComponent; var AFileList: TStringList ): Boolean;
begin
  with self.Create( uniGUIApplication.UniApplication ) do
  begin
    FileList:=AFileList;
    Result:= ShowModal = mrOK;
    if Result then
       SaveTo( AFileList );
  end;
end;

procedure TFrmPrnOtherAttachments.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]) ;
end;

procedure TFrmPrnOtherAttachments.cdsAttachmentBeforeDelete(
  DataSet: TDataSet);
begin
 if not IQConfirmYN('Remove this attachment?') then
    ABORT;
end;

procedure TFrmPrnOtherAttachments.wwDBComboDlgFileNameCustomDlg(
  Sender: TObject);
begin
  UniFileUpload1.Execute;
end;


procedure TFrmPrnOtherAttachments.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmPrnOtherAttachments.LoadFrom( AFileList: TStringList );
var
  I: Integer;
begin
  cdsAttachment.Close;
  cdsAttachment.CreateDataSet;
  cdsAttachment.Open;
  for I:= 0 to AFileList.Count - 1 do
  begin
    cdsAttachment.Append;
    cdsAttachment.FieldByName('fldFileName').asString:= AFileList[ I ];
    cdsAttachment.Post;
  end;

end;

procedure TFrmPrnOtherAttachments.SaveTo( AFileList: TStringList );
begin
  AFileList.Clear;

  cdsAttachment.First;
  while not cdsAttachment.Eof do
  begin
    AFileList.Add( cdsAttachment.FieldByName('fldFileName').asString );
    cdsAttachment.Next;
  end;
end;


procedure TFrmPrnOtherAttachments.SetFileList(const AFileList: TStringList);
begin
  LoadFrom( AFileList );
end;

procedure TFrmPrnOtherAttachments.UniFileUpload1Completed(Sender: TObject;
  AStream: TFileStream);
begin
      cdsAttachment.Edit;
      cdsAttachment.FieldByName('fldFileName').asString:= AStream.FileName;
      cdsAttachment.Post;
end;

procedure TFrmPrnOtherAttachments.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
end;

end.
