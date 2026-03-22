# Layout & Template Documentation

## 📋 Visão Geral

Um template responsivo completamente funcional com:
- ✅ Header sticky com menu de usuário
- ✅ Sidebar navegação com menu colapsível em mobile
- ✅ Sistema de alertas/notificações
- ✅ Dashboard com cards de estatísticas
- ✅ Design moderno e acessível
- ✅ Totalmente responsivo (mobile, tablet, desktop)

## 📁 Estrutura de Arquivos

```
app/views/
├── layouts/
│   └── application.html.erb        # Layout principal
├── shared/
│   ├── _header.html.erb            # Header component
│   ├── _sidebar.html.erb           # Sidebar component
│   ├── _flash_messages.html.erb    # Alert messages
│   └── LAYOUT_TEMPLATE.md          # Documentação completa
├── home/
│   └── index.html.erb              # Dashboard página

app/assets/stylesheets/
├── application.css                 # Asset manifest
└── layout.css                       # Estilos principais (700+ linhas)

app/javascript/
├── application.js                  # JavaScript manifest
├── layout.js                        # Interatividade (sidebar, menus)
└── controllers/                     # Stimulus controllers

app/controllers/
└── home_controller.rb              # Home/Dashboard controller

config/
└── routes.rb                        # Rotas (root é a dashboard)
```

## 🎨 Design System

### Cores Principais
- **Primária**: #3b82f6 (Azul)
- **Sucesso**: #10b981 (Verde)
- **Erro**: #ef4444 (Vermelho)
- **Fundo**: #ffffff (Branco)
- **Fundo Secundário**: #f9fafb (Cinza claro)

### Variáveis CSS Disponíveis
Todas as cores, espaçamento e tamanhos são controlados por variáveis CSS em `:root` no arquivo `layout.css`. Fácil customizar!

### Componentes Reutilizáveis
```html
<!-- Alert -->
<div class="alert alert-success">Mensagem aqui</div>
<div class="alert alert-error">Erro aqui</div>

<!-- Button -->
<button class="btn btn-primary">Clica aqui</button>
<button class="btn btn-secondary">Secundário</button>

<!-- Card -->
<div class="card">
  <div class="card-header">Título</div>
  <div class="card-content">Conteúdo</div>
</div>
```

## 🎯 Como Usar

### 1. Adicionar Item ao Menu

Edite `app/views/shared/_sidebar.html.erb`:
```erb
<li class="nav-item">
  <%= link_to "Novo Item", new_item_path, class: "nav-link" %>
</li>
```

### 2. Exibir Notificações

No controller:
```ruby
redirect_to root_path, notice: "Sucesso!"
redirect_to root_path, alert: "Erro!"
```

### 3. Customizar Cores

No início de `app/assets/stylesheets/layout.css`:
```css
:root {
  --color-primary: #sua-cor;
  --color-success: #sua-cor;
  /* ... etc */
}
```

### 4. Adicionar Card na Dashboard

Edite `app/views/home/index.html.erb` e copie um card existente, ajustando:
- Título
- Ícone SVG
- Estatística
- Link

## 📱 Responsividade

| Dispositivo | Comportamento |
|-----------|--------------|
| Desktop (>768px) | Sidebar sempre visível |
| Tablet (768px) | Sidebar colapsível |
| Mobile (<480px) | Sidebar desliza sobre conteúdo |

Botão de toggle aparece automaticamente em telas menores.

## ⌨️ JavaScript Features

Arquivo:`app/javascript/layout.js`

- **Sidebar Toggle**: Clique no ícone hambúrguer
- **User Dropdown**: Clique no ícone de usuário
- **Active Link**: Destaca o menu atual
- **Auto-dismiss Alerts**: Desaparecem após 5 segundos
- **Click Outside**: Fecha menus ao clicar fora

## 🎯 Próximos Passos Sugeridos

1. **Branding**
   - [ ] Trocar logo no header
   - [ ] Ajustar cores primárias
   - [ ] Adicionar favicon

2. **Menu**
   - [ ] Adicionar mais items ao sidebar
   - [ ] Organizar por seções
   - [ ] Adicionar ícones SVG

3. **Autenticação**
   - [ ] Conectar com Devise ou similar
   - [ ] Mostrar nome do usuário
   - [ ] Implementar logout

4. **Dashboard**
   - [ ] Conectar dados reais
   - [ ] Adicionar gráficos
   - [ ] Criar relatórios

5. **Dark Mode (Opcional)**
   - [ ] Adicionar toggle no header
   - [ ] Criar theme system com Stimulus

## 📚 Documentação Completa

Para mais detalhes sobre cada componente, leia:
👉 `app/views/shared/LAYOUT_TEMPLATE.md`

## 🔗 Rotas Principais

```
GET  /              → Home/Dashboard
GET  /dashboard     → Dashboard (alias)
GET  /payments      → Listagem de Pagamentos
POST /payments      → Criar pagamento
GET  /payments/:id  → Detalhes do pagamento
```

## ✨ Características

- [x] Header com user menu dropdown
- [x] Sidebar com navegação
- [x] Responsive design
- [x] Flash messages automáticas
- [x] Dashboard com stats cards
- [x] Menu ativo destacado
- [x] Totalmente acessível
- [x] Sem dependências externas (CSS/JS vanilla)
- [x] Animações suaves
- [x] Tema de cores customizável

## 🚀 Performance

- CSS otimizado (~700 linhas)
- JavaScript vanilla sem jQuery
- Sem framework CSS (Bootstrap, Tailwind)
- Uso de CSS Grid e Flexbox
- Scrollbar customizada
- Carregamento rápido

Pronto para usar e customizar! 🎉
