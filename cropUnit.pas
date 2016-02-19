unit cropUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TcropForm = class(TForm)
    cropPanel: TPanel;
    mainImage: TImage;
    btnOk: TSpeedButton;
    btnReset: TSpeedButton;
    Panel1: TPanel;
    lblX: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblXVal: TLabel;
    lblYVal: TLabel;
    lblWVal: TLabel;
    lblHVal: TLabel;
    procedure mainImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mainImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mainImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnResetClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function getCropPoint(owner: TComponent; filename: string; startx, starty, width,
  height: integer; allowResize: boolean): TRect;

var
  cropForm: TcropForm;
  imageDragging: boolean;
  prevx, prevy: integer;
  originalx, originaly: integer;
  resultRect  : TRect;
implementation

{$R *.dfm}

{ TcropForm }

function getCropPoint(owner: TComponent; filename: string; startx, starty, width,
  height: integer; allowResize: boolean): TRect;
begin
  cropForm := TcropForm.Create(owner);
  cropForm.mainImage.Picture.LoadFromFile(filename);
  cropForm.mainImage.Top:= -1*starty;
  originaly:=cropForm.mainImage.Top;

  cropForm.mainImage.Left:= -1*startx;
  originalx:=cropForm.mainImage.Left;

  cropForm.Width:= width+20;
  cropForm.cropPanel.Width := width;
  cropForm.Height:= height + 100;
  cropForm.cropPanel.Height := height;
  cropForm.cropPanel.DoubleBuffered := true;
  if allowResize then
    cropForm.BorderStyle := bsSizeable
  else
    cropForm.BorderStyle := bsSingle;
  cropForm.ShowModal;
  result := resultRect;
end;

procedure TcropForm.mainImageMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imageDragging := true;
  prevx := x;
  prevy := y;
end;

procedure TcropForm.mainImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  imageDragging :=false;
end;

procedure TcropForm.mainImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  newLeft, newTop: integer;
begin
  if imageDragging and ((ABS(x-prevx) > 3) or ( ABS(y-prevy) > 3))then
  begin
    newLeft   := mainImage.Left + ( x - prevx);
    newTop    := mainImage.Top  + ( y - prevy);

    //LIMIT image movement
    if (newLeft > 0) then
      newLeft:=0
    else if ((-1 * newLeft) + cropPanel.Width) > mainImage.Width Then
      newLeft := -1*(mainImage.Width - cropPanel.width);

    if (newTop > 0) then
      newTop:=0
    else if ((-1 * newTop) + cropPanel.Height) > mainImage.Height Then
      newTop := -1*(mainImage.Height - cropPanel.height);

    prevx:=x;
    prevy:=y;

    lblWVal.Caption := intToStr(cropPanel.width);
    lblHVal.Caption := intToStr(cropPanel.Height);
    lblXVal.Caption := intToStr( -1 * newLeft );
    lblYVal.Caption := intToStr( -1 * newTop );

    mainImage.SetBounds(newLeft, newTop, mainImage.Width, mainImage.Height);
    mainImage.Invalidate;
    cropForm.Invalidate;
  end;
end;
//resets the image to its default location
procedure TcropForm.btnResetClick(Sender: TObject);
begin
  mainImage.Left := originalx;
  mainImage.Top   := originaly;
end;

procedure TcropForm.btnOkClick(Sender: TObject);
begin
  resultRect.Left := -1 * mainImage.Left;
  resultRect.Top  := -1 * mainImage.Top;

  resultRect.Bottom := resultRect.Top + cropPanel.Height;
  resultRect.Right  := resultRect.Left + cropPanel.Width;
  Close;
end;

end.
