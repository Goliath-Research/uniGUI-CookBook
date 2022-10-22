unit novaOptions;

interface

const

//NovaProfilePreset
 NOVAPDF_PDF_VERSION                   = 1;
 NOVAPDF_PDFA                          = 2;
 NOVAPDF_PDFA_VERSION                  = 3;
 NOVAPDF_PDF_LINEARIZE                 = 4;
 NOVAPDF_URL_ANALIZE                   = 5;
 NOVAPDF_EMAIL_SEND                    = 6;
 NOVAPDF_INFO_ENABLE                   = 7;
 NOVAPDF_INFO_VIEWER_ENABLE            = 8;
 NOVAPDF_COMPRESS_ENABLE               = 9;
 NOVAPDF_GR_CONVERT_ENABLE             = 10;
 NOVAPDF_GR_DOWNSMPL_ENABLE            = 11;
 NOVAPDF_BMARK_EN_AUTO_DET_BMARKS      = 12;
 NOVAPDF_SEC_ENABLE                    = 13;
 NOVAPDF_SAVE_LOCATION                 = 14;
//Metadata
 NOVAPDF_PROFILE_NAME                  = 22;
 NOVAPDF_PROFILE_AUTHOR                = 23;
 NOVAPDF_PROFILE_DESCRIPTION           = 24;
//ViewerOptionsPreset
 NOVAPDF_VIEWOP_HIDE_TOOLBARS          = 25;
 NOVAPDF_VIEWOP_SHOW_DOCTITLE          = 26;
 NOVAPDF_VIEWOP_TRANSITION_TYPE        = 27;
 NOVAPDF_VIEWOP_TRANSITION_DIRECTION   = 28;
 NOVAPDF_VIEWOP_TRANSITION_DURATION    = 29;
 NOVAPDF_VIEWOP_PAGE_DURATION          = 30;
 NOVAPDF_VIEWOP_ZOOM                   = 31;
 NOVAPDF_VIEWOP_USE_START_PAGE         = 32;
 NOVAPDF_VIEWOP_START_PAGE             = 33;
 NOVAPDF_VIEWOP_PAGE_LAYOUT            = 34;
 NOVAPDF_VIEWOP_HIDE_MENUBAR           = 35;
 NOVAPDF_VIEWOP_RESIZE_WINDOW          = 36;
 NOVAPDF_VIEWOP_HIDE_USER              = 37;
 NOVAPDF_VIEWOP_PAGE_MODE              = 38;
 NOVAPDF_VIEWOP_FULLSCREEN             = 39;
 NOVAPDF_VIEWOP_PAGE_SCALING           = 40;
//AfterSaveActionPreset
 NOVAPDF_ACTION_DEFAULT_VIEWER         = 41;
 NOVAPDF_ACTION_RUN_APPLICATION        = 42;
 NOVAPDF_ACTION_APPLICATION            = 43;
 NOVAPDF_ACTION_APPLICATION_LOC        = 44;
 NOVAPDF_ACTION_USER_NAME              = 45;
 NOVAPDF_ACTION_USER_PASSWORD          = 46;
 NOVAPDF_ACTION_CMDLINE_PARAMETERS     = 47;
//AdvancedOptionsPreset
 NOVAPDF_ADV_OPTIMIZE_TEXT             = 48;
 NOVAPDF_ADV_SILENT_PRINT              = 49;
 NOVAPDF_ADV_OPTIMIZE_IMAGE            = 50;
 NOVAPDF_ADV_CORRECT_LINEWIDTH         = 51;
 NOVAPDF_ADV_CORRECT_FILLCOLOR         = 52;
 NOVAPDF_ADV_IGNORE_EMPTY_PAGES        = 53;
