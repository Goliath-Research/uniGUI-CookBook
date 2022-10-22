unit IQMS.Common.formula_editor_base;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  IQMS.WebVcl.About,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.Clipbrd,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  uniGUIBaseClasses,
  uniGUIClasses,
  uniButton,
  uniBitBtn,
  uniSpeedButton,
  uniImageList,
  uniTreeView,
  UniMemo,
  uniPanel,
  uniSplitter,
  uniGUITypes,
  uniGUIAbstractClasses,
  uniGUIForm,
  uniGUIApplication,
  uniMainMenu,System.StrUtils,
  uniLabel, uniHTMLMemo;

type
  TFormulaTVCargo = class
    Index: Integer;
    ID: Real;
    Expression: String;
    Syntax: String;
    Description: String;
    constructor CreateParameter(AID: Real; ADescription: String = '');
    constructor CreateExpression(AExpr: String;
      ASyntax: String = ''; ADescription: String = '');
  end;

type
  TFrmFormulaEditorBase = class(TUniForm)
    PnlSQL: TUniPanel;
    Bevel2: TUniPanel;
    PnlSQLToolbar: TUniPanel;
    sbtnClearSQL: TUniSpeedButton;
    sbtnTestSQL: TUniSpeedButton;
    Bevel3: TUniPanel;
    memSQL: TUniHTMLMemo;
    PnlFieldList: TUniPanel;
    Splitter1: TUniSplitter;
    tv: TUniTreeView;
    MainMenu1: TUniMainMenu;
    File1: TUniMenuItem;
    Exit1: TUniMenuItem;
    Help1: TUniMenuItem;
    About1: TUniMenuItem;
    IQAbout1: TIQWebAbout;
    SyntaxCheck1: TUniMenuItem;
    N1: TUniMenuItem;
    ClearFormula1: TUniMenuItem;
    PSQL: TUniPopupMenu;
    SelectAllSQL1: TUniMenuItem;
    MenuItem1: TUniMenuItem;
    CopySQL1: TUniMenuItem;
    PasteSQL1: TUniMenuItem;
    CutSQL1: TUniMenuItem;
    ClearSQL1: TUniMenuItem;
    N2: TUniMenuItem;
    SyntaxCheck2: TUniMenuItem;
    PnlButtons: TUniPanel;
    PnlButtonsInner: TUniPanel;
    btnOk: TUniBitBtn;
    btnCancle: TUniBitBtn;
    tvImages: TUniImageList;
    PnlSummary: TUniPanel;
    lblItemLine1: TUniLabel;
    Panel2: TUniPanel;
    PnlEditorControls: TUniPanel;
    sbtnSymbol1: TUniSpeedButton;
    sbtnSymbol2: TUniSpeedButton;
    sbtnSymbol3: TUniSpeedButton;
    sbtnSymbol4: TUniSpeedButton;
    sbtnSymbol5: TUniSpeedButton;
    sbtnSymbol6: TUniSpeedButton;
    sbtnSymbol7: TUniSpeedButton;
    sbtnSymbol8: TUniSpeedButton;
    sbtnSymbol9: TUniSpeedButton;
    sbtnSymbol10: TUniSpeedButton;
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure SyntaxCheck1Click(Sender: TObject);
    procedure ClearFormula1Click(Sender: TObject);
    procedure memSQLChange(Sender: TObject);
    procedure memSQLMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SelectAllSQL1Click(Sender: TObject);
    procedure CopySQL1Click(Sender: TObject);
    procedure PasteSQL1Click(Sender: TObject);
    procedure CutSQL1Click(Sender: TObject);
    procedure memSQLDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure memSQLDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvDblClick(Sender: TObject);
    procedure memSQLMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvChange(Sender: TObject; Node: TUniTreeNode);
    procedure DoSymbolClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FModified: Boolean;
    // FSPCInspectionID: Real;
    FDragging: Boolean;
    FTableName: string;
    procedure UpdateSQLEditor;
    function GetTagAt(const APos: Integer; const AText: string; var AStart,
      AEnd: Integer): String;
    procedure InsertSelected;
    procedure InsertExpr(const AExpr: String);
    procedure LoadTreeExprByClass(const AParent: TUniTreeNode;
      const AClass: String);
    procedure SummarizeItem(const AText, AHint: String);
    function GetFormula: string;
    procedure SetFormula(const Value: string);
  protected
    FParameterRootNode: TUniTreeNode;

    /// <summary> Loads the tree view.  It is unnecessary to call this method
    /// directly since it is called when the form is displayed.
    /// </summary>
    procedure LoadTree;

    /// <summary> Load the dataset-specific parameters.  Descendent classes
    /// must provide this method in order for parameters to be added.
    /// Loop the appropriate dataset, calling AddParameterNode() to
    /// add each parameter.
    /// </summary>
    procedure LoadParameters; virtual;

    /// <summary> Add a Parameter node.  Parameters are used as values
    /// within the formula.
    /// </summary>
    /// <param name="ADescription">The name or description text to display
    /// in the tree view.
    /// </param>
    /// <param name="AValue">The ID value associated with the node.
    /// </param>
    function AddParameterNode(ADescription: string; AValue: Int64): TUniTreeNode;

    /// <summary> If no source dataset values are found -- such that no
    /// parameters could be listed -- add a node indicating that no
    /// parameters were found.
    /// </summary>
    function AddNoParametersFoundNode: TUniTreeNode;

  public
    { Public declarations }
    constructor Create( AFormula: String);

    /// <summary> Get or set the formula. </summary>
    property Formula: string read GetFormula write SetFormula;

    /// <summary> The table name that contains the ID values expected
    /// in the formula.  The table must have the field ID.
    /// </summary>
    property TableName: string read FTableName write FTableName;

    /// <summary> Test the syntax of a formula. An error is returned if the
    /// test fails.
    /// </summary>
    /// <param name="AFormula">The formula to test.
    /// </param>
    /// <param name="ATableName">The table name that contains the ID values.
    /// Requires the given table to have the field ID.
    /// </param>
    /// <param name="AErrorMsg">The error message, if returned.
    /// </param>
    /// <returns>True if syntax check was successful.  False if the syntax
    /// check failed.
    /// </returns>
    class function TestFormula(AFormula, ATableName: String;
      var AErrorMsg: string): Boolean;

    /// <summary> Get the list of ID values used within a formula. </summary>
    /// <param name="AFormula">The formula to evaluate.
    /// </param>
    /// <param name="AList">The string list containing ID values.
    /// </param>
    class function FormulaIDList(const AFormula: String;
      var AList: TStringList): Boolean;
  end;

{$REGION 'Resource strings'}


