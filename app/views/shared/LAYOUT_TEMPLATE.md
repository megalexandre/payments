# Layout Template Base

Este é um template de layout moderno e responsivo para a aplicação, incluindo header, sidebar e sistema de mensagens.

## Estrutura

### Componentes Principais

#### 1. **Header** (`_header.html.erb`)
- Logo/Brand com toggle do sidebar
- Navegação central (opcional)
- Menu de usuário com dropdown

**Funcionalidades:**
- Menu dropdown para usuário
- Toggle do sidebar em dispositivos móveis
- Links de navegação responsivos

#### 2. **Sidebar** (`_sidebar.html.erb`)
- Menu de navegação lateral
- Estruturado em seções
- Links para diferentes módulos
- Versão da aplicação no rodapé

**Seções Incluídas:**
- Menu (Dashboard, Pagamentos)
- Administração (Usuários, Configurações)
- Ajuda (Documentação, Suporte)

#### 3. **Flash Messages** (`_flash_messages.html.erb`)
- Exibição de mensagens de sucesso
- Exibição de alertas de erro
- Botões para fechar mensagens
- Auto-desaparecimento após 5 segundos

#### 4. **Home/Dashboard** (`app/views/home/index.html.erb`)
- Página inicial com cards de estatísticas
- Grid responsivo
- Integração com dados de pagamentos

## Estilos

### Arquivo Principal: `app/assets/stylesheets/layout.css`

**Variáveis CSS:**
```css
--color-primary: #3b82f6         /* Azul principal */
--color-primary-dark: #1e40af    /* Azul escuro */
--color-success: #10b981         /* Verde */
--color-error: #ef4444           /* Vermelho */
--sidebar-width: 250px           /* Largura do sidebar */
--header-height: 60px            /* Altura do header */
```

### Classes Principais

**Layout:**
- `.app-layout` - Container principal
- `.app-container` - Container flex com sidebar + conteúdo
- `.header` - Header sticky
- `.sidebar` - Sidebar com navegação
- `.main-content` - Conteúdo principal com scroll
- `.content-wrapper` - Wrapper com padding

**Componentes:**
- `.btn` - Botão
- `.btn-primary` - Botão primário
- `.alert` - Alerta/mensagem
- `.card` - Card de conteúdo
- `.dropdown-menu` - Menu dropdown

## JavaScript

### Arquivo: `app/javascript/layout.js`

**Funcionalidades:**
- Toggle do sidebar em mobile
- Toggle do dropdown de usuário
- Destaque do menu ativo baseado na URL
- Auto-fechamento de alerts após 5 segundos
- Fechar menus ao clicar fora

## Responsividade

### Breakpoints

**Desktop (> 768px):**
- Sidebar sempre visível
- Layout 2-colunas (sidebar + conteúdo)
- Header com navegação central

**Tablet/Mobile (≤ 768px):**
- Sidebar hidden por padrão
- Toggle button aparece no header
- Sidebar desliza sobre o conteúdo (overlay)
- Navegação central hidden

**Mobile (≤ 480px):**
- Padding reduzido
- Alerts empilhados verticalmente
- Textos otimizados

## Como Usar

### Adicionar Links ao Sidebar

Edite `app/views/shared/_sidebar.html.erb`:

```erb
<div class="sidebar-section">
  <h3 class="sidebar-title">Novo Menu</h3>
  <ul class="nav-list">
    <li class="nav-item">
      <%= link_to "Link", path, class: "nav-link" %>
    </li>
  </ul>
</div>
```

### Exibir Mensagens Flash

No controller:
```ruby
redirect_to payments_path, notice: "Pagamento criado com sucesso"
redirect_to payments_path, alert: "Erro ao criar pagamento"
```

A mensagem será exibida automaticamente no topo da página.

### Customizar Cores

Edite as variáveis CSS em `app/assets/stylesheets/layout.css`:

```css
:root {
  --color-primary: #sua-cor;
  --color-success: #sua-cor;
  /* ... */
}
```

### Adicionar Novos Cards na Dashboard

Edite `app/views/home/index.html.erb` e adicione novo card:

```erb
<div class="card">
  <div class="card-header">
    <h3>Título</h3>
    <svg class="card-icon"><!-- seu ícone --></svg>
  </div>
  <div class="card-content">
    <p class="stat-number">42</p>
    <p class="stat-label">Descrição</p>
    <%= link_to "Ver →", path, class: "card-link" %>
  </div>
</div>
```

## Navegação Ativa

O menu item ativo é destacado automaticamente baseado na URL atual. A classe `.active` é adicionada aos links que correspondem à página atual.

## Acessibilidade

- Labels ARIA em botões
- Estrutura semântica HTML
- Contraste de cores adequado
- Navegação por teclado funcional

## Dark Mode (Opcional)

Para adicionar suporte a dark mode, adicione media query:

```css
@media (prefers-color-scheme: dark) {
  :root {
    --color-bg: #1f2937;
    --color-text: #ffffff;
    /* ... */
  }
}
```

## Performance

- CSS otimizado sem pré-processadores
- JavaScript vanilla sem dependências
- Carregamento crítico no head
- Scrollbar customizada
- Animações suaves com GPU acceleration

## Browser Support

- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Próximos Passos

1. ✅ Customizar cores e branding
2. ✅ Adicionar mais links ao menu
3. ✅ Implementar autenticação (logout no menu)
4. ✅ Adicionar submenu (opcional)
5. ✅ Dark mode (opcional)
