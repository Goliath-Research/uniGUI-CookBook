unit uniGUITypes;

{ uniGUI documents TUniStrings as a TStringList descendant
  (uniGUITypes.pas, component reference). The sample reads ajax
  parameters with Params.Values, which is TStrings.Values. }

interface

uses
  Classes;

type
  TUniStrings = class(TStringList);

implementation

end.
