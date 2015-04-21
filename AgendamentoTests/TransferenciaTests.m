//
//  TransferenciaTests.m
//  Agendamento
//
//  Created by Madson on 4/21/15.
//  Copyright (c) 2015 Madson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Transferencia.h"
#import "DataHelpers.h"

@interface TransferenciaTests : XCTestCase {
    Transferencia *t1;
}

@end

@implementation TransferenciaTests

- (void)setUp {
    [super setUp];
    
    t1 = Transferencia.new;
    t1.origem = @"00001-x";
    t1.destino = @"00002-x";
    t1.valor = @(100);
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_TipoTaxa {
    NSNumber *taxa = t1.taxa;
    XCTAssertTrue([taxa isKindOfClass:[NSNumber class]]);
}

- (void)test_TipoA {
    double valor = 500.00;
    double esperado = valor / 100 * 3 + 2; // 3% + $2

    t1.tipo = TipoA;
    t1.valor = @(valor);
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoB {
    double esperado = 10.00;
    
    t1.tipo = TipoB;
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoB_acima30dias {
    double esperado = 8.00;

    t1.tipo = TipoB;
    [t1 agendarPara:31];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}


- (void)test_TipoC_ate5dias {
    double esperado = 8.30;

    t1.tipo = TipoC;
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_ate10dias {
    double esperado = 7.40;

    t1.tipo = TipoC;
    [t1 agendarPara:10];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_ate15dias {
    double esperado = 6.70;

    t1.tipo = TipoC;
    [t1 agendarPara:15];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_ate20dias {
    double esperado = 5.40;

    t1.tipo = TipoC;
    [t1 agendarPara:20];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_ate25dias {
    double esperado = 4.30;
    
    t1.tipo = TipoC;
    [t1 agendarPara:25];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_ate30dias {
    double esperado = 2.10;
    
    t1.tipo = TipoC;
    [t1 agendarPara:30];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoC_acima30dias {
    double esperado = 1.20;
    
    t1.tipo = TipoC;
    [t1 agendarPara:90];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}


- (void)test_TipoD_range1 {
    double valor = 20000;
    double esperado = valor / 100 * 3 + 2;
    
    t1.tipo = TipoD;
    t1.valor = @(valor);
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoD_range2 {
    double valor = 25001;
    double esperado = 10; // + $10 ate 30 dias
    
    t1.tipo = TipoD;
    t1.valor = @(valor);
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoD_range2_acima30dias {
    double valor = 25001;
    double esperado = 8; // + $8 acima de 30 dias

    t1.tipo = TipoD;
    t1.valor = @(valor);
    [t1 agendarPara:31];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoD_range3 {
    double valor = 120001;
    double esperado = valor / 100 * 8.3; // 8.3%

    t1.tipo = TipoD;
    t1.valor = @(valor);
    NSNumber *taxa = t1.taxa;

    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

- (void)test_TipoD_range3_acima30dias {
    double valor = 120001;
    double esperado = valor / 100 * 1.2; // 1.2%
    
    t1.tipo = TipoD;
    t1.valor = @(valor);
    [t1 agendarPara:31];
    NSNumber *taxa = t1.taxa;
    
    XCTAssertEqualWithAccuracy([taxa doubleValue], [@(esperado) doubleValue], 0.009);
}

@end
