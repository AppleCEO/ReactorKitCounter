//
//  CounterReactor.swift
//  ReactorKitCounter
//
//  Created by 도미닉 on 7/23/25.
//

import ReactorKit

final class CounterReactor: Reactor {
    enum Action {
        case plusButtonTapped
        case minusButtonTapped
    }
    
    enum Mutation {
        case increaseCount
        case decreaseCount
    }
    
    struct State {
        var count = 0
    }
    
    var initialState: State = State()
    
    func mutate(action: Action) -> Observable<Mutation> {
        
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        
    }
}
