unit IQMS.Common.InputQuery;

interface

uses
  Winapi.Windows,
  System.SysUtils,
  Vcl.Controls,
  Vcl.Forms,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPanel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniButton,  Vcl.StdCtrls,
  uniLabel, uniEdit, System.Classes;

type
  { TFrmIQInputQuery }
  TFrmIQInputQuery = class(TUniForm)
    PnlButtons: TUniPanel;
    Panel1: TUniPanel;
    BtnOk: TUniButton;
    BtnCancel: TUniButton;
    PnlMain: TUniPanel;
    Label1: TUniLabel;
    MaskEdit1: TUniEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

function IQInputQuery(const ACaption, APrompt: string; var Value: string): Boolean; overload;
function IQInputQuery(const ACaption, APrompt: string; var Value: string;AMask: string): Boolean; overload;
function IQInputQuery(const ACaption, APrompt: string; var Value: string;ALength: Integer): Boolean; overload;
function IQInputQueryUpper(const ACaption, APrompt: string;var Value: string): Boolean;


implementation

{$R *.DFM}

uses
  IQMS.Common.RegFrm;

function IQInputQuery(const ACaption, APrompt: string;
  var Value: string): Boolean;
begin
  Result := IQInputQuery(ACaption, APrompt, Value, '');
end;

function IQInputQuery(const ACaption, APrompt: string; var Value: string;
  AMask: string): Boolean;
var
  FrmIQInputQuery: TFrmIQInputQuery;
begin
  Result := False;
  FrmIQInputQuery:= TFrmIQInputQuery.Create(uniGUIApplication.UniApplication);
  with FrmIQInputQuery do
    begin
        Caption := ACaption;
        Label1.Caption := APrompt;
        MaskEdit1.InputMask.Mask := AMask;
        MaskEdit1.Text := Value;
      if ShowModal = mrOk then
        begin
          Value := MaskEdit1.Text;
          Result := True;
        end;
    end;
end;

function IQInputQuery(const ACaption, APrompt: string; var Value: string;  ALength: Integer): Boolean;
var
  FrmIQInputQuery: TFrmIQInputQuery;
begin
  Result := False;
  FrmIQInputQuery:= TFrmIQInputQuery.Create(uniGUIApplication.UniApplication);
  with FrmIQInputQuery do
    begin
      Caption := ACaption;
      Label1.Caption := APrompt;
      MaskEdit1.MaxLength := ALength;
      MaskEdit1.Text := Value;
      if ShowModal = mrOk then
        begin
          Value := MaskEdit1.Text;
          Result := True;
        end;
    end;
end;


function IQInputQueryUpper(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
  FrmIQInputQuery: TFrmIQInputQuery;
begin
  Result := False;
  FrmIQInputQuery:= TFrmIQInputQuery.Create(uniGUIApplication.UniApplication);
  with FrmIQInputQuery do
    begin
      Caption := ACaption;
      Label1.Caption := APrompt;
      MaskEdit1.CharCase := ecUpperCase;
      MaskEdit1.Text := Value;
      if ShowModal = mrOk then
        begin
          Value := MaskEdit1.Text;
          Result := True;
        end;
    end;
end;

procedure TFrmIQInputQuery.FormCreate(Sender: TObject);
begin
  IQRegFormRead(self, [self]);
end;

procedure TFrmIQInputQuery.FormShow(Sender: TObject);
begin
  if MaskEdit1.CanFocus then
     MaskEdit1.SetFocus;

end;

procedure TFrmIQInputQuery.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IQRegFormWrite(self, [self]);
end;

end.