//ContentCompressionPreset
 NOVAPDF_COMPRESS_HIGH_COLOR           = 54;
 NOVAPDF_COMPRESS_HIGH_COLOR_TYPE      = 55;
 NOVAPDF_COMPRESS_HIGH_COLOR_LEVEL     = 56;
 NOVAPDF_COMPRESS_INDEXED              = 57;
 NOVAPDF_COMPRESS_INDEXED_TYPE         = 58;
 NOVAPDF_COMPRESS_INDEXED_LEVEL        = 59;
 NOVAPDF_COMPRESS_MONOCHROM            = 60;
 NOVAPDF_COMPRESS_MONOCHROM_TYPE       = 61;
 NOVAPDF_COMPRESS_MONOCHROM_LEVEL      = 62;
 NOVAPDF_COMPRESS_TEXT_GRAPHICS        = 63;
 NOVAPDF_COMPRESS_TEXT_GRAPHICS_TYPE   = 64;
 NOVAPDF_COMPRESS_TEXT_GRAPHICS_LEVEL  = 65;
//DocumentInfoPreset
 NOVAPDF_DOCINFO_TITLE                 = 66;
 NOVAPDF_DOCINFO_CREATOR               = 67;
 NOVAPDF_DOCINFO_SUBJECT               = 68;
 NOVAPDF_DOCINFO_AUTHOR                = 69;
 NOVAPDF_DOCINFO_KEYWORDS              = 70;
//ImageConversionPreset
 NOVAPDF_IMAGE_CONVERT_HIGH_COLOR      = 71;
 NOVAPDF_IMAGE_DITHER_HIGH_COLOR       = 72;
 NOVAPDF_IMAGE_CONVERT_TYPE_HIGH_COLOR = 73;
 NOVAPDF_IMAGE_CONVERT_TRESH_HIGH_COLOR = 74;
 NOVAPDF_IMAGE_DITHER_TYPE_HIGH_COLOR  = 75;
 NOVAPDF_IMAGE_CONVERT_INDEXED         = 76;
 NOVAPDF_IMAGE_DITHER_INDEXED          = 77;
 NOVAPDF_IMAGE_CONVERT_TYPE_INDEXED    = 78;
 NOVAPDF_IMAGE_CONVERT_TRESH_INDEXED   = 79;
 NOVAPDF_IMAGE_DITHER_TYPE_INDEXED     = 80;
 NOVAPDF_IMAGE_CONVERT_TEXTANDGR       = 81;
 NOVAPDF_IMAGE_CONVERT_TYPE_TEXTANDGR  = 82;
 NOVAPDF_IMAGE_CONVERT_TRESH_TEXTANDGR = 83;
//ImageDownsamplingPreset
 NOVAPDF_DOWNSAMPLE_HIGH_COLOR         = 84;
 NOVAPDF_DOWNSAMPLE_TYPE_HIGH_COLOR    = 85;
 NOVAPDF_DOWNSAMPLE_RES_HIGH_COLOR     = 86;
 NOVAPDF_DOWNSAMPLE_INDEXED            = 87;
 NOVAPDF_DOWNSAMPLE_TYPE_INDEXED       = 88;
 NOVAPDF_DOWNSAMPLE_RES_INDEXED        = 89;
 NOVAPDF_DOWNSAMPLE_MONOCHROM          = 90;
 NOVAPDF_DOWNSAMPLE_TYPE_MONOCHROM     = 91;
 NOVAPDF_DOWNSAMPLE_RES_MONOCHROM      = 92;
//OverlaysPreset
 NOVAPDF_OVERLAY_FILE                  = 93;
 NOVAPDF_OVERLAY_USER_NAME             = 94;
 NOVAPDF_OVERLAY_USER_PASSWORD         = 95;
 NOVAPDF_OVERLAY_FILE_LOCATION         = 96;
 NOVAPDF_OVERLAY_FILE_PASSWORD         = 97;
 NOVAPDF_OVERLAY_REPEAT_TYPE           = 99;
 NOVAPDF_OVERLAY_OPACITY               = 100;
//SaveOptionsPreset
 NOVAPDF_SAVE_PROMPT_TYPE              = 101;
 NOVAPDF_SAVE_FOLDER                   = 103;
 NOVAPDF_SAVE_FILE_NAME                = 104;
 NOVAPDF_SAVE_USER_NAME                = 105;
 NOVAPDF_SAVE_USER_PASSWORD            = 106;
 NOVAPDF_SAVE_APPEND_PASSWORD          = 107;
 NOVAPDF_SAVE_FILEEXIST_ACTION         = 108;
