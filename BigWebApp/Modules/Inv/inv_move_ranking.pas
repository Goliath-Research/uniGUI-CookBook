unit inv_move_ranking;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  Vcl.Wwdatsrc,
  Mask,
  IQMS.WebVcl.Hpick,
  IQMS.Common.UserMessages,
  Vcl.Menus,
  IQMS.WebVcl.About,
  IQMS.WebVcl.Jump,
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
  uniCheckBox,
  uniEdit,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator,
  uniMainMenu,
  uniLabel,
  uniMultiItem,
  uniComboBox,
  uniDBComboBox, IQUniGrid, uniGUIFrame;

type
  TFrmInvMovementRanking = class(TUniForm)
    Panel1: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    sbtnRecalc: TUniSpeedButton;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    wwDBGridArinvt: TIQUniGridControl;
    SrcArinvt: TDataSource;
    QryArinvt: TFDQuery;
    wwDBComboBoxPkUnitType: TUniDBComboBox;
    chkNotRanked: TUniCheckBox;
    QryArinvtITEMNO: TStringField;
    QryArinvtDESCRIP: TStringField;
    QryArinvtCLASS: TStringField;
    QryArinvtREV: TStringField;
    QryArinvtInvMoveClassCode: TStringField;
    QryArinvtInvMoveClassDescrip: TStringField;
    wwDBComboDlgMoveClassDesc: TUniEdit;
    PkInvtMoveClass: TIQWebHPick;
    PkInvtMoveClassID: TFloatField;
    PkInvtMoveClassSEQ: TFloatField;
    PkInvtMoveClassCODE: TStringField;
    PkInvtMoveClassDESCRIP: TStringField;
    PkArinvt: TIQWebHPick;
    PkArinvtITEMNO: TStringField;
    PkArinvtDESCRIP: TStringField;
    PkArinvtDESCRIP2: TStringField;
    PkArinvtREV: TStringField;
    PkArinvtCLASS: TStringField;
    PkArinvtID: TBCDField;
    PkArinvtONHAND: TBCDField;
    PkArinvtEPLANT_ID: TBCDField;
    PkArinvtPK_HIDE: TStringField;
    PkArinvtNON_MATERIAL: TStringField;
    Label1: TUniLabel;
    PopupMenu1: TUniPopupMenu;
    AssignMovementClass1: TUniMenuItem;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    N1: TUniMenuItem;
    JumpToInventory1: TUniMenuItem;
    IQJumpInv: TIQWebJump;
    QryArinvtDESCRIP2: TStringField;
    JumpToBOLDataMovementClass1: TUniMenuItem;
    QryArinvtMOVE_RANK_LOCK: TStringField;
    QryArinvtID: TBCDField;
    QryArinvtINV_MOVE_CLASS_ID: TBCDField;
    QryArinvtEPLANT_ID: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
    procedure CheckRefresh(Sender: TObject; Button: TNavigateBtn);   }
    procedure RebuildQuery(Sender: TObject);
    procedure wwDBComboDlgMoveClassDescCustomDlg(Sender: TObject);
    procedure ApplyUpdate(DataSet: TDataSet);
    procedure QryArinvtUpdateRecord(ASender: TDataSet; ARequest: TFDUpdateRequest;
      var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
    procedure wwDBComboDlgMoveClassDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbtnSearchClick(Sender: TObject);
    procedure AbortInsert(DataSet: TDataSet);
{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
    procedure wwDBGridArinvtCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);    }
    procedure AssignMovementClass1Click(Sender: TObject);
    procedure sbtnRecalcClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure JumpToInventory1Click(Sender: TObject);
    procedure JumpToBOLDataMovementClass1Click(Sender: TObject);
    procedure QryArinvtCalcFields(DataSet: TDataSet);
    procedure UniFormCreate(Sender: TObject);
  private
    FColors    : Variant;
    FColorCount: Integer;

    function GetInvMoveClassID_FieldName: string;
    function GetInvMoveRankLock_FieldName: string;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    function MapRankToColor( AInv_Move_Class_ID: Real ): TColor;
    procedure PopulateColorArray;

  public
    { Public declarations }
    class procedure DoShow;
  end;

implementation

{$R *.dfm}

uses
  inv_move_rank_calc,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils;

{ TFrmInvMovementRanking }

class procedure TFrmInvMovementRanking.DoShow;
var
  LFrmInvMovementRanking : TFrmInvMovementRanking;
begin
  LFrmInvMovementRanking := TFrmInvMovementRanking.Create( UniGUIApplication.UniApplication );
  LFrmInvMovementRanking.Show;
end;

procedure TFrmInvMovementRanking.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvMovementRanking.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, wwDBComboBoxPkUnitType ]);
  Action:= caFree;
end;

