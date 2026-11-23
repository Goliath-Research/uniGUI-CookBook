unit uniGUIForm;

interface

uses
  Classes;

type
  TUniForm = class(TComponent)
  private
    FModalResult: Integer;
  public
    property ModalResult: Integer read FModalResult write FModalResult;
  end;

  TUniLoginForm = class(TUniForm);

implementation

end.