//SecurityPreset
 NOVAPDF_SECURITY_LEVEL                = 109;
 NOVAPDF_SECURITY_USER_PASSWORD        = 110;
 NOVAPDF_SECURITY_OWNER_PASSWORD       = 111;
 NOVAPDF_SECURITY_FLAG_PRINTDOC        = 112;
 NOVAPDF_SECURITY_FLAG_MODIFYDOC       = 113;
 NOVAPDF_SECURITY_FLAG_EXTRACTTEXT     = 114;
 NOVAPDF_SECURITY_FLAG_MODIFYANNOTATION = 115;
 NOVAPDF_SECURITY_FLAG_PRINTHIGHRES     = 116;
 NOVAPDF_SECURITY_FLAG_ASSEMBLEDOC      = 117;
 NOVAPDF_SECURITY_FLAG_ADVANCEDEXTRACT  = 118;
 NOVAPDF_SECURITY_FLAG_ADVANCEDFILL    = 119;
//SignaturesPreset
 NOVAPDF_SIGN_FILECERT_LOCATION        = 120;
 NOVAPDF_SIGN_FILECERT_FILE            = 121;
 NOVAPDF_SIGN_FILECERT_FILE_PASSWORD   = 122;
 NOVAPDF_SIGN_FILECERT_USER_NAME       = 123;
 NOVAPDF_SIGN_FILECERT_USER_PASSWORD   = 124;
 NOVAPDF_SIGN_SYSCERT_ISSUEDTO         = 125;
 NOVAPDF_SIGN_SYSCERT_ISSUEDBY         = 126;
 NOVAPDF_SIGN_SYSCERT_FRIENDLYNAME     = 127;
 NOVAPDF_SIGN_SYSCERT_SUBJECT          = 128;
 NOVAPDF_SIGN_SYSCERT_SUBJECT_NAME     = 129;
 NOVAPDF_SIGN_SYSCERT_EXPIRE_DATE      = 130;
 NOVAPDF_SIGN_CERTIFICATE_TYPE         = 131;
 NOVAPDF_SIGN_SHOW_GRAPHIC_NAME        = 132;
 NOVAPDF_SIGN_SHOW_GRAPHIC_IAMGE       = 133;
 NOVAPDF_SIGN_SHOW_KEEPASPECTRATIO     = 134;
 NOVAPDF_SIGN_SHOW_CERTIFICATE_NAME    = 135;
 NOVAPDF_SIGN_SHOW_SIGN_DATE           = 136;
 NOVAPDF_SIGN_SHOW_CONTACT_INFO        = 137;
 NOVAPDF_SIGN_SHOW_SIGN_REASON         = 138;
 NOVAPDF_SIGN_SHOW_SIGN_LOCATION       = 139;
 NOVAPDF_SIGN_SHOW_DETAILS             = 140;
 NOVAPDF_SIGN_SHOW_LABELS              = 141;
 NOVAPDF_SIGN_FONT_NAME                = 142;
 NOVAPDF_SIGN_FONT_TYPE                = 143;
 NOVAPDF_SIGN_FONT_SIZE                = 144;
 NOVAPDF_SIGN_CUSTOM_SIZE              = 145;
 NOVAPDF_SIGN_NAME_COLOR               = 146;
 NOVAPDF_SIGN_NAME_OPACITY             = 147;
 NOVAPDF_SIGN_IMAGE_LOCATION           = 148;
 NOVAPDF_SIGN_IMAGE_FILE               = 149;
 NOVAPDF_SIGN_IMAGE_USER_NAME          = 150;
 NOVAPDF_SIGN_IMAGE_USER_PASSWORD      = 151;
 NOVAPDF_SIGN_IMAGE_OPACITY            = 152;
 NOVAPDF_SIGN_INFO_CONTACT             = 153;
 NOVAPDF_SIGN_INFO_REASON              = 154;
 NOVAPDF_SIGN_INFO_LOCATION            = 155;
 NOVAPDF_SIGN_VIEW_VIEW                = 156;
 NOVAPDF_SIGN_VIEW_PRINT               = 157;
 NOVAPDF_SIGN_VIEW_EXPORT              = 158;
