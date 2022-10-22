unit schd_def_wo_caption;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Buttons,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniMultiItem,
  uniListBox,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniLabel;

type
  TFrmSchdDefineWOCaption = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    pnlAvail: TUniPanel;
    lstboxAvail: TUniListBox;
    Splitter1: TUniSplitter;
    pnlSelect: TUniPanel;
    lstboxSelect: TUniListBox;
    Panel5: TUniPanel;
    sbtnRight: TUniSpeedButton;
    sbtnLeft: TUniSpeedButton;
    Panel4: TUniPanel;
    Label3: TUniLabel;
    Panel3: TUniPanel;
    Label4: TUniLabel;
    PnlButtonsInner: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    procedure sbtnRightClick(Sender: TObject);
    procedure sbtnLeftClick(Sender: TObject);
    procedure lstboxSelectMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstboxSelectDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstboxSelectDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure lstboxAvailMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lstboxAvailDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lstboxAvailDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure UniFormCreate(Sender: TObject);
  private
    procedure LoadAvailableCaptions;
    procedure SetProperty_Caption(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    class function DoShowModal( var ACaption: string ): Boolean;
    property Property_Caption: string write SetProperty_Caption;
  end;

implementation

{$R *.dfm}

uses
  IQMS.Common.StringUtils,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  sched_rscstr;

{ TFrmSchdDefineWOCaption }

class function TFrmSchdDefineWOCaption.DoShowModal( var ACaption: string): Boolean;
var
  frm : TFrmSchdDefineWOCaption;
begin
  frm := TFrmSchdDefineWOCaption.Create( uniGUIApplication.UniApplication );
  frm.LoadAvailableCaptions;
  frm.Property_Caption := ACaption;
  Result:= frm.ShowModal = mrOK;
  if Result then
     ACaption:= StrTran( Copy(frm.lstboxSelect.Items.Text, 1, Length(frm.lstboxSelect.Items.Text)-2), #13#10, '+');
end;

procedure TFrmSchdDefineWOCaption.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self, pnlAvail, pnlSelect ]);
end;

procedure TFrmSchdDefineWOCaption.sbtnRightClick(Sender: TObject);
begin
  if lstboxAvail.ItemIndex = -1 then
     EXIT;

  if lstboxSelect.Items.IndexOf( lstboxAvail.Items[ lstboxAvail.ItemIndex ]) > -1 then
     EXIT;

  lstboxSelect.Items.Add( lstboxAvail.Items[ lstboxAvail.ItemIndex ]);
end;

procedure TFrmSchdDefineWOCaption.SetProperty_Caption(const Value: string);
begin
  lstboxSelect.Items.Text:= StrTran( Value, '+', #13#10 );;
end;

procedure TFrmSchdDefineWOCaption.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self, pnlAvail, pnlSelect ]);
end;

procedure TFrmSchdDefineWOCaption.sbtnLeftClick(Sender: TObject);
begin
  if lstboxSelect.ItemIndex = -1 then
     EXIT;

  lstboxSelect.Items.Delete( lstboxSelect.ItemIndex );
end;

procedure TFrmSchdDefineWOCaption.lstboxSelectMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ ssLeft ]) and (lstboxSelect.ItemIndex > -1) then
     lstboxSelect.BeginDrag( FALSE )
end;

procedure TFrmSchdDefineWOCaption.lstboxSelectDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  APoint: TPoint;
  I     : Integer;
begin
  if (Source = lstboxAvail) and (Sender = lstboxSelect) then
  begin
    Accept:= lstboxSelect.Items.IndexOf( lstboxAvail.Items[ lstboxAvail.ItemIndex ]) = -1;
    EXIT;
  end;

  {same listbox - change seq}
  APoint.X := X;
  APoint.Y := Y;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'ItemAtPos'
  I:= lstboxSelect.ItemAtPos( APoint, True );

  Accept:= lstboxSelect.ItemIndex <> I;                             }
end;

procedure TFrmSchdDefineWOCaption.lstboxSelectDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  APoint: TPoint;
  I     : Integer;
begin
  APoint.X := X;
  APoint.Y := Y;
  { TODO -oathite -cWebConvert : Undeclared identifier: 'ItemAtPos'
  I:= lstboxSelect.ItemAtPos( APoint, True );

  if Sender = Source then
     lstboxSelect.Items.Move( lstboxSelect.ItemIndex, I )
  else
     lstboxSelect.Items.Insert( I, lstboxAvail.Items[ lstboxAvail.ItemIndex ]) }
end;


procedure TFrmSchdDefineWOCaption.btnOKClick(Sender: TObject);
begin
  IQAssert( lstboxSelect.Items.Count > 0, 'Nothing is selected.' );
  ModalResult:= mrOK;
end;

procedure TFrmSchdDefineWOCaption.LoadAvailableCaptions;
begin
  lstboxAvail.Clear;
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000001 {'Mfg#'     });
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000002 {'Tool#'    });
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000003 {'Customer' });
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000004 {'Material' });
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000005 {'Material Color Group'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000006 {'Labor'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000010 {'Mfg Description'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000011 {'Process#'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000012 {'Process Description'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000013 {'WO#'});
  lstboxAvail.Items.Add( sched_rscstr.cTXT0000014 {'Item#'});
end;

procedure TFrmSchdDefineWOCaption.lstboxAvailMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ ssLeft ]) and (lstboxAvail.ItemIndex > -1) then
     lstboxAvail.BeginDrag( FALSE )
end;

procedure TFrmSchdDefineWOCaption.lstboxAvailDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= (Sender = lstboxAvail) and (Source = lstboxSelect)
end;

procedure TFrmSchdDefineWOCaption.lstboxAvailDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  lstboxSelect.Items.Delete( lstboxSelect.ItemIndex );
end;

end.
