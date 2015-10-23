//
//  Deck.m
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	return _cards;
}


- (void)addCard:(Card *)card {
	[self addCard:card atTop:NO];
}

- (NSUInteger) getCountCards {
    
    return self.cards.count;
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop {
	if (atTop) {
		[self.cards insertObject:card atIndex:0];
	} else {
		[self.cards addObject:card];
	}
}

- (Card *)drawRandomCard {
    if (![self.cards count]) {
        
        return nil;
    }
    
        int randomCardIndex = arc4random() % [self.cards count];
        randomCardIndex = randomCardIndex == 0 ? randomCardIndex : randomCardIndex - 1;
        Card *returnedCard = nil;
        
        if (randomCardIndex <= self.cards.count) {
            returnedCard = self.cards[randomCardIndex];
            [self.cards removeObjectAtIndex:randomCardIndex];
        }
        
        NSLog(@"cards left %li", self.cards.count);
        
        return returnedCard;
}

@end