//FontsPreset
 NOVAPDF_FONTS_EMBED_SUBSETS           = 159;
 NOVAPDF_FONTS_EMBED_ALL_USED_FONTS    = 160;
 NOVAPDF_FONTS_FORCE_EMBED_PROTECTED   = 161;
//LinksPreset
 NOVAPDF_URL_DETECT_FILES              = 163;
 NOVAPDF_URL_CHECK_FILE_EXISTS         = 164;
 NOVAPDF_URL_UNDERLINE                 = 166;
 NOVAPDF_URL_OVERWRITE_COLOR           = 167;
 NOVAPDF_URL_COLOR                     = 168;
//ImageWatermarksPreset
 NOVAPDF_WTM_IMG_IMAGE_FILE_NAME       = 200;
 NOVAPDF_WTM_IMG_IMAGE_LOCATION        = 201;
 NOVAPDF_WTM_IMG_IMAGE_USER_NAME       = 202;
 NOVAPDF_WTM_IMG_IMAGE_USER_PASSWORD   = 203;
 NOVAPDF_WTM_IMG_IMAGE_TRANSPARENCY    = 204;
 NOVAPDF_WTM_IMG_IMAGE_TRANSP_COLOR    = 205;
 NOVAPDF_WTM_IMG_IMAGE_OPACITY         = 206;
 NOVAPDF_WTM_IMG_COLOR_VARIATION       = 207;
 NOVAPDF_WTM_IMG_VISIBILITY_VIEW       = 208;
 NOVAPDF_WTM_IMG_VISIBILITY_PRINT      = 209;
 NOVAPDF_WTM_IMG_VISIBILITY_EXPORT     = 210;
//Metadata
 NOVAPDF_WTM_IMG_NAME                  = 211;
 NOVAPDF_WTM_IMG_AUTHOR                = 212;
 NOVAPDF_WTM_IMG_DESCRIPTION           = 213;
//TextWatermarksPreset
 NOVAPDF_WTM_TXT_WATERMARK_TEXT        = 240;
 NOVAPDF_WTM_TXT_FONT_NAME             = 241;
 NOVAPDF_WTM_TXT_FONT_TYPE             = 242;
 NOVAPDF_WTM_TXT_FONT_SIZE             = 243;
 NOVAPDF_WTM_TXT_FONT_BOLD             = 244;
 NOVAPDF_WTM_TXT_FONT_ITALIC           = 245;
 NOVAPDF_WTM_TXT_FONT_OUTLINE          = 246;
 NOVAPDF_WTM_TXT_FONT_UNDERLINE        = 247;
 NOVAPDF_WTM_TXT_FONT_COLOR            = 248;
 NOVAPDF_WTM_TXT_OPACITY               = 249;
 NOVAPDF_WTM_TXT_VISIBILITY_VIEW       = 250;
 NOVAPDF_WTM_TXT_VISIBILITY_PRINT      = 251;
 NOVAPDF_WTM_TXT_VISIBILITY_EXPORT     = 252;
 NOVAPDF_WTM_TXT_UNDERLINE_POSITION    = 253;
 NOVAPDF_WTM_TXT_UNDERLINE_THICKNESS   = 254;
 NOVAPDF_WTM_TXT_TEXT_CORRECTION       = 255;
//Metadata
 NOVAPDF_WTM_TXT_NAME                  = 256;
 NOVAPDF_WTM_TXT_AUTHOR                = 257;
 NOVAPDF_WTM_TXT_DESCRIPTION           = 258;
//Border (additions)
 NOVAPDF_URL_BORDER_WIDTH_UNITS        = 259;
//Save (additions)
 NOVAPDF_SAVE_FOLDER_TYPE              = 260;
