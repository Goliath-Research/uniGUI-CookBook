unit DDOption;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  ComCtrls,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniPageControl,
  uniLabel,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniEdit,
  uniButton, uniPanel;

type
  TDDOptions = class(TUniForm)
    PageControl1: TUniPageControl;
    shGeneral: TUniTabSheet;
    Label1: TUniLabel;
    eSize: TUniEdit;
    Button1: TUniButton;
    Button2: TUniButton;
    Label2: TUniLabel;
  private
    { Private declarations }
     function GetMaxBufferSize:Integer;
     procedure SetMaxBufferSize( AValue : Integer );
  public
    { Public declarations }
    property MaxBufferSize: Integer read GetMaxBufferSize write SetMaxBufferSize;
  end;


implementation

{$R *.DFM}

function TDDOptions.GetMaxBufferSize:Integer;
begin
  Result:= StrToIntDef( eSize.Text, 0 );
end;

procedure TDDOptions.SetMaxBufferSize( AValue : Integer );
begin
  eSize.Text:= IntToStr( AValue );
end;

end.

