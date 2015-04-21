//
//  Transferencia.h
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Tipo) {
    TipoA,
    TipoB,
    TipoC,
    TipoD
};

@interface Transferencia : NSObject

@property (nonatomic, assign) Tipo tipo;
@property (nonatomic, strong) NSString *origem;
@property (nonatomic, strong) NSString *destino;
@property (nonatomic, strong) NSNumber *valor;
@property (nonatomic, strong) NSDate *dataAgendada;
@property (nonatomic, strong, readonly) NSNumber *taxa;
@property (nonatomic, strong, readonly) NSDate *dataCadastro;

/**
 Altera a dataAgendada adicionando numero de dias a partir da data atual
 
 @param dias    Quantidade de dias a ser adicionado na data do agendamento
 */
- (void)agendarPara:(NSInteger)dias;

@end
