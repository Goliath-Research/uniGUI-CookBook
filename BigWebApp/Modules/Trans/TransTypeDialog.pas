unit TransTypeDialog;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  Vcl.CheckLst,
  vcl.Wwdbdatetimepicker,
  MainModule,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniPanel,
  uniGroupBox,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel, uniDateTimePicker, uniDBDateTimePicker, Vcl.StdCtrls;

type
  TFrmTransTypeDialog = class(TUniForm)
    Panel2: TUniPanel;
    PnlToolbar: TUniPanel;
    lstTypes: TCheckListBox;
    sbtnSelectAll: TUniSpeedButton;
    sbtnUnselectAll: TUniSpeedButton;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    gbDates: TUniGroupBox;
    cmbStartDate: TUniDBDateTimePicker;
    cmbEndDate: TUniDBDateTimePicker;
    lblStartDate: TUniLabel;
    lblEndDate: TUniLabel;
    PnlDates: TUniPanel;
    PnlDateControls: TUniPanel;
    PnlDateControlsLeft: TUniPanel;
    PnlDateControlsRight: TUniPanel;
    sbtnStartDate: TUniSpeedButton;
    sbtnEndDate: TUniSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnSelectAllClick(Sender: TObject);
    procedure sbtnUnselectAllClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure sbtnStartDateClick(Sender: TObject);
    procedure sbtnEndDateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSelectedFrom(AList: TStringList);
    procedure SelectAll(Value: Boolean);
    procedure CheckApplyTouchScreen;
    procedure SetList(AList: TStringList);
    procedure SetFrom(Afrom:TDatetime);
    procedure SetdTo(ATo:TDatetime);
  public
    { Public declarations }
    class function DoShowModal(var AList: TStringList; var AFrom:TDateTime; var ATo:TDateTime ): Boolean;
    procedure SaveSelectedTo(var AList: TStringList);
    property List: TStringList write SetList;
    property From :Tdatetime write SetFrom;
    property dTo :Tdatetime write SetdTo;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.ApplicationSet,
  IQMS.Common.Controls,
  IQMS.Common.RegFrm,
  IQMS.WebVcl.Trans;
//  touchscrn;

{ TFrmTransTypeDialog }

class function TFrmTransTypeDialog.DoShowModal(var AList: TStringList; var AFrom:TDateTime; var ATo:TDateTime): Boolean;
var
  FrmTransTypeDialog: TFrmTransTypeDialog;
begin
  FrmTransTypeDialog:=TFrmTransTypeDialog.Create(uniGUIApplication.UniApplication);
  with FrmTransTypeDialog do
  begin
    List:=AList;
    From:=AFrom;
    dTo:=ATo;
    Result:= ShowModal = mrOK;
    if Result then
    begin
       SaveSelectedTo( AList );
       AFrom := cmbStartDate.Datetime;
       ATo   := cmbEndDate.Datetime;
    end;
  end;
end;

procedure TFrmTransTypeDialog.FormShow(Sender: TObject);
begin
  // 12/19/2014 Apply touch-screen style
  CheckApplyTouchScreen;
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormRead(self, [self]);
end;

procedure TFrmTransTypeDialog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if not IQMS.Common.ApplicationSet.IsTouchScreen then
    IQRegFormWrite(self, [self]);
end;

procedure TFrmTransTypeDialog.LoadSelectedFrom( AList: TStringList );
var
  I: Integer;
  AIndex: Integer;
begin
  for I:= 0 to AList.Count - 1 do
  begin
    AIndex:= lstTypes.Items.IndexOf( AList[ I ] );
    if AIndex > -1 then
       lstTypes.Checked[ AIndex ]:= TRUE;
  end;
end;


procedure TFrmTransTypeDialog.SaveSelectedTo( var AList: TStringList );
var
  I: Integer;
begin
  AList.Clear;
  for I:= 0 to lstTypes.Items.Count - 1 do
  begin
    if lstTypes.Checked[ I ] then
       AList.Add( lstTypes.Items[ I ]);
  end;
end;

procedure TFrmTransTypeDialog.sbtnSelectAllClick(Sender: TObject);
begin
  SelectAll( TRUE );
end;

procedure TFrmTransTypeDialog.sbtnUnselectAllClick(Sender: TObject);
begin
  SelectAll( FALSE );
end;

procedure TFrmTransTypeDialog.SelectAll( Value: Boolean );
var
  I: Integer;
begin
  for I:= 0 to lstTypes.Items.Count - 1 do
    lstTypes.Checked[ I ]:= Value;
end;


procedure TFrmTransTypeDialog.SetdTo(ATo: TDatetime);
begin
  if ATo = 0 then
    cmbEndDate.DateTime := Date
  else
    cmbEndDate.DateTime := ATo;
end;

procedure TFrmTransTypeDialog.SetFrom(Afrom: TDatetime);
begin
  if AFrom = 0 then
    cmbStartDate.DateTime := Date
  else
    cmbStartDate.DateTime := AFrom;
end;

procedure TFrmTransTypeDialog.SetList(AList: TStringList);
begin
  // CheckListBox1.MultiSelect:= TRUE;
  IQMS.WebVcl.Trans.PopulateTransTypeList( lstTypes.Items );

  LoadSelectedFrom( AList );
end;

procedure TFrmTransTypeDialog.btnOKClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TFrmTransTypeDialog.CheckApplyTouchScreen;
begin
//  if IQMS.Common.ApplicationSet.IsTouchScreen then
//    begin
//      // Form
//      Self.Width := 800;
//      Self.Height := 600;
//      IQMS.Common.Controls.CenterForm(Self, True);
//      touchscrn.ApplyTouchscreenFont(Self);
//
//      // Toolbar
//      PnlToolbar.Height := 42;
//      sbtnSelectAll.Width := 40;
//      sbtnSelectAll.Height := 40;
//      sbtnUnselectAll.Width := 40;
//      sbtnUnselectAll.Height := 40;
//      StackUpControlsLeft(1, 0, [sbtnSelectAll, sbtnUnselectAll]);
//
//      // Date controls
//      PnlDateControlsRight.Visible := True;
//      PnlDates.Height := 118;
//      IQMS.Common.Controls.IQAlignControls([sbtnStartDate, cmbStartDate, lblStartDate], acVerticalCenters);
//      IQMS.Common.Controls.IQAlignControls([sbtnEndDate, cmbEndDate, lblEndDate], acVerticalCenters);
//      cmbStartDate.ShowButton := False;
//      cmbEndDate.ShowButton := False;
//
//      // List
//      lstTypes.Style := lbOwnerDrawFixed;
//      lstTypes.ItemHeight := 25;
//
//      // Modal Vcl.Buttons
//      PnlButtons.Height := 62;
//      PnlButtonsInner.Width := 260;
//      btnOK.Width := 120;
//      btnOK.Height := 40;
//      btnCancel.Width := 120;
//      btnCancel.Height := 40;
//      StackUpControlsLeft(1, 4, [btnOK, btnCancel]);
//    end;
end;

procedure TFrmTransTypeDialog.sbtnStartDateClick(Sender: TObject);
begin
  // Edit the start date
//  touchscrn.TouchScreen_EditDate(cmbStartDate);
end;

procedure TFrmTransTypeDialog.sbtnEndDateClick(Sender: TObject);
begin
  // Edit the end date
//  touchscrn.TouchScreen_EditDate(cmbEndDate);
end;

end.
