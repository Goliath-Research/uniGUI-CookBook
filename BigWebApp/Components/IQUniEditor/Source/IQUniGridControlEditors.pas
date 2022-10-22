unit IQUniGridControlEditors;
{***@@@---------------------------------------------------------------------***}
{               uniGUI Web Application Framework for Delphi                    }
{                                                                              }
{ This source code is copyrighted material.                                    }
{ Copyright (c) FMSoft Co. Ltd. 2009-2016. All rights reserved.                }
{                                                                              }
{ See License.pdf under installation folder for details.                       }
{                                                                              }
{ Developed by: Farshad Mohajeri                                               }
{ Contact: farshad@fmsoft.net - info@fmsoft.net                                }
{ http://www.unigui.com                                                        }
{ http://www.fmsoft.net                                                        }
{------------------------------------------------------------------------------}

interface

uses
  Classes, Controls, SysUtils, DesignIntf, DesignEditors, Dialogs, WideStrings,
  DBReg, IQUniGrid, ColnEdit;


implementation

uses
  uniGUIEditors, uniGUIAbstractClasses, uniDBGrid;

initialization
  RegisterPropertyEditor(TypeInfo(TControl), TUniBaseDBGridColumn, 'Editor', TDBGridEditorProperty);
  RegisterPropertyEditor(TypeInfo(TUniDBGridColumns), TIQUniGridControl, 'Columns', TUniDBColumnsProperty);


end.
