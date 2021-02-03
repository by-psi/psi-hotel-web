unit md_produtos;

interface

uses
  Classes, SysUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, IWCompEdit,
  IWAppForm, IWApplication, IWColor, IWTypes, Vcl.Controls,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompGrids, IWDBGrids,
  IWCompListbox, IWHTMLControls, IWCompLabel, Vcl.Imaging.jpeg, IWCompExtCtrls,
  IWCompFileUploader, Vcl.Graphics, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF, frxGradient;

type
  TF_produtos = class(TIWAppForm)
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    ed_produto: TIWEdit;
    ed_valor: TIWEdit;
    ed_id: TIWEdit;
    ed_unidade: TIWEdit;
    ed_buscar: TIWEdit;
    bt_buscar: TIWButton;
    ed_estoque: TIWEdit;
    ed_fornecedor: TIWComboBox;
    template_produtos: TIWTemplateProcessorHTML;
    img_uploader: TIWFileUploader;
    img_refresh: TIWButton;
    img_produto: TIWImage;
    frx_produtos: TfrxReport;
    frx_PDF: TfrxPDFExport;
    frx_dbdataset: TfrxDBDataset;
    bt_imprimir: TIWButton;
    frxGradientObject1: TfrxGradientObject;
    link_home: TIWLink;
    m_painel: TIWLink;
    m_aptos: TIWLink;
    m_feriados: TIWLink;
    m_tabeladeprecos: TIWLink;
    m_vendas: TIWLink;
    m_estoque: TIWLink;
    m_produtos: TIWLink;
    m_fornecedores: TIWLink;
    m_compras: TIWLink;
    m_financeiro: TIWLink;
    m_planodecontas: TIWLink;
    m_contasapagarreceber: TIWLink;
    m_lancamentos: TIWLink;
    m_relatorios: TIWLink;
    m_relatoriodeestoque: TIWLink;
    m_relatoriodevendas: TIWLink;
    m_relatoriofinanceiro: TIWLink;
    m_lavanderia: TIWLink;
    m_usuarios: TIWLink;
    m_suportetecnico: TIWLink;
    m_configuracoes: TIWLink;
    m_sair: TIWLink;
    link_usuario: TIWLink;
    link_sair: TIWLink;
    Label_1: TIWLabel;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_produtosUnknownTag(const AName: string;  var VValue: string);

    procedure m_painelClick(Sender: TObject);
    procedure m_apartamentosClick(Sender: TObject);
    procedure m_feriadosClick(Sender: TObject);
    procedure m_tabeladeprecosClick(Sender: TObject);
    procedure m_vendasClick(Sender: TObject);
    procedure m_estoqueClick(Sender: TObject);
    procedure m_produtosClick(Sender: TObject);
    procedure m_fornecedoresClick(Sender: TObject);
    procedure m_comprasClick(Sender: TObject);
    procedure m_financeiroClick(Sender: TObject);
    procedure m_planodecontasClick(Sender: TObject);
    procedure m_contasapagarreceberClick(Sender: TObject);
    procedure m_lancamentosClick(Sender: TObject);
    procedure m_relatoriosClick(Sender: TObject);
    procedure m_relatoriodeestoqueClick(Sender: TObject);
    procedure m_relatoriodevendasClick(Sender: TObject);
    procedure m_relatoriofinanceiroClick(Sender: TObject);
    procedure m_lavanderiaClick(Sender: TObject);
    procedure m_usuariosClick(Sender: TObject);
    procedure m_suportetecnicoClick(Sender: TObject);
    procedure m_configuracoesClick(Sender: TObject);

    procedure link_homeClick(Sender: TObject);
    procedure link_usuarioClick(Sender: TObject);
    procedure link_sairClick(Sender: TObject);

    procedure ClearFields();
    procedure SyncFields();
    procedure UpdateAll();
    procedure Search();
    procedure LoadCombobox();

    procedure ed_fornecedorAsyncEnter(Sender: TObject; EventParams: TStringList);
    procedure ed_estoqueAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure ed_valorAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure img_uploaderAsyncUploadCompleted(Sender: TObject; var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
    procedure img_refreshAsyncClick(Sender: TObject; EventParams: TStringList);

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_imprimirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);

  public

  var
    arquivo: string;
  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_feriados, md_tabeladeprecos, md_vendas, md_fornecedores, md_lancamentos,
  md_usuarios;

