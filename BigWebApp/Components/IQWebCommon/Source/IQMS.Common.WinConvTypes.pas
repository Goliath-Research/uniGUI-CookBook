unit IQMS.Common.WinConvTypes;

interface

{$WEAKPACKAGEUNIT ON}

uses
  Winapi.Windows;

type
  PHICON = ^HICON;

  {$IFDEF UNICODE}
  LPCTSTR = PWideChar;
  LPTSTR  = PWideChar;
  PCTSTR  = PWideChar;
  PTSTR   = PWideChar;
  TCHAR   = WideChar;
  {$ELSE}
  LPCTSTR = PAnsiChar;
  LPTSTR  = PAnsiChar;
  PCTSTR  = PAnsiChar;
  PTSTR   = PAnsiChar;
  TCHAR   = Char;
  {$ENDIF UNICODE}
  {$EXTERNALSYM LPCTSTR}
  {$EXTERNALSYM LPTSTR}
  {$EXTERNALSYM PCTSTR}
  PPWSTR = ^PWideChar;
  PPASTR = ^PAnsiChar;
  PPSTR  = ^PTSTR;
  {$EXTERNALSYM PTSTR}

type
  ULONG_PTR = DWORD;
  {$EXTERNALSYM ULONG_PTR}
  DWORD_PTR = DWORD;
  {$EXTERNALSYM DWORD_PTR}
  UINT_PTR  = DWORD;
  {$EXTERNALSYM UINT_PTR}
  ULONG32 = ULONG;
  {$EXTERNALSYM ULONG32}
  ULONG64 = Int64;   // (rom) no unsigned Int64 available in Delphi
  {$EXTERNALSYM ULONG64}

implementation

end.
