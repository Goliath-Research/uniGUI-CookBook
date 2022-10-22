unit IQMS.WebVcl.Connection;

interface

uses
  FireDAC.Comp.Client;

type
  TIQWebConnection = class(TFDConnection)
  published
    property Connected stored False;
  end;

implementation

end.
