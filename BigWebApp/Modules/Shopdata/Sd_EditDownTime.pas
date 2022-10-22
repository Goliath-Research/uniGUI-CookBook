unit Sd_EditDownTime;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Data.DB,
  IQMS.WebVcl.Hpick,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniEdit,
  uniMemo,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TFrmSDEditDownTime = class(TUniForm)
    PnlMain: TUniPanel;
    Panel1: TUniPanel;
    lblCode: TUniLabel;
    PkDTCode: TIQWebHPick;
    PkDTCodeDOWN_CODE: TStringField;
    PkDTCodeDOWN_DESCRIP: TStringField;
    edtCode: TUniEdit;
    sbtnCode: TUniSpeedButton;
    gbStartDateTime: TUniGroupBox;
    lblStartDate: TUniLabel;
    edtStartDate: TUniEdit;
    sbtnStartDate: TUniSpeedButton;
    lblStartTime: TUniLabel;
    edtStartTime: TUniEdit;
    sbtnStartTime: TUniSpeedButton;
    gbIntervalFinish: TUniGroupBox;
    lblFinishDate: TUniLabel;
    sbtnFinishDate: TUniSpeedButton;
    lblFinishTime: TUniLabel;
    sbtnFinishTime: TUniSpeedButton;
    edtFinishDate: TUniEdit;
    edtFinishTime: TUniEdit;
    GroupBox2: TUniGroupBox;
    memComment: TUniMemo;
    sbtnKeyboard: TUniSpeedButton;
    PkDTCodeEPLANT_ID: TBCDField;
    Panel2: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancel: TUniBitBtn;
    PkDTCodeEPLANT_NAME: TStringField;
    procedure sbtnStartDateClick(Sender: TObject);
    procedure sbtnStartTimeClick(Sender: TObject);
    procedure sbtnCodeClick(Sender: TObject);
    procedure sbtnFinishDateClick(Sender: TObject);
    procedure sbtnFinishTimeClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnKeyboardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AssignEPlantFilter(DataSet: TDataSet);
  private
    { Private declarations }
    FStartDate  : TDateTime;
    FStartTime  : TTime;
    FEndDate    : TDateTime;
    FEndTime    : TTime;
    FCode       : String;
    FCodeDescrip: String;
    FComment    : String;
    FShowFinishDate: Boolean;
    FFinish: TDateTime;
    FStart: TDateTime;
    FShowStartDate: Boolean;
    procedure SetCode(const Value: String);
    procedure SetComment(const Value: String);
    procedure SetFinish(const Value: TDateTime);
    procedure SetShowFinishDate(const Value: Boolean);
    procedure SetStart(const Value: TDateTime);
    procedure SetShowStartDate(const Value: Boolean);
    procedure SetCodeDescrip(const Value: String);
  public
    { Public declarations }
    property ShowStartDate : Boolean write SetShowStartDate;
    property ShowFinishDate : Boolean write SetShowFinishDate;
    property Start : TDateTime write SetStart;
    property Finish : TDateTime write SetFinish;
    property Code : String write SetCode;
    property Comment : String write SetComment;
    property CodeDescrip : String write SetCodeDescrip;
  end;

  function DoEditDownTime(AShowStartDate, AShowFinishDate: Boolean;
                           var AStart, AFinish: TDateTime; var ACode, ACodeDescrip, AComment: String ): Boolean;

implementation

{$R *.DFM}

uses
  IQMS.Common.Dates,
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.StringUtils,
  shopdata_rscstr;
  { TODO : touchscrn has a no web convert tag }
  //touchscrn;

function DoEditDownTime(AShowStartDate, AShowFinishDate: Boolean;
                         var AStart, AFinish: TDateTime; var ACode, ACodeDescrip, AComment: String ): Boolean;
var
   LFrmSDEditDownTime : TFrmSDEditDownTime;