procedure TFrmInvMovementRanking.AbortInsert(DataSet: TDataSet);
begin
  ABORT;
end;

procedure TFrmInvMovementRanking.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvMovementRanking.ApplyUpdate(DataSet: TDataSet);
begin
  IQApplyUpdateToTable(DataSet);
  RefreshDataSetByID( DataSet );
end;

{ TODO -oGPatil -cWebConvert : TNavigateBtn not present in UniGui
procedure TFrmInvMovementRanking.CheckRefresh(Sender: TObject;
  Button: TNavigateBtn);
begin
  IQCheckRefresh( Sender, Button );
end;   }

function TFrmInvMovementRanking.GetInvMoveClassID_FieldName: string;
begin
  case wwDBComboBoxPkUnitType.ItemIndex of
     0: Result:= 'loose_inv_move_class_id';
     1: Result:= 'pack_inv_move_class_id';
     2: Result:= 'pallet_inv_move_class_id';
  end;
end;

function TFrmInvMovementRanking.GetInvMoveRankLock_FieldName: string;
begin
  case wwDBComboBoxPkUnitType.ItemIndex of
     0: Result:= 'loose_move_rank_lock';
     1: Result:= 'pack_move_rank_lock';
     2: Result:= 'pallet_move_rank_lock';
  end;
end;

procedure TFrmInvMovementRanking.IQAfterShowMessage(var Msg: TMessage);
begin
  RebuildQuery(nil);
end;

procedure TFrmInvMovementRanking.JumpToInventory1Click(Sender: TObject);
begin
  IQJumpInv.Execute;
end;

procedure TFrmInvMovementRanking.QryArinvtCalcFields(DataSet: TDataSet);
begin
  if QryArinvtINV_MOVE_CLASS_ID.asFloat <> 0 then
  begin
    QryArinvtInvMoveClassCode.asString := SelectValueByID('CODE', 'INV_MOVE_CLASS', QryArinvtINV_MOVE_CLASS_ID.asFloat);
    QryArinvtInvMoveClassDescrip.asString := SelectValueByID('DESCRIP', 'INV_MOVE_CLASS', QryArinvtINV_MOVE_CLASS_ID.asFloat);
  end;

end;

procedure TFrmInvMovementRanking.QryArinvtUpdateRecord(ASender: TDataSet;
  ARequest: TFDUpdateRequest; var AAction: TFDErrorAction; AOptions: TFDUpdateRowOptions);
begin
  // update arinvt set loose_inv_move_class_id = 1 where id = 100
  if ASender.FieldByName('inv_move_class_id').asFloat = 0 then
     ExecuteCommandFmt('update arinvt set %s = null where id = %f',
               [ GetInvMoveClassID_FieldName,
                 ASender.FieldByName('id').asFloat ])
  else
     ExecuteCommandFmt('update arinvt set %s = %f where id = %f',
               [ GetInvMoveClassID_FieldName,
                 ASender.FieldByName('inv_move_class_id').asFloat,
                 ASender.FieldByName('id').asFloat ]);

  ExecuteCommandFmt('update arinvt set %s = ''%s'' where id = %f',
            [ GetInvMoveRankLock_FieldName(),
              ASender.FieldByName('move_rank_lock').asString,
              ASender.FieldByName('id').asFloat ]);

  AAction := eaApplied;
end;

procedure TFrmInvMovementRanking.RebuildQuery(Sender: TObject);
var
  S: string;

  procedure _ReplaceSQLText( AKeyword1, AKeyword2, S: string );
  var
    I: Integer;
  begin
    IQMS.Common.StringUtils.DeleteStringsBetweenKeyWords( QryArinvt.SQL, AKeyword1, AKeyword2, I );
    IQMS.Common.StringUtils.InsertStringsBetweenKeyWords( QryArinvt.SQL, S, AKeyword1, AKeyword2 );
  end;

begin
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain UnselectAll
  wwDBGridArinvt.UnselectAll;   }
  QryArinvt.Close;

  // a.loose_inv_move_class_id as inv_move_class_id,
  // a.loose_move_rank_lock as move_rank_lock
  S:= Format( 'a.%s as inv_move_class_id, ', [ GetInvMoveClassID_FieldName()  ]) +
      Format( 'a.%s as move_rank_lock ',     [ GetInvMoveRankLock_FieldName() ]);
  _ReplaceSQLText( '_INV_MOVE_CLASS_ID_START_', '_INV_MOVE_CLASS_ID_END_', S );

   // a.loose_inv_move_class_id = m.id
  S:= Format( 'a.%s = m.id ', [ GetInvMoveClassID_FieldName() ]);
  // if needed add outer joint to show not ranked items
  if chkNotRanked.Checked then
     S:= Format('%s(+) and m.id is null ', [ S ]);
  _ReplaceSQLText( '_WHERE_START_', '_WHERE_END_', S );

  Reopen(QryArinvt);
