unit md_feriados;

interface

uses
  Classes, SysUtils, Data.DB, FireDAC.Stan.Param,
  IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompLabel, IWCompButton, IWHTMLControls,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWCompEdit, IWHTMLTag;

type
  TF_feriados = class(TIWAppForm)
    ed_data: TIWEdit;
    ed_id: TIWEdit;
    ed_buscar: TIWEdit;
    ed_descricao: TIWEdit;
    link_home: TIWLink;
    bt_incluir: TIWButton;
    bt_editar: TIWButton;
    bt_excluir: TIWButton;
    bt_ok: TIWButton;
    bt_cancelar: TIWButton;
    bt_buscar: TIWButton;
    bt_imprimir: TIWButton;
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
    template_feriados: TIWTemplateProcessorHTML;

    procedure IWAppFormShow(Sender: TObject);
    procedure template_feriadosUnknownTag(const AName: string; var VValue: string);

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
    procedure ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);

  public

  end;

implementation

{$R *.dfm}

uses
  ServerController, UserSessionUnit,
  md_login, md_principal, md_aptos, md_tabeladeprecos, md_fornecedores, md_produtos, md_vendas, md_lancamentos,
  md_usuarios;

procedure TF_feriados.IWAppFormShow(Sender: TObject);
begin
  Label_1.Caption := USRNAME;
  UpdateAll;
end;

procedure TF_feriados.template_feriadosUnknownTag(const AName: string;
  var VValue: string);
begin
  if AName = 'GRID_FERIADOS' then
  begin
    with UserSession do
    begin
      T_feriados.First;
      while not T_feriados.eof do
      begin
        VValue := VValue + '<tr>'+
        '<td>'+T_feriados.FieldByName('DATA').AsString+'</td>'+sLineBreak+
        '<td>'+T_feriados.FieldByName('DESCRICAO').AsString+'</td>'+sLineBreak+
        '<td>'+
        '<a href="#" class="buttom" onclick="return getItemId('+T_feriados.FieldByName('ID').AsString+', ''editar'')"><img src="icons/931.bmp" width="32" alt="EDITAR" title="EDITAR"></a> '+
        '<a href="#" class="buttom" onclick="return getItemId('+T_feriados.FieldByName('ID').AsString+', ''excluir'')"><img src="icons/938.bmp" width="32" alt="EXCLUIR" title="EXCLUIR"></a>'+
        '</td>'+sLineBreak+'</tr>';
        T_feriados.Next;
      end;
    end;
  end;
end;

procedure TF_feriados.m_painelClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_feriados.m_apartamentosClick(Sender: TObject);
begin
  TF_aptos.Create(WebApplication).Show;
end;

procedure TF_feriados.m_tabeladeprecosClick(Sender: TObject);
begin
  TF_tabeladeprecos.Create(WebApplication).Show;
end;