resourcestring
  cTXT0000529 = 'Invalid Parameter ID in formula:  {%s}';
  cTXT0000530 = 'Parameters';
  cTXT0000531 = 'Returns a number that is the absolute value of the number ' +
    'passed to the function.';
  cTXT0000532 = 'Returns a number that is the arccosine of the number ' +
    'passed to the function.';
  cTXT0000533 = 'Returns a number that is the arcsine of the number passed ' +
    'to the function.';
  cTXT0000534 = 'Returns a number that is the arctangent of the number ' +
    'passed to the function.';
  cTXT0000535 = 'Returns a number between -pi and pi representing the ' +
    'angle of the point, x and y.';
  cTXT000000538 = 'Functions';
  cTXT000000539 = 'Text';
  cTXT000000540 = 'Math';
  cTXT000000541 = 'Conversion';
  cTXT000000542 = 'Date and Time';
  cTXT000000543 = 'Evaluation';
  cTXT000000544 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000545 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000546 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000547 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000548 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000549 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000550 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000551 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000552 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000553 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000554 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000555 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000556 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000557 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000558 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000559 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000560 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000561 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000562 = 'Returns a number that is the absolute value of the number ' +
    'passed to the function.';
  cTXT000000563 = 'Returns a number that is the arccosine of the number ' +
    'passed to the function.';
  cTXT000000564 = 'Returns a number that is the arcsine of the number passed ' +
    'to the function.';
  cTXT000000565 = 'Returns a number that is the arctangent of the number ' +
    'passed to the function.';
  cTXT000000566 = 'Returns a number between -pi and pi representing the ' +
    'angle of the point, x and y.';
  cTXT000000567 = 'Returns the nearest integer greater than or equal to the ' +
    'number passed to the function.';
  cTXT000000568 = 'Returns the cosign of the number passed to the function.';
  cTXT000000569 = 'Returns a number that is the exponential of the number ' +
    'passed to the function.';
  cTXT000000570 = 'Returns the nearest integer less than or equal to the ' +
    'number passed to the function.';
  cTXT000000571 = 'Returns a number representing the logarithm of the given ' +
    'number.';
  cTXT000000572 = 'Returns the greatest number from the numeric arguments ' +
    'supplied to the function.';
  cTXT000000573 = 'Returns the lowest number from the numeric arguments ' +
    'supplied to the function';
  cTXT000000574 = 'Returns a number representing the base raised a given ' +
    'power.';
  cTXT000000575 = 'Returns a random number between 0 and 1.';
  cTXT000000576 = 'Rounds the given number to the nearest integer.';
  cTXT000000577 = 'Returns a number that is the sine of the number passed to ' +
    'the function.';
  cTXT000000578 = 'Returns a number that is the square root of the number ' +
    'passed to the function.';
  cTXT000000579 = 'Returns a number that is the tangent of the number passed ' +
    'to the function.';
  cTXT000000580 = 'Decodes and returns text from the encoded Uniform ' +
    'Resource Identifier (URI) passed to the function.';
  cTXT000000581 = 'Returns decoded text from the encoded component of a ' +
    'Uniform Resource Identifier (URI) passed to the function.';
  cTXT000000582 = 'Encodes and returns text from the non-encoded Uniform ' +
    'Resource Identifier (URI) passed to the function.';
  cTXT000000583 = 'Returns encoded text from the non-encoded component of a ' +
    'Uniform Resource Identifier (URI) passed to the function.';
  cTXT000000584 = 'Returns Unicode text encoded from the text passed to the ' +
    'function.';
  cTXT000000585 = 'Returns text concatenated from the argument list of ' +
    'Unicode character bytes.';
  cTXT000000586 = 'Returns a number converted from text.  The provided text ' +
    'must represent a valid number or a NaN is returned.';
  cTXT000000587 = 'Returns an integer converted from text.  The optional ' +
    'radix parameter, a value between 2 and 36, indicates the ' +
    'base of the number returned.';
  cTXT000000588 = 'Returns text representing the date.';
  cTXT000000589 = 'Returns text representing a number in exponential notation.';
  cTXT000000590 = 'Returns text representing a number in fixed point notation.';
  cTXT000000591 = 'Returns text representing the date.  The date is ' +
    'formatted using local regional settings.';
  cTXT000000592 = 'Converts all alphabetic characters to lower case.  The ' +
    'locale is checked to prevent conflicts with Unicode case ' +
    'mappings.';
  cTXT000000593 = 'Returns text representing the date.  The date is ' +
    'formatted using local regional settings.';
  cTXT000000594 = 'Returns text representing the time.  The time is ' +
    'formatted using local regional settings.';
  cTXT000000595 = 'Converts all alphabetic characters to upper case.  The ' +
    'locale is checked to prevent conflicts with Unicode case ' +
    'mappings.';
  cTXT000000596 = 'Converts all alphabetic characters to lower case.';
  cTXT000000597 = 'Returns text representing a number with a specified ' +
    'number of digits.';
  cTXT000000598 = 'Returns text representing the time.';
  cTXT000000599 = 'Converts all alphabetic characters to upper case.';
  cTXT000000600 = 'Returns text representing the date using Universal ' +
    'Coordinated Time (UTC).';
  cTXT000000601 = 'Evaluates a date and time passed as a string of text, and ' +
    'returns an integer representing the number of ' +
    'milliseconds between midnight, January 1, 1970 and the ' +
    'date passed to the function.';
  cTXT000000602 = 'Returns an integer representing the day of the month (1 ' +
    'to 31) for the given date object.';
  cTXT000000603 = 'Returns an integer representing the day of the week (0 to ' +
    '6) for the given date object.';
  cTXT000000604 = 'Returns a number representing the year for the given date ' +
    'object.';
  cTXT000000605 = 'Returns an integer representing the hour (0 to 23) for ' +
    'the given date object.';
  cTXT000000606 = 'Returns an integer representing the milliseconds (0 to ' +
    '999) for the given date object.';
  cTXT000000607 = 'Returns an integer representing the minutes (0 to 59) for ' +
    'the given date object.';
  cTXT000000608 = 'Returns an integer representing the month (0 to 11) for ' +
    'the given date object.';
  cTXT000000609 = 'Returns an integer representing the seconds (0 to 59) for ' +
    'the given date object.';
  cTXT000000610 = 'Returns an integer representing the number of ' +
    'milliseconds between midnight, January 1, 1970 and the ' +
    'given date object.';
  cTXT000000611 = 'Returns an integer representing the number of minutes ' +
    'between Universal Coordinated Time (UTC) and local ' +
    'computer clock.';
  cTXT000000612 = 'Returns an integer representing the day of the month (1 ' +
    'to 31) in Universal Coordinated Time (UTC) for the given ' +
    'date object.';
  cTXT000000613 = 'Returns an integer representing the day of the week (0 to ' +
    '6) in Universal Coordinated Time (UTC) for the given date ' +
    'object.';
  cTXT000000614 = 'Returns a number representing the year in Universal ' +
    'Coordinated Time (UTC) for the given date object.';
  cTXT000000615 = 'Returns an integer representing the hour (0 to 23) in ' +
    'Universal Coordinated Time (UTC) for the given date object.';
  cTXT000000616 = 'Returns an integer representing the milliseconds (0 to ' +
    '999) in Universal Coordinated Time (UTC) for the given ' +
    'date object.';
  cTXT000000617 = 'Returns an integer representing the minutes (0 to 59) in ' +
    'Universal Coordinated Time (UTC) for the given date object.';
  cTXT000000618 = 'Returns an integer representing the month (0 to 11) in ' +
    'Universal Coordinated Time (UTC) for the given date object.';
  cTXT000000619 = 'Returns an integer representing the seconds (0 to 59) in ' +
    'Universal Coordinated Time (UTC) for the given date object.';
  cTXT000000620 = 'Sets the day of the month (integer) for the date object.';
  cTXT000000621 = 'Sets the year (integer) for the date object.  The month ' +
    '(integer) and the day (integer) of the month are optional.';
  cTXT000000622 = 'Sets the hour (integer) for the date object.  Minutes ' +
    '(integer) and seconds (integer) are optional.';
  cTXT000000623 = 'Sets milliseconds for the date object.';
  cTXT000000624 = 'Sets minutes (integer) for the date object.  Seconds ' +
    '(integer) and milliseconds (integer) are optional.';
  cTXT000000625 = 'Sets the month (integer) for the date object.  The day ' +
    '(integer) of the month is optional.';
  cTXT000000626 = 'Sets seconds (integer) for the date object.  The ' +
    'milliseconds (integer) parameter is optional.';
  cTXT000000627 = 'Sets the date and time in milliseconds (integer) for the ' +
    'date object.';
  cTXT000000628 = 'Sets the day of the month (integer) for the date object ' +
    'using Universal Coordinated Time (UTC).';
  cTXT000000629 = 'Sets the year (integer) for the date object using ' +
    'Universal Coordinated Time (UTC).  The month (integer) ' +
    'and the day (integer) of the month are optional.';
  cTXT000000630 = 'Sets the hour (integer) for the date object using ' +
    'Universal Coordinated Time (UTC).  Minutes (integer) and ' +
    'seconds (integer) are optional.';
  cTXT000000631 = 'Sets milliseconds for the date object using Universal ' +
    'Coordinated Time (UTC).';
  cTXT000000632 = 'Sets minutes (integer) for the date object using ' +
    'Universal Coordinated Time (UTC).  Seconds (integer) and ' +
    'milliseconds (integer) are optional.';
  cTXT000000633 = 'Sets the month (integer) for the date object using ' +
    'Universal Coordinated Time (UTC).  The day (integer) of ' +
    'the month is optional.';
  cTXT000000634 = 'Sets seconds (integer) for the date object using ' +
    'Universal Coordinated Time (UTC).  The milliseconds ' +
    '(integer) parameter is optional.';
  cTXT000000635 = 'Sets the year (integer) for the date object.  The month ' +
    '(integer) and the day (integer) of the month are optional.';
  cTXT000000636 = 'Returns text representing the date.';
  cTXT000000637 = 'Returns the number of milliseconds from 12:00 midnight ' +
    'January 1, 1970 GMT to the given date.';
  cTXT000000638 = 'Returns a Boolean (True or False) depending on whether or ' +
    'not the supplied number is finite.';
  cTXT000000639 = 'Returns a Boolean (True or False) depending on whether or ' +
    'not the supplied number is a NaN (Not a Number).';
  cTXT000000640 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000641 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000642 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000643 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000644 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000645 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000646 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000647 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000648 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000649 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000650 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000651 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000652 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000653 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000654 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000655 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000656 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000657 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000658 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000659 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000660 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000661 = 'Returns the character at the specified index within a ' +
    'string, where 0 is the position of the first character.';
  cTXT000000662 = 'Returns an integer representing the Unicode encoding of ' +
    'the character located the specified index within the ' +
    'string.';
  cTXT000000663 = 'Returns text concatenated from the list of arguments.';
  cTXT000000664 = 'Returns an integer indicating the index of the first ' +
    'position of a substring within the given text starting at ' +
    'the specified index.';
  cTXT000000665 = 'Returns an integer indicating the index of the last ' +
    'position of a substring within the given text starting at ' +
    'the specified index.';
  cTXT000000666 = 'Returns text where the old text has been replaced by the ' +
    'new text within the original text.';
  cTXT000000667 = 'Returns an integer indicating the index of the first ' +
    'position of a substring within the given text.';
  cTXT000000668 = 'Returns a section of text from the start position ' +
    '(integer) to the end position (integer).';
  cTXT000000669 = 'Returns a section of text having the specified length ' +
    'beginning at the start position.';
  cTXT000000670 = 'Returns a section of text from the start position to the ' +
    'end position.';
  cTXT000000671 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000672 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000673 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000674 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000675 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000676 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000677 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000678 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000679 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000680 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000681 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000682 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000683 = ''; // Reserved for expression item (spc_formula_editor.pas)
  cTXT000000690 = 'Success!  No errors found.';
  cTXT000000691 = 'Clear formula?';
  cTXT000000692 = '(No parameters found)';
  // cTXT000000693 = '';
  // cTXT000000694 = '';
  // cTXT000000695 = '';
  // cTXT000000696 = '';
  // cTXT000000697 = '';
  // cTXT000000698 = '';
  // cTXT000000699 = '';
  // cTXT000000700 = '';
  // cTXT000000701 = '';
  // cTXT000000702 = '';
  // cTXT000000703 = '';
  // cTXT000000704 = '';
  // cTXT000000705 = '';
  // cTXT000000706 = '';
  // cTXT000000707 = '';
  // cTXT000000708 = '';
  // cTXT000000709 = '';
  // cTXT000000710 = '';
  // cTXT000000711 = '';
  // cTXT000000712 = '';
  // cTXT000000713 = '';
  // cTXT000000714 = '';
  // cTXT000000715 = '';
  // cTXT000000716 = '';
  // cTXT000000717 = '';
  // cTXT000000718 = '';
  // cTXT000000719 = '';
  // cTXT000000720 = '';

