unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, RzListVw,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Data.Win.ADODB, Db, Data.DBXJSON, RzStatus, Vcl.ExtCtrls, RzPanel,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh,
  DataDriverEh, MemTableEh, GridsEh, DBAxisGridsEh, DBGridEh, IdAntiFreezeBase,
  Vcl.IdAntiFreeze, Vcl.Samples.Spin;

type
  TryType = (ttAll, ttPay, ttFree);

  TfrmMain = class(TForm)
    IdHTTP: TIdHTTP;
    dsData: TDataSource;
    DBGridEh1: TDBGridEh;
    pgc1: TPageControl;
    tsFree: TTabSheet;
    tsCharge: TTabSheet;
    mtData: TMemTableEh;
    RzStatusBar1: TRzStatusBar;
    pnlStatus: TRzStatusPane;
    dlgOpen: TOpenDialog;
    dlgSave: TSaveDialog;
    DBGridEh2: TDBGridEh;
    mtPay: TMemTableEh;
    dsPay: TDataSource;
    IdAntiFreeze1: TIdAntiFreeze;
    mtDatatitle: TStringField;
    mtDatastatus: TIntegerField;
    mtDatastatusStr: TStringField;
    mtDataitemDetailUrl: TStringField;
    mtDatarequestNum: TIntegerField;
    mtDataitemId: TStringField;
    mtDatacurrentPrice: TFloatField;
    mtDatacapacity: TStringField;
    mtDatatotalNum: TIntegerField;
    mtDataotherGood: TStringField;
    mtDatapicUrl: TStringField;
    mtDatarequestRate: TFloatField;
    mtDataRequest_Price_Rate: TFloatField;
    mtPaytitle: TStringField;
    mtPaystatus: TIntegerField;
    mtPaystatusStr: TStringField;
    mtPayitemDetailUrl: TStringField;
    mtPayitemId: TStringField;
    mtPaycurrentPrice: TFloatField;
    mtPaycapacity: TStringField;
    mtPaytotalNum: TIntegerField;
    mtPayotherGood: TStringField;
    mtPaypicUrl: TStringField;
    mtPaydiscountPrice: TFloatField;
    mtPayquantity: TFloatField;
    pnlTop: TRzPanel;
    btnFree: TButton;
    rbAll: TRadioButton;
    chkBreak: TCheckBox;
    rbPage: TRadioButton;
    edtPage: TEdit;
    btnSaveDataset: TButton;
    btnLoadDataset: TButton;
    btnStop: TButton;
    pnlFree: TPanel;
    btnFreeFilter: TButton;
    btnFreeClearFilter: TButton;
    lbl1: TLabel;
    cbbStatus: TComboBox;
    lbl2: TLabel;
    seFreePriceStart: TSpinEdit;
    seFreePriceEnd: TSpinEdit;
    lbl3: TLabel;
    Label2: TLabel;
    lbl4: TLabel;
    edtFreeName: TEdit;
    edtrequestRate: TEdit;
    cbbRequestType: TComboBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    btnPayFilter: TButton;
    Button2: TButton;
    cbbPayStatus: TComboBox;
    sePriceStart: TSpinEdit;
    sePriceEnd: TSpinEdit;
    edtPayTitle: TEdit;
    procedure btnFreeClick(Sender: TObject);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveDatasetClick(Sender: TObject);
    procedure btnLoadDatasetClick(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure btnStopClick(Sender: TObject);
    procedure btnFreeFilterClick(Sender: TObject);
    procedure btnFreeClearFilterClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnPayFilterClick(Sender: TObject);
  private
    { Private declarations }
    canBreak: Boolean;

    function ReadTryPage(tab, page: Integer; var TotalPage: Integer): TJSONArray;
    procedure ReadData(DataSet: TMemTableEh; AType: TryType);
    procedure LoadDataSet(DataSet: TMemTableEh; Atype: TryType);
    procedure SaveDataSet(DataSet: TMemTableEh; Atype: TryType);
    procedure SetDialog(Atype: TryType);
  public
    { Public declarations }
  published
  end;

var
  frmMain: TfrmMain;

implementation

uses
  HtmlUtils, Winapi.ShellAPI, uShowPic, FileUtils;

const
  tryUrlPage = 'http://try.taobao.com/item/newItemList.htm?tab=%d&page=%d';
  //perlFormat = '"title": "(.*?)".*?"status":(.[^,]*).*?"itemDetailUrl":"(.*?)".*?"requestNum":(.*?),.*?"itemId":(.*?),.*?"currentPrice":(.*?),.*?"capacity":"(.*?)".*?"totalNum":(.*?),.*?"otherGood":"(.*?)".*?"picUrl":"(.*?)"';

{$R *.dfm}

function TfrmMain.ReadTryPage(tab, page: Integer; var TotalPage: Integer): TJSONArray;
var
  s: string;
  JO: TJSONObject;
  jp: TJSONPair;
  data: TJSONArray;
begin
  s := IdHTTP.Get(Format(tryUrlPage, [tab, page]));
  //MsgSaveToTxt(s, ExtractFilePath(Application.ExeName) + Format('tab%d_page%d_%s.json', [tab, page, FormatDatetime('yyyymmddhhnnss', Now)]));

  JO := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(s), 0) as TJSONObject;

  jp := JO.Get('below');
  if jp <> nil then
  begin
    if jp.JsonValue is TJSONObject then
      JO := jp.JsonValue as TJSONObject;
    if jp <> nil then
    begin
      //总页数
      try
        jp := JO.Get('totalPage');
        if (jp <> nil) and (jp.JsonValue is TJSONNumber) then
          TotalPage := TJSONNumber(jp.JsonValue).AsInt;
      except
        //ShowMessage(s);
        TotalPage := 999;
      end;

      try
        jp := jo.Get('data');
        data := jp.JsonValue as TJSONArray;
        Result := data;
      except
        Result := nil;
      end;
    end
    else
      Result := nil;
  end
  else
    Result := nil;
