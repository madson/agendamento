# Agendamento

Sistema de agendamento de transferências financeiras.

## Requisitos

1) O usuário deve poder agendar uma transferência financeira com as seguintes 
   informações:
 
  - Conta de origem (padrão XXXXX-X)
  - Conta de destino  (padrão XXXXX-X)
  - Valor da transferência
  - Taxa (a ser calculada)
  - Data do agendamento
  - Tipo (A, B, C, D)
 
2) Cada tipo de transação segue uma regra diferente para cálculo da taxa
 
    A: Operações do tipo A tem uma taxa de $2 mais 3% do valor da transferência
 
    B: Operações do tipo B tem uma taxa de:
            $10 para pedidos com agendamento até 30 dias da data de cadastro 
            $8 para os demais
 
    C: Operações do tipo C tem uma taxa regressiva conforme a data de agendamento:
            maior que 30 dias da data de cadastro - 1.2%
            até 30 dias da data de cadastro - 2.1%
            até 25 dias da data de cadastro - 4.3%
            até 20 dias da data de cadastro - 5.4%
            até 15 dias da data de cadastro - 6.7%
            até 10 dias da data de cadastro - 7.4%
            até  5 dias da data de cadastro - 8.3%
 
    D: Operações do tipo D tem a taxa igual a A, B ou C dependendo do valor da transferência.
            Valores até $25.000 seguem a taxação tipo A
            Valores de $25.001 até $120.000 seguem a taxação tipo B
            Valores maiores que $120.000 seguem a taxação tipo C
 
 
3) O usuário deve poder ver todos os agendamentos cadastrados.
 
4) O usuário pode enviar as informações(Tipo de transferência, valor transferido, conta de origem, conta de destino) para a sua conta no twitter, usando a API REST
