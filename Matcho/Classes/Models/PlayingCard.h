//
//  PlayingCard.h
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

extern NSString *const clubs;
extern NSString *const diamonds;
extern NSString *const hearts;
extern NSString *const spades;

-(instancetype) initWithSuit:(NSString *)suit andRank:(NSInteger)rank;

+ (NSArray *)suits;
+ (NSUInteger)maxRank;

@end