end;

procedure TfrmMain.SaveDataSet(DataSet: TMemTableEh; Atype: TryType);
begin
  SetDialog(Atype);

  if dlgSave.Execute then
  begin
    DataSet.SaveToFile(dlgSave.FileName);
  end;
end;

procedure TfrmMain.SetDialog(Atype: TryType);
begin
  case Atype of
    ttPay:
    begin
      dlgOpen.Filter := '*.pay.dat|*.pay.dat|*.*|*';
      dlgOpen.DefaultExt := '.pay.dat';
    end;
    ttFree:
    begin
      dlgOpen.Filter := '*.free.dat|*.free.dat|*.*|*';
      dlgOpen.DefaultExt := '.free.dat';
    end;
  end;
  dlgSave.Filter := dlgOpen.Filter;
  dlgSave.DefaultExt := dlgOpen.DefaultExt;
end;

procedure TfrmMain.btnFreeClearFilterClick(Sender: TObject);
begin
  mtData.Filtered := False;
end;

procedure TfrmMain.btnFreeClick(Sender: TObject);
begin
  case Self.pgc1.ActivePageIndex of
    0: ReadData(mtData, ttFree);
    1: ReadData(mtPay, ttPay);
  end;
end;

procedure TfrmMain.ReadData(DataSet: TMemTableEh; AType: TryType);
var
  i, currentPage, TotalPage: Integer;
  jaData: TJSONArray;
  jo: TJSONObject;
