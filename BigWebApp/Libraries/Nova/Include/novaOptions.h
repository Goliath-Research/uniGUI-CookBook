#ifndef __NOVA_OPTIONS_H__
#define __NOVA_OPTIONS_H__

//NovaProfilePreset
#define NOVAPDF_PDF_VERSION                    1
#define NOVAPDF_PDFA                           2
#define NOVAPDF_PDFA_VERSION                   3
#define NOVAPDF_PDF_LINEARIZE                  4
#define NOVAPDF_URL_ANALIZE                    5
#define NOVAPDF_EMAIL_SEND                     6
#define NOVAPDF_INFO_ENABLE                    7
#define NOVAPDF_INFO_VIEWER_ENABLE             8
#define NOVAPDF_COMPRESS_ENABLE                9
#define NOVAPDF_GR_CONVERT_ENABLE              10
#define NOVAPDF_GR_DOWNSMPL_ENABLE             11
#define NOVAPDF_BMARK_EN_AUTO_DET_BMARKS       12
#define NOVAPDF_SEC_ENABLE                     13
#define NOVAPDF_SAVE_LOCATION                  14
//Metadata
#define NOVAPDF_PROFILE_NAME                   22
#define NOVAPDF_PROFILE_AUTHOR                 23
#define NOVAPDF_PROFILE_DESCRIPTION            24
//ViewerOptionsPreset
#define NOVAPDF_VIEWOP_HIDE_TOOLBARS           25
#define NOVAPDF_VIEWOP_SHOW_DOCTITLE           26
#define NOVAPDF_VIEWOP_TRANSITION_TYPE         27
#define NOVAPDF_VIEWOP_TRANSITION_DIRECTION    28
#define NOVAPDF_VIEWOP_TRANSITION_DURATION     29
#define NOVAPDF_VIEWOP_PAGE_DURATION           30
#define NOVAPDF_VIEWOP_ZOOM                    31
#define NOVAPDF_VIEWOP_USE_START_PAGE          32
#define NOVAPDF_VIEWOP_START_PAGE              33
#define NOVAPDF_VIEWOP_PAGE_LAYOUT             34
#define NOVAPDF_VIEWOP_HIDE_MENUBAR            35
#define NOVAPDF_VIEWOP_RESIZE_WINDOW           36
#define NOVAPDF_VIEWOP_HIDE_USER               37
#define NOVAPDF_VIEWOP_PAGE_MODE               38
#define NOVAPDF_VIEWOP_FULLSCREEN              39
#define NOVAPDF_VIEWOP_PAGE_SCALING            40
//AfterSaveActionPreset
#define NOVAPDF_ACTION_DEFAULT_VIEWER          41
#define NOVAPDF_ACTION_RUN_APPLICATION         42
#define NOVAPDF_ACTION_APPLICATION             43
#define NOVAPDF_ACTION_USER_NAME               45
#define NOVAPDF_ACTION_USER_PASSWORD           46
#define NOVAPDF_ACTION_CMDLINE_PARAMETERS      47
//AdvancedOptionsPreset
#define NOVAPDF_ADV_OPTIMIZE_TEXT              48
#define NOVAPDF_ADV_SILENT_PRINT               49
#define NOVAPDF_ADV_OPTIMIZE_IMAGE             50
#define NOVAPDF_ADV_CORRECT_LINEWIDTH          51
#define NOVAPDF_ADV_CORRECT_FILLCOLOR          52
#define NOVAPDF_ADV_IGNORE_EMPTY_PAGES         53
//ContentCompressionPreset
#define NOVAPDF_COMPRESS_HIGH_COLOR            54
#define NOVAPDF_COMPRESS_HIGH_COLOR_TYPE       55
#define NOVAPDF_COMPRESS_HIGH_COLOR_LEVEL      56
#define NOVAPDF_COMPRESS_INDEXED               57
#define NOVAPDF_COMPRESS_INDEXED_TYPE          58
#define NOVAPDF_COMPRESS_INDEXED_LEVEL         59
#define NOVAPDF_COMPRESS_MONOCHROM             60
#define NOVAPDF_COMPRESS_MONOCHROM_TYPE        61
#define NOVAPDF_COMPRESS_MONOCHROM_LEVEL       62
#define NOVAPDF_COMPRESS_TEXT_GRAPHICS         63
#define NOVAPDF_COMPRESS_TEXT_GRAPHICS_TYPE    64
#define NOVAPDF_COMPRESS_TEXT_GRAPHICS_LEVEL   65
//DocumentInfoPreset
#define NOVAPDF_DOCINFO_TITLE                  66
#define NOVAPDF_DOCINFO_CREATOR                67
#define NOVAPDF_DOCINFO_SUBJECT                68
#define NOVAPDF_DOCINFO_AUTHOR                 69
#define NOVAPDF_DOCINFO_KEYWORDS               70
//ImageConversionPreset
#define NOVAPDF_IMAGE_CONVERT_HIGH_COLOR       71
#define NOVAPDF_IMAGE_DITHER_HIGH_COLOR        72
#define NOVAPDF_IMAGE_CONVERT_TYPE_HIGH_COLOR  73
#define NOVAPDF_IMAGE_CONVERT_TRESH_HIGH_COLOR 74
#define NOVAPDF_IMAGE_DITHER_TYPE_HIGH_COLOR   75
#define NOVAPDF_IMAGE_CONVERT_INDEXED          76
#define NOVAPDF_IMAGE_DITHER_INDEXED           77
#define NOVAPDF_IMAGE_CONVERT_TYPE_INDEXED     78
#define NOVAPDF_IMAGE_CONVERT_TRESH_INDEXED    79
#define NOVAPDF_IMAGE_DITHER_TYPE_INDEXED      80
#define NOVAPDF_IMAGE_CONVERT_TEXTANDGR        81
#define NOVAPDF_IMAGE_CONVERT_TYPE_TEXTANDGR   82
#define NOVAPDF_IMAGE_CONVERT_TRESH_TEXTANDGR  83
//ImageDownsamplingPreset
#define NOVAPDF_DOWNSAMPLE_HIGH_COLOR          84
#define NOVAPDF_DOWNSAMPLE_TYPE_HIGH_COLOR     85
#define NOVAPDF_DOWNSAMPLE_RES_HIGH_COLOR      86
#define NOVAPDF_DOWNSAMPLE_INDEXED             87
#define NOVAPDF_DOWNSAMPLE_TYPE_INDEXED        88
#define NOVAPDF_DOWNSAMPLE_RES_INDEXED         89
#define NOVAPDF_DOWNSAMPLE_MONOCHROM           90
#define NOVAPDF_DOWNSAMPLE_TYPE_MONOCHROM      91
#define NOVAPDF_DOWNSAMPLE_RES_MONOCHROM       92
//OverlaysPreset
#define NOVAPDF_OVERLAY_FILE                   93
#define NOVAPDF_OVERLAY_USER_NAME              94
#define NOVAPDF_OVERLAY_USER_PASSWORD          95
#define NOVAPDF_OVERLAY_FILE_LOCATION          96
#define NOVAPDF_OVERLAY_FILE_PASSWORD          97
#define NOVAPDF_OVERLAY_REPEAT_TYPE            99
#define NOVAPDF_OVERLAY_OPACITY                100
//SaveOptionsPreset
#define NOVAPDF_SAVE_PROMPT_TYPE               101
#define NOVAPDF_SAVE_FOLDER                    103
#define NOVAPDF_SAVE_FILE_NAME                 104
#define NOVAPDF_SAVE_USER_NAME                 105
#define NOVAPDF_SAVE_USER_PASSWORD             106
#define NOVAPDF_SAVE_APPEND_PASSWORD           107
#define NOVAPDF_SAVE_FILEEXIST_ACTION          108
//SecurityPreset
#define NOVAPDF_SECURITY_LEVEL                 109
#define NOVAPDF_SECURITY_USER_PASSWORD         110
#define NOVAPDF_SECURITY_OWNER_PASSWORD        111
#define NOVAPDF_SECURITY_FLAG_PRINTDOC         112
#define NOVAPDF_SECURITY_FLAG_MODIFYDOC        113
#define NOVAPDF_SECURITY_FLAG_EXTRACTTEXT      114
#define NOVAPDF_SECURITY_FLAG_MODIFYANNOTATION 115
#define NOVAPDF_SECURITY_FLAG_PRINTHIGHRES     116
#define NOVAPDF_SECURITY_FLAG_ASSEMBLEDOC      117
#define NOVAPDF_SECURITY_FLAG_ADVANCEDEXTRACT  118
#define NOVAPDF_SECURITY_FLAG_ADVANCEDFILL     119
//SignaturesPreset
#define NOVAPDF_SIGN_FILECERT_LOCATION         120
#define NOVAPDF_SIGN_FILECERT_FILE             121
#define NOVAPDF_SIGN_FILECERT_FILE_PASSWORD    122
#define NOVAPDF_SIGN_FILECERT_USER_NAME        123
#define NOVAPDF_SIGN_FILECERT_USER_PASSWORD    124
#define NOVAPDF_SIGN_SYSCERT_ISSUEDTO          125
#define NOVAPDF_SIGN_SYSCERT_ISSUEDBY          126
#define NOVAPDF_SIGN_SYSCERT_FRIENDLYNAME      127
#define NOVAPDF_SIGN_SYSCERT_SUBJECT           128
#define NOVAPDF_SIGN_SYSCERT_SUBJECT_NAME      129
#define NOVAPDF_SIGN_SYSCERT_EXPIRE_DATE       130
#define NOVAPDF_SIGN_CERTIFICATE_TYPE          131
#define NOVAPDF_SIGN_SHOW_GRAPHIC_NAME         132
#define NOVAPDF_SIGN_SHOW_GRAPHIC_IAMGE        133
#define NOVAPDF_SIGN_SHOW_KEEPASPECTRATIO      134
#define NOVAPDF_SIGN_SHOW_CERTIFICATE_NAME     135
#define NOVAPDF_SIGN_SHOW_SIGN_DATE            136
#define NOVAPDF_SIGN_SHOW_CONTACT_INFO         137
#define NOVAPDF_SIGN_SHOW_SIGN_REASON          138
#define NOVAPDF_SIGN_SHOW_SIGN_LOCATION        139
#define NOVAPDF_SIGN_SHOW_DETAILS              140
#define NOVAPDF_SIGN_SHOW_LABELS               141
#define NOVAPDF_SIGN_FONT_NAME                 142
#define NOVAPDF_SIGN_FONT_TYPE                 143
#define NOVAPDF_SIGN_FONT_SIZE                 144
#define NOVAPDF_SIGN_CUSTOM_SIZE               145
#define NOVAPDF_SIGN_NAME_COLOR                146
#define NOVAPDF_SIGN_NAME_OPACITY              147
#define NOVAPDF_SIGN_IMAGE_LOCATION            148
#define NOVAPDF_SIGN_IMAGE_FILE                149
#define NOVAPDF_SIGN_IMAGE_USER_NAME           150
#define NOVAPDF_SIGN_IMAGE_USER_PASSWORD       151
#define NOVAPDF_SIGN_IMAGE_OPACITY             152
#define NOVAPDF_SIGN_INFO_CONTACT              153
#define NOVAPDF_SIGN_INFO_REASON               154
#define NOVAPDF_SIGN_INFO_LOCATION             155
#define NOVAPDF_SIGN_VIEW_VIEW                 156
#define NOVAPDF_SIGN_VIEW_PRINT                157
#define NOVAPDF_SIGN_VIEW_EXPORT               158
//FontsPreset
#define NOVAPDF_FONTS_EMBED_SUBSETS            159
#define NOVAPDF_FONTS_EMBED_ALL_USED_FONTS     160
#define NOVAPDF_FONTS_FORCE_EMBED_PROTECTED    161
//LinksPreset
#define NOVAPDF_URL_DETECT_FILES               163
#define NOVAPDF_URL_CHECK_FILE_EXISTS          164
#define NOVAPDF_URL_UNDERLINE                  166
#define NOVAPDF_URL_OVERWRITE_COLOR            167
#define NOVAPDF_URL_COLOR                      168
//ImageWatermarksPreset
#define NOVAPDF_WTM_IMG_IMAGE_FILE_NAME        200
#define NOVAPDF_WTM_IMG_IMAGE_LOCATION         201
#define NOVAPDF_WTM_IMG_IMAGE_USER_NAME        202
#define NOVAPDF_WTM_IMG_IMAGE_USER_PASSWORD    203
#define NOVAPDF_WTM_IMG_IMAGE_TRANSPARENCY     204
#define NOVAPDF_WTM_IMG_IMAGE_TRANSP_COLOR     205
#define NOVAPDF_WTM_IMG_IMAGE_OPACITY          206
#define NOVAPDF_WTM_IMG_COLOR_VARIATION        207
#define NOVAPDF_WTM_IMG_VISIBILITY_VIEW        208
#define NOVAPDF_WTM_IMG_VISIBILITY_PRINT       209
#define NOVAPDF_WTM_IMG_VISIBILITY_EXPORT      210
//Metadata
#define NOVAPDF_WTM_IMG_NAME                   211
#define NOVAPDF_WTM_IMG_AUTHOR                 212
#define NOVAPDF_WTM_IMG_DESCRIPTION            213
//TextWatermarksPreset
#define NOVAPDF_WTM_TXT_WATERMARK_TEXT         240
#define NOVAPDF_WTM_TXT_FONT_NAME              241
#define NOVAPDF_WTM_TXT_FONT_TYPE              242
#define NOVAPDF_WTM_TXT_FONT_SIZE              243
#define NOVAPDF_WTM_TXT_FONT_BOLD              244
#define NOVAPDF_WTM_TXT_FONT_ITALIC            245
#define NOVAPDF_WTM_TXT_FONT_OUTLINE           246
#define NOVAPDF_WTM_TXT_FONT_UNDERLINE         247
#define NOVAPDF_WTM_TXT_FONT_COLOR             248
#define NOVAPDF_WTM_TXT_OPACITY                249
#define NOVAPDF_WTM_TXT_VISIBILITY_VIEW        250
#define NOVAPDF_WTM_TXT_VISIBILITY_PRINT       251
#define NOVAPDF_WTM_TXT_VISIBILITY_EXPORT      252
#define NOVAPDF_WTM_TXT_UNDERLINE_POSITION     253
#define NOVAPDF_WTM_TXT_UNDERLINE_THICKNESS    254
#define NOVAPDF_WTM_TXT_TEXT_CORRECTION        255
//Metadata
#define NOVAPDF_WTM_TXT_NAME                   256
#define NOVAPDF_WTM_TXT_AUTHOR                 257
#define NOVAPDF_WTM_TXT_DESCRIPTION            258
//Border (additions)
#define NOVAPDF_URL_BORDER_WIDTH_UNITS         259
//Save (additions)
#define NOVAPDF_SAVE_FOLDER_TYPE               260
//BookmarksPreset
#define NOVAPDF_BMK_ALLOW_MULTILINE            280
#define NOVAPDF_BMK_MATCH_ALL_LEVELS           281
#define NOVAPDF_BMK_USE_LEVELS                 282
#define NOVAPDF_BMK_OPEN_TO_LEVEL              283
#define NOVAPDF_BMK_ROOT_NAME                  284
#define NOVAPDF_BMK_ROOT_ENABLED               285
#define NOVAPDF_BMK_ROOT_BOLD                  286
#define NOVAPDF_BMK_ROOT_ITALIC                287
#define NOVAPDF_BMK_ROOT_COLOR                 288
//-----
//LayoutsPreset
#define NOVAPDF_LAYOUT_LEFTANCHOR_USED          320
#define NOVAPDF_LAYOUT_LEFTANCHOR_OFFSET        321
#define NOVAPDF_LAYOUT_LEFTANCHOR_USE_PERCENT   322
#define NOVAPDF_LAYOUT_RIGHTANCHOR_USED         323
#define NOVAPDF_LAYOUT_RIGHTANCHOR_OFFSET       324
#define NOVAPDF_LAYOUT_RIGHTANCHOR_USE_PERCENT  325
#define NOVAPDF_LAYOUT_TOPANCHOR_USED           326
#define NOVAPDF_LAYOUT_TOPANCHOR_OFFSET         327
#define NOVAPDF_LAYOUT_TOPANCHOR_USE_PERCENT    328
#define NOVAPDF_LAYOUT_BOTTOMANCHOR_USED        329
#define NOVAPDF_LAYOUT_BOTTOMANCHOR_OFFSET      330
#define NOVAPDF_LAYOUT_BOTTOMANCHOR_USE_PERCENT 331
#define NOVAPDF_LAYOUT_VERTANCHOR_USED          332
#define NOVAPDF_LAYOUT_VERTLANCHOR_OFFSET       333
#define NOVAPDF_LAYOUT_VERTANCHOR_USE_PERCENT   334
#define NOVAPDF_LAYOUT_HORIZANCHOR_USED         335
#define NOVAPDF_LAYOUT_HORIZANCHOR_OFFSET       336
#define NOVAPDF_LAYOUT_HORIZANCHOR_USE_PERCENT  337
#define NOVAPDF_LAYOUT_USE_ASPECT_RATIO         338
#define NOVAPDF_LAYOUT_WIDTH                    339
#define NOVAPDF_LAYOUT_HEIGHT                   340
#define NOVAPDF_LAYOUT_ROTATION                 341
#define NOVAPDF_LAYOUT_UNITS                    342
#define NOVAPDF_LAYOUT_FIRSTPAGE                343
#define NOVAPDF_LAYOUT_LASTPAGE                 344
#define NOVAPDF_LAYOUT_ODDPAGE                  345
#define NOVAPDF_LAYOUT_EVENPAGE                 346
#define NOVAPDF_LAYOUT_ALLPAGE                  347
#define NOVAPDF_LAYOUT_PAGES                    348
#define NOVAPDF_LAYOUT_PAGERANGE                349
#define NOVAPDF_LAYOUT_ZINDEX                   350
#define NOVAPDF_LAYOUT_FORM_WIDTH               351
#define NOVAPDF_LAYOUT_FORM_HEIGHT              352
#define NOVAPDF_LAYOUT_BOUNDING_WIDTH           353
#define NOVAPDF_LAYOUT_BOUNDING_HEIGHT          354
#define NOVAPDF_LAYOUT_ORIGINAL_WIDTH           355
#define NOVAPDF_LAYOUT_ORIGINAL_HEIGHT          356
#define NOVAPDF_LAYOUT_ALLOW_STRETCH            386
#define NOVAPDF_LAYOUT_STRETCH_X                387
#define NOVAPDF_LAYOUT_STRETCH_Y                388
#define NOVAPDF_LAYOUT_STRETCH_ROT_X            389
#define NOVAPDF_LAYOUT_STRETCH_ROT_Y            390
#define NOVAPDF_LAYOUT_WIDTHHEIGHT_SET          391
#define NOVAPDF_LAYOUT_CALC_LAYOUT              392
#define NOVAPDF_LAYOUT_OBJECT_WIDTH             393
#define NOVAPDF_LAYOUT_OBJECT_HEIGHT            394
//Metadata
#define NOVAPDF_LAYOUT_NAME                     357
#define NOVAPDF_LAYOUT_AUTHOR					358
#define NOVAPDF_LAYOUT_DESCRIPTION              359
#define NOVAPDF_LAYOUT_SCALE_X                  360
#define NOVAPDF_LAYOUT_SCALE_Y                  361
//-----
//BordersPreset (layout)
#define NOVAPDF_LAYOUT_USE_BORDER               380
#define NOVAPDF_LAYOUT_BORDER_STYLE             382
#define NOVAPDF_LAYOUT_BORDER_WIDTH             383
#define NOVAPDF_LAYOUT_BORDER_COLOR             384
#define NOVAPDF_LAYOUT_BORDER_POSITION          385
//-----