{$ENDREGION 'Resource strings'}

{$REGION 'Constants'}


const
  constNUMBERS = ['0' .. '9'];
  constLOWER = ['a' .. 'z'];
  constUPPER = ['A' .. 'Z'];
  constSPECIAL = ['_'];
  constFORMULA = ['{', '}', '/', '-', '+', '=', '>', '<', '!', '|', '*', '(',
    ')', '?', ':', ' '];
  constCOMMON_CHARS = constNUMBERS + constLOWER + constUPPER + constSPECIAL;
  constVALID_CHARS = constCOMMON_CHARS + constFORMULA;

  CATEGORY_ARRAY = 'ARRAY';
  CATEGORY_MATH = 'MATH';
  CATEGORY_CONVERSION = 'CONVERSION';
  CATEGORY_DATETIME = 'DATETIME';
  CATEGORY_INSPECTION = 'INSPECTION';
  CATEGORY_PROGRAM_FLOW = 'PROGRAM';
  CATEGORY_TEXT = 'TEXT';
  CATEGORY_HTML = 'HTML';

  { Array containing JScript commands that can be used in the formula editor.
    These methods are documented on-line:

    JScript Language Documentation:
    http://msdn.microsoft.com/en-us/library/hbxc2t98(VS.85).aspx

    JScript Operators
    http://msdn.microsoft.com/en-us/library/ce57k8d5(VS.85).aspx

    JScript Math Object:
    http://msdn.microsoft.com/en-us/library/b272f386(VS.85).aspx

    JScript Methods
    http://msdn.microsoft.com/en-us/library/c6hac83s(VS.85).aspx

  }

  AExprArray: array [0 .. 139, 0 .. 3] of String =
    (
    ( { Expression: } 'concat()',
    { Syntax: } 'array1.concat([item1, item2, ..., itemN)',
    { Description: } cTXT000000544, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'dimensions()',
    { Syntax: } 'array.dimensions()',
    { Description: } cTXT000000545, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'getItem()',
    { Syntax: } 'safeArray.getItem(dimension1, dimension2, ...)',
    { Description: } cTXT000000546, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'join()',
    { Syntax: } 'arrayObj.join([separator])',
    { Description: } cTXT000000547, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'lbound()',
    { Syntax: } 'safeArray.lbound(dimension)',
    { Description: } cTXT000000548, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'match()',
    { Syntax: } 'stringObj.match(rgExp)',
    { Description: } cTXT000000549, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'pop()',
    { Syntax: } 'arrayObj.pop()',
    { Description: } cTXT000000550, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'push()',
    { Syntax: } 'arrayObj.push(item1, item2, . . ., itemN)',
    { Description: } cTXT000000551, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'reverse()',
    { Syntax: } 'arrayObj.reverse()',
    { Description: } cTXT000000552, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'shift()',
    { Syntax: } 'arrayObj.shift()',
    { Description: } cTXT000000553, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'slice()',
    { Syntax: } 'arrayObj.slice(start, end)',
    { Description: } cTXT000000554, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'sort()',
    { Syntax: } 'arrayobj.sort(sortFunction)',
    { Description: } cTXT000000555, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'splice()',
    { Syntax: }
    'arrayObj.splice(start, deleteCount, item1, item2, . . . ,itemN)',
    { Description: } cTXT000000556, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'split()',
    { Syntax: } 'stringObj.split(separator, limit)',
    { Description: } cTXT000000557, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'toArray()',
    { Syntax: } 'safeArray.toArray()',
    { Description: } cTXT000000558, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'ubound()',
    { Syntax: } 'ubound()',
    { Description: } cTXT000000559, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'unescape()',
    { Syntax: } 'unescape()',
    { Description: } cTXT000000560, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'unshift()',
    { Syntax: } 'unshift()',
    { Description: } cTXT000000561, // ''
    { Category: } CATEGORY_ARRAY),

    ( { Expression: } 'Math.abs()',
    { Syntax: } 'Math.abs(number)',
    { Description: } cTXT0000531, // Returns a number that is
    // the absolute value of the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.acos()',
    { Syntax: } 'Math.acos(number)',
    { Description: } cTXT0000532, // Returns a number that is
    // the arccosine of the number
    // passed to the function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.asin()',
    { Syntax: } 'Math.asin(number)',
    { Description: } cTXT0000533, // Returns a number that is
    // the arcsine of the number
    // passed to the function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.atan()',
    { Syntax: } 'Math.atan(number)',
    { Description: } cTXT0000534, // Returns a number that is
    // the arctangent of the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.atan2()',
    { Syntax: } 'Math.atan2(x, y)',
    { Description: } cTXT0000535, // Returns a number between
    // -pi and pi representing the
    // angle of the point, x and y.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.ceil()',
    { Syntax: } 'Math.ceil(number)',
    { Description: } cTXT000000567, // Returns the nearest integer
    // greater than or equal to
    // the number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.cos()',
    { Syntax: } 'Math.cos(number)',
    { Description: } cTXT000000568, // Returns the cosign of the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.exp()',
    { Syntax: } 'Math.exp(number)',
    { Description: } cTXT000000569, // Returns a number that is
    // the exponential of the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.floor()',
    { Syntax: } 'Math.floor(number)',
    { Description: } cTXT000000570, // Returns the nearest integer
    // less than or equal to the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.log()',
    { Syntax: } 'Math.log(number)',
    { Description: } cTXT000000571, // Returns a number
    // representing the logarithm
    // of the given number.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.max()',
    { Syntax: } 'Math.max(number1, number2, . . ., numberN)',
    { Description: } cTXT000000572, // Returns the greatest number
    // from the numeric arguments
    // supplied to the function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.min()',
    { Syntax: } 'Math.min(number1, number2, . . ., numberN)',
    { Description: } cTXT000000573, // Returns the lowest number
    // from the numeric arguments
    // supplied to the function
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.pow()',
    { Syntax: } 'Math.pow(base, exponent)',
    { Description: } cTXT000000574, // Returns a number
    // representing the base
    // raised a given power.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.random()',
    { Syntax: } 'Math.random()',
    { Description: } cTXT000000575, // Returns a random number
    // between 0 and 1.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.round()',
    { Syntax: } 'Math.round(number)',
    { Description: } cTXT000000576, // Rounds the given number to
    // the nearest integer.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.sin()',
    { Syntax: } 'Math.sin(number)',
    { Description: } cTXT000000577, // Returns a number that is
    // the sine of the number
    // passed to the function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.sqrt()',
    { Syntax: } 'Math.sqrt(number)',
    { Description: } cTXT000000578, // Returns a number that is
    // the square root of the
    // number passed to the
    // function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'Math.tan()',
    { Syntax: } 'Math.tan(number)',
    { Description: } cTXT000000579, // Returns a number that is
    // the tangent of the number
    // passed to the function.
    { Category: } CATEGORY_MATH),

    ( { Expression: } 'decodeURI()',
    { Syntax: } 'decodeURI(URI_text)',
    { Description: } cTXT000000580, // Decodes and returns text
    // from the encoded Uniform
    // Resource Identifier (URI)
    // passed to the function.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'decodeURIComponent()',
    { Syntax: } 'decodeURIComponent(encoded_URI_text)',
    { Description: } cTXT000000581, // Returns decoded text from
    // the encoded component of a
    // Uniform Resource Identifier
    // (URI) passed to the function.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'encodeURI()',
    { Syntax: } 'encodeURI(URI_text)',
    { Description: } cTXT000000582, // Encodes and returns text
    // from the non-encoded
    // Uniform Resource Identifier
    // (URI) passed to the function.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'encodeURIComponent()',
    { Syntax: } 'encodeURIComponent(encoded_URI_text)',
    { Description: } cTXT000000583, // Returns encoded text from
    // the non-encoded component
    // of a Uniform Resource
    // Identifier (URI) passed to
    // the function.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'escape()',
    { Syntax: } 'escape(character)',
    { Description: } cTXT000000584, // Returns Unicode text
    // encoded from the text
    // passed to the function.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'fromCharCode()',
    { Syntax: } 'string_object.fromCharCode(number1, number2, ..., numberN)',
    { Description: } cTXT000000585, // Returns text concatenated
    // from the argument list of
    // Unicode character bytes.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'parseFloat()',
    { Syntax: } 'parseFloat(text)',
    { Description: } cTXT000000586, // Returns a number converted
    // from text.  The provided
    // text must represent a valid
    // number or a NaN is returned.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'parseInt()',
    { Syntax: } 'parseInt(text, radix)',
    { Description: } cTXT000000587, // Returns an integer
    // converted from text.  The
    // optional radix parameter, a
    // value between 2 and 36,
    // indicates the base of the
    // number returned.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toDateString()',
    { Syntax: } 'date_object.toDateString()',
    { Description: } cTXT000000588, // Returns text representing
    // the date.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toExponential()',
    { Syntax: } 'number_object.toExponential(digits)',
    { Description: } cTXT000000589, // Returns text representing a
    // number in exponential
    // notation.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toFixed()',
    { Syntax: } 'number_object.toFixed(digits)',
    { Description: } cTXT000000590, // Returns text representing a
    // number in fixed point
    // notation.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLocaleDateString()',
    { Syntax: } 'date_object.toLocaleDateString()',
    { Description: } cTXT000000591, // Returns text representing
    // the date.  The date is
    // formatted using local
    // regional settings.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLocaleLowerCase()',
    { Syntax: } 'string_object.toLocaleLowerCase()',
    { Description: } cTXT000000592, // Converts all alphabetic
    // characters to lower case.
    // The locale is checked to
    // prevent conflicts with
    // Unicode case mappings.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLocaleString()',
    { Syntax: } 'date_object.toLocaleString()',
    { Description: } cTXT000000593, // Returns text representing
    // the date.  The date is
    // formatted using local
    // regional settings.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLocaleTimeString()',
    { Syntax: } 'date_object.toLocaleTimeString()',
    { Description: } cTXT000000594, // Returns text representing
    // the time.  The time is
    // formatted using local
    // regional settings.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLocaleUpperCase()',
    { Syntax: } 'string_object.toLocaleUpperCase()',
    { Description: } cTXT000000595, // Converts all alphabetic
    // characters to upper case.
    // The locale is checked to
    // prevent conflicts with
    // Unicode case mappings.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toLowerCase()',
    { Syntax: } 'string_object.toLowerCase()',
    { Description: } cTXT000000596, // Converts all alphabetic
    // characters to lower case.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toPrecision()',
    { Syntax: } 'number_object.toPrecision(precision)',
    { Description: } cTXT000000597, // Returns text representing a
    // number with a specified
    // number of digits.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toTimeString()',
    { Syntax: } 'date_object.toTimeString()',
    { Description: } cTXT000000598, // Returns text representing
    // the time.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toUpperCase()',
    { Syntax: } 'string_object.toUpperCase()',
    { Description: } cTXT000000599, // Converts all alphabetic
    // characters to upper case.
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'toUTCString()',
    { Syntax: } 'date_object.toUTCString()',
    { Description: } cTXT000000600, // Returns text representing
    // the date using Universal
    // Coordinated Time (UTC).
    { Category: } CATEGORY_CONVERSION),

    ( { Expression: } 'Date.parse()',
    { Syntax: } 'Date.parse(date_text)',
    { Description: } cTXT000000601, // Evaluates a date and time
    // passed as a string of text,
    // and returns an integer
    // representing the number of
    // milliseconds between
    // midnight, January 1, 1970
    // and the date passed to the
    // function.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getDate()',
    { Syntax: } 'date_object.getDate()',
    { Description: } cTXT000000602, // Returns an integer
    // representing the day of the
    // month (1 to 31) for the
    // given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getDay()',
    { Syntax: } 'date_object.getDay()',
    { Description: } cTXT000000603, // Returns an integer
    // representing the day of the
    // week (0 to 6) for the given
    // date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getFullYear()',
    { Syntax: } 'date_object.getFullYear()',
    { Description: } cTXT000000604, // Returns a number
    // representing the year for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getHours()',
    { Syntax: } 'date_object.getHours()',
    { Description: } cTXT000000605, // Returns an integer
    // representing the hour (0 to
    // 23) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getMilliseconds()',
    { Syntax: } 'date_object.getMilliseconds()',
    { Description: } cTXT000000606, // Returns an integer
    // representing the
    // milliseconds (0 to 999) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getMinutes()',
    { Syntax: } 'date_object.getMinutes()',
    { Description: } cTXT000000607, // Returns an integer
    // representing the minutes (0
    // to 59) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getMonth()',
    { Syntax: } 'date_object.getMonth()',
    { Description: } cTXT000000608, // Returns an integer
    // representing the month (0
    // to 11) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getSeconds()',
    { Syntax: } 'date_object.getSeconds()',
    { Description: } cTXT000000609, // Returns an integer
    // representing the seconds (0
    // to 59) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getTime()',
    { Syntax: } 'date_object.getTime()',
    { Description: } cTXT000000610, // Returns an integer
    // representing the number of
    // milliseconds between
    // midnight, January 1, 1970
    // and the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getTimezoneOffset()',
    { Syntax: } 'date_object.getTimezoneOffset()',
    { Description: } cTXT000000611, // Returns an integer
    // representing the number of
    // minutes between Universal
    // Coordinated Time (UTC) and
    // local computer clock.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCDate()',
    { Syntax: } 'date_object.getUTCDate()',
    { Description: } cTXT000000612, // Returns an integer
    // representing the day of the
    // month (1 to 31) in
    // Universal Coordinated Time
    // (UTC) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCDay()',
    { Syntax: } 'date_object.getUTCDay()',
    { Description: } cTXT000000613, // Returns an integer
    // representing the day of the
    // week (0 to 6) in Universal
    // Coordinated Time (UTC) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCFullYear()',
    { Syntax: } 'date_object.getUTCFullYear()',
    { Description: } cTXT000000614, // Returns a number
    // representing the year in
    // Universal Coordinated Time
    // (UTC) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCHours()',
    { Syntax: } 'date_object.getUTCHours()',
    { Description: } cTXT000000615, // Returns an integer
    // representing the hour (0 to
    // 23) in Universal
    // Coordinated Time (UTC) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCMilliseconds()',
    { Syntax: } 'date_object.getUTCMilliseconds()',
    { Description: } cTXT000000616, // Returns an integer
    // representing the
    // milliseconds (0 to 999) in
    // Universal Coordinated Time
    // (UTC) for the given date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCMinutes()',
    { Syntax: } 'date_object.getUTCMinutes()',
    { Description: } cTXT000000617, // Returns an integer
    // representing the minutes (0
    // to 59) in Universal
    // Coordinated Time (UTC) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCMonth()',
    { Syntax: } 'date_object.getUTCMonth()',
    { Description: } cTXT000000618, // Returns an integer
    // representing the month (0
    // to 11) in Universal
    // Coordinated Time (UTC) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'getUTCSeconds()',
    { Syntax: } 'date_object.getUTCSeconds()',
    { Description: } cTXT000000619, // Returns an integer
    // representing the seconds (0
    // to 59) in Universal
    // Coordinated Time (UTC) for
    // the given date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setDate()',
    { Syntax: } 'date_object.setDate(month)',
    { Description: } cTXT000000620, // Sets the day of the month
    // (integer) for the date
    // object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setFullYear()',
    { Syntax: } 'date_object.setFullYear(year, month, day) ',
    { Description: } cTXT000000621, // Sets the year (integer) for
    // the date object.  The month
    // (integer) and the day
    // (integer) of the month are
    // optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setHours()',
    { Syntax: } 'date_object.setHours(hour, minutes, seconds)',
    { Description: } cTXT000000622, // Sets the hour (integer) for
    // the date object.  Minutes
    // (integer) and seconds
    // (integer) are optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setMilliseconds()',
    { Syntax: } 'date_object.setMilliseconds(milliseconds)',
    { Description: } cTXT000000623, // Sets milliseconds for the
    // date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setMinutes()',
    { Syntax: } 'date_object.setMinutes(minutes, seconds, milliseconds)',
    { Description: } cTXT000000624, // Sets minutes (integer) for
    // the date object.  Seconds
    // (integer) and milliseconds
    // (integer) are optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setMonth()',
    { Syntax: } 'date_object.setMonth(month, day)',
    { Description: } cTXT000000625, // Sets the month (integer)
    // for the date object.  The
    // day (integer) of the month
    // is optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setSeconds()',
    { Syntax: } 'date_object.setSeconds(seconds, milliseconds)',
    { Description: } cTXT000000626, // Sets seconds (integer) for
    // the date object.  The
    // milliseconds (integer)
    // parameter is optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setTime()',
    { Syntax: } 'date_object.setTime(milliseconds)',
    { Description: } cTXT000000627, // Sets the date and time in
    // milliseconds (integer) for
    // the date object.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCDate()',
    { Syntax: } 'date_object.setUTCDate(month)',
    { Description: } cTXT000000628, // Sets the day of the month
    // (integer) for the date
    // object using Universal
    // Coordinated Time (UTC).
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCFullYear()',
    { Syntax: } 'date_object.setUTCFullYear(year, month, day)',
    { Description: } cTXT000000629, // Sets the year (integer) for
    // the date object using
    // Universal Coordinated Time
    // (UTC).  The month (integer)
    // and the day (integer) of
    // the month are optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCHours()',
    { Syntax: } 'date_object.setUTCHours(hour, minutes, seconds)',
    { Description: } cTXT000000630, // Sets the hour (integer) for
    // the date object using
    // Universal Coordinated Time
    // (UTC).  Minutes (integer)
    // and seconds (integer) are
    // optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCMilliseconds()',
    { Syntax: } 'date_object.setUTCMilliseconds(milliseconds)',
    { Description: } cTXT000000631, // Sets milliseconds for the
    // date object using Universal
    // Coordinated Time (UTC).
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCMinutes()',
    { Syntax: } 'date_object.setUTCMinutes(minutes, seconds, milliseconds)',
    { Description: } cTXT000000632, // Sets minutes (integer) for
    // the date object using
    // Universal Coordinated Time
    // (UTC).  Seconds (integer)
    // and milliseconds (integer)
    // are optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCMonth()',
    { Syntax: } 'date_object.setUTCMonth(month, day)',
    { Description: } cTXT000000633, // Sets the month (integer)
    // for the date object using
    // Universal Coordinated Time
    // (UTC).  The day (integer)
    // of the month is optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setUTCSeconds()',
    { Syntax: } 'date_object.setUTCSeconds(seconds, milliseconds)',
    { Description: } cTXT000000634, // Sets seconds (integer) for
    // the date object using
    // Universal Coordinated Time
    // (UTC).  The milliseconds
    // (integer) parameter is
    // optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'setYear()',
    { Syntax: } 'date_object.setYear(year)',
    { Description: } cTXT000000635, // Sets the year (integer) for
    // the date object.  The month
    // (integer) and the day
    // (integer) of the month are
    // optional.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'toDateString()',
    { Syntax: } 'date_object.toDateString()',
    { Description: } cTXT000000636, // Returns text representing
    // the date.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'UTC()',
    { Syntax: }
    'date_object.UTC(year, month, day, hours, minutes, seconds, milliseconds)',
    { Description: } cTXT000000637, // Returns the number of
    // milliseconds from 12:00
    // midnight January 1, 1970
    // GMT to the given date.
    { Category: } CATEGORY_DATETIME),

    ( { Expression: } 'isFinite()',
    { Syntax: } 'isFinite(number)',
    { Description: } cTXT000000638, // Returns a Boolean (True or
    // False) depending on whether
    // or not the supplied number
    // is finite.
    { Category: } CATEGORY_INSPECTION),

    ( { Expression: } 'isNaN()',
    { Syntax: } 'isNaN(number)',
    { Description: } cTXT000000639, // Returns a Boolean (True or
    // False) depending on whether
    // or not the supplied number
    // is a NaN (Not a Number).
    { Category: } CATEGORY_INSPECTION),

    ( { Expression: } 'apply()',
    { Syntax: } 'functionObject.apply(object, argArray)',
    { Description: } cTXT000000640, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'atEnd()',
    { Syntax: } 'myEnum.atEnd()',
    { Description: } cTXT000000641, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'call()',
    { Syntax: } 'call(object, arg1, arg2, ..., argN)',
    { Description: } cTXT000000642, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'compile()',
    { Syntax: } 'rgExp.compile(pattern, flags)',
    { Description: } cTXT000000643, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'defineProperty()',
    { Syntax: } 'some_object.defineProperty(object, propertyname, descriptor)',
    { Description: } cTXT000000644, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'eval()',
    { Syntax: } 'eval(codeString)',
    { Description: } cTXT000000645, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'exec()',
    { Syntax: } 'rgExp.exec(codeString)',
    { Description: } cTXT000000646, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'getOwnPropertyDescriptor()',
    { Syntax: } 'some_object.getOwnPropertyDescriptor(object, propertyname)',
    { Description: } cTXT000000647, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'getVarDate()',
    { Syntax: } 'date_object.getVarDate()',
    { Description: } cTXT000000648, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'hasOwnProperty()',
    { Syntax: } 'some_object.hasOwnProperty(proName)',
    { Description: } cTXT000000649, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'isPrototypeOf()',
    { Syntax: } 'some_object.isPrototypeOf(object2)',
    { Description: } cTXT000000650, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'item()',
    { Syntax: } 'enumObj.item()',
    { Description: } cTXT000000651, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'JSON.parse()',
    { Syntax: } 'JSON.parse(text, reviver)',
    { Description: } cTXT000000652, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'JSON.stringify()',
    { Syntax: } 'JSON.stringify(value, replacer, space)',
    { Description: } cTXT000000653, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'localeCompare()',
    { Syntax: } 'stringVar.localeCompare(stringExp)',
    { Description: } cTXT000000654, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'moveFirst()',
    { Syntax: } 'enumObj.moveFirst()',
    { Description: } cTXT000000655, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'moveNext()',
    { Syntax: } 'enumObj.moveNext()',
    { Description: } cTXT000000656, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'test()',
    { Syntax: } 'rgExp.test(str)',
    { Description: } cTXT000000657, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'toJSON()',
    { Syntax: } 'objectname.toJSON()',
    { Description: } cTXT000000658, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'toString()',
    { Syntax: } 'objectname.toString(radix)',
    { Description: } cTXT000000659, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'valueOf()',
    { Syntax: } 'object.valueOf()',
    { Description: } cTXT000000660, // ''
    { Category: } CATEGORY_PROGRAM_FLOW),

    ( { Expression: } 'charAt()',
    { Syntax: } 'string_object.charAt(index)',
    { Description: } cTXT000000661, // Returns the character at
    // the specified index within
    // a string, where 0 is the
    // position of the first
    // character.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'charCodeAt()',
    { Syntax: } 'string_object.charCodeAt(index)',
    { Description: } cTXT000000662, // Returns an integer
    // representing the Unicode
    // encoding of the character
    // located the specified index
    // within the string.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'concat()',
    { Syntax: } 'string_object.concat(text2, text3, . . . , textN)',
    { Description: } cTXT000000663, // Returns text concatenated
    // from the list of arguments.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'indexOf()',
    { Syntax: } 'string_object.indexOf(substring, start_index)',
    { Description: } cTXT000000664, // Returns an integer
    // indicating the index of the
    // first position of a
    // substring within the given
    // text starting at the
    // specified index.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'lastIndexOf()',
    { Syntax: } 'string_object.lastIndexOf(substring, start_index)',
    { Description: } cTXT000000665, // Returns an integer
    // indicating the index of the
    // last position of a
    // substring within the given
    // text starting at the
    // specified index.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'replace()',
    { Syntax: } 'string_object.replace(old_text, new_text)',
    { Description: } cTXT000000666, // Returns text where the old
    // text has been replaced by
    // the new text within the
    // original text.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'search()',
    { Syntax: } 'string_object.search(findtext)',
    { Description: } cTXT000000667, // Returns an integer
    // indicating the index of the
    // first position of a
    // substring within the given
    // text.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'slice()',
    { Syntax: } 'string_object.slice(start, end)',
    { Description: } cTXT000000668, // Returns a section of text
    // from the start position
    // (integer) to the end
    // position (integer).
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'substr()',
    { Syntax: } 'string_object.substr(start, length)',
    { Description: } cTXT000000669, // Returns a section of text
    // having the specified length
    // beginning at the start
    // position.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'substring()',
    { Syntax: } 'string_object.substring(start, end)',
    { Description: } cTXT000000670, // Returns a section of text
    // from the start position to
    // the end position.
    { Category: } CATEGORY_TEXT),

    ( { Expression: } 'anchor()',
    { Syntax: } 'string_object.anchor(text)',
    { Description: } cTXT000000671, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'big()',
    { Syntax: } 'string_object.big()',
    { Description: } cTXT000000672, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'blink()',
    { Syntax: } 'string_object.blink()',
    { Description: } cTXT000000673, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'bold()',
    { Syntax: } 'string_object.bold()',
    { Description: } cTXT000000674, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'fixed()',
    { Syntax: } 'string_object.fixed()',
    { Description: } cTXT000000675, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'fontcolor()',
    { Syntax: } 'string_object.fontcolor(colorVal)',
    { Description: } cTXT000000676, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'fontsize()',
    { Syntax: } 'string_object.fontsize(intSize)',
    { Description: } cTXT000000677, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'italics()',
    { Syntax: } 'string_object.italics()',
    { Description: } cTXT000000678, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'link()',
    { Syntax: } 'string_object.link(linkstring)',
    { Description: } cTXT000000679, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'small()',
    { Syntax: } 'string_object.small()',
    { Description: } cTXT000000680, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'strike()',
    { Syntax: } 'string_object.strike()',
    { Description: } cTXT000000681, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'sub()',
    { Syntax: } 'string_object.sub()',
    { Description: } cTXT000000682, // ''
    { Category: } CATEGORY_HTML),

    ( { Expression: } 'sup()',
    { Syntax: } 'string_object.sup()',
    { Description: } cTXT000000683, // ''
    { Category: } CATEGORY_HTML)
    );