//BookmarksPreset
 NOVAPDF_BMK_ALLOW_MULTILINE           = 280;
 NOVAPDF_BMK_MATCH_ALL_LEVELS          = 281;
 NOVAPDF_BMK_USE_LEVELS                = 282;
 NOVAPDF_BMK_OPEN_TO_LEVEL             = 283;
 NOVAPDF_BMK_ROOT_NAME                 = 284;
 NOVAPDF_BMK_ROOT_ENABLED              = 285;
 NOVAPDF_BMK_ROOT_BOLD                 = 286;
 NOVAPDF_BMK_ROOT_ITALIC               = 287;
 NOVAPDF_BMK_ROOT_COLOR                = 288;

//LayoutsPreset
 NOVAPDF_LAYOUT_LEFTANCHOR_USED         = 320;
 NOVAPDF_LAYOUT_LEFTANCHOR_OFFSET       = 321;
 NOVAPDF_LAYOUT_LEFTANCHOR_USE_PERCENT  = 322;
 NOVAPDF_LAYOUT_RIGHTANCHOR_USED        = 323;
 NOVAPDF_LAYOUT_RIGHTANCHOR_OFFSET      = 324;
 NOVAPDF_LAYOUT_RIGHTANCHOR_USE_PERCENT = 325;
 NOVAPDF_LAYOUT_TOPANCHOR_USED          = 326;
 NOVAPDF_LAYOUT_TOPANCHOR_OFFSET        = 327;
 NOVAPDF_LAYOUT_TOPANCHOR_USE_PERCENT   = 328;
 NOVAPDF_LAYOUT_BOTTOMANCHOR_USED       = 329;
 NOVAPDF_LAYOUT_BOTTOMANCHOR_OFFSET     = 330;
 NOVAPDF_LAYOUT_BOTTOMANCHOR_USE_PERCENT= 331;
 NOVAPDF_LAYOUT_VERTANCHOR_USED         = 332;
 NOVAPDF_LAYOUT_VERTLANCHOR_OFFSET      = 333;
 NOVAPDF_LAYOUT_VERTANCHOR_USE_PERCENT  = 334;
 NOVAPDF_LAYOUT_HORIZANCHOR_USED        = 335;
 NOVAPDF_LAYOUT_HORIZANCHOR_OFFSET      = 336;
 NOVAPDF_LAYOUT_HORIZANCHOR_USE_PERCENT = 337;
 NOVAPDF_LAYOUT_USE_ASPECT_RATIO        = 338;
 NOVAPDF_LAYOUT_WIDTH                   = 339;
 NOVAPDF_LAYOUT_HEIGHT                  = 340;
 NOVAPDF_LAYOUT_ROTATION                = 341;
 NOVAPDF_LAYOUT_UNITS                   = 342;
 NOVAPDF_LAYOUT_FIRSTPAGE               = 343;
 NOVAPDF_LAYOUT_LASTPAGE                = 344;
 NOVAPDF_LAYOUT_ODDPAGE                 = 345;
 NOVAPDF_LAYOUT_EVENPAGE                = 346;
 NOVAPDF_LAYOUT_ALLPAGE                 = 347;
 NOVAPDF_LAYOUT_PAGES                   = 348;
 NOVAPDF_LAYOUT_PAGERANGE               = 349;
 NOVAPDF_LAYOUT_ZINDEX                  = 350;
 NOVAPDF_LAYOUT_FORM_WIDTH              = 351;
 NOVAPDF_LAYOUT_FORM_HEIGHT             = 352;
 NOVAPDF_LAYOUT_BOUNDING_WIDTH          = 353;
 NOVAPDF_LAYOUT_BOUNDING_HEIGHT         = 354;
 NOVAPDF_LAYOUT_ORIGINAL_WIDTH          = 355;
 NOVAPDF_LAYOUT_ORIGINAL_HEIGHT         = 356;
 NOVAPDF_LAYOUT_ALLOW_STRETCH           = 386;
 NOVAPDF_LAYOUT_STRETCH_X               = 387;
 NOVAPDF_LAYOUT_STRETCH_Y               = 388;
 NOVAPDF_LAYOUT_STRETCH_ROT_X           = 389;
 NOVAPDF_LAYOUT_STRETCH_ROT_Y           = 390;
 NOVAPDF_LAYOUT_OBJECT_WIDTH            = 393;
 NOVAPDF_LAYOUT_OBJECT_HEIGHT           = 394;
 
