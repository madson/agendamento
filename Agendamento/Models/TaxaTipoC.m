//
//  TaxaTipoC.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "TaxaTipoC.h"
#import "Transferencia.h"
#import "DataHelpers.h"

@implementation TaxaTipoC

/**
 C: Operações do tipo C tem uma taxa regressiva conforme a data de agendamento:
    maior que 30 dias da data de cadastro - 1.2%
    até 30 dias da data de cadastro - 2.1%
    até 25 dias da data de cadastro - 4.3%
    até 20 dias da data de cadastro - 5.4%
    até 15 dias da data de cadastro - 6.7%
    até 10 dias da data de cadastro - 7.4%
    até  5 dias da data de cadastro - 8.3%
 */

- (NSNumber *)taxaParaTransferencia:(Transferencia *)transferencia
{
    NSDate *dataCadastro = transferencia.dataCadastro;
    NSDate *dataAgendada = transferencia.dataAgendada;
    double valor = transferencia.valor.doubleValue;

    NSInteger dias = [DataHelpers diferencaDiasEntre:dataCadastro eData:dataAgendada];
    
    double fator;
    
    if (dias <= 5) {
        fator = 8.3;
    }
    else if (dias <= 10) {
        fator = 7.4;
    }
    else if (dias <= 15) {
        fator = 6.7;
    }
    else if (dias <= 20) {
        fator = 5.4;
    }
    else if (dias <= 25) {
        fator = 4.3;
    }
    else if (dias <= 30) {
        fator = 2.1;
    }
    else {
        fator = 1.2;
    }
    
    fator /= 100;

    return @(valor * fator);
}

@end
