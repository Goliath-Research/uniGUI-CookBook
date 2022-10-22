// Code based on work done by Brad Stowers DFS.inc file (www.delphifreestuff.com).
// (See also article by Brad at http://www.howtodothings.com/showarticle.asp?article=189)
// and Mike Lischke's compilers.inc file (http://www.delphi-gems.com)
//----------------------------------------------------------------------------------------------------------------------

{$ifdef Win32}
  {$ifdef VER310}
    {$define COMPILER_10}
    {$define DELPHI}
    {$define DELPHI_10}
  {$endif}

  {$ifdef VER300}
    {$define COMPILER_10}
    {$define DELPHI}
    {$define DELPHI_10}
  {$endif}

  {$ifdef VER260}
    {$define COMPILER_XE5}
    {$define DELPHI_XE5}
    {$define DELPHI_XE5}
  {$endif}

  {$ifdef VER220}
    {$define COMPILER_XE}
    {$define DELPHI_XE}
    {$define DELPHI_XE}
  {$endif}

  {$ifdef VER150}
    {$define COMPILER_7}
    {$define DELPHI}
    {$define DELPHI_7}
  {$endif}

  {$ifdef VER130}
    {$define COMPILER_5}
    {$ifdef BCB}
      {$define CPPB}
      {$define CPPB_5}
    {$else}
      {$define DELPHI}
      {$define DELPHI_5}
    {$endif}
  {$endif}

  {$ifdef COMPILER_5}
    {$define COMPILER_5_UP}
  {$endif}

  {$ifdef COMPILER_7}
    {$define COMPILER_5_UP}
    {$define COMPILER_7_UP}
  {$endif}

  {$ifdef DELPHI_5}
    {$define DELPHI_5_UP}
  {$endif}

  {$ifdef DELPHI_7}
    {$define DELPHI_5_UP}
    {$define DELPHI_7_UP}
  {$endif}

  {$ifdef DELPHI_XE}
    {$define DELPHI_5_UP}
    {$define DELPHI_7_UP}
    {$define DELPHI_XE_UP}
  {$endif}

  {$ifdef DELPHI_XE5}
    {$define DELPHI_5_UP}
    {$define DELPHI_7_UP}
    {$define DELPHI_XE_UP}
    {$define DELPHI_XE5_UP}
  {$endif}

  {$ifdef DELPHI_10}
    {$define DELPHI_5_UP}
    {$define DELPHI_7_UP}
    {$define DELPHI_XE_UP}
    {$define DELPHI_XE5_UP}
    {$define DELPHI_10_UP}
  {$endif}

{$else (not Windows)}
  // Linux is the target
  {$define KYLIX}
  {$define KYLIX_1}
  {$define KYLIX_1_UP}
{$endif}

/////////////////////////////////////////////////////////////////////////////
//  Stop the Platform messages
/////////////////////////////////////////////////////////////////////////////

{$IFDEF DELPHI_7_UP}
{$warn SYMBOL_PLATFORM off}
{$warn UNIT_PLATFORM off}
{$ENDIF}

//----------------------------------------------------------------------------------------------------------------------