//Metadata
 NOVAPDF_LAYOUT_NAME                    = 357;
 NOVAPDF_LAYOUT_AUTHOR				    = 358;
 NOVAPDF_LAYOUT_DESCRIPTION             = 359;
 NOVAPDF_LAYOUT_SCALE_X                 = 360;
 NOVAPDF_LAYOUT_SCALE_Y                 = 361;
//-----
//BordersPreset (layout)
 NOVAPDF_LAYOUT_USE_BORDER              = 380;
 NOVAPDF_LAYOUT_BORDER_STYLE            = 382;
 NOVAPDF_LAYOUT_BORDER_WIDTH            = 383;
 NOVAPDF_LAYOUT_BORDER_COLOR            = 384;
 NOVAPDF_LAYOUT_BORDER_POSITION         = 385;
//-----

//-----------------------------------------------------------------------------
// Email options
//-----------------------------------------------------------------------------
//SendEmailsPreset
 NOVAPDF_SENDEMAIL_ACTION               = 400;
//SMTPPreset
 NOVAPDF_SMTP_SERVER                    = 401;
 NOVAPDF_SMTP_PORT                      = 402;
 NOVAPDF_SMTP_SSL                       = 403;
 NOVAPDF_SMTP_AUTHENTICATION            = 404;
 NOVAPDF_SMTP_ACCOUNT                   = 405;
 NOVAPDF_SMTP_PASSWORD                  = 406;
 NOVAPDF_SMTP_TLS			= 407;
//EmailsPreset
 NOVAPDF_EMAIL_COMPRESS                 = 411;
 NOVAPDF_EMAIL_CHANGEEXTENSION          = 412;
 NOVAPDF_EMAIL_ATTACH_PDF               = 413;
 NOVAPDF_EMAIL_DELETE_PDF               = 414;
 NOVAPDF_EMAIL_LOOKUP_ADDRESS           = 415;
 NOVAPDF_EMAIL_ATTACH_OTHER_FILES       = 416;
 NOVAPDF_EMAIL_OTHER_FILES              = 417;
 NOVAPDF_EMAIL_SUBJECT                  = 418;
 NOVAPDF_EMAIL_BODY                     = 419;
 NOVAPDF_EMAIL_EXTENSION                = 420;


//-----------------------------------------------------------------------------
// Printer options
//-----------------------------------------------------------------------------
 NOVAPDF_PRINTER_ACTIVE_PROFILE	       = 501;
 NOVAPDF_PRINTER_SELECT_PROFILE_DLG	   = 502;
//-----------------------------------------------------------------------------
// Location type
//-----------------------------------------------------------------------------
 LOCATION_TYPE_LOCAL  = 1;
 LOCATION_TYPE_SERVER = 2;
//-----------------------------------------------------------------------------
// Option types
//-----------------------------------------------------------------------------
 PRESET_OPTION_TYPE_STRING = 1;
 PRESET_OPTION_TYPE_LONG   = 2;
 PRESET_OPTION_TYPE_BOOL   = 3;
 PRESET_OPTION_TYPE_FLOAT  = 4;
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// PDF version
//-----------------------------------------------------------------------------
 PDF_VERSION_13 = 3;
 PDF_VERSION_14 = 4;
 PDF_VERSION_15 = 5;
 PDF_VERSION_16 = 6;
 PDF_VERSION_17 = 7;
//-----------------------------------------------------------------------------
// PDF/A version
//-----------------------------------------------------------------------------
 PDFA_1A       = 1;
 PDFA_1B       = 2;
