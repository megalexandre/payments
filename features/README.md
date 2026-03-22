# Cucumber Integration Tests

Este projeto está configurado com o Cucumber para testes de integração. O Cucumber permite escrever testes em linguagem natural (Gherkin) que descrevem o comportamento da aplicação.

## Estrutura

- **features/**: Contém os arquivos .feature com os cenários de testes
- **features/step_definitions/**: Contém a implementação dos steps (passos) das features
- **features/support/**: Contém configurações e hooks do Cucumber
- **config/cucumber.yml**: Configuração dos perfis do Cucumber

## Como executar os testes

### Executar todos os testes
```bash
bundle exec cucumber
```

### Executar testes de um arquivo específico
```bash
bundle exec cucumber features/payments.feature
```

### Executar testes com tag específica
```bash
bundle exec cucumber --tags "@wip"
```

### Executar testes excluindo tags
```bash
bundle exec cucumber --tags "not @wip"
```

### Executar apenas testes que falharam (usando rerun)
```bash
bundle exec cucumber @rerun.txt
```

### Executar com diferentes formatos de saída
```bash
# Formato pretty (padrão)
bundle exec cucumber --format pretty

# Formato HTML
bundle exec cucumber --format html --out cucumber_report.html

# Formato progress (resumido)
bundle exec cucumber --format progress

# Múltiplos formatos
bundle exec cucumber --format pretty --format html --out report.html
```

## Sintaxe Gherkin

Os testes são escritos em Gherkin, que usa palavras-chave em inglês:

- **Feature**: Descreve a funcionalidade
- **Scenario**: Um caso de teste específico
- **Given**: Condição inicial (pré-requisitos)
- **When**: Ação realizada
- **Then**: Resultado esperado
- **And/But**: Continua a linha anterior

Exemplo:
```gherkin
Feature: Payments Management
  Scenario: Create a new payment
    Given I am on the new payment page
    When I fill in "Amount" with "150.00"
    And I click "Create Payment"
    Then I should see "Payment was successfully created"
```

## Tags

Use tags para organizar e selecionar testes:

```gherkin
@smoke @critical
Scenario: Critical payment creation
  ...

@wip
Scenario: Feature em desenvolvimento
  ...
```

## Dicas

1. **Escrever features legíveis**: Use linguagem clara e próxima do negócio
2. **Reutilizar steps**: Crie steps genéricos que possam ser usados em múltiplos cenários
3. **Background**: Use Background para setup comum entre cenários
4. **Hooks**: Configurar setup/teardown em features/support/hooks.rb
5. **Database Cleaner**: Já está configurado para limpar o banco entre testes

## Integração com CI/CD

Para integrar com pipelines CI/CD, use:

```bash
bundle exec cucumber --format json --out cucumber_report.json
```

Isso gera um relatório JSON que pode ser processado por ferramentas de CI/CD.