//-----------------------------------------------------------------------------
// Email options
//-----------------------------------------------------------------------------
//SendEmailsPreset
#define NOVAPDF_SENDEMAIL_ACTION                400
//SMTPPreset
#define NOVAPDF_SMTP_SERVER                     401
#define NOVAPDF_SMTP_PORT                       402
#define NOVAPDF_SMTP_SSL                        403
#define NOVAPDF_SMTP_AUTHENTICATION             404
#define NOVAPDF_SMTP_ACCOUNT                    405
#define NOVAPDF_SMTP_PASSWORD                   406
#define NOVAPDF_SMTP_TLS                        407
//EmailsPreset
#define NOVAPDF_EMAIL_COMPRESS                  411
#define NOVAPDF_EMAIL_CHANGEEXTENSION           412
#define NOVAPDF_EMAIL_ATTACH_PDF                413
#define NOVAPDF_EMAIL_DELETE_PDF                414
#define NOVAPDF_EMAIL_LOOKUP_ADDRESS            415
#define NOVAPDF_EMAIL_ATTACH_OTHER_FILES        416
#define NOVAPDF_EMAIL_OTHER_FILES               417
#define NOVAPDF_EMAIL_SUBJECT                   418
#define NOVAPDF_EMAIL_BODY                      419
#define NOVAPDF_EMAIL_EXTENSION                 420


