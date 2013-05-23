unit fTextButton;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrameTextButton = class(TFrame)
    btnCopy: TButton;
    edtText: TEdit;
    edtTitle: TEdit;
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function CreateFrame(AOwner: TComponent; ATitle: string = ''; AText: string = ''; ACaption: string = ''): TFrameTextButton;

implementation

uses
  Vcl.Clipbrd;

{$R *.dfm}

function CreateFrame(AOwner: TComponent; ATitle: string = ''; AText: string = ''; ACaption: string = ''): TFrameTextButton;
var
  s: string;
begin
  Randomize;
  Result := TFrameTextButton.Create(AOwner);
  with Result do
  begin
    Parent := TWinControl(AOwner);
    repeat
      s := 'FrameTextButton' + IntToStr(Random(9999999));
    until (TWinControl(AOwner).FindChildControl(s) = nil);
    Name := s;
    Visible := True;
    Top := MaxInt;

    if ATitle <> '' then
      edtTitle.Text := ATitle;

    if AText <> '' then
      edtText.Text := AText;

    if ACaption <> '' then
      btnCopy.Caption := ACaption;
  end;
end;

procedure TFrameTextButton.btnCopyClick(Sender: TObject);
begin
  Clipboard.AsText := edtText.Text;
  TForm(Self.Parent).Close;
end;

end.
