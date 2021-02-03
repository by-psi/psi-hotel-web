unit md_fornecedores;

interface

uses
  Classes, SysUtils, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWCompEdit,
  IWCompButton, IWCompGrids, IWDBGrids, Vcl.Controls, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Data.DB, IWCompLabel;

type
  TF_fornecedores = class(TIWAppForm)
    template_fornecedores: TIWTemplateProcessorHTML;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    ed_fornecedor: TIWEdit;
    ed_id: TIWEdit;
    ed_buscar: TIWEdit;
    bt_buscar: TIWButton;
    ed_email: TIWEdit;
    ed_telefone: TIWEdit;
    bt_imprimir: TIWButton;
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
    procedure template_fornecedoresUnknownTag(const AName: string;  var VValue: string);

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

    procedure bt_incluirAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_editarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_buscarClick(Sender: TObject);
    procedure bt_okAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure bt_cancelarClick(Sender: TObject);

  public

  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_tabeladeprecos, md_feriados, md_vendas, md_produtos, md_lancamentos,
  md_usuarios;

procedure TF_fornecedores.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_fornecedores.template_fornecedoresUnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'GRID_FORNECEDORES' then
  begin
    with UserSession do
    begin
      T_fornecedores.First;
      while not T_fornecedores.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_fornecedores.FieldByName('FORNECEDOR').AsString+'</td>'+sLineBreak+
        '<td>'+T_fornecedores.FieldByName('EMAIL').AsString+'</td>'+sLineBreak+
        '<td>'+T_fornecedores.FieldByName('TELEFONE').AsString+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_fornecedores.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_fornecedores.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_fornecedores.Next;
      end;
    end;
  end;
end;

procedure TF_fornecedores.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_feriadosClick(Sender: TObject);
begin
  TF_feriados.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_fornecedores.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_fornecedores.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_fornecedores.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_fornecedores.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_fornecedores.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_fornecedores.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_fornecedores.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_fornecedores.ClearFields;
begin
  ed_fornecedor.Text := '';
  ed_email.Text := '';
  ed_telefone.Text := '';
end;

procedure TF_fornecedores.SyncFields;
begin
  with UserSession do
  begin
    T_fornecedores.FieldByName('FORNECEDOR').Value := ed_fornecedor.Text;
    T_fornecedores.FieldByName('EMAIL').Value := ed_email.Text;
    T_fornecedores.FieldByName('TELEFONE').Value := ed_telefone.Text;
  end;
end;

procedure TF_fornecedores.UpdateAll;
begin
  with UserSession do
  begin
    T_fornecedores.Active := False;
    T_fornecedores.Active := True;
    T_fornecedores.SQL.Clear;
    T_fornecedores.SQL.Add('SELECT * FROM t_fornecedores ORDER BY FORNECEDOR ASC ');
    T_fornecedores.Open();
  end;
end;

procedure TF_fornecedores.Search;
begin
  with UserSession do
  begin
    T_fornecedores.Close;
    T_fornecedores.Active := True;
    T_fornecedores.SQL.Clear;
    T_fornecedores.SQL.Add('SELECT * FROM t_fornecedores WHERE FORNECEDOR LIKE :CHV ORDER BY FORNECEDOR ASC ');
    T_fornecedores.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_fornecedores.Open();
		if T_fornecedores.IsEmpty then WebApplication.ShowMessage('Fornecedor não encontrado!');
  end;
end;

{ ... }

procedure TF_fornecedores.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  ClearFields;
  UserSession.T_fornecedores.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_fornecedores.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  with UserSession do
  begin
    T_fornecedores.Locate('ID', ed_id.Text, []);
    T_fornecedores.Edit;
    if T_fornecedores.FieldByName('ID').IsNull <> true then ed_id.Text := T_fornecedores.FieldByName('ID').Value;
    if T_fornecedores.FieldByName('FORNECEDOR').IsNull <> true then ed_fornecedor.Text := T_fornecedores.FieldByName('FORNECEDOR').Value;
    if T_fornecedores.FieldByName('EMAIL').IsNull <> true then ed_email.Text := T_fornecedores.FieldByName('EMAIL').Value;
    if T_fornecedores.FieldByName('TELEFONE').IsNull <> true then ed_telefone.Text := T_fornecedores.FieldByName('TELEFONE').Value;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_fornecedores.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_fornecedores.Locate('ID', ed_id.Text, []);
    T_fornecedores.Delete;
  end;
  UpdateAll;
end;

procedure TF_fornecedores.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_fornecedores.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_fornecedor.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo FORNECEDOR!');
    ed_fornecedor.SetFocus;
    exit;
  end;
  if Trim(ed_email.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo E-MAIL!');
    ed_email.SetFocus;
    exit;
  end;
  if Trim(ed_telefone.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo TELEFONE!');
    ed_telefone.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_fornecedores.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_fornecedores.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
