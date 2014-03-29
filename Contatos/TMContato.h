//
//  TMContato.h
//  Contatos
//
//  Created by ios4311 on 26/03/14.
//  Copyright (c) 2014 thiagomelo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMContato : NSObject <NSCoding>

{
    NSString* _nome;
}

- (void) setNome : (NSString *) nome;

- (NSString *) nome;

@property (strong, atomic) NSString * nome;
@property (strong, atomic) NSString * telefone;
@property (strong, atomic) NSString * email;
@property (strong, atomic) NSString * endereco;
@property (strong, atomic) NSString * site;

@end
