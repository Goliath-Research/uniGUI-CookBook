unit M_Viewer;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  Menus,
  IQMS.WebVcl.About,
  Buttons,
  ExtCtrls,
  DB,
  IQMS.WebVcl.Hpick,
  IQMS.WebVcl.CaptionPanel,
  ComCtrls,
  IQMS.Common.UserMessages,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.Phys,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniScrollBox,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniStatusBar,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, uniMainMenu;

type
  TFrmM_Viewer = class(TUniForm)
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    SetupViewer1: TUniMenuItem;
    N1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    PkView: TIQWebHPick;
    PkViewID: TBCDField;
    PkViewNAME: TStringField;
    PkViewDESCRIP: TStringField;
    Panel1: TUniPanel;
    sbtnSearch: TUniSpeedButton;
    CaptionPanel1: TIQWebCaptionPanel;
    ScrollBoxDisplay: TUniScrollBox;
    StatusBar1: TUniStatusBar;
    Contents1: TUniMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SetupViewer1Click(Sender: TObject);
    procedure sbtnSearchClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PkViewIQModify(Sender: TObject; var Action: TModalResult;
      var ResultValue: Variant);
    procedure Contents1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FM_View_ID: Real;
    FList: TList;
    FIsDemoMode: Integer;

    procedure MainLoadMonitors(AM_View_ID: Real);
    procedure AssignHeaderInfo;
    procedure LoadMonitors;
    procedure ArrangeMonitorsOnTheScreen;
    procedure IQAfterShowMessage(var Msg: TMessage);
      message iq_AfterShowMessage;
  public
    { Public declarations }
    // constructor Create(AIsDemoMode: Integer );

    class procedure DoShow(AIsDemoMode: Integer);
    property IsDemoMode: Integer read FIsDemoMode write FIsDemoMode;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Controls,
  m_viewer_setup,
  m_type,
  M_RTEff_View,
  IQMS.Common.HelpHook;

{ TFrmM_Viewer }

procedure TFrmM_Viewer.UniFormCreate(Sender: TObject);
begin
  FList := TList.Create;
  IQRegFormRead(self, [self]);
    // PostMessage( Handle, iq_AfterShowMessage, 0, 0 );  {call picklist}
end;

procedure TFrmM_Viewer.UniFormDestroy(Sender: TObject);
begin
  ClearListOfObjects(FList);
  FList.Free;
end;

class procedure TFrmM_Viewer.DoShow(AIsDemoMode: Integer);
var
  AForm: TUniForm;
begin

  AForm := FindFormByClassName('TFrmM_Viewer');
  if not Assigned(AForm) then
    AForm := TFrmM_Viewer.Create(uniGUIApplication.UniApplication);
  TFrmM_Viewer(AForm).IsDemoMode := AIsDemoMode;
  AForm.Show;
end;

procedure TFrmM_Viewer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmM_Viewer.IQAfterShowMessage(var Msg: TMessage);
begin
  try
    sbtnSearchClick(NIL); // activate search speed button
  except
    on E: EAbort do
      PostMessage(Handle, wm_Command, Exit1.Command, 0); { Call "Exit" }
  end;
end;

procedure TFrmM_Viewer.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmM_Viewer.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmM_Viewer.SetupViewer1Click(Sender: TObject);
begin
  TFrmM_ViewerSetup.DoShowModal; { m_viewer_setup.pas }

  { ensure this m_view_id still valid }
  MainLoadMonitors(SelectValueFmtAsFloat('select id from m_view where id = %f',
    [FM_View_ID]));

  if FM_View_ID = 0 then
    sbtnSearchClick(NIL);
end;

procedure TFrmM_Viewer.sbtnSearchClick(Sender: TObject);
begin
  with PkView do
    if Execute then
      MainLoadMonitors(GetValue('ID'))
    else
      ABORT;
end;

procedure TFrmM_Viewer.MainLoadMonitors(AM_View_ID: Real);
begin
  FM_View_ID := AM_View_ID;
  AssignHeaderInfo;

  ClearListOfObjects(FList);

  LoadMonitors;
end;

procedure TFrmM_Viewer.AssignHeaderInfo;
var
  A: Variant;
begin
  A := SelectValueArrayFmt('select name, descrip from m_view where id = %f',
    [FM_View_ID]);
  if VarArrayDimCount(A) > 0 then
  begin
    CaptionPanel1.Caption := A[0];
    CaptionPanel1.Text := A[1];
  end
  else
  begin
    CaptionPanel1.Caption := 'Current View';
    CaptionPanel1.Text := 'Undefined';
  end;
  CaptionPanel1.Update;
end;