begin
  DataSet.Close;
  DataSet.CreateDataSet;
  currentPage := 1;
  canBreak := False;
  TotalPage := 0;
  pnlTop.Enabled := False;
  btnStop.Enabled := True;
  try
    repeat
      if TotalPage > 0 then
        pnlStatus.Caption := Format('正在加载 %d / %d 页', [currentPage, TotalPage])
      else
        pnlStatus.Caption := Format('正在加载 %d 页', [currentPage]);
      Application.ProcessMessages;

      jaData := ReadTryPage(Ord(AType), currentPage, TotalPage);
      if jaData <> nil then
      begin
        for i := 0 to jaData.Size - 1 do
        begin
          jo := jaData.Get(i) as TJSONObject;
          with DataSet do
          begin
            Append;
            FieldByName('title').Value := HtmlCode2String(jo.Get('title').JsonValue.Value);
            FieldByName('status').Value := (jo.Get('status').JsonValue as TJSONNumber).AsInt;
            case AType of
              ttPay:
              begin
                case FieldByName('status').AsInteger of
                  1: FieldByName('statusStr').AsString := '付邮领取';
                  3: FieldByName('statusStr').AsString := '开试提醒';
                  2: FieldByName('statusStr').AsString := '已结束';
                end;
              end;
              ttFree:
              begin
                case FieldByName('status').AsInteger of
                  1: FieldByName('statusStr').AsString := '进行中';
                else FieldByName('statusStr').AsString := '已结束';
                end;
              end;
            end;

            canBreak := canBreak or (rbAll.Checked and chkBreak.Checked and (FieldByName('statusStr').AsString = '已结束'));
            FieldByName('itemDetailUrl').Value := jo.Get('itemDetailUrl').JsonValue.Value;
            FieldByName('itemId').Value := jo.Get('itemId').JsonValue.Value;
            FieldByName('currentPrice').Value := (jo.Get('currentPrice').JsonValue as TJSONNumber).AsDouble;
            FieldByName('capacity').Value := HtmlCode2String(jo.Get('capacity').JsonValue.Value);
            FieldByName('totalNum').Value := (jo.Get('totalNum').JsonValue as TJSONNumber).AsInt;
            FieldByName('otherGood').Value := jo.Get('otherGood').JsonValue.Value;
            FieldByName('picUrl').Value := jo.Get('picUrl').JsonValue.Value;

            if (FindField('requestNum') <> nil) then
            begin
              FieldByName('requestNum').Value := (jo.Get('requestNum').JsonValue as TJSONNumber).AsInt;
              if (FieldByName('totalNum').AsFloat > 0) and (FieldByName('requestNum').AsFloat <> 0) then
              begin
                FieldByName('requestRate').AsFloat := FieldByName('totalNum').AsFloat / FieldByName('requestNum').AsFloat * 100;
                FieldByName('Request_Price_Rate').AsFloat := FieldByName('currentPrice').AsFloat * FieldByName('requestRate').AsFloat;
              end;
            end;

            if FindField('discountPrice') <> nil then
              FieldByName('discountPrice').Value := (jo.Get('discountPrice').JsonValue as TJSONNumber).AsDouble;
            if FindField('quantity') <> nil then
              FieldByName('quantity').Value := (jo.Get('quantity').JsonValue as TJSONNumber).AsDouble;

            Post;
          end;
        end;
      end;
      Inc(currentPage);
      if canBreak then
        Break;
    until (currentPage >= TotalPage) or (rbPage.Checked and (currentPage > StrToInt(edtPage.Text)));

    pnlStatus.Caption := Format('试用数据读取完毕。共读取%d页。（双击打开链接）', [currentPage -  1]);
  finally
    pnlTop.Enabled := True;
    btnStop.Enabled := False;
  end;
end;

procedure TfrmMain.btnFreeFilterClick(Sender: TObject);
var
  sFilter: string;
  requestRate: Double;