{$ENDREGION 'Constants'}



implementation

{$R *.dfm}


uses
  IQMS.Common.FormulaExpressionEval,
  IQMS.Common.Controls,
  IQMS.Common.DataLib,
  IQMS.Common.Dialogs,
  IQMS.Common.Miscellaneous,
  IQMS.Common.Numbers,
  IQMS.Common.RegFrm,
  IQMS.Common.Screen,
  IQMS.Common.StringUtils;
// spc_misc;

CONST
  VV = 1;

{$REGION 'TFormulaTVCargo'}

  { TFormulaTVCargo }

constructor TFormulaTVCargo.CreateParameter(AID: Real; ADescription: String);
begin
  Index := 1; // not zero-based
  ID := AID;
  Expression := '';
  Description := ADescription;
end;

constructor TFormulaTVCargo.CreateExpression(AExpr, ASyntax, ADescription: String);
begin
  Index := 2; // not zero-based
  Expression := AExpr;
  ID := 0;
  Syntax := ASyntax;
  Description := ADescription;
end;

{$ENDREGION 'TFormulaTVCargo'}

{$REGION 'TFrmFormulaEditorBase'}

{ TFrmFormulaEditorBase }

constructor TFrmFormulaEditorBase.Create( AFormula: String);
begin
  inherited Create(uniGUIApplication.UniApplication);
  memSQL.Text := AFormula;
  FModified := False;
