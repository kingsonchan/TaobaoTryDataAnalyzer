unit uShowPic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TfrmPic = class(TForm)
    wbPic: TWebBrowser;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FUrl: string;
  public
    { Public declarations }
    procedure OpenUrl(url: string);
  end;

var
  frmPic: TfrmPic;

implementation

uses
  uMain;

{$R *.dfm}

procedure TfrmPic.FormResize(Sender: TObject);
begin
  //Caption := Format('%d, %d', [width, height]);
end;

procedure TfrmPic.FormShow(Sender: TObject);
begin
  if frmMain.Left + frmMain.Width + Self.Width > Screen.Width then // ������Ļ�ұ�
  begin
    if frmMain.Left - Self.Width < 0 then // ������Ļ���
      Self.Left := frmMain.Left + frmMain.Width - Self.Width //�����������ұ�
    else
      Self.Left := frmMain.Left - Self.Width;  //����
  end
  else
    Self.Left := frmMain.Left + frmMain.Width; //����

  Self.Top := frmMain.Top;
end;

procedure TfrmPic.OpenUrl(url: string);
begin
  if FUrl <> url then
  begin
    FUrl := url;
    wbPic.Navigate(FUrl);
  end;
  Self.Show;
end;

end.
