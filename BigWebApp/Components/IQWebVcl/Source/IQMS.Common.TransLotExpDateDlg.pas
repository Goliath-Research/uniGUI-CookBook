unit IQMS.Common.TransLotExpDateDlg;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.CaptionPanel,
  vcl.Wwdbdatetimepicker,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniEdit,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel,
  Vcl.Graphics,
  uniDateTimePicker,
  uniDBDateTimePicker;

type
  TFrmTransLotExpDateDlg = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Panel5: TUniPanel;
    Splitter1: TUniSplitter;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    CaptionPanel1: TIQWebCaptionPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    Label3: TUniLabel;
    edItemNo: TUniEdit;
    edLotNo: TUniEdit;
    wwDBDateTimePickerExpDate: TUniDBDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    FArinvt_ID: Real;
    FLotNo: string;
    procedure Validate;
    procedure SetFArinvt_ID(AArinvt_ID: Real);
    procedure SetFLotNo(ALotNo: string);
  public
    { Public declarations }
    class procedure DoShowModal(AArinvt_ID: Real; ALotNo: string );
    property Arinvt_ID: Real read FArinvt_ID write SetFArinvt_ID;
    property LotNo: string read FLotNo write SetFLotNo;
  end;


implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils;


{ TFrmTransLotExpDateDlg }

class procedure TFrmTransLotExpDateDlg.DoShowModal(AArinvt_ID: Real; ALotNo: string);
var
  FrmTransLotExpDateDlg: TFrmTransLotExpDateDlg;
begin
  FrmTransLotExpDateDlg:=TFrmTransLotExpDateDlg.Create(uniGUIApplication.UniApplication);
  with FrmTransLotExpDateDlg do
  begin
    Arinvt_ID:=AArinvt_ID;
    LotNo    := ALotNo;
    ShowModal;
  end;
end;

procedure TFrmTransLotExpDateDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [ self ]);
end;

procedure TFrmTransLotExpDateDlg.SetFArinvt_ID(AArinvt_ID: Real);
begin
  FArinvt_ID:=AArinvt_ID;
  edItemNo.Text:= SelectValueByID('itemno', 'arinvt', AArinvt_ID);
end;

procedure TFrmTransLotExpDateDlg.SetFLotNo(ALotNo: string);
begin
  FLotNo:=ALotNo;
  edLotNo.Text := ALotNo;
end;

procedure TFrmTransLotExpDateDlg.UniFormCreate(Sender: TObject);
begin
  IQRegFormRead( self, [ self ]);
end;

procedure TFrmTransLotExpDateDlg.btnOKClick(Sender: TObject);
begin
  Validate;

  ExecuteCommandFmt('begin                                                                                          '+
            '  arinvt_misc.assign_lot_expiry_date( %f, ''%s'', to_date(''%s'', ''mm/dd/yyyy hh24:mi:ss'')); '+
            'end;                                                                                           ',
            [ FArinvt_ID,
              FixStr( FLotNo ),
              FormatDateTime( 'mm/dd/yyyy hh:nn:ss', wwDBDateTimePickerExpDate.DateTime )]);

  ModalResult:= mrOK;
end;

procedure TFrmTransLotExpDateDlg.Validate;
begin
  IQAssert( wwDBDateTimePickerExpDate.DateTime > 0, 'Lot Exp. Date must be entered - operation aborted' );
end;



end.
