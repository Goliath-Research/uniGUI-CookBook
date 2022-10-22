unit po_archive_batch;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  IQMS.Common.JumpConstants,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  System.Generics.Collections,
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
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmPOArchiveBatch = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryPO: TFDQuery;
    SrcPO: TDataSource;
    QryPOID: TBCDField;
    QryPOPONO: TStringField;
    QryPOVENDOR_ID: TBCDField;
    QryPOPO_DATE: TDateTimeField;
    QryPOCOMPANY: TStringField;
    QryPOVENDORNO: TStringField;
    QryPOAPPROVED_BY: TStringField;
    QryPOEPLANT_ID: TBCDField;
    QryPOBUYERID: TStringField;
    IQSearch1: TIQUniGridControl;
    QryPOKIND: TStringField;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    QryPOUSERID: TStringField;
    QryPOREQUESTED_BY: TStringField;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IQSearch1AfterSortChange(Sender: TObject);
    procedure IQSearch1UserBtn1OnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FList: TList<Int64>;
    procedure IQNotify(var Msg: TMessage); message iq_Notify;
    procedure MarkCandidatesForArchiving;
    procedure SetList(const Value: TList<Int64>);
  public
    { Public declarations }
    property List: TList<Int64> write SetList;
    class function DoShowModal(AList: TList<Int64>): Boolean;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.Dialogs,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.PanelMsg,
  po_rscstr;

class function TFrmPOArchiveBatch.DoShowModal(AList: TList<Int64>): Boolean;
var
  LFrmPOArchiveBatch : TFrmPOArchiveBatch;
begin
  LFrmPOArchiveBatch := TFrmPOArchiveBatch.Create(UniGUIApplication.UniApplication);
  LFrmPOArchiveBatch.List := AList;
  Result := LFrmPOArchiveBatch.ShowModal = mrOK;
end;

procedure TFrmPOArchiveBatch.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmPOArchiveBatch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmPOArchiveBatch.Exit1Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmPOArchiveBatch.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmPOArchiveBatch.MarkCandidatesForArchiving;
var
  hMsg: TPanelMesg;
begin
  // po_rscstr.cTXT0000137 = 'Marking purchased orders.  Please wait ...';
  hMsg := hPleaseWait(po_rscstr.cTXT0000137);
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain UnselectAll
  IQSearch1.DBGrid.UnselectAll;     }
  try
    Reopen(QryPO);
    with QryPO do
      try
        DisableControls;
        while not Eof do
        begin
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain UnselectAll
          if FList.IndexOf(FieldByName('id').AsLargeInt) > - 1 then
            IQSearch1.DBGrid.SelectRecord;   }
          Next;
        end;
        QryPO.First;
      finally
        EnableControls;
      end;
  finally
    hMsg.Free;
  end;

  // po_rscstr.cTXT0000138 =
  // 'Finished marking purchase orders.'#13#13'Number of records marked: %d.';
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList
  IQInformation(Format(
    po_rscstr.cTXT0000138,
    [IQSearch1.DBGrid.SelectedList.Count]));  }
end;

procedure TFrmPOArchiveBatch.SetList(const Value: TList<Int64>);
begin
  FList := Value;
end;

procedure TFrmPOArchiveBatch.UniFormCreate(Sender: TObject);
begin
  IQSetTablesActive(TRUE, self);
  PostMessage(Handle, iq_Notify, 0, 0);
end;

procedure TFrmPOArchiveBatch.IQNotify(var Msg: TMessage);
begin
  MarkCandidatesForArchiving;
end;

procedure TFrmPOArchiveBatch.IQSearch1AfterSortChange(Sender: TObject);
begin
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain UnselectAll
  IQSearch1.DBGrid.UnselectAll;  }
end;

procedure TFrmPOArchiveBatch.IQSearch1UserBtn1OnClick(Sender: TObject);
begin
  MarkCandidatesForArchiving;
end;

procedure TFrmPOArchiveBatch.btnOKClick(Sender: TObject);
var
  I: Integer;
begin
  // po_rscstr.cTXT0000139 =
  // 'About to archive and delete %d purchased order(s). Please confirm to continue.';
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList
  if (IQSearch1.DBGrid.SelectedList.Count > 0) and
    not IQConfirmYN(Format(po_rscstr.cTXT0000139,
    [IQSearch1.DBGrid.SelectedList.Count])) then
    Exit;  }

  FList.Clear;

  with IQSearch1 do
  begin
    DataSource.DataSet.DisableControls;
    try
{ TODO -oGPatil -cWebConvert : TUniDBGrid does not contain SelectedList
      if DBGrid.SelectedList.Count > 0 then
        for I := 0 to DBGrid.SelectedList.Count - 1 do
        begin
          DataSource.DataSet.GotoBookmark(DBGrid.SelectedList.Items[I]);
          FList.Add(DataSource.DataSet.FieldByName('id').AsLargeInt);
        end
      else if not (DataSource.DataSet.Eof and DataSource.DataSet.Bof) then
        FList.Add(DataSource.DataSet.FieldByName('id').AsLargeInt);    }
    finally
      DataSource.DataSet.EnableControls;
    end;
  end;

  ModalResult := mrOK;
end;

end.
