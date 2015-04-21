//
//  Calculador.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transferencia.h"

@interface Calculadora : NSObject

+ (NSNumber *)taxaParaTransferencia:(Transferencia *)transferencia;

@end
