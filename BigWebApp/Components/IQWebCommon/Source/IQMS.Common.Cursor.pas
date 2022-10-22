unit IQMS.Common.Cursor;

interface

uses
  Winapi.Windows, Vcl.Forms, System.Classes, Vcl.Controls;

const
  crJump        = 1;
  crDrill       = 2;
  crJumpDrill   = 3;
  crDoubleClick = 4;
  crRightClick  = 5;

implementation

{*UG_rem_AE*}
//{$R IQCursor.res}

initialization
  Screen.Cursors[ crJump        ]:= LoadCursor(HInstance, 'JUMP');
  Screen.Cursors[ crDrill       ]:= LoadCursor(HInstance, 'DRILL');
  Screen.Cursors[ crJumpDrill   ]:= LoadCursor(HInstance, 'JUMP_DRILL');
  Screen.Cursors[ crDoubleClick ]:= LoadCursor(HInstance, 'DOUBLE_CLICK');
  Screen.Cursors[ crRightClick  ]:= LoadCursor(HInstance, 'RIGHT_CLICK');
end.
