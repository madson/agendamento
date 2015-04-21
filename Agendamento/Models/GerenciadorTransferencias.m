//
//  GerenciadorTransferencias.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import "GerenciadorTransferencias.h"

@interface GerenciadorTransferencias ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation GerenciadorTransferencias

/**
 Retorna uma instancia singleton do objeto
 */
+ (instancetype)sharedInstance
{
    static GerenciadorTransferencias *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
        
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Helpers de dados

+ (NSArray *)lista
{
    return [[self sharedInstance] lista];
}

+ (void)adicionaTransferencia:(Transferencia *)transferencia
{
    [[self sharedInstance] adicionaTransferencia:transferencia];
}

+ (void)removeTransferencia:(Transferencia *)transferencia
{
    [[self sharedInstance] removeTransferencia:transferencia];
}

+ (Transferencia *)transferenciaPorIndice:(NSInteger)indice
{
    return [[self sharedInstance] transferenciaPorIndice:indice];
}

- (NSArray *)lista
{
    return _items;
}

- (void)adicionaTransferencia:(Transferencia *)transferencia
{
    [_items addObject:transferencia];
}

- (void)removeTransferencia:(Transferencia *)transferencia
{
    [_items removeObjectIdenticalTo:transferencia];
}

- (Transferencia *)transferenciaPorIndice:(NSInteger)indice
{
    if (indice < _items.count) {
        return [_items objectAtIndex:indice];
    }
    
    return nil;
}

@end
