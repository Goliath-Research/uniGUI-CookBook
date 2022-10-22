unit IQMS.Web.MicrosoftWord.Types;

interface

type
  //Used for PageSetup.Orientation
  TWdOrientation = (
    wdOrientLandscape = 1, //Landscape orientation.
    wdOrientPortrait = 0 //Portrait orientation.
    );

  //See https://msdn.microsoft.com/en-us/library/office/ff835210.aspx
  TWdBuiltinStyle = (
    wdStyleNormal = - 1,
    wdStyleHeading1 = - 2,
    wdStyleHeading2 = - 3,
    wdStylePlainText = - 91,
    wdStyleSubtitle = 075,
    wdStyleTitle = - 63
    );

  //This is incomplete
  TWdUnits = (
    wdStory = 6
    );

  TWdBreakType = (
    wdSectionBreakNextPage = 2,
    wdSectionBreakContinuous = 3,
    wdSectionBreakEvenPage = 4,
    wdSectionBreakOddPage = 5,
    wdLineBreak = 6,
    wdPageBreak = 7,
    wdColumnBreak = 8,
    wdLineBreakClearLeft = 9,
    wdLineBreakClearRight = 10,
    wdTextWrappingBreak = 11
    );

  TWdSaveOptions = (
    wdDoNotSaveChanges = 0, //Do not save pending changes
    wdPromptToSaveChanges = - 2, //Prompt the user to save pending changes
    wdSaveChanges = - 1 //Save pending changes automatically without prompting the user
    );

  TWdOriginalFormat = (
    wdOriginalDocumentFormat = 1, //Original document format
    wdPromptUser = 2, //Prompt user to select a document format
    wdWordDocument = 0 //Microsoft Word document format
    );

  TWdTextOrientation = (
    wdTextOrientationDownward = 3,
    wdTextOrientationHorizontal = 0,
    wdTextOrientationHorizontalRotatedFarEast = 4,
    wdTextOrientationUpward = 2,
    wdTextOrientationVerticalFarEast = 1,
    wdTextOrientationVertical = 5
    );

  //Used for ActiveDocument.MailMerge.MainDocumentType
  TWdMailMergeMainDocType = (
    wdCatalog = 3,
    wdDirectory = 3,
    wdEMail = 4,
    wdEnvelopes = 2,
    wdFax = 5,
    wdFormLetters = 0,
    wdMailingLabels = 1,
    wdNotAMergeDocument = - 1,
    wdMergeSubTypeAccess = 1);

  TWdSaveFormat = (
    wdFormatDocument = 0, //Microsoft Office Word 97 - 2003 binary file format.
    wdFormatDOSText = 4, //Microsoft DOS text format.
    wdFormatDOSTextLineBreaks = 5, //Microsoft DOS text with line breaks preserved.
    wdFormatEncodedText = 7, //Encoded text format.
    wdFormatFilteredHTML = 10, //Filtered HTML format.
    wdFormatFlatXML = 20, //Open XML file format with macros enabled saved as a single XML file.
    wdFormatFlatXMLTemplate = 21, //Open XML template format saved as a XML single file.
    wdFormatFlatXMLTemplateMacroEnabled = 22, //Open XML template format with macros enabled saved as a single XML file.
    wdFormatOpenDocumentText = 23, //OpenDocument Text format.
    wdFormatHTML = 8, //Standard HTML format.
    wdFormatRTF = 6, //Rich text format (RTF).
    wdFormatStrictOpenXMLDocument = 24, //Strict Open XML document format.
    wdFormatTemplate = 1, //Word template format.
    wdFormatText = 2, //Microsoft Windows text format.
    wdFormatTextLineBreaks = 3, //Windows text format with line breaks preserved.
    wdFormatUnicodeText = 7, //Unicode text format.
    wdFormatWebArchive = 9, //Web archive format.
    wdFormatXML = 11, //Extensible Markup Language (XML) format.
    wdFormatDocument97 = 0, //Microsoft Word 97 document format.
    wdFormatDocumentDefault = 16, //Word default document file format. For Word, this is the DOCX format.
    wdFormatPDF = 17, //PDF format.
    wdFormatTemplate97 = 1, //Word 97 template format.
    wdFormatXMLDocument = 12, //XML document format.
    wdFormatXMLDocumentMacroEnabled = 13, //XML document format with macros enabled.
    wdFormatXMLTemplate = 14, //XML template format.
    wdFormatXMLTemplateMacroEnabled = 15, //XML template format with macros enabled.
    wdFormatXPS = 18 //XPS format.
    );

const
  WordInch = 72;

implementation

end.