begin
     LFrmSDEditDownTime := TFrmSDEditDownTime.Create(UniGUIApplication.UniApplication);
     with LFrmSDEditDownTime do
     begin
       ShowStartDate  := AShowStartDate;
       ShowFinishDate := AShowFinishDate;
       Start := AStart;
       Finish := AFinish;
       Code := ACode;
       Comment := AComment;
       if ShowModal = mrOk then
         begin
           Start   := Trunc( FStartDate ) + FStartTime;
           Finish  := Trunc( FEndDate   ) + FEndTime;
           Code    := FCode;
           CodeDescrip := ACodeDescrip;
           Comment := FComment;
           Result  := TRUE;
         end
       else Result := FALSE;
     end;
end;

{ TFrmSDEditDownTime }

procedure TFrmSDEditDownTime.FormShow(Sender: TObject);
begin

     IQRegFormRead( Self, [ Self ] ); // IQMS.Common.RegFrm.pas

     FStartDate  := Trunc( FStart );
     FStartTime  := FStart;
     FEndDate    := Trunc( FFinish );
     FEndTime    := FFinish;
     FComment    := StrTran( FComment, #$A, #$D#$A );

     if StrToFloat( FormatFloat( '0',  FStartDate  )) > 0 then
        edtStartDate.Text := FormatDateTime( 'c', FStartDate );

     if StrToFloat( FormatFloat( '0.########', FStartTime )) > 0 then
        edtStartTime.Text      := FormatDateTime( 't', FStartTime );

     if StrToFloat( FormatFloat( '0',  FEndDate  )) > 0 then
        edtFinishDate.Text := FormatDateTime( 'c', FEndDate );

     if StrToFloat( FormatFloat( '0.########', FEndTime )) > 0 then
        edtFinishTime.Text      := FormatDateTime( 't', FEndTime );

     edtCode.Text      := FCode;
     memComment.Text   := FComment;


     lblStartDate .Enabled := FShowStartDate;
     edtStartDate .Enabled := FShowStartDate;
     sbtnStartDate.Enabled := FShowStartDate;
     lblStartTime .Enabled := FShowStartDate;
     edtStartTime .Enabled := FShowStartDate;
     sbtnStartTime.Enabled := FShowStartDate;
     gbStartDateTime.Enabled := FShowStartDate;

     // 10/21/2011 the down-time code is always editable
     //lblCode.Enabled  := AShowStartDate;
     //edtCode.Enabled  := AShowStartDate;
     //sbtnCode.Enabled := AShowStartDate;

     lblFinishDate .Enabled := FShowFinishDate;
     edtFinishDate .Enabled := FShowFinishDate;
     sbtnFinishDate.Enabled := FShowFinishDate;
     lblFinishTime .Enabled := FShowFinishDate;
     edtFinishTime .Enabled := FShowFinishDate;
     sbtnFinishTime.Enabled := FShowFinishDate;
     gbIntervalFinish.Enabled := FShowFinishDate;

     // 07/17/2012 Ensure touch-screen font applied.
     { TODO : touchscrn has a no web convert tag }
     //touchscrn.ApplyTouchscreenFont(Self);
{ TODO : touchscrn has a no web convert tag }
//    EnsureTouchScreenToolboxOnTopOf( Self ); // touchscrn.pas
end;

procedure TFrmSDEditDownTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     IQRegFormWrite( Self, [ Self ] ); // IQMS.Common.RegFrm.pas
end;

procedure TFrmSDEditDownTime.sbtnStartDateClick(Sender: TObject);
begin
  if (Trim(edtStartDate.Text) > '') and
     IQMS.Common.Dates.IsStringValidDate(edtStartDate.Text, FStartDate) then
     FStartDate := IQMS.Common.Dates.IQOracleAdjustedDate;

     { TODO : touchscrn has a no web convert tag }
 { if touchscrn.TouchScreen_Calendar(Self, FStartDate) then
     edtStartDate.Text := FormatDateTime( 'c', FStartDate );   }

end;

procedure TFrmSDEditDownTime.sbtnStartTimeClick(Sender: TObject);
begin
     FStartTime := StrToTime( edtStartTime.Text );
     { TODO : touchscrn has a no web convert tag }
     {if touchscrn.TouchScreen_TimePad( Self, FStartTime ) = TRUE then
        begin
             edtStartTime.Text := FormatDateTime( 't', FStartTime );
        end;     }
end;

procedure TFrmSDEditDownTime.SetCode(const Value: String);
begin
  FCode := Value;
end;

procedure TFrmSDEditDownTime.SetCodeDescrip(const Value: String);
begin
  FCodeDescrip := Value;
end;

procedure TFrmSDEditDownTime.SetComment(const Value: String);
begin
  FComment := Value;
end;

procedure TFrmSDEditDownTime.SetFinish(const Value: TDateTime);
begin
  FFinish := Value;
end;

procedure TFrmSDEditDownTime.SetShowFinishDate(const Value: Boolean);
begin
  FShowFinishDate := Value;
end;

procedure TFrmSDEditDownTime.SetShowStartDate(const Value: Boolean);
begin
  FShowStartDate := Value;
end;

procedure TFrmSDEditDownTime.SetStart(const Value: TDateTime);
begin
  FStart := Value;
end;

procedure TFrmSDEditDownTime.sbtnCodeClick(Sender: TObject);
begin
  with PkDTCode do
   if Execute then
      begin
        FCode := GetValue( 'DOWN_CODE' );
        FCodeDescrip := GetValue( 'DOWN_DESCRIP' );
        if edtCode.CanFocus then
           edtCode.SetFocus;
        edtCode.Text := FCode;
      end;
end;

procedure TFrmSDEditDownTime.sbtnFinishDateClick(Sender: TObject);
begin
  if (Trim(edtFinishDate.Text) > '') and
     IQMS.Common.Dates.IsStringValidDate(edtFinishDate.Text, FStartDate) then
     FEndDate := IQMS.Common.Dates.IQOracleAdjustedDate;

     { TODO : touchscrn has a no web convert tag }
  {if touchscrn.TouchScreen_Calendar(Self, FEndDate) then
     edtFinishDate.Text := FormatDateTime( 'c', FEndDate );  }

end;

procedure TFrmSDEditDownTime.sbtnFinishTimeClick(Sender: TObject);
begin
     FEndTime := StrToTime( edtFinishTime.Text );
     { TODO : touchscrn has a no web convert tag }
  {   if touchscrn.TouchScreen_TimePad( Self, FEndTime ) = TRUE then
        begin
             edtFinishTime.Text := FormatDateTime( 't', FEndTime );
        end;      }

end;

procedure TFrmSDEditDownTime.btnOkClick(Sender: TObject);
begin
     if ( Trim( edtStartDate.Text ) > '' ) then
        begin
             FStartDate  := Trunc( StrToDate( edtStartDate.Text ));
             if ( Trim( edtStartTime.Text ) > '' ) then
                FStartTime  := StrToTime( edtStartTime.Text );
        end;

     if ( Trim( edtFinishDate.Text ) > '' ) then
        begin
             FEndDate    := Trunc( StrToDate( edtFinishDate.Text ));
             if ( Trim( edtFinishTime.Text ) > '' ) then
                FEndTime    := StrToTime( edtFinishTime.Text );
        end;
     FCode       := Trim( edtCode.Text );
     FComment    := Trim( memComment.Text );
end;

procedure TFrmSDEditDownTime.sbtnKeyboardClick(Sender: TObject);
var
   S : String;
begin
     S := memComment.Text;
     // 'Downtime Comment'
     { TODO : touchscrn has a no web convert tag }
   {  if touchscrn.TouchScreen_Keyboard( Self, S, 2000, shopdata_rscstr.cTXT0000126) then
        begin
             if Length( S ) > 2000 then
                memComment.Text := LeftStr( S, 2000 )
             else  memComment.Text := S;
             if memComment.CanFocus then memComment.SetFocus;
        end;         }
end;

procedure TFrmSDEditDownTime.AssignEPlantFilter(DataSet: TDataSet);
begin
  // 12/01/2006 Reported by Dawn
  IQAssignEPlantFilter( DataSet, TRUE {Include NULL} );
  DataSet.Filtered := TRUE;
end;

end.
