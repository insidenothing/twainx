unit ScanProj_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 4/30/2008 1:11:05 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\WebScanX\twainx\ScanProj.tlb (1)
// LIBID: {4B7FB444-6EA1-470B-9D43-C80425075612}
// LCID: 0
// Helpfile: 
// HelpString: ScanProj Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ScanProjMajorVersion = 1;
  ScanProjMinorVersion = 0;

  LIBID_ScanProj: TGUID = '{4B7FB444-6EA1-470B-9D43-C80425075612}';

  IID_IScanX: TGUID = '{70B2325E-197C-43C8-A952-CD5C9E501604}';
  DIID_IScanXEvents: TGUID = '{FE086B9D-8542-40B7-AAD3-4A41A3F70C75}';
  CLASS_ScanX: TGUID = '{61EC4ECB-81B6-4309-B7B5-8F7755830EEF}';
  IID_IDeleteX: TGUID = '{261D39FD-4B72-4A2C-9069-F6350B906C7D}';
  DIID_IDeleteXEvents: TGUID = '{9E5C508D-B78F-4B46-BC78-769BD776FE54}';
  CLASS_DeleteX: TGUID = '{9C637D98-F127-4092-BB07-F5C08AA5E705}';
  IID_IActiveFormX: TGUID = '{939CED4E-139D-4BE0-AD3B-ADF138F16FEC}';
  DIID_IActiveFormXEvents: TGUID = '{B1328AF1-4722-411C-863C-D63A25D924EA}';
  CLASS_ActiveFormX: TGUID = '{716E007C-8DE1-4BED-A590-0671DFF7B220}';
  IID_IActiveFormX2: TGUID = '{7FABB09E-0FD3-4BC0-9C2A-B2B77577FE91}';
  DIID_IActiveFormX2Events: TGUID = '{67157431-E651-44DC-BF2F-B68AEA78FB6D}';
  CLASS_ActiveFormX2: TGUID = '{8038C29B-335B-4ED8-8E1F-E09AF68AA55F}';
  IID_IActiveFormX3: TGUID = '{40F5FB2D-BD88-4FC9-AC7E-F918D7D43494}';
  DIID_IActiveFormX3Events: TGUID = '{4C45D3F5-43CD-4002-8800-6EFE7D3218EA}';
  CLASS_ActiveFormX3: TGUID = '{0DB38CD4-76B7-4167-9A17-C6F7F50EBCF0}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum TxActiveFormBorderStyle
type
  TxActiveFormBorderStyle = TOleEnum;
const
  afbNone = $00000000;
  afbSingle = $00000001;
  afbSunken = $00000002;
  afbRaised = $00000003;

// Constants for enum TxPrintScale
type
  TxPrintScale = TOleEnum;
const
  poNone = $00000000;
  poProportional = $00000001;
  poPrintToFit = $00000002;

// Constants for enum TxMouseButton
type
  TxMouseButton = TOleEnum;
const
  mbLeft = $00000000;
  mbRight = $00000001;
  mbMiddle = $00000002;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IScanX = interface;
  IScanXDisp = dispinterface;
  IScanXEvents = dispinterface;
  IDeleteX = interface;
  IDeleteXDisp = dispinterface;
  IDeleteXEvents = dispinterface;
  IActiveFormX = interface;
  IActiveFormXDisp = dispinterface;
  IActiveFormXEvents = dispinterface;
  IActiveFormX2 = interface;
  IActiveFormX2Disp = dispinterface;
  IActiveFormX2Events = dispinterface;
  IActiveFormX3 = interface;
  IActiveFormX3Disp = dispinterface;
  IActiveFormX3Events = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ScanX = IScanX;
  DeleteX = IDeleteX;
  ActiveFormX = IActiveFormX;
  ActiveFormX2 = IActiveFormX2;
  ActiveFormX3 = IActiveFormX3;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PPUserType1 = ^IFontDisp; {*}


