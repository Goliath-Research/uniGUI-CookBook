unit crm_ccconst;

{ ---------------------------------------------------------------------------- }
{ Call Center constant and type declarations }
{ ---------------------------------------------------------------------------- }

interface

uses
   System.Classes;

{ Callback procedure }
type
  TAfterAddCallHistory = procedure(const ACRMCallHistID: Real) of object;

type
  PCallerRec = ^TCallerRec;

  TCallerRec = packed record
    CallerName: String;
    CallerNumber: String;
    Source: String;
    SourceID: Real;
    ContactID: Real;
  end;

  // AllocMem(SizeOf(TCallerRec))
  // FreeMem

const
  dirCallIn = 'IN';
  dirCallOut = 'OUT';

implementation

end.