procedure TF_produtos.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_produtos.template_produtosUnknownTag(const AName: string;
  var VValue: string);
begin
  LoadCombobox;
  if AName = 'GRID_PRODUTOS' then
  begin
    with UserSession do
    begin
      T_produtos.First;
      while not T_produtos.Eof do
      begin
        VValue := VValue + '<tr>'+
        '<td><img src="produtos/'+T_produtos.FieldByName('IMAGEM').AsString+'" width="32"></td>'+sLineBreak+
        '<td>'+T_produtos.FieldByName('PRODUTO').AsString+'</td>'+sLineBreak+
        '<td>'+T_produtos.FieldByName('FORNECEDOR').AsString+'</td>'+sLineBreak+
        '<td>'+T_produtos.FieldByName('ESTQ_ATUAL').AsString+'</td>'+sLineBreak+
        '<td>'+T_produtos.FieldByName('UNIDADE').AsString+'</td>'+sLineBreak+
        '<td>'+FloatToStrF(T_produtos.FieldByName('VALOR').Value,ffCurrency,10,2)+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_produtos.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_produtos.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_produtos.Next;
      end;
    end;
  end;
end;

procedure TF_produtos.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_produtos.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_produtos.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_produtos.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_produtos.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_produtos.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_produtos.m_produtosClick(Sender: TObject);
begin
{  TF_produtos.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_produtos.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_produtos.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_produtos.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_produtos.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_produtos.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_produtos.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_produtos.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_produtos.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_produtos.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_produtos.ClearFields;
begin
  ed_produto.Text := '';
  ed_fornecedor.Text  := '';
  ed_estoque.Text := '';
  ed_unidade.Text := '';
  ed_valor.Text := '';
//arquivo := UserSession.T_produtos.FieldByName('ID').asString; Insert_L(arquivo,6,'0'); arquivo := arquivo+'.jpg';
  arquivo := 'sem-foto.jpg';
end;

procedure TF_produtos.SyncFields;
begin
  with UserSession do
  begin
    T_produtos.FieldByName('PRODUTO').Value  := ed_produto.Text;
    T_produtos.FieldByName('ID_FORNECEDOR').Value := Integer(ed_fornecedor.Items.Objects[ed_fornecedor.ItemIndex]);
    T_produtos.FieldByName('ESTQ_ATUAL').Value  := ed_estoque.Text;
    T_produtos.FieldByName('UNIDADE').Value  := ed_unidade.Text;
    T_produtos.FieldByName('VALOR').Value    := ed_valor.Text;
    T_produtos.FieldByName('IMAGEM').Value  := arquivo;
  end;
end;

procedure TF_produtos.UpdateAll;
begin
  with UserSession do
  begin
    T_produtos.Active := False;
    T_produtos.Active := True;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add(
    'SELECT P.ID, P.PRODUTO, P.IMAGEM, P.UNIDADE, P.ESTQ_ATUAL, P.VALOR, P.ID_FORNECEDOR, F.FORNECEDOR FROM t_produtos AS P '+
    'INNER JOIN t_fornecedores AS F ON P.ID_FORNECEDOR = F.ID '+
    'ORDER BY P.PRODUTO ASC ');
    T_produtos.Open();
  end;
end;

procedure TF_produtos.Search;
begin
  with UserSession do
  begin
    T_produtos.Close;
    T_produtos.Active := True;
    T_produtos.SQL.Clear;
    T_produtos.SQL.Add(
    'SELECT P.ID, P.PRODUTO, P.IMAGEM, P.UNIDADE, P.ESTQ_ATUAL, P.VALOR, P.ID_FORNECEDOR, F.FORNECEDOR FROM t_produtos AS P '+
    'INNER JOIN t_fornecedores AS F ON P.ID_FORNECEDOR = F.ID '+
    'WHERE P.PRODUTO LIKE :CHV OR F.FORNECEDOR LIKE :CHV '+
    'ORDER BY P.PRODUTO ASC ');
    T_produtos.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_produtos.Open();
		if T_produtos.IsEmpty then WebApplication.ShowMessage('Produto não encontrado!');
  end;
end;

{ ... }

procedure TF_produtos.LoadCombobox;
begin
  with UserSession do
  begin
    T_fornecedores.Close;
    T_fornecedores.Active := True;
    ed_fornecedor.Items.Clear;
    while not T_fornecedores.Eof do
    begin
      ed_fornecedor.Items.AddObject(T_fornecedores.FieldByName('FORNECEDOR').AsString, TObject(T_fornecedores.FieldByName('ID').AsInteger));
      T_fornecedores.Next;
    end;
  end;
  ed_fornecedor.ItemIndex := 0;
end;

procedure TF_produtos.ed_fornecedorAsyncEnter(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
end;

procedure TF_produtos.ed_estoqueAsyncChange(Sender: TObject;
  EventParams: TStringList);
var
  i: integer;
begin
  if TryStrToInt(ed_estoque.Text, i) <> True then
  begin
    WebApplication.ShowMessage('Entrada inválida! Digite a QTD novamente.');
    ed_estoque.Text := '';
    ed_estoque.SetFocus;
  end;
end;

procedure TF_produtos.ed_valorAsyncChange(Sender: TObject;
  EventParams: TStringList);
var
  d: double;
begin
  if TryStrToFloat(ed_valor.Text, d) <> True then
  begin
    WebApplication.ShowMessage('Entrada inválida! Digite o VALOR novamente.');
    ed_valor.Text := '';
    ed_valor.SetFocus;
  end;
end;

procedure TF_produtos.img_uploaderAsyncUploadCompleted(Sender: TObject;
  var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
begin
  with UserSession do
  begin
    arquivo := T_produtos.FieldByName('ID').asString; Insert_L(arquivo,6,'0'); arquivo := arquivo+'.jpg';
    img_uploader.SaveToFile(FileName, 'wwwroot\produtos\'+arquivo, True);
    SaveFile := True;
//  img_uploader.SaveAll('wwwroot\produtos\', True);
//  arquivo := FileName;
  end;
end;

procedure TF_produtos.img_refreshAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  img_produto.Picture.LoadFromFile('wwwroot\produtos\'+arquivo);
end;

{ ... }

procedure TF_produtos.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  ClearFields;
  LoadCombobox;
  UserSession.T_produtos.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
  arquivo := 'sem-foto.jpg';
end;

procedure TF_produtos.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  LoadCombobox;
  with UserSession do
  begin
    T_produtos.Locate('ID', ed_id.Text, []);
    T_produtos.Edit;
    ed_id.Text := T_produtos.FieldByName('ID').Value;
    ed_produto.Text := T_produtos.FieldByName('PRODUTO').Value;
    ed_fornecedor.Items[0] := T_produtos.FieldByName('FORNECEDOR').Value;
    ed_estoque.Text := T_produtos.FieldByName('ESTQ_ATUAL').Value;
    ed_unidade.Text := T_produtos.FieldByName('UNIDADE').Value;
    ed_valor.Text := FloatToStrF(T_produtos.FieldByName('VALOR').Value,ffCurrency,10,2);
    arquivo := T_produtos.FieldByName('IMAGEM').Value;
    img_produto.Picture.LoadFromFile('wwwroot\produtos\'+arquivo);
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_produtos.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_produtos.Locate('ID', ed_id.Text, []);
    T_produtos.Delete;
  end;
  UpdateAll;
end;

procedure TF_produtos.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_produtos.bt_imprimirAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
	objExportfilter : TfrxCustomExportFilter;
begin
	objExportfilter := TfrxCustomExportFilter(frx_PDF);
	objExportfilter.ShowDialog := False;
  objExportfilter.FileName := GetCurrentDir + '\wwwroot\impressos\frx_produtos.pdf'; // standalone application
  frx_produtos.Variables['img_path'] := frx_produtos.GetApplicationFolder+'wwwroot\produtos\';
  frx_produtos.PrepareReport(True);
  frx_produtos.Export(objExportfilter);
  WebApplication.CallBackResponse.AddJavaScriptToExecute('window.open("impressos/frx_produtos.pdf");');
end;

procedure TF_produtos.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_produto.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo PRODUTO!');
    ed_produto.SetFocus;
    exit;
  end;
  if Trim(ed_estoque.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo QTD!');
    ed_estoque.SetFocus;
    exit;
  end;
  if Trim(ed_valor.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo VALOR!');
    ed_valor.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_produtos.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_produtos.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