// *********************************************************************//
// Interface: IScanX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {70B2325E-197C-43C8-A952-CD5C9E501604}
// *********************************************************************//
  IScanX = interface(IDispatch)
    ['{70B2325E-197C-43C8-A952-CD5C9E501604}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    function Get_showdialog: Integer; safecall;
    procedure Set_showdialog(Value: Integer); safecall;
    function Get_basedir: WideString; safecall;
    procedure Set_basedir(const Value: WideString); safecall;
    function Get_regkeyid: WideString; safecall;
    procedure Set_regkeyid(const Value: WideString); safecall;
    procedure scanRegions(const basedir: WideString; const regiondef: WideString; 
                          interactive: Integer; const regkey: WideString; debug: Integer); safecall;
    procedure noOp; safecall;
    function getSelectedTwainSource: OleVariant; safecall;
    function Get_xResolution: Integer; safecall;
    procedure Set_xResolution(Value: Integer); safecall;
    function Get_yResolution: Integer; safecall;
    procedure Set_yResolution(Value: Integer); safecall;
    function Get_ScanBitDepth: Shortint; safecall;
    procedure Set_ScanBitDepth(Value: Shortint); safecall;
    procedure config(xres: Integer; yres: Integer; bitdeptEnum: Shortint; cropable: WordBool; 
                     resizable: WordBool; const basedir: WideString; const regkey: WideString; 
                     interactive: WordBool; debugMode: WordBool); safecall;
    function getTwainDeviceName(sourceIndex: Shortint): WideString; safecall;
    procedure clearRegionDefintion; safecall;
    procedure addRegionDefinition(const id: WideString; x: Integer; y: Integer; width: Integer; 
                                  height: Integer; maxQuality: Integer; maxFileSize: Integer; 
                                  const filename: WideString; bitDepth: Shortint; 
                                  const format: WideString); safecall;
    procedure scan; safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
    property showdialog: Integer read Get_showdialog write Set_showdialog;
    property basedir: WideString read Get_basedir write Set_basedir;
    property regkeyid: WideString read Get_regkeyid write Set_regkeyid;
    property xResolution: Integer read Get_xResolution write Set_xResolution;
    property yResolution: Integer read Get_yResolution write Set_yResolution;
    property ScanBitDepth: Shortint read Get_ScanBitDepth write Set_ScanBitDepth;
  end;

// *********************************************************************//
// DispIntf:  IScanXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {70B2325E-197C-43C8-A952-CD5C9E501604}
// *********************************************************************//
  IScanXDisp = dispinterface
    ['{70B2325E-197C-43C8-A952-CD5C9E501604}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
    property showdialog: Integer dispid 217;
    property basedir: WideString dispid 218;
    property regkeyid: WideString dispid 219;
    procedure scanRegions(const basedir: WideString; const regiondef: WideString; 
                          interactive: Integer; const regkey: WideString; debug: Integer); dispid 220;
    procedure noOp; dispid 221;
    function getSelectedTwainSource: OleVariant; dispid 222;
    property xResolution: Integer dispid 223;
    property yResolution: Integer dispid 224;
    property ScanBitDepth: {??Shortint}OleVariant dispid 225;
    procedure config(xres: Integer; yres: Integer; bitdeptEnum: {??Shortint}OleVariant; 
                     cropable: WordBool; resizable: WordBool; const basedir: WideString; 
                     const regkey: WideString; interactive: WordBool; debugMode: WordBool); dispid 226;
    function getTwainDeviceName(sourceIndex: {??Shortint}OleVariant): WideString; dispid 227;
    procedure clearRegionDefintion; dispid 228;
    procedure addRegionDefinition(const id: WideString; x: Integer; y: Integer; width: Integer; 
                                  height: Integer; maxQuality: Integer; maxFileSize: Integer; 
                                  const filename: WideString; bitDepth: {??Shortint}OleVariant; 
                                  const format: WideString); dispid 229;
    procedure scan; dispid 230;
  end;

// *********************************************************************//
// DispIntf:  IScanXEvents
// Flags:     (4096) Dispatchable
// GUID:      {FE086B9D-8542-40B7-AAD3-4A41A3F70C75}
// *********************************************************************//
  IScanXEvents = dispinterface
    ['{FE086B9D-8542-40B7-AAD3-4A41A3F70C75}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;

// *********************************************************************//
// Interface: IDeleteX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {261D39FD-4B72-4A2C-9069-F6350B906C7D}
// *********************************************************************//
  IDeleteX = interface(IDispatch)
    ['{261D39FD-4B72-4A2C-9069-F6350B906C7D}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IDeleteXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {261D39FD-4B72-4A2C-9069-F6350B906C7D}
// *********************************************************************//
  IDeleteXDisp = dispinterface
    ['{261D39FD-4B72-4A2C-9069-F6350B906C7D}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
  end;

// *********************************************************************//
// DispIntf:  IDeleteXEvents
// Flags:     (4096) Dispatchable
// GUID:      {9E5C508D-B78F-4B46-BC78-769BD776FE54}
// *********************************************************************//
  IDeleteXEvents = dispinterface
    ['{9E5C508D-B78F-4B46-BC78-769BD776FE54}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;

// *********************************************************************//
// Interface: IActiveFormX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {939CED4E-139D-4BE0-AD3B-ADF138F16FEC}
// *********************************************************************//
  IActiveFormX = interface(IDispatch)
    ['{939CED4E-139D-4BE0-AD3B-ADF138F16FEC}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {939CED4E-139D-4BE0-AD3B-ADF138F16FEC}
// *********************************************************************//
  IActiveFormXDisp = dispinterface
    ['{939CED4E-139D-4BE0-AD3B-ADF138F16FEC}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormXEvents
// Flags:     (4096) Dispatchable
// GUID:      {B1328AF1-4722-411C-863C-D63A25D924EA}
// *********************************************************************//
  IActiveFormXEvents = dispinterface
    ['{B1328AF1-4722-411C-863C-D63A25D924EA}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;

// *********************************************************************//
// Interface: IActiveFormX2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7FABB09E-0FD3-4BC0-9C2A-B2B77577FE91}
// *********************************************************************//
  IActiveFormX2 = interface(IDispatch)
    ['{7FABB09E-0FD3-4BC0-9C2A-B2B77577FE91}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormX2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7FABB09E-0FD3-4BC0-9C2A-B2B77577FE91}
// *********************************************************************//
  IActiveFormX2Disp = dispinterface
    ['{7FABB09E-0FD3-4BC0-9C2A-B2B77577FE91}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormX2Events
// Flags:     (4096) Dispatchable
// GUID:      {67157431-E651-44DC-BF2F-B68AEA78FB6D}
// *********************************************************************//
  IActiveFormX2Events = dispinterface
    ['{67157431-E651-44DC-BF2F-B68AEA78FB6D}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;

// *********************************************************************//
// Interface: IActiveFormX3
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {40F5FB2D-BD88-4FC9-AC7E-F918D7D43494}
// *********************************************************************//
  IActiveFormX3 = interface(IDispatch)
    ['{40F5FB2D-BD88-4FC9-AC7E-F918D7D43494}']
    function Get_Visible: WordBool; safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_AutoScroll: WordBool; safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    function Get_AutoSize: WordBool; safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    function Get_Caption: WideString; safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    function Get_Color: OLE_COLOR; safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    function Get_Font: IFontDisp; safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    function Get_KeyPreview: WordBool; safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    function Get_PixelsPerInch: Integer; safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    function Get_Scaled: WordBool; safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    function Get_Active: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    function Get_HelpFile: WideString; safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    function Get_ScreenSnap: WordBool; safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    function Get_SnapBuffer: Integer; safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    function Get_Enabled: WordBool; safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property AutoScroll: WordBool read Get_AutoScroll write Set_AutoScroll;
    property AutoSize: WordBool read Get_AutoSize write Set_AutoSize;
    property AxBorderStyle: TxActiveFormBorderStyle read Get_AxBorderStyle write Set_AxBorderStyle;
    property Caption: WideString read Get_Caption write Set_Caption;
    property Color: OLE_COLOR read Get_Color write Set_Color;
    property Font: IFontDisp read Get_Font write Set_Font;
    property KeyPreview: WordBool read Get_KeyPreview write Set_KeyPreview;
    property PixelsPerInch: Integer read Get_PixelsPerInch write Set_PixelsPerInch;
    property PrintScale: TxPrintScale read Get_PrintScale write Set_PrintScale;
    property Scaled: WordBool read Get_Scaled write Set_Scaled;
    property Active: WordBool read Get_Active;
    property DropTarget: WordBool read Get_DropTarget write Set_DropTarget;
    property HelpFile: WideString read Get_HelpFile write Set_HelpFile;
    property ScreenSnap: WordBool read Get_ScreenSnap write Set_ScreenSnap;
    property SnapBuffer: Integer read Get_SnapBuffer write Set_SnapBuffer;
    property DoubleBuffered: WordBool read Get_DoubleBuffered write Set_DoubleBuffered;
    property AlignDisabled: WordBool read Get_AlignDisabled;
    property VisibleDockClientCount: Integer read Get_VisibleDockClientCount;
    property Enabled: WordBool read Get_Enabled write Set_Enabled;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormX3Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {40F5FB2D-BD88-4FC9-AC7E-F918D7D43494}
// *********************************************************************//
  IActiveFormX3Disp = dispinterface
    ['{40F5FB2D-BD88-4FC9-AC7E-F918D7D43494}']
    property Visible: WordBool dispid 201;
    property AutoScroll: WordBool dispid 202;
    property AutoSize: WordBool dispid 203;
    property AxBorderStyle: TxActiveFormBorderStyle dispid 204;
    property Caption: WideString dispid -518;
    property Color: OLE_COLOR dispid -501;
    property Font: IFontDisp dispid -512;
    property KeyPreview: WordBool dispid 205;
    property PixelsPerInch: Integer dispid 206;
    property PrintScale: TxPrintScale dispid 207;
    property Scaled: WordBool dispid 208;
    property Active: WordBool readonly dispid 209;
    property DropTarget: WordBool dispid 210;
    property HelpFile: WideString dispid 211;
    property ScreenSnap: WordBool dispid 212;
    property SnapBuffer: Integer dispid 213;
    property DoubleBuffered: WordBool dispid 214;
    property AlignDisabled: WordBool readonly dispid 215;
    property VisibleDockClientCount: Integer readonly dispid 216;
    property Enabled: WordBool dispid -514;
  end;

// *********************************************************************//
// DispIntf:  IActiveFormX3Events
// Flags:     (0)
// GUID:      {4C45D3F5-43CD-4002-8800-6EFE7D3218EA}
// *********************************************************************//
  IActiveFormX3Events = dispinterface
    ['{4C45D3F5-43CD-4002-8800-6EFE7D3218EA}']
    procedure OnActivate; dispid 201;
    procedure OnClick; dispid 202;
    procedure OnCreate; dispid 203;
    procedure OnDblClick; dispid 204;
    procedure OnDestroy; dispid 205;
    procedure OnDeactivate; dispid 206;
    procedure OnKeyPress(var Key: Smallint); dispid 207;
    procedure OnPaint; dispid 208;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TScanX
// Help String      : ScanX Control
// Default Interface: IScanX
// Def. Intf. DISP? : No
// Event   Interface: IScanXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TScanXOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TScanX = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TScanXOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IScanX;
    function  GetControlInterface: IScanX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    procedure scanRegions(const basedir: WideString; const regiondef: WideString; 
                          interactive: Integer; const regkey: WideString; debug: Integer);
    procedure noOp;
    function getSelectedTwainSource: OleVariant;
    procedure config(xres: Integer; yres: Integer; bitdeptEnum: Shortint; cropable: WordBool; 
                     resizable: WordBool; const basedir: WideString; const regkey: WideString; 
                     interactive: WordBool; debugMode: WordBool);
    function getTwainDeviceName(sourceIndex: Shortint): WideString;
    procedure clearRegionDefintion;
    procedure addRegionDefinition(const id: WideString; x: Integer; y: Integer; width: Integer; 
                                  height: Integer; maxQuality: Integer; maxFileSize: Integer; 
                                  const filename: WideString; bitDepth: Shortint; 
                                  const format: WideString);
    procedure scan;
    property  ControlInterface: IScanX read GetControlInterface;
    property  DefaultInterface: IScanX read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property  ParentColor;
    property  ParentFont;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property showdialog: Integer index 217 read GetIntegerProp write SetIntegerProp stored False;
    property basedir: WideString index 218 read GetWideStringProp write SetWideStringProp stored False;
    property regkeyid: WideString index 219 read GetWideStringProp write SetWideStringProp stored False;
    property xResolution: Integer index 223 read GetIntegerProp write SetIntegerProp stored False;
    property yResolution: Integer index 224 read GetIntegerProp write SetIntegerProp stored False;
    property ScanBitDepth: Shortint index 225 read GetShortintProp write SetShortintProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TScanXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TDeleteX
// Help String      : DeleteX Control
// Default Interface: IDeleteX
// Def. Intf. DISP? : No
// Event   Interface: IDeleteXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TDeleteXOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TDeleteX = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TDeleteXOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IDeleteX;
    function  GetControlInterface: IDeleteX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IDeleteX read GetControlInterface;
    property  DefaultInterface: IDeleteX read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TDeleteXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TActiveFormX
// Help String      : ActiveFormX Control
// Default Interface: IActiveFormX
// Def. Intf. DISP? : No
// Event   Interface: IActiveFormXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TActiveFormXOnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TActiveFormX = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TActiveFormXOnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IActiveFormX;
    function  GetControlInterface: IActiveFormX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IActiveFormX read GetControlInterface;
    property  DefaultInterface: IActiveFormX read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TActiveFormXOnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TActiveFormX2
// Help String      : ActiveFormX2 Control
// Default Interface: IActiveFormX2
// Def. Intf. DISP? : No
// Event   Interface: IActiveFormX2Events
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TActiveFormX2OnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TActiveFormX2 = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TActiveFormX2OnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IActiveFormX2;
    function  GetControlInterface: IActiveFormX2;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IActiveFormX2 read GetControlInterface;
    property  DefaultInterface: IActiveFormX2 read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TActiveFormX2OnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TActiveFormX3
// Help String      : ActiveFormX3 Control
// Default Interface: IActiveFormX3
// Def. Intf. DISP? : No
// Event   Interface: IActiveFormX3Events
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TActiveFormX3OnKeyPress = procedure(ASender: TObject; var Key: Smallint) of object;

  TActiveFormX3 = class(TOleControl)
  private
    FOnActivate: TNotifyEvent;
    FOnClick: TNotifyEvent;
    FOnCreate: TNotifyEvent;
    FOnDblClick: TNotifyEvent;
    FOnDestroy: TNotifyEvent;
    FOnDeactivate: TNotifyEvent;
    FOnKeyPress: TActiveFormX3OnKeyPress;
    FOnPaint: TNotifyEvent;
    FIntf: IActiveFormX3;
    function  GetControlInterface: IActiveFormX3;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    property  ControlInterface: IActiveFormX3 read GetControlInterface;
    property  DefaultInterface: IActiveFormX3 read GetControlInterface;
    property Visible: WordBool index 201 read GetWordBoolProp write SetWordBoolProp;
    property Active: WordBool index 209 read GetWordBoolProp;
    property DropTarget: WordBool index 210 read GetWordBoolProp write SetWordBoolProp;
    property HelpFile: WideString index 211 read GetWideStringProp write SetWideStringProp;
    property ScreenSnap: WordBool index 212 read GetWordBoolProp write SetWordBoolProp;
    property SnapBuffer: Integer index 213 read GetIntegerProp write SetIntegerProp;
    property DoubleBuffered: WordBool index 214 read GetWordBoolProp write SetWordBoolProp;
    property AlignDisabled: WordBool index 215 read GetWordBoolProp;
    property VisibleDockClientCount: Integer index 216 read GetIntegerProp;
    property Enabled: WordBool index -514 read GetWordBoolProp write SetWordBoolProp;
  published
    property Anchors;
    property AutoScroll: WordBool index 202 read GetWordBoolProp write SetWordBoolProp stored False;
    property AutoSize: WordBool index 203 read GetWordBoolProp write SetWordBoolProp stored False;
    property AxBorderStyle: TOleEnum index 204 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Caption: WideString index -518 read GetWideStringProp write SetWideStringProp stored False;
    property Color: TColor index -501 read GetTColorProp write SetTColorProp stored False;
    property Font: TFont index -512 read GetTFontProp write SetTFontProp stored False;
    property KeyPreview: WordBool index 205 read GetWordBoolProp write SetWordBoolProp stored False;
    property PixelsPerInch: Integer index 206 read GetIntegerProp write SetIntegerProp stored False;
    property PrintScale: TOleEnum index 207 read GetTOleEnumProp write SetTOleEnumProp stored False;
    property Scaled: WordBool index 208 read GetWordBoolProp write SetWordBoolProp stored False;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;
    property OnClick: TNotifyEvent read FOnClick write FOnClick;
    property OnCreate: TNotifyEvent read FOnCreate write FOnCreate;
    property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property OnDeactivate: TNotifyEvent read FOnDeactivate write FOnDeactivate;
    property OnKeyPress: TActiveFormX3OnKeyPress read FOnKeyPress write FOnKeyPress;
    property OnPaint: TNotifyEvent read FOnPaint write FOnPaint;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TScanX.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{61EC4ECB-81B6-4309-B7B5-8F7755830EEF}';
    EventIID: '{FE086B9D-8542-40B7-AAD3-4A41A3F70C75}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TScanX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IScanX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TScanX.GetControlInterface: IScanX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TScanX.scanRegions(const basedir: WideString; const regiondef: WideString; 
                             interactive: Integer; const regkey: WideString; debug: Integer);
begin
  DefaultInterface.scanRegions(basedir, regiondef, interactive, regkey, debug);
end;

procedure TScanX.noOp;
begin
  DefaultInterface.noOp;
end;

function TScanX.getSelectedTwainSource: OleVariant;
begin
  Result := DefaultInterface.getSelectedTwainSource;
end;

procedure TScanX.config(xres: Integer; yres: Integer; bitdeptEnum: Shortint; cropable: WordBool; 
                        resizable: WordBool; const basedir: WideString; const regkey: WideString; 
                        interactive: WordBool; debugMode: WordBool);
begin
  DefaultInterface.config(xres, yres, bitdeptEnum, cropable, resizable, basedir, regkey, 
                          interactive, debugMode);
end;

function TScanX.getTwainDeviceName(sourceIndex: Shortint): WideString;
begin
  Result := DefaultInterface.getTwainDeviceName(sourceIndex);
end;

procedure TScanX.clearRegionDefintion;
begin
  DefaultInterface.clearRegionDefintion;
end;

procedure TScanX.addRegionDefinition(const id: WideString; x: Integer; y: Integer; width: Integer; 
                                     height: Integer; maxQuality: Integer; maxFileSize: Integer; 
                                     const filename: WideString; bitDepth: Shortint; 
                                     const format: WideString);
begin
  DefaultInterface.addRegionDefinition(id, x, y, width, height, maxQuality, maxFileSize, filename, 
                                       bitDepth, format);
end;

procedure TScanX.scan;
begin
  DefaultInterface.scan;
end;

procedure TDeleteX.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{9C637D98-F127-4092-BB07-F5C08AA5E705}';
    EventIID: '{9E5C508D-B78F-4B46-BC78-769BD776FE54}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TDeleteX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IDeleteX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TDeleteX.GetControlInterface: IDeleteX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TActiveFormX.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{716E007C-8DE1-4BED-A590-0671DFF7B220}';
    EventIID: '{B1328AF1-4722-411C-863C-D63A25D924EA}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TActiveFormX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IActiveFormX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TActiveFormX.GetControlInterface: IActiveFormX;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TActiveFormX2.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{8038C29B-335B-4ED8-8E1F-E09AF68AA55F}';
    EventIID: '{67157431-E651-44DC-BF2F-B68AEA78FB6D}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TActiveFormX2.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IActiveFormX2;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TActiveFormX2.GetControlInterface: IActiveFormX2;
begin
  CreateControl;
  Result := FIntf;
end;

procedure TActiveFormX3.InitControlData;
const
  CEventDispIDs: array [0..7] of DWORD = (
    $000000C9, $000000CA, $000000CB, $000000CC, $000000CD, $000000CE,
    $000000CF, $000000D0);
  CTFontIDs: array [0..0] of DWORD = (
    $FFFFFE00);
  CControlData: TControlData2 = (
    ClassID: '{0DB38CD4-76B7-4167-9A17-C6F7F50EBCF0}';
    EventIID: '{4C45D3F5-43CD-4002-8800-6EFE7D3218EA}';
    EventCount: 8;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80040154*);
    Flags: $0000001D;
    Version: 401;
    FontCount: 1;
    FontIDs: @CTFontIDs);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnActivate) - Cardinal(Self);
end;

procedure TActiveFormX3.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as IActiveFormX3;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TActiveFormX3.GetControlInterface: IActiveFormX3;
begin
  CreateControl;
  Result := FIntf;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TScanX, TDeleteX, TActiveFormX, TActiveFormX2, 
    TActiveFormX3]);
end;

end.
