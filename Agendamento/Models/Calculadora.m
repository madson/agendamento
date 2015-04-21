//
//  Calculador.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "Calculadora.h"
#import "ProtocoloTaxa.h"
#import "TaxaTipoA.h"
#import "TaxaTipoB.h"
#import "TaxaTipoC.h"

@implementation Calculadora

+ (NSNumber *)taxaParaTransferencia:(Transferencia *)transferencia
{
    NSObject<ProtocoloTaxa> * calculadoraTaxa = nil;
    Tipo tipo = transferencia.tipo;
    double valor = transferencia.valor.doubleValue;

    if (tipo == TipoA) {
        calculadoraTaxa = [TaxaTipoA new];
    }
    else if (tipo == TipoB) {
        calculadoraTaxa = [TaxaTipoB new];
    }
    else if (tipo == TipoC) {
        calculadoraTaxa = [TaxaTipoC new];
    }
    else {
        
        if (valor <= 25000) {
            calculadoraTaxa = [TaxaTipoA new];
        }
        else if (valor >= 25001 && valor <= 120000) {
            calculadoraTaxa = [TaxaTipoB new];
        }
        else {
            calculadoraTaxa = [TaxaTipoC new];
        }
    }
    
    return [calculadoraTaxa taxaParaTransferencia:transferencia];
}

@end
