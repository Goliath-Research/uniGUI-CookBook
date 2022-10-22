unit FaBkHist;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Data.DB,
  Vcl.Wwdatsrc,
  IQMS.WebVcl.Search,
  { TODO -omugdha -cWEBIQ : Dependency on on  FaMaint
  FaMaint,  }
  IQMS.WebVcl.About,
  Vcl.Menus,
  Mask,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
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
  Vcl.Controls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmBookPostings = class(TUniForm)
    IQSearch1: TIQUniGridControl;
    SrcPost: TDataSource;
    QryPost: TFDQuery;
    QryPostID: TBCDField;
    QryPostPOST_DATE: TDateTimeField;
    QryPostGLPERIODS_ID: TBCDField;
    QryPostAMOUNT: TBCDField;
    QryPostBEG_BALANCE: TStringField;
    QryPostPERIOD: TBCDField;
    QryPostYEAR: TStringField;
    Panel1: TUniPanel;
    Nav: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    Exit1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Shape1: TUniPanel;
    QryPostGLBATCHID_ID: TBCDField;
    UpdateSQL1: TFDUpdateSQL;
    QryPostFA_BOOK_ID: TBCDField;
    wwDBPeriod: TUniEdit;
    QryPostFINALIZED_DATE: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    { TODO -omugdha -cWEBIQ : Dependency on on TNavigateBtn
    procedure NavBeforeAction(Sender: TObject; Button: TNavigateBtn); }
    procedure QryPostBeforePost(DataSet: TDataSet);
    procedure QryPostAfterPost(DataSet: TDataSet);
    procedure wwDBPeriodCustomDlg(Sender: TObject);
    procedure QryPostAfterInsert(DataSet: TDataSet);
    procedure QryPostBeforeEdit(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  protected
  { TODO -omugdha -cWEBIQ : Undeclared identifier: 'TGridDrawState'
    procedure GridCalcCellColors(Sender: TObject;
              Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
              ABrush: TBrush);  }
  private
    { Private declarations }
  public
    { Public declarations }
  //  constructor Create(AOwner:TComponent);override;
  end;

procedure DoShowBookHist();


implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.Period;
{$R *.DFM}

procedure DoShowBookHist();
var
  LFrmBookPostings : TFrmBookPostings;
begin
// with TFrmBookPostings.Create(AOwner) do Show;
  LFrmBookPostings := TFrmBookPostings.Create(uniGUIApplication.UniApplication);
  LFrmBookPostings.Show;

end;

procedure TFrmBookPostings.UniFormCreate(Sender: TObject);
begin
{ TODO -omugdha -cWEBIQ : Undeclared identifier: 'wwDBGrid'
  IqSearch1.wwDBGrid.OnCalcCellColors := GridCalcCellColors;
  QryPost.DataSource := TFaMaintenance(AOwner).SrcBooks;
  wwDBPeriod.Parent  := IQSearch1.wwDBGrid; }
  wwDBPeriod.Visible := False;

  IQSetTablesActive( True, self );
  IQRegFormRead( Self, [ Self]);
end;



procedure TFrmBookPostings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( Self, [ Self]);
end;

procedure TFrmBookPostings.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBookPostings.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;
{ TODO -omugdha -cWEBIQ : Dependency on on TNavigateBtn
procedure TFrmBookPostings.NavBeforeAction(Sender: TObject; Button: TNavigateBtn);
var
  AId:Real;
begin
  if Button = nbDelete then
  begin
    if QryPostFINALIZED_DATE.asDateTime <> 0 then
      raise Exception.Create('Record is Finalized cannot delete');

    if SelectValueFmtAsFloat('select NVL(glbatchid_id, 0) from FA_DEPR_POSTING where id = %f', [QryPostID.asFloat]) <> 0 then
      raise Exception.Create('Record is posted to the GL cannot delete');

    if IqConfirmYN('Delete record?') then
    begin
      ExecuteCommandFmt('delete from FA_DEPR_POSTING where id = %f', [QryPostID.asFloat]);
      QryPost.Close;
      QryPost.Open;
    end;
    Abort;
  end
  else if Button = nbRefresh then
  begin
    AId := QryPostID.asFloat;
    QryPost.Close;
    QryPost.Open;
    QryPost.Locate('ID', AId, []);
    Abort;
  end;
end;
  }
  { TODO -omugdha -cWEBIQ : Undeclared identifier: 'TGridDrawState'
procedure TFrmBookPostings.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if QryPostGLBATCHID_ID.asFloat <> 0 then
  begin
    ABrush.Color := clLime;
    AFont.Color := clBlack;
  end;
  if Highlight then
  begin
    ABrush.Color:= clBlue;
    AFont.Color := clWhite;
  end;
end;
 }

procedure TFrmBookPostings.QryPostBeforePost(DataSet: TDataSet);
begin
  if QryPostID.asFloat = 0 then
    QryPostID.asFloat := GetNextID('FA_DEPR_POSTING');

end;


procedure TFrmBookPostings.QryPostAfterPost(DataSet: TDataSet);
begin
{
  try
    QryPost.DataBase.ApplyUpdates( [ QryPost ]);
  except on E:Exception do
    begin
      Application.ShowException(E);
      QryPost.Close;
      QryPost.Open;
      System.SysUtils.ABORT;
    end;
  end;
}
end;

procedure TFrmBookPostings.wwDBPeriodCustomDlg(Sender: TObject);
var
  AId:Real;
begin
  AId := DoFindPeriod(); {in IQMS.Common.Period.pas}
  if AId <> 0 then
  begin
    if not(QryPost.State in [dsEdit, dsInsert]) then
      QryPost.Edit;
    QryPostGLPERIODS_ID.asFloat := AId;
    QryPostPERIOD.asFloat := SelectValueFmtAsFloat('select period from glperiods where id = %f', [AId]);
    QryPostYEAR.asString := SelectValueFmtAsString('select y.descrip from glyear y, glperiods p where p.id = %f and p.glyear_id = y.id', [AId]);
  end;
end;

procedure TFrmBookPostings.QryPostAfterInsert(DataSet: TDataSet);
begin
  QryPostBEG_BALANCE.asString := 'Y';
  { TODO -omugdha -cWEBIQ : Undeclared identifier: 'TFaMaintenance'
  QryPostFA_BOOK_ID.asFloat   := TFaMaintenance(Owner).SrcBooks.DataSet.FieldByName('ID').asFloat;}
end;

procedure TFrmBookPostings.QryPostBeforeEdit(DataSet: TDataSet);
begin
  if QryPostFINALIZED_DATE.asDateTime <> 0 then Abort;
end;



end.