procedure TF_feriados.m_feriadosClick(Sender: TObject);
begin
{  TF_feriados.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_vendasClick(Sender: TObject);
begin
  TF_vendas.Create(WebApplication).Show;
end;

procedure TF_feriados.m_estoqueClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_feriados.m_produtosClick(Sender: TObject);
begin
  TF_produtos.Create(WebApplication).Show;
end;

procedure TF_feriados.m_fornecedoresClick(Sender: TObject);
begin
  TF_fornecedores.Create(WebApplication).Show;
end;

procedure TF_feriados.m_comprasClick(Sender: TObject);
begin
{  TF_compras.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_financeiroClick(Sender: TObject);
begin
{  separador de linha }
end;

procedure TF_feriados.m_planodecontasClick(Sender: TObject);
begin
{  TF_contas.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_contasapagarreceberClick(Sender: TObject);
begin
{  TF_contasapagarreceber.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_lancamentosClick(Sender: TObject);
begin
  TF_lancamentos.Create(WebApplication).Show;
end;

procedure TF_feriados.m_relatoriosClick(Sender: TObject);
begin
{ separador de linha }
end;

procedure TF_feriados.m_relatoriodeestoqueClick(Sender: TObject);
begin
{  TF_relatoriodeestoque.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_relatoriodevendasClick(Sender: TObject);
begin
{  TF_relatoriodevendas.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_relatoriofinanceiroClick(Sender: TObject);
begin
{  TF_relatoriofinanceiro.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_lavanderiaClick(Sender: TObject);
begin
{  TF_lavanderia.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_usuariosClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_feriados.m_suportetecnicoClick(Sender: TObject);
begin
{  TF_suportetecnico.Create(WebApplication).Show; }
end;

procedure TF_feriados.m_configuracoesClick(Sender: TObject);
begin
{  TF_configuracoes.Create(WebApplication).Show; }
end;

procedure TF_feriados.link_homeClick(Sender: TObject);
begin
  TF_principal.Create(WebApplication).Show;
end;

procedure TF_feriados.link_usuarioClick(Sender: TObject);
begin
  TF_usuarios.Create(WebApplication).Show;
end;

procedure TF_feriados.link_sairClick(Sender: TObject);
begin
  TF_login.Create(WebApplication).Show;
end;

{ ... }

procedure TF_feriados.ClearFields;
begin
  ed_data.Text := '';
  ed_descricao.Text := '';
end;

procedure TF_feriados.SyncFields;
begin
  with UserSession do
  begin
    T_feriados.FieldByName('DATA').Value := ed_data.Text;
    T_feriados.FieldByName('DESCRICAO').Value := ed_descricao.Text;
  end;
end;

procedure TF_feriados.UpdateAll;
begin
  with UserSession do
  begin
    T_feriados.Active := False;
    T_feriados.Active := True;
    T_feriados.SQL.Clear;
    T_feriados.SQL.Add('SELECT * FROM t_feriados ORDER BY DATA ASC ');
    T_feriados.Open();
  end;
end;

procedure TF_feriados.Search;
begin
  with UserSession do
  begin
    T_feriados.Close;
    T_feriados.Active := True;
    T_feriados.SQL.Clear;
    T_feriados.SQL.Add('SELECT * FROM t_feriados WHERE DESCRICAO LIKE :CHV ORDER BY DATA ASC ');
    T_feriados.ParamByName('CHV').Value := '%'+ed_buscar.Text+'%';
    T_feriados.Open();
		if T_feriados.IsEmpty then WebApplication.ShowMessage('Descrição não encontrados');
  end;
end;

procedure TF_feriados.ed_buscarHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  ATag.AddStringParam('placeholder','Descrição');
end;

{ ... }

procedure TF_feriados.bt_incluirAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  ClearFields;
  UserSession.T_feriados.Insert;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_feriados.bt_editarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  with UserSession do
  begin
    T_feriados.Locate('ID', ed_id.Text, []);
    T_feriados.Edit;
    ed_id.Text := T_feriados.FieldByName('ID').Value;
    ed_data.Text := T_feriados.FieldByName('DATA').Value;
    ed_descricao.Text := T_feriados.FieldByName('DESCRICAO').Value;
  end;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''show'');');
end;

procedure TF_feriados.bt_excluirClick(Sender: TObject);
begin
  with UserSession do
  begin
    T_feriados.Locate('ID', ed_id.Text, []);
    T_feriados.Delete;
  end;
  UpdateAll;
end;

procedure TF_feriados.bt_buscarClick(Sender: TObject);
begin
  Search;
end;

procedure TF_feriados.bt_okAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  if Trim(ed_data.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo DATA!');
    ed_data.SetFocus;
    exit;
  end;
  if Trim(ed_descricao.Text) = '' then
  begin
    WebApplication.ShowMessage('Favor preencher o campo DESCRIÇÃO!');
    ed_descricao.SetFocus;
    exit;
  end;
  SyncFields;
  UserSession.T_feriados.Post;
  ClearFields;
  UpdateAll;
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
  WebApplication.CallBackResponse.AddJavaScriptToExecute('location.reload()');
end;

procedure TF_feriados.bt_cancelarClick(Sender: TObject);
begin
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#EDITAR_DADOS'').modal(''hide'');');
end;

end.