end;

class function TFrmFormulaEditorBase.TestFormula(AFormula, ATableName: String; var AErrorMsg: string): Boolean;
var
  tmp: String;
  sl: TStringList;
  i, X: Integer;
  AID: Integer;
  AData: Variant;
begin
  // Initialization
  AErrorMsg := '';
  Result := True;
  sl := NIL;
  X := 0;

  // Do not evaluate an empty formula
  if Trim(AFormula) = '' then
    Exit(True);

  sl := TStringList.Create;
  try
    try
      Result := IQMS.Common.FormulaExpressionEval.ListFormulaIDValues(AFormula, sl);
    except
      on E: Exception do
        begin
          AErrorMsg := E.Message;
          Exit(False);
        end;
    end;

    // test the ID values
    for i := 0 to sl.Count - 1 do
      begin
        if not IQMS.Common.Numbers.IsStringValidInteger(sl.Strings[i], AID) then
          // cTXT0000529 = 'Invalid Parameter ID in formula:  {%s}';
          raise Exception.CreateFmt(cTXT0000529, [sl.Strings[i]]);

        if ATableName > '' then
          begin
            if SelectValueFmtAsInteger(
              'SELECT 1 FROM %s WHERE id = %d',
              [ATableName, AID]) = 0 then
              // cTXT0000529 = 'Invalid Parameter ID in formula:  {%s}';
              raise Exception.CreateFmt(cTXT0000529, [sl.Strings[i]]);
          end;
      end;

    // Use the "Expression Evaluator" to test the formula.
    // This component is declared in spc_expression_eval.pas,
    // and uses a .Net DLL.
    with TExprParams.CreateEx(uniGUIApplication.UniApplication, AFormula) do
      try
        // Cycle params and prepare the component
        for i := 0 to sl.Count - 1 do
          begin
            Inc(X);
            SetParam(StrToInt(sl.Strings[i]), X);
          end;

        try
          Execute;
          Result := True;
        except
          on E: Exception do
            begin
              AErrorMsg := E.Message;
              Exit(False);
            end;
        end;
      finally
        Free;
      end;
  finally
    if Assigned(sl) then
      FreeAndNil(sl);
  end;
