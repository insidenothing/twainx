unit ScanImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX, AxCtrls, ScanProj_TLB, StdVcl, DelphiTwain, Buttons, Jpeg, registry, cropUnit,
  StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TScanRegion = class
  public
    id, format: string;
    x ,y, width, height: extended;
    filename: string;
    bitdepth: byte;
    quality: integer;
    maxFileSize : integer;

    Constructor create(
          _id,
          _format: string;
          _x, _y, _width, _height: extended;
          _filename: string;
          _bitdepth: byte;
          _quality, _maxFileSize: integer);overload;
  end;
  TScanX = class(TActiveForm, IScanX)
    Twain: TDelphiTwain;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    httpClient: TIdHTTP;
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure TwainAcquireCancel(Sender: TObject; const Index: Integer);
    procedure TwainAcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
  private
    { Private declarations }
    FEvents: IScanXEvents;
    procedure ActivateEvent(Sender: TObject);
    procedure ClickEvent(Sender: TObject);
    procedure CreateEvent(Sender: TObject);
    procedure DblClickEvent(Sender: TObject);
    procedure DeactivateEvent(Sender: TObject);
    procedure DestroyEvent(Sender: TObject);
    procedure KeyPressEvent(Sender: TObject; var Key: Char);
    procedure PaintEvent(Sender: TObject);
    function readTwainSourceFromRegistry(): integer;
    procedure writeTwainSourceToRegistry(srcIndex: integer);
    function getFileSize(filename: String):integer;
  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    function Get_Active: WordBool; safecall;
    function Get_AlignDisabled: WordBool; safecall;
    function Get_AutoScroll: WordBool; safecall;
    function Get_AutoSize: WordBool; safecall;
    function Get_AxBorderStyle: TxActiveFormBorderStyle; safecall;
    function Get_Caption: WideString; safecall;
    function Get_Color: OLE_COLOR; safecall;
    function Get_DoubleBuffered: WordBool; safecall;
    function Get_DropTarget: WordBool; safecall;
    function Get_Enabled: WordBool; safecall;
    function Get_Font: IFontDisp; safecall;
    function Get_HelpFile: WideString; safecall;
    function Get_KeyPreview: WordBool; safecall;
    function Get_PixelsPerInch: Integer; safecall;
    function Get_PrintScale: TxPrintScale; safecall;
    function Get_Scaled: WordBool; safecall;
    function Get_ScreenSnap: WordBool; safecall;
    function Get_SnapBuffer: Integer; safecall;
    function Get_Visible: WordBool; safecall;
    function Get_VisibleDockClientCount: Integer; safecall;
    procedure _Set_Font(var Value: IFontDisp); safecall;
    procedure Set_AutoScroll(Value: WordBool); safecall;
    procedure Set_AutoSize(Value: WordBool); safecall;
    procedure Set_AxBorderStyle(Value: TxActiveFormBorderStyle); safecall;
    procedure Set_Caption(const Value: WideString); safecall;
    procedure Set_Color(Value: OLE_COLOR); safecall;
    procedure Set_DoubleBuffered(Value: WordBool); safecall;
    procedure Set_DropTarget(Value: WordBool); safecall;
    procedure Set_Enabled(Value: WordBool); safecall;
    procedure Set_Font(const Value: IFontDisp); safecall;
    procedure Set_HelpFile(const Value: WideString); safecall;
    procedure Set_KeyPreview(Value: WordBool); safecall;
    procedure Set_PixelsPerInch(Value: Integer); safecall;
    procedure Set_PrintScale(Value: TxPrintScale); safecall;
    procedure Set_Scaled(Value: WordBool); safecall;
    procedure Set_ScreenSnap(Value: WordBool); safecall;
    procedure Set_SnapBuffer(Value: Integer); safecall;
    procedure Set_Visible(Value: WordBool); safecall;
    function Get_basedir: WideString; safecall;
    function Get_regkeyid: WideString; safecall;
    function Get_showdialog: Integer; safecall;
    procedure Set_basedir(const Value: WideString); safecall;
    procedure Set_regkeyid(const Value: WideString); safecall;
    procedure Set_showdialog(Value: Integer); safecall;
    procedure scanRegions(const basedir, regiondef: WideString;
      interactive: Integer; const regkey: WideString; debug: Integer);
      safecall;
    procedure noOp; safecall;
    function getSelectedTwainSource: OleVariant; safecall;
    function Get_ScanBitDepth: Shortint; safecall;
    function Get_xResolution: Integer; safecall;
    function Get_yResolution: Integer; safecall;
    procedure Set_ScanBitDepth(Value: Shortint); safecall;
    procedure Set_xResolution(Value: Integer); safecall;
    procedure Set_yResolution(Value: Integer); safecall;
    procedure config(_xres, _yres: Integer; _bitdeptEnum: Shortint; _cropable,
      _resizable: WordBool; const _baseDir, _regKey: WideString; _interactive,
      _debugMode: WordBool); safecall;
    function getTwainDeviceName(sourceIndex: Shortint): WideString; safecall;
    procedure addRegionDefinition(const id: WideString; x, y, width, height, maxQuality,
      maxFileSize: Integer; const filename: WideString; bitDepth: Shortint;
      const format: WideString); safecall;
    procedure clearRegionDefintion; safecall;
    procedure scan; safecall;
  public
     regions:TStrings;
     BaseDir:String;
     RegKeyID:String;
     ShowDialog:Integer;
     debug: Integer;
     ScanRegionArray: array of TScanRegion;
     xResolution, yResolution: integer;
     scanbitdepth : Integer;
     cropable, resizable, interactive: boolean;
    { Public declarations }
    procedure debugIt(msg: String);
    procedure Initialize; override;
    function getPreferredSource(const allowInteractive: boolean): integer;
    function selectSource(): integer;
  end;

