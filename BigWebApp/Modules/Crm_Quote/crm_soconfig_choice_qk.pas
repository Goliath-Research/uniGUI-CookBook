unit crm_soconfig_choice_qk;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
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
  uniLabel;

type
  TFrmSalesConfigChoiceQk = class(TUniForm)
    Panel1: TUniPanel;
    Panel2: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Panel3: TUniPanel;
    Panel4: TUniPanel;
    Splitter1: TUniSplitter;
    Panel5: TUniPanel;
    Label1: TUniLabel;
    Label2: TUniLabel;
    edCode: TUniEdit;
    edDescrip: TUniEdit;
    Bevel1: TUniPanel;
    Label3: TUniLabel;
    edPrice: TUniEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSales_Choice_ID: Real;
  public
    { Public declarations }
    class function DoShowModal(var ASales_Choice_ID: Real ): TModalResult;
  end;



implementation

{$R *.dfm}

uses
  IQMS.Common.DataLib,
  IQMS.Common.RegFrm,
  IQMS.Common.Miscellaneous,
  IQMS.Common.StringUtils,
  IQMS.Common.Numbers;

{ TFrmSalesConfigChoiceQk }

class function TFrmSalesConfigChoiceQk.DoShowModal(var ASales_Choice_ID: Real): TModalResult;
var
  FrmSalesConfigChoiceQk: TFrmSalesConfigChoiceQk;
begin
  FrmSalesConfigChoiceQk := TFrmSalesConfigChoiceQk.Create(uniGUIApplication.UniApplication);
  with FrmSalesConfigChoiceQk do
  begin
    try
       Result:= ShowModal;
       if Result = mrOK then
          ASales_Choice_ID:= FSales_Choice_ID;
    finally
      //Release;
    end;
  end;
end;

procedure TFrmSalesConfigChoiceQk.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

procedure TFrmSalesConfigChoiceQk.FormShow(Sender: TObject);
begin
  IQRegFormRead(self, [self])
end;

procedure TFrmSalesConfigChoiceQk.btnOKClick(Sender: TObject);
var
  APrice: Real;
begin
  APrice:= 0;
  IQAssert( Trim(edCode.Text) > '', 'Code must be entered.');
  if edPrice.Text > '' then
     IQAssert( IQMS.Common.Numbers.IsStringValidFloat( edPrice.Text, APrice ), 'Invalid price - operation aborted' );

  FSales_Choice_ID:= GetNextID('sales_choice');
  ExecuteCommandFmt('insert into sales_choice( id, code, descrip, price ) values ( %f, ''%s'', ''%s'', %s )',
            [ FSales_Choice_ID,
              FixStr(Trim(edCode.Text)),
              FixStr(Trim(edDescrip.Text)),
              IQMS.Common.StringUtils.FloatToStr0asNull( APrice, 'null') ]);

  ModalResult:= mrOK;
end;

end.