end;

class function TFrmFormulaEditorBase.FormulaIDList(const AFormula: String;
  var AList: TStringList): Boolean;
var
  s, tmp: String;
  i, pos1, pos2: Integer;
  b: Boolean;
  r: Real;
begin
  // Initialization
  Result := False;
  b := False;
  tmp := AFormula;
  // Validation
  if not Assigned(AList) then
    Exit;

  repeat
    pos1 := Pos('{', tmp);
    pos2 := Pos('}', tmp);
    if pos1 > 0 then
      begin
        s := Copy(tmp, pos1 + 1, pos2 - pos1 - 1);
        if Trim(s) = '' then
          Break;
        s := IQMS.Common.StringUtils.Numerics(s);
        if IQMS.Common.Numbers.IsStringValidFloat(s, r) then
          AList.Add(s);
        tmp := Copy(tmp, pos2 + 1, Length(tmp));
        s := '';
      end
    else
      Break;
  until tmp = '';

  Result := AList.Count > 0;
end;

procedure TFrmFormulaEditorBase.FormShow(Sender: TObject);
begin
  IQMS.Common.RegFrm.IQRegFormRead(Self, [Self]);
  // Load the tree only on show to allow parameters to be set
  // by descendent System.Classes.
  LoadTree;
  // Ensure this flag is initialized
  FModified := False;
end;

procedure TFrmFormulaEditorBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IQMS.Common.RegFrm.IQRegFormWrite(Self, [Self]);
end;

function TFrmFormulaEditorBase.GetFormula: string;
begin
  Result := memSQL.Text;
end;

procedure TFrmFormulaEditorBase.SetFormula(const Value: string);
begin
  memSQL.Text := Value;
end;

procedure TFrmFormulaEditorBase.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmFormulaEditorBase.About1Click(Sender: TObject);
begin
  IQAbout1.Execute;
end;

procedure TFrmFormulaEditorBase.SyntaxCheck1Click(Sender: TObject);
var
  AErrorMsg: String;
