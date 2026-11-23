unit Controls;

{ Modal results the login form assigns. Delphi's System.UITypes defines
  mrOk = idOk = 1 and mrCancel = idCancel = 2. The test and the sample
  both compile against these constants. }

interface

const
  mrNone    = 0;
  mrOk      = 1;
  mrCancel  = 2;
  mrAbort   = 3;
  mrRetry   = 4;
  mrIgnore  = 5;
  mrYes     = 6;
  mrNo      = 7;
  mrClose   = 8;
  mrAll     = 9;
  mrNoToAll = 10;
  mrYesToAll = 11;

implementation

end.