procedure TFrmM_Viewer.LoadMonitors;
var
  AQry: TFDQuery;
  AFilter: TMeterFilter; { m_type.pas }

  { ---------------------------------------------------------------------------- }
  procedure AssignFilter(AQry: TFDQuery);
  begin
    { mode }
    if AQry.FieldByName('filter_by').asString = 'O' then
      AFilter.Mode := mfOvervall
    else if AQry.FieldByName('filter_by').asString = 'E' then
      AFilter.Mode := mfEPlant
    else if AQry.FieldByName('filter_by').asString = 'C' then
      AFilter.Mode := mfMfgCell
    else
      AFilter.Mode := mfOvervall;

    case AFilter.Mode of
      mfOvervall:
        begin
          AFilter.MfgType := AQry.FieldByName('mfgtype').asString;
          AFilter.MfgCell := '';
          AFilter.EPlant_ID := 0;
        end;
      mfEPlant:
        begin
          AFilter.MfgType := AQry.FieldByName('mfgtype').asString;
          AFilter.MfgCell := '';
          AFilter.EPlant_ID := AQry.FieldByName('eplant_id').asFloat;
        end;
      mfMfgCell:
        begin
          AFilter.MfgType := AQry.FieldByName('mfgtype').asString;
          AFilter.MfgCell := SelectValueByID('mfgcell', 'mfgcell',
            AQry.FieldByName('mfgcell_id').asFloat);
          AFilter.EPlant_ID := AQry.FieldByName('eplant_id').asFloat;
        end;
    end;

    AFilter.Work_Center_ID := 0;
  end;

{ ---------------------------------------------------------------------------- }
  function CreateMonitor(AQry: TFDQuery): TFrmM_RTEff_View;
  begin
    { create the monitor! }
    Result := TFrmM_RTEff_View.Create(uniGUIApplication.UniApplication);
    with Result do
    begin
      IsDemoMode:= 0;
      { Assign the title }

      SetTitle(AQry.FieldByName('descrip').asString);

      { Set filter and refresh display }
      AssignFilterRefreshDisplay(AFilter);

      { show on the display. put them temporarily in the top left corner }
      pnlCarrier.Align := alNone;
      pnlCarrier.Parent := self.ScrollBoxDisplay;
      pnlCarrier.Left := 0;
      pnlCarrier.Top := 0;
      pnlCarrier.Width := ClientWidth;
      pnlCarrier.Height := ClientHeight;
    end;
  end;

begin
  { --------------------------------------------------------------------------- }
  AQry := TFDQuery.Create(nil);
  with AQry do
    try
      Connection := uniMainModule.FDConnection1;
      SQL.Add(Format
        ('select descrip, filter_by, eplant_id, mfgtype, mfgcell_id from m_view_detail where m_view_id = %.0f order by seq',
        [FM_View_ID]));
      Open;
      while not Eof do
      begin
        AssignFilter(AQry);
        FList.Add(CreateMonitor(AQry));
        Next;
      end;
      ArrangeMonitorsOnTheScreen;
    finally
      Free;
    end;
end;

procedure TFrmM_Viewer.ArrangeMonitorsOnTheScreen;
const
  cGAP = 10;
var
  I: Integer;
  AOffs: Integer;
  AFloor: Integer;
begin
  AOffs := 0; // cGAP;
  AFloor := 0;
  // ScrollBoxDisplay.HorzScrollBar.Range:= 0;
  // ScrollBoxDisplay.VertScrollBar.Range:= 0;

  for I := 0 to FList.Count - 1 do
    with TFrmM_RTEff_View(FList[I]) do
    begin
      pnlCarrier.Top := AOffs + 1;
      pnlCarrier.Align := alTop;
      pnlCarrier.Height := 240;
      AOffs := AOffs + pnlCarrier.Height;
      {
        if AOffs + pnlCarrier.Width - 1 > self.ScrollBoxDisplay.ClientWidth then
        begin
        if AOffs = 0 then
        self.ScrollBoxDisplay.HorzScrollBar.Range:= pnlCarrier.Width
        else
        begin
        AFloor:= AFloor + 1;
        AOffs := cGAP;
        end;
        end;

        pnlCarrier.Left:= AOffs;
        pnlCarrier.Top:= AFloor * (pnlCarrier.Height + cGAP) + cGAP;

        AOffs:= AOffs + pnlCarrier.Width  + cGAP;

        self.ScrollBoxDisplay.VertScrollBar.Range:= pnlCarrier.Top + pnlCarrier.Height;
      }
    end;

  ScrollBoxDisplay.Realign;
end;

procedure TFrmM_Viewer.FormResize(Sender: TObject);
begin
  // ArrangeMonitorsOnTheScreen;
end;

procedure TFrmM_Viewer.PkViewIQModify(Sender: TObject; var Action: TModalResult;
  var ResultValue: Variant);
begin
  Action := mrOK;
  ResultValue := 0;
  PostMessage(self.Handle, wm_Command, SetupViewer1.Command, 0);
end;

procedure TFrmM_Viewer.Contents1Click(Sender: TObject);
begin
  IQHelp.HelpContext(self.HelpContext); { IQMS.Common.HelpHook.pas }
end;

procedure TFrmM_Viewer.FormActivate(Sender: TObject);
begin
  IQHelp.AssignHTMLFile(iqchmMFG { CHM } , iqhtmRT { HTM } );
  { IQMS.Common.HelpHook.pas }
end;

procedure TFrmM_Viewer.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  AFocusControl: TControl;
begin
  if Key = VK_F1 then
  begin
    AFocusControl := ActiveControl;
    if Assigned(AFocusControl) and (AFocusControl.HelpContext <= 0) then
      PostMessage(Handle, wm_Command, Contents1.Command, 0); { Call "Contents" }
    Key := 0;
  end;
end;

end.