//-----------------------------------------------------------------------------
// Border style
//-----------------------------------------------------------------------------
 BORDER_STYLE_SOLID  = 0;
 BORDER_STYLE_DASHED = 1;
//-----------------------------------------------------------------------------
// Border position
//-----------------------------------------------------------------------------
 BORDER_POSITION_NEUTRAL  =  0;
 BORDER_POSITION_INTERIOR =  1;
 BORDER_POSITION_EXTERIOR =  2;
//-----------------------------------------------------------------------------
// Units
//-----------------------------------------------------------------------------
 NOVA_UNITS_MILIMETERS     = 0;
 NOVA_UNITS_CENTIMETERS    = 1;
 NOVA_UNITS_INCHES         = 2;
//-----------------------------------------------------------------------------
// Transition types
//-----------------------------------------------------------------------------
 TRANSITION_TYPE_VIEWERDEFAULT = 0;
 TRANSITION_TYPE_REPLACE  = 1;
 TRANSITION_TYPE_SPLIT    = 2;
 TRANSITION_TYPE_BLINDS   = 3;
 TRANSITION_TYPE_BOX      = 4;
 TRANSITION_TYPE_WIPE     = 5;
 TRANSITION_TYPE_DISSOLVE = 6;
 TRANSITION_TYPE_GLITTER  = 7;
 TRANSITION_TYPE_FLYIN    = 8;
 TRANSITION_TYPE_FLYOUT   = 9;
 TRANSITION_TYPE_PUSH     = 10;
 TRANSITION_TYPE_COVER    = 11;
 TRANSITION_TYPE_UNCOVER  = 12;
 TRANSITION_TYPE_FADE     = 13;
//-----------------------------------------------------------------------------
// Transition direction
//-----------------------------------------------------------------------------
 TRANSITION_DIR_HORZ = 0;
 TRANSITION_DIR_VERT = 1;
//-----------------------------------------------------------------------------
// Page layout
//-----------------------------------------------------------------------------
 PAGE_LAY_VIEWERDEF        = 0;
 PAGE_LAY_SINGLE           = 1;
 PAGE_LAY_COLUMN           = 2;
 PAGE_LAY_TWOCOL_LEFT      = 3;
 PAGE_LAY_TWOCOL_RIGHT     = 4;
 PAGE_LAY_TWOPAGE_LEFT     = 5;
 PAGE_LAY_TWOPAGE_RIGHT    = 6;
//-----------------------------------------------------------------------------
// Page mode
//-----------------------------------------------------------------------------
 PAGE_MODE_VIEWERDEFAULT   = 0;
 PAGE_MODE_NONE            = 1;
 PAGE_MODE_OUTLINES        = 2;
 PAGE_MODE_PAGES           = 3;
 PAGE_MODE_FULLSCREEN      = 4;
 PAGE_MODE_LAYERS          = 5;
 PAGE_MODE_ATTACHMENTS     = 6;
//-----------------------------------------------------------------------------
// Page magnification
//-----------------------------------------------------------------------------
 PAGE_MAGN_VIEWERDEFAULT   = 0;
 PAGE_MAGN_DEFAULT         = 1;
 PAGE_MAGN_FITWIDTH        = 2;
 PAGE_MAGN_FITHEIGHT       = 3;
 PAGE_MAGN_FITPAGE         = 4;
 PAGE_MAGN_PERCENT         = 5;
 PAGE_MAGN_FITVISIBLE      = 6;
//-----------------------------------------------------------------------------
// Page scale
//-----------------------------------------------------------------------------
 PAGE_SCALE_APPDEFAULT     = 0;
 PAGE_SCALE_NONE           = 1;
//-----------------------------------------------------------------------------
// Fullscreen mode
//-----------------------------------------------------------------------------
 FULLSCREEN_VIEWERDEF = 0;
 FULLSCREEN_NONE      = 1;
 FULLSCREEN_BOOKMARKS = 2;
 FULLSCREEN_PAGES     = 3;
 FULLSCREEN_LAYERS    = 4;
