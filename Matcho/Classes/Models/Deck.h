//
//  Deck.h
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

@import Foundation;

#import "PlayingCard.h"
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (NSUInteger) getCountCards;

- (PlayingCard *)drawRandomCard;

@end