//  procedure debugIt(msg: String);
  var
    isDebugMode : boolean;
    doneScanning: boolean;
    procedure MakeDir(Dir: String);
implementation

uses ComObj, ComServ;

{$R *.DFM}

{ TScanX }

procedure TScanX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  { Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_ScanXPage); }
end;

procedure TScanX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as IScanXEvents;
  inherited EventSinkChanged(EventSink);
end;

procedure TScanX.Initialize;
begin
  inherited Initialize;
  OnActivate := ActivateEvent;
  OnClick := ClickEvent;
  OnCreate := CreateEvent;
  OnDblClick := DblClickEvent;
  OnDeactivate := DeactivateEvent;
  OnDestroy := DestroyEvent;
  OnKeyPress := KeyPressEvent;
  OnPaint := PaintEvent;
end;

function TScanX.Get_Active: WordBool;
begin
  Result := Active;
end;

function TScanX.Get_AlignDisabled: WordBool;
begin
  Result := AlignDisabled;
end;

function TScanX.Get_AutoScroll: WordBool;
begin
  Result := AutoScroll;
end;

function TScanX.Get_AutoSize: WordBool;
begin
  Result := AutoSize;
end;

function TScanX.Get_AxBorderStyle: TxActiveFormBorderStyle;
begin
  Result := Ord(AxBorderStyle);
end;

function TScanX.Get_Caption: WideString;
begin
  Result := WideString(Caption);
end;

function TScanX.Get_Color: OLE_COLOR;
begin
  Result := OLE_COLOR(Color);
end;

function TScanX.Get_DoubleBuffered: WordBool;
begin
  Result := DoubleBuffered;
end;

function TScanX.Get_DropTarget: WordBool;
begin
  Result := DropTarget;
end;

function TScanX.Get_Enabled: WordBool;
begin
  Result := Enabled;
end;

function TScanX.Get_Font: IFontDisp;
begin
  GetOleFont(Font, Result);
end;

function TScanX.Get_HelpFile: WideString;
begin
  Result := WideString(HelpFile);
end;

function TScanX.Get_KeyPreview: WordBool;
begin
  Result := KeyPreview;
end;

function TScanX.Get_PixelsPerInch: Integer;
begin
  Result := PixelsPerInch;
end;

function TScanX.Get_PrintScale: TxPrintScale;
begin
  Result := Ord(PrintScale);
end;

function TScanX.Get_Scaled: WordBool;
begin
  Result := Scaled;
end;

function TScanX.Get_ScreenSnap: WordBool;
begin
  Result := ScreenSnap;
end;

function TScanX.Get_SnapBuffer: Integer;
begin
  Result := SnapBuffer;
end;

function TScanX.Get_Visible: WordBool;
begin
  Result := Visible;