//-----------------------------------------------------------------------------
// Compression method
//-----------------------------------------------------------------------------
 COMPRESS_METHOD_ZIP  = 0;
 COMPRESS_METHOD_JPEG = 1;
//-----------------------------------------------------------------------------
// Image convertion type
//-----------------------------------------------------------------------------
 CONVERT_GRAYSCALE	 =	0;
 CONVERT_MONOCHROME	 =	1;
//-----------------------------------------------------------------------------
// Dither
//-----------------------------------------------------------------------------
 DITHER_FS       =  0;
 DITHER_BAYER4   =  1;
 DITHER_BAYER8   =  2;
 DITHER_ORDER6   =  3;
 DITHER_ORDER8   =  4;
 DITHER_ORDER16  =  5;
//-----------------------------------------------------------------------------
// Downsample
//-----------------------------------------------------------------------------
 DOWNSAMPLE_FILTER_BOX          = 0;
 DOWNSAMPLE_FILTER_BILINEAR     = 1;
 DOWNSAMPLE_FILTER_BSPLINE      = 2;
 DOWNSAMPLE_FILTER_BICUBIC      = 3;
 DOWNSAMPLE_FILTER_CATMULLROM   = 4;
 DOWNSAMPLE_FILTER_LANCZOS3     = 5;
//-----------------------------------------------------------------------------
// Overlay repeat type
//-----------------------------------------------------------------------------
 OVERLAY_REPEAT_NONE      = 0;
 OVERLAY_REPEAT_LAST      = 1;
 OVERLAY_REPEAT_ALL       = 2;
//-----------------------------------------------------------------------------
// Save dlg
//-----------------------------------------------------------------------------
 PROMPT_SAVE_STNANDARD = 0;
 PROMPT_SAVE_NONE     = 1;
 PROMPT_SAVE_SIMPLE   = 2;
//-----------------------------------------------------------------------------
// Save file conflict
//-----------------------------------------------------------------------------
 FILE_CONFLICT_STRATEGY_PROMPT           = 0;
 FILE_CONFLICT_STRATEGY_AUTONUMBER_NEW   = 1;
 FILE_CONFLICT_STRATEGY_APPEND_DATE      = 2;
 FILE_CONFLICT_STRATEGY_OVERWRITE        = 3;
 FILE_CONFLICT_STRATEGY_AUTONUMBER_EXIST = 4;
 FILE_CONFLICT_STRATEGY_APPEND           = 5;
 FILE_CONFLICT_STRATEGY_INSERT_BEFORE    = 6;
 FILE_CONFLICT_STRATEGY_DONTSAVE         = 7;
//-----------------------------------------------------------------------------
// Security level
//-----------------------------------------------------------------------------
 SECURITY_40BITS          =  1;
 SECURITY_128BITS         =  2;
//-----------------------------------------------------------------------------
// Certificate type
//-----------------------------------------------------------------------------
 CERTIFICATE_TYPE_USER     = 0;
 CERTIFICATE_TYPE_SYSTEM   = 1;
 CERTIFICATE_TYPE_FILE     = 2;
//-----------------------------------------------------------------------------
// Font type
//-----------------------------------------------------------------------------
 NOVA_FONTTYPE_TRUETYPE		 = 0;
 NOVA_FONTTYPE_TYPE1		   = 1;
 NOVA_FONTTYPE_OT_TRUETYPE = 2;
 NOVA_FONTTYPE_OT_TYPE1		 = 3;
//-----------------------------------------------------------------------------
// Send email method
//-----------------------------------------------------------------------------
 EMAIL_TYPE_MAPI_NO_DLG    = 0;
 EMAIL_TYPE_MAPI_DLG       = 1;
 EMAIL_TYPE_SMTP           = 2;
//-----------------------------------------------------------------------------
// Predefined save folders
//-----------------------------------------------------------------------------
 SAVEFOLDER_APPLICATION    = 1;
 SAVEFOLDER_LAST           = 2;
 SAVEFOLDER_CUSTOM         = 3;
 SAVEFOLDER_MYDOCUMENTS    = 4;
//-----------------------------------------------------------------------------


implementation

end.
