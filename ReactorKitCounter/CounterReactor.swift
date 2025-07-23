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
        switch action {
        case .plusButtonTapped:
            return .just(.increaseCount)
        case .minusButtonTapped:
            return .just(.decreaseCount)
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case .increaseCount:
            newState.count += 1
        case .decreaseCount:
            newState.count -= 1
        }
        return newState
    }
}