begin
  sFilter := '1=1';
  if cbbStatus.Text <> '' then
    sFilter := sFilter + ' and statusStr = ''' + cbbStatus.Text + '''';
  if edtFreeName.Text <> '' then
    sFilter := sFilter + ' and title like ''%' + edtFreeName.Text + '%''';
  if seFreePriceEnd.Value > 0 then
    sFilter := sFilter + Format(' and currentPrice >= %d and currentPrice <= %d', [seFreePriceStart.Value, seFreePriceEnd.Value]);

  if not TryStrToFloat(edtrequestRate.Text, requestRate) then
    Application.MessageBox('申请比例请输入数值。', '错误', MB_OK + MB_ICONSTOP);

  if requestRate > 0 then
  begin
    case cbbRequestType.ItemIndex  of
      0: sFilter := sFilter + Format(' and requestRate >= %f', [requestRate]);
      1: sFilter := sFilter + Format(' and requestRate <= %f', [requestRate]);
    end;
  end;

  if sFilter <> '1=1' then
  begin
    mtData.Filter := sFilter;
    mtData.Filtered := True;
  end;
end;

procedure TfrmMain.btnLoadDatasetClick(Sender: TObject);
begin
  case Self.pgc1.ActivePageIndex of
    0: LoadDataSet(mtData, ttFree);
    1: LoadDataSet(mtPay, ttPay);
  end;
end;

procedure TfrmMain.btnSaveDatasetClick(Sender: TObject);
begin
  case Self.pgc1.ActivePageIndex of
    0: SaveDataSet(mtData, ttFree);
    1: SaveDataSet(mtPay, ttPay);
  end;
end;

procedure TfrmMain.btnStopClick(Sender: TObject);
begin
  canBreak := True;
end;

procedure TfrmMain.btnPayFilterClick(Sender: TObject);
var
  sFilter: string;
begin
  sFilter := '1=1';
  if cbbPayStatus.Text <> '' then
    sFilter := sFilter + ' and statusStr = ''' + cbbPayStatus.Text + '''';
  if edtPayTitle.Text <> '' then
    sFilter := sFilter + ' and title like ''%' + edtPayTitle.Text + '%''';
  if sePriceEnd.Value > 0 then
    sFilter := sFilter + Format(' and currentPrice >= %d and currentPrice <= %d', [sePriceStart.Value, sePriceEnd.Value]);

  if sFilter <> '1=1' then
  begin
    mtPay.Filter := sFilter;
    mtPay.Filtered := True;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  mtPay.Filtered := False;
end;

procedure TfrmMain.DBGridEh1CellClick(Column: TColumnEh);
begin
  frmPic.OpenUrl(Column.Grid.DataSource.DataSet.FieldByName('picUrl').AsString);
  Self.SetFocus;
end;

procedure TfrmMain.DBGridEh1DblClick(Sender: TObject);
var
  s: string;
begin
  if not TDBGridEh(Sender).DataSource.DataSet.IsEmpty then
  begin
    s := TDBGridEh(Sender).DataSource.DataSet.FieldByName('itemDetailUrl').AsString;
    if not s.Trim.IsEmpty then
      ShellExecute(0, 'open', PWideChar(s), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmMain.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  with ((Sender As TDBGridEh).DataSource.Dataset) as TMemTableEh do
  begin
    case Column.Title.SortMarker of
      smNoneEh, smDownEh:
      begin
       SortOrder := Column.FieldName + ' ASC';
       Column.Title.SortMarker := smUpEh;
      end;
      else
      begin
       SortOrder := Column.FieldName + ' DESC';
       Column.Title.SortMarker := smDownEh;
      end;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  if pgc1.PageCount > 0 then
    pgc1.TabIndex := 0;
end;

procedure TfrmMain.LoadDataSet(DataSet: TMemTableEh; Atype: TryType);
begin
  SetDialog(Atype);

  if dlgOpen.Execute then
  begin
    DataSet.DestroyTable;
    try
      DataSet.LoadFromFile(dlgOpen.FileName);
      DataSet.Open;
    except
      Application.MessageBox('无法导入该文件，请检查所选文件的格式是否正确。', '错误', MB_OK +
        MB_ICONSTOP);
      DataSet.Close;
    end;
  end;
end;

end.
