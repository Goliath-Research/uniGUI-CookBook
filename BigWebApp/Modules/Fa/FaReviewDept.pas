unit FaReviewDept;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.DBCtrls,
  IQMS.WebVcl.SecurityRegister,
  IQMS.WebVcl.Search,
  Data.DB,
//  Vcl.Wwdatsrc,
  Vcl.Buttons,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  MainModule,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmRevDepr = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Splitter1: TUniSplitter;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    SR: TIQWebSecurityRegister;
    IQSearch1: TIQUniGridControl;
    SrcHdr: TDataSource;
    QryHdr: TFDQuery;
    SrcDtl: TDataSource;
    QryDtl: TFDQuery;
    wwDBGrid1: TIQUniGridControl;
    QryHdrPOST_DATE: TDateTimeField;
    QryHdrBEG_BALANCE: TStringField;
    QryHdrPERIOD: TBCDField;
    QryHdrYEAR: TStringField;
    QryHdrBOOK_DESCRIP: TStringField;
    QryHdrBOOK_TYPE: TStringField;
    QryDtlID: TBCDField;
    QryDtlASSET_NO: TStringField;
    QryDtlDESCRIP: TStringField;
    QryDtlFA_BOOK_ID: TBCDField;
    QryDtlAMOUNT: TBCDField;
    QryDtlYEAR: TStringField;
    QryDtlPERIOD: TBCDField;
    QryDtlBOOK_DESCRIP: TStringField;
    QryDtlBOOK_TYPE: TStringField;
    QryHdrGLBATCHID_ID: TFMTBCDField;
    Contents1: TUniMenuItem;
    QryDtlFA_DEPR_POSTING_ID: TBCDField;
    SbToggle: TUniSpeedButton;
    BtnSelectAll: TUniSpeedButton;
    BtnClearAll: TUniSpeedButton;
    QryDtlGLBATCHID_ID: TBCDField;
    Shape1: TUniPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure QryHdrUpdateRecord(ASender: TDataSet;
      ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure FormActivate(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure SbToggleClick(Sender: TObject);
    procedure BtnSelectAllClick(Sender: TObject);
    procedure BtnClearAllClick(Sender: TObject);
    procedure QryHdrAfterScroll(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  protected
  { TODO -oLema : To find a workaround to Grid.CalcCellColors }
{    procedure GridCalcCellColors(Sender: TObject;
              Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
              ABrush: TBrush);
}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure DoReviewDepr;

implementation
uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Dialogs,
  IQMS.Common.EditMemoStr,
  IQMS.Common.HelpHook;
{$R *.dfm}

procedure DoReviewDepr;
var
  frm : TFrmRevDepr;
begin
  frm := TFrmRevDepr.Create(uniGUIApplication.UniApplication);
  frm.Show;
//  with TFrmRevDepr.Create(AOwner) do Show;
end;


procedure TFrmRevDepr.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( Self, [ Self, Panel2, wwDBGrid1]);

//  IqSearch1.DBGrid.OnCalcCellColors := GridCalcCellColors;
  QryHdr.Open;
  QryDtl.Open;
end;


procedure TFrmRevDepr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := caFree;
  IQRegFormWrite( Self, [ Self, Panel2, wwDBGrid1]);
end;

procedure TFrmRevDepr.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRevDepr.About1Click(Sender: TObject);
begin
  IqAbout1.Execute;
end;

{
procedure TFrmRevDepr.GridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if QryHdrGLBATCHID_ID.asFloat <> 0 then
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

procedure TFrmRevDepr.DBNavigator1BeforeAction(Sender: TObject;  Button: TNavigateBtn);
var
  AList:TStringList;
  ADate:TDateTime;
  AMostRecentDate:boolean;
  AId:Real;
  j, i:integer;
  AText:String;
  ACount:Real;
begin
  if Button = nbRefresh then
  begin
    QryHdr.Close;
    QryHdr.Open;
    Abort;
  end
  else if Button = nbDelete then
  try
  { TODO -oLema : To find a workaround to Grid.SelectRecord }
//    if IQSearch1.wwDbGrid.Selected.Count = 0 then
//      IQSearch1.wwDbGrid.SelectRecord;

   if IqConfirmYN('Delete marked records?') then
   begin
      AList := TStringList.Create;
      ACount := 0;
      try
        if wwDBGrid1.DBGrid.SelectedRows.Count > 0 then
        with wwDBGrid1, wwDBGrid1.datasource.dataset do
        begin
          ACount := DBGrid.SelectedRows.Count;
          try
            for i:= 0 to DBGrid.SelectedRows.Count-1 do
            begin
              GotoBookmark(DBGrid.SelectedRows.items[i]);
              if QryDtlGLBATCHID_ID.asFloat <> 0 then
                AList.Add(Format('%s is posted to the GL. Cannot delete.', [QryDtlBOOK_DESCRIP.asString]));

              if QryDtlGLBATCHID_ID.asFloat = 0 then
                 ExecuteCommandFmt('delete from FA_DEPR_POSTING where id = %f', [QryDtlFA_DEPR_POSTING_ID.asFloat]);
            end;
          finally
  { TODO -oLema : To find a workaround to UnselectAll}
//            UnselectAll;
          end;
        end;

        if ACount = 0 then
        with IqSearch1.DBGrid, IqSearch1.DBGrid.datasource.dataset do
        begin
          QryDtl.Close;
          try
            for i:= 0 to SelectedRows.Count-1 do
            begin
              GotoBookmark(SelectedRows.items[i]);
              if QryHdrGLBATCHID_ID.asFloat <> 0 then
                AList.Add(Format('%s is posted to the GL. Cannot delete.', [QryHdrBOOK_DESCRIP.asString]));

              if QryHdrGLBATCHID_ID.asFloat = 0 then
              begin
                ADate := SelectValueFmtAsFloat('select max(f.post_date) ' +
                                   '  from FA_DEPR_POSTING f,       ' +
                                   '       glperiods p,             ' +
                                   '       glyear y,                ' +
                                   '       fa_book b                ' +
                                   ' where f.glperiods_id = p.id(+) ' +
                                   '   and p.glyear_id = y.id(+)    ' +
                                   '   and f.fa_book_id = b.id      ' +
                                   '   and NVL(p.period, 0) = %f    ' +
                                   '   and NVL(y.descrip, '' '') = ''%s'' ' +
                                   '   and NVL(f.beg_balance, ''N'') = ''%s'' ' +
                                   '   and b.book_type = ''%s'' ' +
                                   '   and b.descrip = ''%s'' ' +
                                   '   and NVL(f.glbatchid_id, 0) = 0',
                                   [QryHdrPERIOD.asFloat,
                                    QryHdrYEAR.asString,
                                    QryHdrBEG_BALANCE.asString,
                                    QryHdrBOOK_TYPE.asString,
                                    QryHdrBOOK_DESCRIP.asString]);

                 AMostRecentDate := (ADate <= QryHdrPOST_DATE.asDateTime);
                 if not AMostRecentDate then
                   AList.Add(Format('Only the most recent depreciation calculation for the %s book may be deleted.', [QryHdrBOOK_DESCRIP.asString]));

              end;

               if (QryHdrGLBATCHID_ID.asFloat = 0) and AMostRecentDate then
               begin
                  AId := SelectValueFmtAsFloat('select f.id ' +
                                     '  from FA_DEPR_POSTING f,       ' +
                                     '       glperiods p,             ' +
                                     '       glyear y,                ' +
                                     '       fa_book b                ' +
                                     ' where f.glperiods_id = p.id(+) ' +
                                     '   and p.glyear_id = y.id(+)    ' +
                                     '   and f.fa_book_id = b.id      ' +
                                     '   and NVL(p.period, 0) = %f    ' +
                                     '   and NVL(y.descrip, '' '') = ''%s'' ' +
                                     '   and NVL(f.beg_balance, ''N'') = ''%s'' ' +
                                     '   and b.book_type = ''%s'' ' +
                                     '   and b.descrip = ''%s'' ' +
                                     '   and f.post_date = To_Date(''%s'', ''MM/DD/RRRR'') ' +
                                     '   and NVL(f.glbatchid_id, 0) = 0',
                                     [QryHdrPERIOD.asFloat,
                                      QryHdrYEAR.asString,
                                      QryHdrBEG_BALANCE.asString,
                                      QryHdrBOOK_TYPE.asString,
                                      QryHdrBOOK_DESCRIP.asString,
                                      FormatDateTime('mm/dd/yyyy', QryHdrPOST_DATE.asDateTime)]);
                   ExecuteCommandFmt('delete from FA_DEPR_POSTING where id = %f', [AId]);
               end;
            end;

          finally
  { TODO -oLema : To find a workaround to UnselectAll}
//            UnselectAll;
          end;
        end;
        if AList.Count <> 0 then
        begin
          for j := 0 to (AList.Count - 1) do
            AText := AList[j] + #13#10 + AText;
          DoViewMemoStr( AText, 'Warning');
        end;
      finally
        AList.Free;
        QryHdr.Close;
        QryHdr.Open;
        QryDtl.Close;
        QryDtl.Open;
      end;
   end;
  finally
    Abort;
  end;

end;

procedure TFrmRevDepr.QryHdrUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
//
end;

procedure TFrmRevDepr.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile( iqchmFA{CHM}, iqhtmFA{HTM} )  {IQMS.Common.HelpHook.pas}
end;

procedure TFrmRevDepr.Contents1Click(Sender: TObject);
begin
 IQHelp.HelpContext( HelpContext );

end;

procedure TFrmRevDepr.BtnClearAllClick(Sender: TObject);
begin
  { TODO -oLema : To find a workaround to UnselectAll}
//  wwDBGrid1.UnSelectAll;
end;

procedure TFrmRevDepr.BtnSelectAllClick(Sender: TObject);
begin
  { TODO -oLema : To find a workaround to SelectAll}
//  wwDBGrid1.SelectAll;
end;

procedure TFrmRevDepr.SbToggleClick(Sender: TObject);
begin
  { TODO -oLema : To find a workaround to following}
{
  if wwDBGrid1.IsSelected then
     wwDBGrid1.UnSelectRecord
  else
     wwDBGrid1.SelectRecord;
}
end;


procedure TFrmRevDepr.QryHdrAfterScroll(DataSet: TDataSet);
begin
  { TODO -oLema : To find a workaround to UnselectAll}
//  wwDBGrid1.UnSelectAll;
end;


end.