begin
  if not TestFormula(Formula, TableName, AErrorMsg) and
    (AErrorMsg > '') then
    IQError(AErrorMsg)
  else
    // 'Success!  No errors found.'
    IQInformation(cTXT000000690);
end;

procedure TFrmFormulaEditorBase.ClearFormula1Click(Sender: TObject);
begin
  if IQMS.Common.Dialogs.IQConfirmYN(cTXT000000691 { 'Clear formula?' } ) then
    memSQL.Clear;
end;

procedure TFrmFormulaEditorBase.LoadParameters;
//var
//  ADescription: string;
//  AValue: Int64;
begin
  // Provided by descendent form.
  //
  // Example code:
  //  with TFDQuery.Create(NIL) do
  //    try
  //      Connection := MainModule.FDConnection;
  //      SQL.Add('select a.spc_dimension_id');
  //      SQL.Add('from spc_inspection_detail a, spc_dimension b');
  //      SQL.Add(Format('where a.spc_inspection_id = %.0f', [FSPCInspectionID]));
  //      SQL.Add(' and b.id = a.spc_dimension_id');
  //      // SQL.Add(' and NVL(b.is_rt, ''N'') = ''Y''');
  //      SQL.Add(' and NVL(b.calculated, ''N'') = ''N''');
  //      SQL.Add(' and NVL(b.isattribute, ''N'') = ''N''');
  //      SQL.Add('order by a.seq');
  //
  //      Open;
  //
  //      // If no records are found, add a "No parameters found" node
  //      if BOF and EOF then
  //        AddNoParametersFoundNode;
  //
  //      // Loop the records, add nodes.
  //      while not EOF do
  //        begin
  //          // ID value for the parameter
  //          AValue := FieldByName('spc_dimension_id').AsLargeInt;
  //          // Description
  //          ADescription := spc_misc.GetParameterDisplay(AValue);
  //          AddParameterNode(
  //            ADescription,
  //            AValue);
  //          Next;
  //        end;
  //    finally
  //      Free;
  //    end;
end;

procedure TFrmFormulaEditorBase.LoadTree;
var
  ASubParent: TUniTreeNode;
  AItem: TUniTreeNode;
begin
  // Initialization
  FParameterRootNode := NIL;
  AItem := NIL;

  try
    tv.Items.BeginUpdate;
    tv.Items.Clear;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // *** Add Parameters ***
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // cTXT0000530 = 'Parameters';
    FParameterRootNode := tv.Items.Add(NIL,cTXT0000530); // 'Parameters'
    FParameterRootNode.Data:=TFormulaTVCargo.CreateParameter(0);
    FParameterRootNode.ImageIndex := 0;
    FParameterRootNode.SelectedIndex := 1;

    LoadParameters;

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // *** Add Expressions ***
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    FParameterRootNode := tv.Items.Add(NIL,cTXT000000538); // 'Functions'
    FParameterRootNode.Data:= TFormulaTVCargo.CreateExpression('');
    FParameterRootNode.ImageIndex := 0;
    FParameterRootNode.SelectedIndex := 1;

    ASubParent := tv.Items.AddChild(FParameterRootNode,
      cTXT000000539); // 'Text'
    ASubParent.Data:=  TFormulaTVCargo.CreateExpression('');
    ASubParent.ImageIndex := 0;
    ASubParent.SelectedIndex := 1;
    LoadTreeExprByClass(ASubParent, CATEGORY_TEXT);

    ASubParent := tv.Items.AddChild(FParameterRootNode,
      cTXT000000540); // 'Math'
    ASubParent.Data:=  TFormulaTVCargo.CreateExpression('');
    ASubParent.ImageIndex := 0;
    ASubParent.SelectedIndex := 1;
    LoadTreeExprByClass(ASubParent, CATEGORY_MATH);

    ASubParent := tv.Items.AddChild(FParameterRootNode,
      cTXT000000541); // 'Conversion'
    ASubParent.Data:=  TFormulaTVCargo.CreateExpression('');
    ASubParent.ImageIndex := 0;
    ASubParent.SelectedIndex := 1;
    LoadTreeExprByClass(ASubParent, CATEGORY_CONVERSION);

    ASubParent := tv.Items.AddChild(FParameterRootNode,
      cTXT000000542); // 'Date and Time'
    ASubParent.Data:=  TFormulaTVCargo.CreateExpression('');
    ASubParent.ImageIndex := 0;
    ASubParent.SelectedIndex := 1;
    LoadTreeExprByClass(ASubParent, CATEGORY_DATETIME);

    ASubParent := tv.Items.AddChild(FParameterRootNode,
      cTXT000000543); // 'Evaluation'
    ASubParent.Data:=  TFormulaTVCargo.CreateExpression('');
    ASubParent.ImageIndex := 0;
    ASubParent.SelectedIndex := 1;
    LoadTreeExprByClass(ASubParent, CATEGORY_INSPECTION);

    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    tv.FullCollapse;
    tv.Selected := tv.Items[0];
    tv.Items[0].Expand(False);

  finally
    tv.Items.EndUpdate;
  end;

end;

function TFrmFormulaEditorBase.AddNoParametersFoundNode: TUniTreeNode;
begin
  // cTXT000000692 = '(No parameters found)'
  Result := tv.Items.AddChild(FParameterRootNode, cTXT000000692);
  Result.ImageIndex := 3;
  Result.SelectedIndex := Result.ImageIndex;
end;

function TFrmFormulaEditorBase.AddParameterNode(ADescription: string;
  AValue: Int64): TUniTreeNode;
begin
  // ADescrip :=  spc_misc.GetParameterDisplay(AID);
  // ANodeText := Format('{%d} %s', [AValue, ADescrip]);
  Result := tv.Items.AddChild(FParameterRootNode,
    Format('{%d} %s', [AValue, ADescription]));
  Result.Data:=TFormulaTVCargo.CreateParameter(AValue, ADescription);
  Result.ImageIndex := 2;
  Result.SelectedIndex := Result.ImageIndex;
end;

procedure TFrmFormulaEditorBase.LoadTreeExprByClass(const AParent: TUniTreeNode;
  const AClass: String);
var
  i: Integer;
  AItemExpr,
    AItemSyntax,
    AItemDescrip,
    AItemClass: String;

  function _AddNode(AExpr, ASyntax, ADescrip: String): TUniTreeNode;
  begin
    Result := tv.Items.AddChild(AParent, AExpr);
    Result.Data:=TFormulaTVCargo.CreateExpression(AExpr, ASyntax, ADescrip);
    Result.ImageIndex := 4;
    Result.SelectedIndex := Result.ImageIndex;
  end;

begin
  for i := 0 to High(AExprArray) do
    begin
      AItemExpr := AExprArray[i, 0];
      AItemSyntax := AExprArray[i, 1];
      AItemDescrip := AExprArray[i, 2];
      AItemClass := AExprArray[i, 3];
      if AItemClass = AClass then
        _AddNode(AItemExpr, AItemSyntax, AItemDescrip);
    end;
end;

procedure TFrmFormulaEditorBase.memSQLChange(Sender: TObject);
begin
  FModified := True;
  UpdateSQLEditor;
end;

procedure TFrmFormulaEditorBase.UpdateSQLEditor;
const
  COLOR_TAG = clSilver;
  COLOR_NONE = 16777215;
var
  C: Char;
  i, X, Y: Integer;
  AText, ALastPair, ANextPair: String;
  AFormattingString: Boolean;
  ASelStart, ASelLength: Integer;
  ev: TNotifyEvent;
  strbefore, strafter:widestring;
  // ---------------------------------------------------------------------------
//  procedure _AllowRedraw(AAllow: Boolean);
//  begin
//    SendMessage(PnlSQL.Handle, WM_SETREDRAW, Integer(AAllow), 0);
//  end;
// ---------------------------------------------------------------------------
//  procedure _SetColor(const AColor: TColor);
//  var
//    Format: CHARFORMAT2; // Winapi.RichEdit
//  begin
//    FillChar(Format, SizeOf(Format), 0);
//    with Format do
//      begin
//        cbSize := SizeOf(Format);
//        dwMask := CFM_BACKCOLOR;
//        crBackColor := AColor;
//        memSQL.Perform(EM_SETCHARFORMAT, SCF_SELECTION, Longint(@Format));
//      end;
//  end;
// ---------------------------------------------------------------------------
  function StripHTML(S: string): string;
    var
      TagBegin, TagEnd, TagLength: integer;
    begin
      TagBegin := Pos( '<', S);      // search position of first <

      while (TagBegin > 0) do begin  // while there is a < in S
        TagEnd := Pos('>', S);              // find the matching >
        TagLength := TagEnd - TagBegin + 1;
        Delete(S, TagBegin, TagLength);     // delete the tag
        TagBegin:= Pos( '<', S);            // search for next <
      end;

      Result := S;                   // give the result
    end;
