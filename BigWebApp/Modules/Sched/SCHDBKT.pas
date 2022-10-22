unit SchdBkt;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.SecurityRegister,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniDateTimePicker,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,
  uniLabel;

type
  TFrmProdBucketEnd = class(TUniForm)
    SR: TIQWebSecurityRegister;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    PnlMain: TUniPanel;
    btnOK: TUniButton;
    btnCancel: TUniButton;
    Label1: TUniLabel;
    DateTimePicker1: TUniDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create( AOwner: TComponent; ADate: TDateTime );
  end;

function GetProdBucketEndDate( var ADate: TDateTime ):Boolean;

var
  FrmProdBucketEnd: TFrmProdBucketEnd;

implementation

{$R *.DFM}

uses
  IQSecIns,
  IQMS.Common.RegFrm;

function GetProdBucketEndDate( var ADate: TDateTime ):Boolean;
begin
  with TFrmProdBucketEnd.Create( Application,ADate ) do
  try
    Result:= ShowModal = mrOK;
    if Result then
       ADate:= DateTimePicker1.Date;
  finally
    Free;
  end;
end;

constructor TFrmProdBucketEnd.Create( AOwner: TComponent; ADate: TDateTime );
begin
  inherited Create( AOwner );
  IQRegFormRead( self, [self]);
  if ADate > 0 then
     DateTimePicker1.Date:= ADate
  else
     DateTimePicker1.Date:= Date;
end;

procedure TFrmProdBucketEnd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQRegFormWrite( self, [self]);
end;

procedure TFrmProdBucketEnd.FormShow(Sender: TObject);
begin
  EnsureSecurityInspectorOnTopOf( self );
end;

end.