//-----------------------------------------------------------------------------
// Printer options
//-----------------------------------------------------------------------------
#define NOVAPDF_PRINTER_ACTIVE_PROFILE	       501
#define NOVAPDF_PRINTER_SELECT_PROFILE_DLG	   502 
//-----------------------------------------------------------------------------
// Location type
//-----------------------------------------------------------------------------
#define LOCATION_TYPE_LOCAL        1
#define LOCATION_TYPE_SERVER       2
//-----------------------------------------------------------------------------
// Option types
//-----------------------------------------------------------------------------
#define PRESET_OPTION_TYPE_STRING  1
#define PRESET_OPTION_TYPE_LONG    2
#define PRESET_OPTION_TYPE_BOOL    3
#define PRESET_OPTION_TYPE_FLOAT   4
//-----------------------------------------------------------------------------
// PDF version
//-----------------------------------------------------------------------------
#define PDF_VERSION_13	          3
#define PDF_VERSION_14            4
#define PDF_VERSION_15            5
#define PDF_VERSION_16            6
#define PDF_VERSION_17            7
//-----------------------------------------------------------------------------
// PDF/A version
//-----------------------------------------------------------------------------
#define PDFA_1A                   1
#define PDFA_1B                   2
//-----------------------------------------------------------------------------
// Border style
//-----------------------------------------------------------------------------
#define BORDER_STYLE_SOLID        0
#define BORDER_STYLE_DASHED       1
//-----------------------------------------------------------------------------
// Border position
//-----------------------------------------------------------------------------
#define BORDER_POSITION_NEUTRAL	   0
#define BORDER_POSITION_INTERIOR   1
#define BORDER_POSITION_EXTERIOR   2
//-----------------------------------------------------------------------------
// Units
//-----------------------------------------------------------------------------
#define NOVA_UNITS_MILIMETERS      0
#define NOVA_UNITS_CENTIMETERS     1
#define NOVA_UNITS_INCHES          2
//-----------------------------------------------------------------------------
// Transition types
//-----------------------------------------------------------------------------
#define TRANSITION_TYPE_VIEWERDEFAULT  0
#define TRANSITION_TYPE_REPLACE  1
#define TRANSITION_TYPE_SPLIT    2
#define TRANSITION_TYPE_BLINDS   3
#define TRANSITION_TYPE_BOX      4
#define TRANSITION_TYPE_WIPE     5
#define TRANSITION_TYPE_DISSOLVE 6
#define TRANSITION_TYPE_GLITTER  7
#define TRANSITION_TYPE_FLYIN    8
#define TRANSITION_TYPE_FLYOUT   9
#define TRANSITION_TYPE_PUSH     10
#define TRANSITION_TYPE_COVER    11
#define TRANSITION_TYPE_UNCOVER  12
#define TRANSITION_TYPE_FADE     13
//-----------------------------------------------------------------------------
// Transition direction
//-----------------------------------------------------------------------------
#define TRANSITION_DIR_HORZ      0
#define TRANSITION_DIR_VERT      1
//-----------------------------------------------------------------------------
// Page layout
//-----------------------------------------------------------------------------
#define PAGE_LAY_VIEWERDEF       0
#define PAGE_LAY_SINGLE          1
#define PAGE_LAY_COLUMN          2
#define PAGE_LAY_TWOCOL_LEFT     3
#define PAGE_LAY_TWOCOL_RIGHT    4
#define PAGE_LAY_TWOPAGE_LEFT    5
#define PAGE_LAY_TWOPAGE_RIGHT   6
//-----------------------------------------------------------------------------
// Page mode
//-----------------------------------------------------------------------------
#define PAGE_MODE_VIEWERDEFAULT    0
#define PAGE_MODE_NONE             1
#define PAGE_MODE_OUTLINES         2
#define PAGE_MODE_PAGES            3
#define PAGE_MODE_FULLSCREEN       4
#define PAGE_MODE_LAYERS           5
#define PAGE_MODE_ATTACHMENTS      6
//-----------------------------------------------------------------------------
// Page magnification
//-----------------------------------------------------------------------------
#define PAGE_MAGN_VIEWERDEFAULT    0
#define PAGE_MAGN_DEFAULT          1
#define PAGE_MAGN_FITWIDTH         2
#define PAGE_MAGN_FITHEIGHT        3
#define PAGE_MAGN_FITPAGE          4
#define PAGE_MAGN_PERCENT          5
#define PAGE_MAGN_FITVISIBLE       6
//-----------------------------------------------------------------------------
// Page scale
//-----------------------------------------------------------------------------
#define PAGE_SCALE_APPDEFAULT      0
#define PAGE_SCALE_NONE            1
//-----------------------------------------------------------------------------
// Fullscreen mode
//-----------------------------------------------------------------------------
#define FULLSCREEN_VIEWERDEF 0      
#define FULLSCREEN_NONE      1      
#define FULLSCREEN_BOOKMARKS 2      
#define FULLSCREEN_PAGES     3       
#define FULLSCREEN_LAYERS    4      
//-----------------------------------------------------------------------------
// Compression method
//-----------------------------------------------------------------------------
#define COMPRESS_METHOD_ZIP   0
#define COMPRESS_METHOD_JPEG  1
//-----------------------------------------------------------------------------
// Image convertion type
//-----------------------------------------------------------------------------
#define CONVERT_GRAYSCALE		0
#define CONVERT_MONOCHROME		1
//-----------------------------------------------------------------------------
// Dither
//-----------------------------------------------------------------------------
#define DITHER_FS                       0
#define DITHER_BAYER4                   1
#define DITHER_BAYER8                   2
#define DITHER_ORDER6                   3
#define DITHER_ORDER8                   4
#define DITHER_ORDER16                  5
//-----------------------------------------------------------------------------
// Downsample
//-----------------------------------------------------------------------------
#define DOWNSAMPLE_FILTER_BOX           0
#define DOWNSAMPLE_FILTER_BILINEAR      1
#define DOWNSAMPLE_FILTER_BSPLINE       2
#define DOWNSAMPLE_FILTER_BICUBIC       3
#define DOWNSAMPLE_FILTER_CATMULLROM    4
#define DOWNSAMPLE_FILTER_LANCZOS3      5
//-----------------------------------------------------------------------------
// Overlay repeat type
//-----------------------------------------------------------------------------
#define OVERLAY_REPEAT_NONE       0
#define OVERLAY_REPEAT_LAST       1
#define OVERLAY_REPEAT_ALL        2
//-----------------------------------------------------------------------------
// Save dlg
//-----------------------------------------------------------------------------
#define PROMPT_SAVE_STNANDARD 0
#define PROMPT_SAVE_NONE      1
#define PROMPT_SAVE_SIMPLE    2
//-----------------------------------------------------------------------------
// Save file conflict
//-----------------------------------------------------------------------------
#define FILE_CONFLICT_STRATEGY_PROMPT            0
#define FILE_CONFLICT_STRATEGY_AUTONUMBER_NEW    1
#define FILE_CONFLICT_STRATEGY_APPEND_DATE       2
#define FILE_CONFLICT_STRATEGY_OVERWRITE         3
#define FILE_CONFLICT_STRATEGY_AUTONUMBER_EXIST  4
#define FILE_CONFLICT_STRATEGY_APPEND            5
#define FILE_CONFLICT_STRATEGY_INSERT_BEFORE     6
#define FILE_CONFLICT_STRATEGY_DONTSAVE          7
//-----------------------------------------------------------------------------
// Security level
//-----------------------------------------------------------------------------
#define SECURITY_40BITS            1
#define SECURITY_128BITS           2
//-----------------------------------------------------------------------------
// Certificate type
//-----------------------------------------------------------------------------
#define CERTIFICATE_TYPE_USER      0
#define CERTIFICATE_TYPE_SYSTEM    1
#define CERTIFICATE_TYPE_FILE      2
//-----------------------------------------------------------------------------
// Font type
//-----------------------------------------------------------------------------
#define NOVA_FONTTYPE_TRUETYPE		0
#define NOVA_FONTTYPE_TYPE1		    1
#define NOVA_FONTTYPE_OT_TRUETYPE	2
#define NOVA_FONTTYPE_OT_TYPE1		3
//-----------------------------------------------------------------------------
// Send email method
//-----------------------------------------------------------------------------
#define EMAIL_TYPE_MAPI_NO_DLG     0
#define EMAIL_TYPE_MAPI_DLG        1
#define EMAIL_TYPE_SMTP            2
//-----------------------------------------------------------------------------
// Predefined save folders
//-----------------------------------------------------------------------------
#define SAVEFOLDER_APPLICATION     1
#define SAVEFOLDER_LAST            2
#define SAVEFOLDER_CUSTOM          3
#define SAVEFOLDER_MYDOCUMENTS     4
//-----------------------------------------------------------------------------

#endif // not defined __NOVA_OPTIONS_H__