begin
  with memSQL do
    try
      Lines.BeginUpdate;
//      _AllowRedraw(False);
      ev := memSQL.OnChange;
      memSQL.OnChange := NIL;

//      ASelStart := memSQL.SelStart;
//      ASelLength := memSQL.SelLength;

//      memSQL.SelectAll;
//      memSQL.Font.Name := IQMS.Common.Screen.SystemFontName;
//      memSQL.Font.Size := 8;
//      _SetColor(COLOR_NONE);
//      memSQL.SelStart := 0;
      memSQL.Text:=StripHTML(memSQL.Text);

      // Initialize
      AText := Text;
      i := 1;
      X := 0;
      Y := 0;
      AFormattingString := False;

      while i <= Length(AText) do
        begin
          // Get values to be used below
          C := AText[i];
          if (C = '{') then
            begin
              // This will paint the characters Teal from the
              // comment characters to the end of the line
              X := posex('}', memSQL.Text, i) + 1;

              // if no end character was found, color everything "comment" and exit.
              if ((X - 1) = - 1) then
                Exit
                // color to the end character
              else if (X > - 1) and (X > i) then
                begin
                  strbefore:=copy(memSQL.Text,1,i - 1);
                  strafter:=Copy(memSQL.Text,i - 1+(X - i) + 1,5000 );
//                  SelStart := i - 1;
//                  SelLength := (X - i) + 1;
//                  _SetColor(COLOR_TAG);
//                  SelLength := 0;
                  memSQL.Text:=strbefore+'<span style=''color:gray;''>'+copy(memSQL.Text,i - 1,(X - i) + 1)+'</span>'+strafter;
                  i := X + 1;
                end
                // otherwise, just increment the count
              else
                Inc(i);
            end
          else
            Inc(i);
        end;

    finally
//      memSQL.SelStart := ASelStart;
//      memSQL.SelLength := ASelLength;
//      _AllowRedraw(True);
      Lines.EndUpdate;
      memSQL.OnChange := ev;
    end;
end;

procedure TFrmFormulaEditorBase.memSQLMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ATag: String;
  AStart, AEnd: Integer;
  APos: Integer;
begin
//  APos := memSQL.SelStart;
//  if APos < 0 then
//    Exit;
//  ATag := GetTagAt(APos, memSQL.Text, AStart, AEnd);
//  if (ATag > '') and (AStart > 0) and (AEnd > 0) then
//    with memSQL do
//      begin
//        SelStart := AStart - 1;
//        SelLength := (AEnd - AStart) + 2;
//      end;
end;

procedure TFrmFormulaEditorBase.memSQLMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
end;

function TFrmFormulaEditorBase.GetTagAt(const APos: Integer;
  const AText: string; var AStart, AEnd: Integer): String;

  function _FirstPosFrom(const AIndex: Integer): Integer;
  var
    j: Integer;
  begin
    Result := 0;
    for j := AIndex downto 1 do
      if (AText[j] = '}') then
        Break
      else if (AText[j] = '{') then
        begin
          Result := j;
          Break;
        end;
  end;

  function _LastPosFrom(const AIndex: Integer): Integer;
  var
    j: Integer;
  begin
    Result := 0;
    for j := AIndex to Length(AText) do
      if (AText[j] = '{') then
        Break
      else if (AText[j] = '}') then
        begin
          Result := j - 1;
          Break;
        end;
  end;

begin
  // Initialization
  Result := '';
  AStart := 0;
  AEnd := 0;

  if Trim(AText) = '' then
    Exit;

  if (APos = 0) or (APos > Length(AText)) then
    Exit;

  AStart := _FirstPosFrom(APos);
  AEnd := _LastPosFrom(APos);

  if (AStart > 0) and (AEnd > 0) then
    Result := Copy(AText, AStart + 1, AEnd - AStart);

end;

procedure TFrmFormulaEditorBase.SelectAllSQL1Click(Sender: TObject);
begin
//  memSQL.SelectAll;
end;

procedure TFrmFormulaEditorBase.CopySQL1Click(Sender: TObject);
begin
//  memSQL.CopyToClipboard;
end;

procedure TFrmFormulaEditorBase.PasteSQL1Click(Sender: TObject);
var
  AClipboardText, AFullText: String;
  i: Integer;
begin
//  AFullText := '';
//  AClipboardText := Clipboard.AsText; // Vcl.Clipbrd.pas
//  for i := 1 to Length(AClipboardText) do
//    if (AClipboardText[i] in constVALID_CHARS) then
//      AFullText := AFullText + AClipboardText[i];
//  memSQL.SelText := AFullText;
end;

procedure TFrmFormulaEditorBase.CutSQL1Click(Sender: TObject);
begin
//  memSQL.CutToClipboard;
end;

procedure TFrmFormulaEditorBase.memSQLDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
//  Accept := (Source = Self) or (Source = tv);
//  if (Source = tv) then
//    begin
//      FDragging := True;
//      UpdateCursorPos(memSQL, X, Y); // IQMS.Common.Controls.pas
//    end
//  else
//    FDragging := False;
end;

procedure TFrmFormulaEditorBase.memSQLDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Source = tv) and (tv.Selected <> NIL) then
    begin
      if memSQL.CanFocus then
        memSQL.SetFocus;
      InsertSelected;
    end;
end;

procedure TFrmFormulaEditorBase.InsertSelected;
var
  AID: Real;
  AExpr: String;
begin
  if (tv.Selected = NIL) then
    Exit;
  if not Assigned(tv.Selected.Data) then
    Exit;

  case TFormulaTVCargo(tv.Selected.Data).Index of
    1: // Parameter
      begin
        AID := TFormulaTVCargo(tv.Selected.Data).ID;
        if AID > 0 then
          begin
            UniSession.AddJS(memSQL.JSName + '.insertAtCursor("'+ Format('{%.0f}', [AID])+'")');
//            memSQL.SelText := Format('{%.0f}', [AID]);
            if memSQL.CanFocus then
              memSQL.SetFocus;
          end;
      end;
    2: // Expression
      begin
        AExpr := TFormulaTVCargo(tv.Selected.Data).Expression;
        if AExpr > '' then
          InsertExpr(AExpr); // see below
      end;
  end;
end;

procedure TFrmFormulaEditorBase.InsertExpr(const AExpr: String);
var
  ACurPos,
    AChrPos: Integer;
begin
//  ACurPos := memSQL.SelStart;
//  AChrPos := Pos('(', AExpr);
//  memSQL.SelText := AExpr;
  UniSession.AddJS(memSQL.JSName + '.insertAtCursor("'+ AExpr+'")');
//  if AChrPos > 0 then
//    memSQL.SelStart := ACurPos + AChrPos;
//  if memSQL.CanFocus then
//    memSQL.SetFocus;
end;

procedure TFrmFormulaEditorBase.SummarizeItem(const AText, AHint: String);
begin
  lblItemLine1.Caption := AText;
  lblItemLine1.Hint := System.SysUtils.WrapText(AHint, #13, ['.', ' ', #9, '-'], 65);
  lblItemLine1.ShowHint := AHint > '';
  lblItemLine1.Visible := (AText > '');
end;

procedure TFrmFormulaEditorBase.tvDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = tv;
end;

procedure TFrmFormulaEditorBase.tvDblClick(Sender: TObject);
begin
  InsertSelected;
end;

procedure TFrmFormulaEditorBase.tvChange(Sender: TObject; Node: TUniTreeNode);
begin
  if Assigned(Node) and Assigned(Node.Data) then
    begin
      case TFormulaTVCargo(Node.Data).Index of
        1: // Parameter
          SummarizeItem(TFormulaTVCargo(Node.Data).Description, '');
        2: // Expression
          SummarizeItem(TFormulaTVCargo(Node.Data).Syntax,
            TFormulaTVCargo(Node.Data).Description);
      end; // end case
    end
  else
    SummarizeItem('', '');
end;

procedure TFrmFormulaEditorBase.DoSymbolClick(Sender: TObject);
begin
  if (Sender is TUniSpeedButton) then
   begin
     UniSession.AddJS(memSQL.JSName + '.insertAtCursor("'+ TUniSpeedButton(Sender).Caption +'")');
   end;
//    memSQL.SelText := TUniSpeedButton(Sender).Caption;
end;

{$ENDREGION 'TFrmFormulaEditorBase'}

end.
