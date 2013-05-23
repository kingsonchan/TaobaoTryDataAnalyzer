unit uAnswer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fTextButton, Vcl.StdCtrls;

type
  TfrmAnswer = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AddFrame(ATitle, AText: string);
  end;

var
  frmAnswer: TfrmAnswer;

implementation

{$R *.dfm}


procedure TfrmAnswer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  with Params do
  begin
    WndParent := GetdesktopWindow();
  end;
end;

procedure TfrmAnswer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAnswer.FormCreate(Sender: TObject);
begin
  //Self.ClientHeight := 0;
  SetWindowLong(Self.Handle,GWL_EXSTYLE,(GetWindowLong(Self.Handle,GWL_EXSTYLE) or WS_EX_APPWINDOW));    //在任务栏上显示
end;

procedure TfrmAnswer.FormShow(Sender: TObject);
begin
  Self.Top := Screen.WorkAreaHeight - Self.Height;
  Self.Left := (Screen.WorkAreaWidth - Self.Width) div 2;
end;

procedure TfrmAnswer.AddFrame(ATitle, AText: string);
var
  frame: TFrameTextButton;
begin
  frame := CreateFrame(Self, ATitle, AText);
  Self.ClientHeight := frame.Top + frame.Height;
end;

end.