end;

function TScanX.Get_VisibleDockClientCount: Integer;
begin
  Result := VisibleDockClientCount;
end;

procedure TScanX._Set_Font(var Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TScanX.ActivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnActivate;
end;

procedure TScanX.ClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnClick;
end;

procedure TScanX.CreateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnCreate;
end;

procedure TScanX.DblClickEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDblClick;
end;

procedure TScanX.DeactivateEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDeactivate;
end;

procedure TScanX.DestroyEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnDestroy;
end;

procedure TScanX.KeyPressEvent(Sender: TObject; var Key: Char);
var
  TempKey: Smallint;
begin
  TempKey := Smallint(Key);
  if FEvents <> nil then FEvents.OnKeyPress(TempKey);
  Key := Char(TempKey);
end;

procedure TScanX.PaintEvent(Sender: TObject);
begin
  if FEvents <> nil then FEvents.OnPaint;
end;

procedure TScanX.Set_AutoScroll(Value: WordBool);
begin
  AutoScroll := Value;
end;

procedure TScanX.Set_AutoSize(Value: WordBool);
begin
  AutoSize := Value;
end;

procedure TScanX.Set_AxBorderStyle(Value: TxActiveFormBorderStyle);
begin
  AxBorderStyle := TActiveFormBorderStyle(Value);
end;

procedure TScanX.Set_Caption(const Value: WideString);
begin
  Caption := TCaption(Value);
end;

procedure TScanX.Set_Color(Value: OLE_COLOR);
begin
  Color := TColor(Value);
end;

procedure TScanX.Set_DoubleBuffered(Value: WordBool);
begin
  DoubleBuffered := Value;
end;

procedure TScanX.Set_DropTarget(Value: WordBool);
begin
  DropTarget := Value;
end;

procedure TScanX.Set_Enabled(Value: WordBool);
begin
  Enabled := Value;
end;

procedure TScanX.Set_Font(const Value: IFontDisp);
begin
  SetOleFont(Font, Value);
end;

procedure TScanX.Set_HelpFile(const Value: WideString);
begin
  HelpFile := String(Value);
end;

procedure TScanX.Set_KeyPreview(Value: WordBool);
begin
  KeyPreview := Value;
end;

procedure TScanX.Set_PixelsPerInch(Value: Integer);
begin
  PixelsPerInch := Value;
end;

procedure TScanX.Set_PrintScale(Value: TxPrintScale);
begin
  PrintScale := TPrintScale(Value);
end;

procedure TScanX.Set_Scaled(Value: WordBool);
begin
  Scaled := Value;
end;

procedure TScanX.Set_ScreenSnap(Value: WordBool);
begin
  ScreenSnap := Value;
end;

procedure TScanX.Set_SnapBuffer(Value: Integer);
begin
  SnapBuffer := Value;
end;

procedure TScanX.Set_Visible(Value: WordBool);
begin
  Visible := Value;
end;

function TScanX.Get_basedir: WideString;
begin
  result:= WideString(BaseDir);
end;

function TScanX.Get_regkeyid: WideString;
begin
  result:=WideString(RegKeyID);
end;

function TScanX.Get_showdialog: Integer;
begin
  result:=ShowDialog;
end;

// --------------------------------------------------------
// opens the standard twain dialog to allow the user to
//  select his preferred twain acquisition source i.e. Scanner
//  if the selection of the scanner was successfuly
//  its twain index is stored in the registry
//  for further reference
// --------------------------------------------------------
function TScanX.selectSource(): integer;
begin
  debugit('selectSource() invoking TWAIN source selection dialog ...');
  if Twain.LoadLibrary then begin
      Twain.SourceManagerLoaded := TRUE;
      result := Twain.SelectSource;
      if result <> -1 then
      begin
        writeTwainSourceToRegistry(result);
      end else
        ShowMessage('selection of scanner was cancelled');
  end // load library
  else
    result := -1;
  debugit('selectSource() TWAIN source selected ' + intToStr(result));
end;

// --------------------------------------------------------
// reads the preferred twain source index from the registry
// if the registry key was not found, returns -1
// --------------------------------------------------------
function TScanX.readTwainSourceFromRegistry(): integer;
var
  reg: TRegistry;
begin
  debugit('readTwainSourceFromRegistry() reading preferred source from registry...');
  reg := TRegistry.Create();
  with reg do begin
    try
       if OpenKey('\Software\TwainX\Config', False) then
          result := reg.ReadInteger('preferred-source')
       else
          result := -1;
    finally
      reg.Free;
    end;
  end;
  debugit('readTwainSourceFromRegistry() read value '+ IntToStr(result));
end;

// --------------------------------------------------------
// stores the preferred twain source index to the registry
// --------------------------------------------------------
procedure TScanX.writeTwainSourceToRegistry(srcIndex: integer);
var
  reg: TRegistry;
begin
  debugit('writeTwainSourceToRegistry() writing preferred source to registry ' + IntToStr(srcIndex));
  reg := TRegistry.Create();
  with reg do begin
    try
       if OpenKey('\Software\TwainX\Config', true) then
          reg.WriteInteger('preferred-source', srcIndex)
       else
          showMessage('Couldn''t write twain to the registry');
    finally
      reg.Free;
    end;
  end;
end;

// --------------------------------------------------------
// attempts to read the preferred twain source index from the
// registry and if it fails and allowInteractive is set to
// true will open the twain source selection dialog to allow
// the user to select the preferred source
// --------------------------------------------------------
function TScanX.getPreferredSource(const allowInteractive: boolean): integer;
begin
  result := readTwainSourceFromRegistry;
  if (result = -1) and (allowInteractive = true) THEN
    result := selectSource;
end;

//----------------------------------------------------------
// Accessors and Mutators for the properties
//----------------------------------------------------------

procedure TScanX.Set_basedir(const Value: WideString);
begin
   BaseDir := String(Value);
   showMessage('inside set base dir: '+BaseDir);
end;

procedure TScanX.Set_regkeyid(const Value: WideString);
begin
   RegKeyID := String(value);
end;

procedure TScanX.Set_showdialog(Value: Integer);
begin
  ShowDialog := value;
end;

procedure Split
   (const Delimiter: Char;
    Input: string;
    const Strings: TStrings) ;
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure TScanX.scanRegions(const basedir, regiondef: WideString;
  interactive: Integer; const regkey: WideString; debug : Integer);
var
  SelectedSource: Integer;
  index : Integer;
  regionDetails: TStrings;

begin
  self.debug := debug;
  isDebugMode:= debug=1;
  doneScanning := false;
  debugit('Param 1 region def:\n\t'+String(regiondef)
      +'\n Param 2 base   dir:\n\t'+String(basedir)
      +'\n Param 3 nteractiv:'+ IntToStr(interactive)
      +'\n Param 4 key reg: '+  String(regkey));
  self.BaseDir := basedir;
  {*
  if assigned(ScanRegionArray) Then begin
    for regionCount := 0 to length(ScanRegionArray)-1 do
      if Assigned(ScanRegionArray[regionCount]) then
        ScanRegionArray[regionCount].Free;
  end;

  if assigned(regions)  then
    regions.Free;
  *}
  regions:=TStringList.create;
  split('#',regiondef, regions);
  debugit('parsed regions to: ' + regions.Text);
  SetLength(ScanRegionArray, regions.count);
  for index:=0 to regions.Count-1 do
  begin
    debugit('adding region ' + intToStr(index) );
    regionDetails := TStringList.Create();
    Split(',',regions[index], regionDetails);
    ScanRegionArray[index] := TScanRegion.Create
          ('id'+inttostr(index), 'jpg',
          StrToInt(regionDetails[0]),
          StrToInt(regionDetails[1]),
          StrToInt(regionDetails[2]),
          StrToInt(regionDetails[3]),
          regionDetails[4],
          StrToInt(regionDetails[5]),
          StrToInt(regionDetails[6]),
          StrToInt(regionDetails[7])
          );
  end;
  debugit('Total regions added: '+ intToStr(length(ScanRegionArray)) );
  if assigned(regionDetails) then
    regionDetails.Free;
  //regions.Free;

  if Twain.LoadLibrary then
  begin
    {Load source manager}
    Twain.SourceManagerLoaded := TRUE;
    {Allow user to select source}
    SelectedSource := getPreferredSource(TRUE);//Twain.SelectSource;
    //showMessage(InttoStr(SelectedSource));
    if SelectedSource <> -1 then
    begin
      {Load source, select transference method and enable (display interface)}
      //f interactive=1 then
      Twain.Source[SelectedSource].Loaded := TRUE;
      if scanbitdepth = 0 then
        Twain.Source[SelectedSource].SetIPixelType(tbdBw)
      else if scanbitdepth = 1 then
        Twain.Source[SelectedSource].SetIPixelType(tbdGray)
      else
        Twain.Source[SelectedSource].SetIPixelType(tbdRgb);

      Twain.Source[SelectedSource].SetIXResolution(Get_xResolution);
      Twain.Source[SelectedSource].SetIYResolution(Get_yResolution);
      Twain.Source[SelectedSource].TransferMode := ttmMemory;
      Twain.Source[SelectedSource].EnableSource(interactive=1, TRUE);
      //debugit('Twain Acquiring is complete..');
    end {if SelectedSource <> -1}
  end
  else
    showmessage('Problem communicating with Scanner Driver, a TWAIN scanner is not installed.');
  repeat
    Application.ProcessMessages;
  until doneScanning=true;
end;
procedure Delay(msecs: integer);
var
  FirstTickCount: longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
  until ((GetTickCount-FirstTickCount) >= Longint(msecs));
end;

//----------------------------------------------------------------------
// event handling the acquisition of an image sent by the twain source
//----------------------------------------------------------------------
procedure TScanX.TwainTwainAcquire(Sender: TObject; const Index: Integer;
  Image: TBitmap; var Cancel: Boolean);
var
  i, currentQuality: Integer;
  regionDetails: TStrings;
  TmpBmp: TBitmap;
  JpegImage: TJpegImage;
  cropRect : TRect;
  currentRegion : TScanRegion;
begin
  MakeDir(Get_basedir);
  DeleteFile(Get_basedir+'fullscan.bmp');
  Image.SaveToFile(Get_basedir+'fullscan.bmp');
  for i:=0  to (length(ScanRegionArray) -1) do
  begin
    currentRegion := ScanRegionArray[i];
    debugit('processing region:'+IntToStr(i)+ ' of '+intToStr(length(ScanRegionArray))+ ' /n' +
        Format('Region Details: x:%d , y:%d, w:%d, h:%d for file:<%s> maxQuality: %d, maxFileSize(bytes): %d',
          [ trunc(currentRegion.x),
            trunc(currentRegion.y),
            trunc(currentRegion.width),
            trunc(currentRegion.height),
            BaseDir+ currentRegion.filename,
            currentRegion.quality,
            currentRegion.maxFileSize]
            ));
    if (cropable) then
      cropRect := getCropPoint(self,
            Get_basedir+'fullscan.bmp',
            trunc(currentRegion.x), trunc(currentRegion.y),
            trunc(currentRegion.width), trunc(currentRegion.height), true)
    else begin
      cropRect.Left := trunc(currentRegion.x);
      cropRect.Top  := trunc(currentRegion.y);
      cropRect.Bottom := trunc(currentRegion.y + currentRegion.height);
      cropRect.Right :=  trunc(currentRegion.x + currentRegion.width);
    end;


    debugit(Format('crop Details: x:%d , y:%d, w:%d, h:%d ',
                [cropRect.left, cropRect.top,
                cropRect.right - cropRect.left,
                cropRect.bottom - cropRect.top]));
    TmpBmp := TBitmap.Create;
      with TmpBmp do
      try
        Width   := cropRect.right - cropRect.left;
        Height  := cropRect.bottom - cropRect.top;
        //copy image from source to destination
        BitBlt(Canvas.Handle,
            0, 0, width, height,
            Image.Canvas.Handle,
            cropRect.Left, cropRect.Top ,SRCCOPY);

//        JpegImage := TJpegImage.Create;
        currentQuality := currentRegion.quality;
        debugit('finding optimum compression ratio starting with quality '+intToStr(currentQuality));
        repeat
          if currentQuality <= 2 then
          begin
            showMessage('current image cannot be saved for such a low quailty of '
                + IntToStr(currentQuality-1));
          end;
          with TJPEGImage.Create do
          try
            Assign(TmpBmp);
            CompressionQuality := currentQuality;
            currentQuality := currentQuality - 1;
            deleteFile(BaseDir+currentRegion.filename);
            SaveToFile(BaseDir+currentRegion.filename);
          finally
            Free;
          end;
        until (getFileSize(BaseDir+currentRegion.filename) <= currentRegion.maxFileSize) OR (currentQuality <=1);
        debugit('Saved with quality ratio '+IntToStr(currentQuality));
      finally
        Free;
      end;
  end;
  //if Assigned(JpegImage) then
  //  JpegImage.free;
  doneScanning:=true;
  try
      Twain.UnloadSourceManager(true);
      Twain.UnloadLibrary;
  Except
      debugIt('problem closing scanner driver...');
  end;
end;
//calculates the size of the file with the specified name
function TScanX.getFileSize(filename: String):integer;
var
  f: File of byte;
begin
  AssignFile(f, filename);
  reset(f);
  result:=FileSize(f);
  CloseFile(f);
end;

procedure TScanX.noOp;
begin
   showMessage('waiting');
end;

function TScanX.getSelectedTwainSource: OleVariant;
begin
    result := getPreferredSource(true);
end;

function TScanX.Get_ScanBitDepth: Shortint;
begin
  result:= scanbitdepth;
end;

function TScanX.Get_xResolution: Integer;
begin
  if (xResolution >= 50) and (xResolution <= 600) then
    result:= xResolution
  else
    result:= 50;
end;

function TScanX.Get_yResolution: Integer;
begin
  if (yResolution >= 50) and (yResolution <= 600) then
    result:= yResolution
  else
    result:= 50;
end;

procedure TScanX.Set_ScanBitDepth(Value: Shortint);
begin
  scanbitdepth:= value;
end;

procedure TScanX.Set_xResolution(Value: Integer);
begin
  xResolution:= value;
end;

procedure TScanX.Set_yResolution(Value: Integer);
begin
  yResolution := value;
end;

{ TScanRegion }
// All field constructor
constructor TScanRegion.create(_id, _format: string; _x, _y, _width, _height: extended;
  _filename: string; _bitdepth: byte; _quality,_maxFileSize: integer);
begin
  self.id           :=  _id;
  self.x            :=  _x;
  self.y            :=  _y;
  self.width        :=  _width;
  self.height       :=  _height;
  self.filename     :=  _filename;
  self.bitdepth     :=  _bitdepth;
  self.quality      :=  _quality;
  self.maxFileSize  :=  _maxFileSize;

end;

//configures the control programmatically
procedure TScanX.config(_xres, _yres: Integer; _bitdeptEnum: Shortint;
  _cropable, _resizable: WordBool; const _baseDir, _regKey: WideString;
  _interactive, _debugMode: WordBool);
begin
  xResolution := _xres;
  yResolution := _yres;
  scanbitdepth := _bitdeptEnum;
  cropable  := _cropable;
  resizable := _resizable;
  BaseDir := _baseDir;
  RegKeyID := _regKey;
  interactive := _interactive;
  if _debugMode then begin
    debug := 1;
    isDebugMode := true;
  end else begin
    debug := 0;
    isDebugMode := false;
  end;
end;

// returns the name of the current selected twain source
// uses the registry or the selection dialog to prompt for selection
// if the default source is not yet defined
function TScanX.getTwainDeviceName(sourceIndex: Shortint): WideString;
var
  currentSource: integer;
begin
//Loads the library and the source manager
  if Twain.LoadLibrary() then
    with Twain do
    begin
      LoadSourceManager();
      currentSource := getPreferredSource(true);
      //If no item was selected, show message
      if currentSource = -1 then
        ShowMessage('No item was chosen')
      else
        result := Source[currentSource].ProductName;
    end
  else ShowMessage('Twain is not installed');
end;

// adds a region definition to the list of scan-crop regions
//dublicate regions are allowed, i.e. no checking for duplicate
// is done
procedure TScanX.addRegionDefinition(const id: WideString; x, y, width, height,
  maxQuality, maxFileSize: Integer; const filename: WideString;
  bitDepth: Shortint; const format: WideString);
begin
   SetLength(ScanRegionArray, Length(ScanRegionArray) +1);
   ScanRegionArray [Length(ScanRegionArray)-1] :=
      TScanRegion.create(id, format, x, y, width, height, filename, bitDepth, maxQuality, maxFileSize);
end;

//clears the array of defined regions
procedure TScanX.clearRegionDefintion;
begin
    debugIt('clearing region defitions...');
    SetLength(ScanRegionArray, 0);
    debugIt('region defitions cleared...');
end;
procedure TScanX.debugIt(msg: String);
begin
  if isDebugMode then
  begin
    //ShowMessage(msg);
    Memo1.Lines.Add(msg);
  end;
end;
//performs the scan based on the configuration done by
// setting of properties; either individually or as a batch using config()
// and performs the cropping required by the region definition
// configured using the addRegionDefintion()
procedure TScanX.scan;
var
  SelectedSource: Integer;
  regionCount : Integer;
  regionDetails: TStrings;

begin
  debugIt('starting batch scan..');
  if Twain.LoadLibrary then
  begin
    {Load source manager}
    Twain.SourceManagerLoaded := TRUE;
    {Allow user to select source}
    SelectedSource := getPreferredSource(TRUE);//Twain.SelectSource;
    //showMessage(InttoStr(SelectedSource));
    if SelectedSource <> -1 then
    begin
      {Load source, select transference method and enable (display interface)}
      //f interactive=1 then
      Twain.Source[SelectedSource].Loaded := TRUE;
      if scanbitdepth = 0 then
        Twain.Source[SelectedSource].SetIPixelType(tbdBw)
      else if scanbitdepth = 1 then
        Twain.Source[SelectedSource].SetIPixelType(tbdGray)
      else
        Twain.Source[SelectedSource].SetIPixelType(tbdRgb);

      Twain.Source[SelectedSource].SetIXResolution(Get_xResolution);
      Twain.Source[SelectedSource].SetIYResolution(Get_yResolution);
      Twain.Source[SelectedSource].TransferMode := ttmMemory;
      Twain.Source[SelectedSource].EnableSource(interactive, TRUE);
    end {if SelectedSource <> -1}
  end
  else
    showmessage('Problem communicating with Scanner Driver, a TWAIN scanner is not installed.');
  debugIt('Scanning complete..');
end;
procedure MakeDir(Dir: String);
  function Last(What: String; Where: String): Integer;
  var
    Ind : Integer;

  begin
    Result := 0;

    for Ind := (Length(Where)-Length(What)+1) downto 1 do
        if Copy(Where, Ind, Length(What)) = What then begin
           Result := Ind;
           Break;
        end;
  end;

var
  PrevDir : String;
  Ind     : Integer;

begin
  Dir := StringReplace(Dir, '/', '\', [rfReplaceAll, rfIgnoreCase]);
  if Copy(Dir,2,1) <> ':' then
     if Copy(Dir,3,1) <> '\' then
        if Copy(Dir,1,1) = '\' then
           Dir := 'C:'+Dir
        else
           Dir := 'C:\'+Dir
     else
        Dir := 'C:'+Dir;

  if not DirectoryExists(Dir) then begin
     // if directory don't exist, get name of the previous directory

     Ind     := Last('\', Dir);         //  Position of the last '\'
     PrevDir := Copy(Dir, 1, Ind-1);    //  Previous directory

     // if previous directoy don't exist,
     // it's passed to this procedure - this is recursively...
     if not DirectoryExists(PrevDir) then
        MakeDir(PrevDir);

     // In thats point, the previous directory must be exist.
     // So, the actual directory (in "Dir" variable) will be created.
     CreateDir(Dir);
  end;
end;
procedure TScanX.TwainAcquireCancel(Sender: TObject; const Index: Integer);
begin
  if not doneScanning then begin
    showMessage('scanning was cancelled..');
  end;
  doneScanning := true;
  Twain.UnloadSourceManager(true);
  Twain.UnloadLibrary;
end;

procedure TScanX.TwainAcquireError(Sender: TObject; const Index: Integer;
  ErrorCode, Additional: Integer);
begin
  if not doneScanning then begin
    showMessage('Error scanning job..');
  end;
  doneScanning := true;
  Twain.UnloadSourceManager(true);
  Twain.UnloadLibrary;
end;

initialization
  TActiveFormFactory.Create(
    ComServer,
    TActiveFormControl,
    TScanX,
    Class_ScanX,
    1,
    '',
    OLEMISC_SIMPLEFRAME or OLEMISC_ACTSLIKELABEL,
    tmApartment);
end.

