//
//  GerenciadorTransferencias.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Transferencia;

@interface GerenciadorTransferencias : NSObject

+ (NSArray *)lista;
+ (void)adicionaTransferencia:(Transferencia *)transferencia;
+ (void)removeTransferencia:(Transferencia *)transferencia;
+ (Transferencia *)transferenciaPorIndice:(NSInteger)indice;

@end