end;


procedure TFrmInvMovementRanking.sbtnRecalcClick(Sender: TObject);
begin
  if TFrmInvMoveRankCalc.DoShowModal then   // inv_move_rank_calc.pas
     RebuildQuery( nil );
end;

procedure TFrmInvMovementRanking.sbtnSearchClick(Sender: TObject);
begin
  with PkArinvt do
    if Execute then
    begin
      if not QryArinvt.Locate('id', GetValue('ID'), []) then
         IQConfirm(Format('Unable to locate item %s in the current list - review the selection criteria and try again.', [ Trim(GetValue('itemno')) ]));
    end;
end;

procedure TFrmInvMovementRanking.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, wwDBComboBoxPkUnitType ]);
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 );
  PopulateColorArray;
end;

procedure TFrmInvMovementRanking.wwDBComboDlgMoveClassDescCustomDlg( Sender: TObject);
begin
  with PkInvtMoveClass do
    if Execute then
    begin
       QryArinvt.Edit;
       QryArinvtINV_MOVE_CLASS_ID.asFloat:= GetValue('id');
       QryArinvt.Post;
    end;
end;

procedure TFrmInvMovementRanking.wwDBComboDlgMoveClassDescKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    QryArinvt.Edit;
    QryArinvtINV_MOVE_CLASS_ID.Clear;
    QryArinvt.Post;
    Key:= 0;
  end;
end;

{ TODO -oGPatil -cWebConvert : TGridDrawState not present in UniGui
procedure TFrmInvMovementRanking.wwDBGridArinvtCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  if Highlight then EXIT;

  if (Field <> QryArinvtInvMoveClassCode) and (QryArinvtINV_MOVE_CLASS_ID.asFloat > 0) then
     ABrush.Color:= MapRankToColor( QryArinvtINV_MOVE_CLASS_ID.asFloat );
end;
}

function TFrmInvMovementRanking.MapRankToColor( AInv_Move_Class_ID: Real ): TColor;
var
  I: Integer;
begin
  for I:= 0 to FColorCount - 1 do
    if FColors[ I ][ 0 ] = AInv_Move_Class_ID then
    begin
      Result:= FColors[ I ][ 1 ];
      EXIT;
    end;
  Result:= clWindow;
end;


procedure TFrmInvMovementRanking.PopulateColorArray;
const
  ABottomRGB = 200;
var
  I      : Integer;
  ADelta : Integer;
  R, G, B: Integer;
begin
  FColorCount := Trunc( SelectValueAsFloat('select count(*) from inv_move_class'));
  ADelta := Trunc((255-ABottomRGB) / FColorCount);
  FColors:= VarArrayCreate([0, FColorCount], varVariant);

  with TFDQuery.Create(nil) do
  try
    Connection := UniMainModule.FDConnection1;

    SQL.Add('select id from inv_move_class order by seq');
    Open;
    I:= FColorCount - 1;
    while not Eof do
    begin
      R:= ABottomRGB + (I * ADelta) - 15;
      G:= ABottomRGB + (I * ADelta) + 10;
      B:= ABottomRGB + (I * ADelta) + 15;

      FColors[ I ]:= VarArrayOf([ FieldByName('id').asFloat,  {inv_move_class_id}
                                  RGB( R, G, B) ]);           {color for the grid}

      Dec(I);
      Next;
    end;
  finally
    Free;
  end;
end;

procedure TFrmInvMovementRanking.AssignMovementClass1Click(Sender: TObject);
var
  I: Integer;

  procedure _UpdateMoveClass;
  begin
    QryArinvt.Edit;
    QryArinvtINV_MOVE_CLASS_ID.asFloat:= PkInvtMoveClass.GetValue('id');
    QryArinvt.Post;
  end;

begin
  // get the move class
  if not PkInvtMoveClass.Execute then
     EXIT;

  // loop - update arinvts
  QryArinvt.DisableControls;
{ TODO -oGPatil -cWebConvert : TIQUniGridControl does not contain selectedlist
  with wwDBGridArinvt do
  try
    if SelectedList.Count > 0 then
       for I:= 0 to SelectedList.Count - 1 do
       begin
         QryArinvt.GotoBookmark( SelectedList.Items[ I ]);
         _UpdateMoveClass;
       end
    else if QryArinvtID.asFloat > 0 then
       _UpdateMoveClass;

  finally
    QryArinvt.EnableControls;
    wwDBGridArinvt.UnselectAll;
    Reopen( QryArinvt );
  end; }
end;

procedure TFrmInvMovementRanking.JumpToBOLDataMovementClass1Click(
  Sender: TObject);
begin
  JumpDirect( iq_JumpToBOLParams, QryArinvtID.asInteger );
end;


end.
