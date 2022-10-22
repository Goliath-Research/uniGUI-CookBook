unit inv_where_used_flat;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Forms,
  IQMS.Common.JumpConstants,
  Data.DB,
  Vcl.Buttons,
  IQMS.WebVcl.Search,
  Datasnap.DBClient,
  Vcl.Menus,
  IQMS.WebVcl.About,
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
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniDBNavigator, uniMainMenu, IQUniGrid, uniGUIFrame;

type
  TFrmInvWhereUsedFlat = class(TUniForm)
    pnlMain: TUniPanel;
    Panel1: TUniPanel;
    pnlGrid: TUniPanel;
    SrcWhereUsed: TDataSource;
    QryWhereUsed: TFDQuery;
    QryWhereUsedKIND: TStringField;
    QryWhereUsedCLASS: TStringField;
    QryWhereUsedITEMNO: TStringField;
    QryWhereUsedDESCRIP: TStringField;
    QryWhereUsedREV: TStringField;
    QryWhereUsedDESCRIP2: TStringField;
    QryWhereUsedMFGNO: TStringField;
    QryWhereUsedOPNO: TStringField;
    QryWhereUsedOPDESC: TStringField;
    QryWhereUsedCUSTNO: TStringField;
    QryWhereUsedVENDORNO: TStringField;
    sbtnRecalc: TUniSpeedButton;
    Grid: TIQUniGridControl;
    DBNavigator1: TUniDBNavigator;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    QryWhereUsedMAX_LEVEL: TBCDField;
    QryWhereUsedEPLANT_ID: TBCDField;
    QryWhereUsedID: TBCDField;
    QryWhereUsedARINVT_ID: TBCDField;
    QryWhereUsedPTOPER_ID: TBCDField;
    QryWhereUsedSNDOP_ID: TBCDField;
    QryWhereUsedOPMAT_ID: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnRefreshClick(Sender: TObject);
    { TODO -oathite -cWebConvert : property's aleternative not found TIQUniDBGrid
    procedure GridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);  }
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FMaxLevel: Real;
    procedure IQAfterShowMessage( var Msg: TMessage ); message iq_AfterShowMessage;
    procedure Recalc;
    procedure SetArinvt_ID(const Value: Real);
  public
    { Public declarations }
    class procedure DoShow(AArinvt_ID: Real );
    property Arinvt_ID : Real write SetArinvt_ID;
  end;


implementation

{$R *.dfm}

uses
  inv_rscstr,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  PanelMsg;


{ TTFrmInvWhereUsedFlat }
class procedure TFrmInvWhereUsedFlat.DoShow(AArinvt_ID: Real);
var
  LFrmInvWhereUsedFlat : TFrmInvWhereUsedFlat;
begin
  LFrmInvWhereUsedFlat := TFrmInvWhereUsedFlat.Create( uniGUIApplication.UniApplication );

  LFrmInvWhereUsedFlat.Arinvt_ID := AArinvt_ID;

  // find the max level for displaying bar
  LFrmInvWhereUsedFlat.Caption:= Format(inv_rscstr.cTXT0000174 {'Sequential Where Used View: %s'},
                        [ SelectValueFmtAsString('select RTRim(class) || ''.'' || RTRim(itemno) || ''.'' || RTrim(descrip) from arinvt where id = %f', [ AArinvt_ID ])]);

  LFrmInvWhereUsedFlat.Show();

end;

procedure TFrmInvWhereUsedFlat.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvWhereUsedFlat.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmInvWhereUsedFlat.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [ self ]);
end;

procedure TFrmInvWhereUsedFlat.IQAfterShowMessage(var Msg: TMessage);
begin
  Recalc;
end;

procedure TFrmInvWhereUsedFlat.sbtnRefreshClick(Sender: TObject);
begin
  if IQConfirmYN('Are you sure you want to recalculate ''Where Used''?') then
     Recalc;
end;

procedure TFrmInvWhereUsedFlat.SetArinvt_ID(const Value: Real);
begin
  FArinvt_ID := Value;
  FMaxLevel:= SelectValueFmtAsFloat('select max_level from v_bom_levels where opmat_arinvt_id = %f', [ Value ]);
  if FMaxLevel = 0 then FMaxLevel:= 1;
end;

procedure TFrmInvWhereUsedFlat.UniFormShow(Sender: TObject);
begin
  IQRegFormRead(self, [ self ]);
  { TODO -oathite -cWebConvert : Windows messege
  PostMessage( Handle, iq_AfterShowMessage, 0, 0 )}
end;

procedure TFrmInvWhereUsedFlat.Recalc;
var
  hMsg: TPanelMesg;
  AScalarString: string;
begin
  hMsg:= hPleaseWait();
  try
    // recalculate!
    ExecuteCommandFmt('begin where_used.populate_items_involved(%f); end;', [ FArinvt_ID ]);

    // reopen
    QryWhereUsed.Close;
    QryWhereUsed.Open;
  finally
    hMsg.Free;
  end;
end;

{ TODO -oathite -cWebConvert : property's aleternative not found TIQUniDBGrid
procedure TFrmInvWhereUsedFlat.GridDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);

  procedure _DrawMaxLevelBar( ALevel: Real );
  var
    ABarRect: TRect;
    ATextRect: TRect;
    ABarWidth: Integer;
  begin
    (*Re-determine FMaxLevel to properly draw the bar within the field*)
    with QryWhereUsed do begin
      while not EOF and BOF do begin
        if QryWhereUsedMAX_LEVEL.asFloat > FMaxLevel then
          FMaxLevel:= QryWhereUsedMAX_LEVEL.asFloat;
        Next;
      end;
    end;

    // Text
    ATextRect.TopLeft:= Rect.TopLeft;
    ATextRect.BottomRight:= Rect.BottomRight;
    ATextRect.Right  := ATextRect.Left + Grid.wwDBGrid.Canvas.TextWidth('1000 ') + 3;

    Grid.wwDBGrid.Canvas.TextRect( ATextRect, ATextRect.Left + 2, ATextRect.Top + 3, Format('%.0f', [ ALevel ]));

    // bar background
    ABarRect.Left  := ATextRect.Right + 2;
    ABarRect.Top   := Rect.Top + 3;
    ABarRect.Right := Rect.Right - 3;
    ABarRect.Bottom:= Rect.Bottom - 3;
    Grid.wwDBGrid.Canvas.Brush.Color:= clBtnFace;  // $00F4F4F4; // cl3DLight;
    Grid.wwDBGrid.Canvas.FillRect(ABarRect);
    // bar outline
    Grid.wwDBGrid.Canvas.Pen.Color := clSilver;
    Grid.wwDBGrid.Canvas.Rectangle(ABarRect);

    // calculate the width of the bar
    ABarWidth:= Trunc((ABarRect.Right - ABarRect.Left + 1) / fMax(FMaxLevel, ALevel) * ALevel);
    if ABarWidth = 0 then
       ABarRect.Right := ABarRect.Left + 1
    else if ABarRect.Left + ABarWidth > ABarRect.Right then
       // do nothing - keep current ABarRect.Right
    else
       ABarRect.Right := ABarRect.Left + ABarWidth;

    // color
    Grid.wwDBGrid.Canvas.Brush.Color:= clSilver;

    // finally!
    Grid.wwDBGrid.Canvas.FillRect(ABarRect);
  end;

begin
  if Field = QryWhereUsedMAX_LEVEL then
     _DrawMaxLevelBar( QryWhereUsedMAX_LEVEL.asFloat )
  else
     Grid.wwDBGrid.DefaultDrawDataCell( Rect, Field, State );
end; }

end.
