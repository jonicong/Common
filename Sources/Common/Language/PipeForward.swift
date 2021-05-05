//REF :
//https://martinmitrevski.com/2018/02/16/forward-pipe-operator-in-swift/
//https://gist.github.com/kristopherjohnson/ed97acf0bbe0013df8af

precedencegroup ForwardPipe {
    associativity: left
    higherThan: LogicalConjunctionPrecedence
}

infix operator |> : ForwardPipe
infix operator |>! : ForwardPipe
infix operator |>& : ForwardPipe
infix operator |>* : ForwardPipe

// Pipe forward: transform "x |> f" to "f(x)" and "x |> f |> g |> h" to "h(g(f(x)))"
public func |> <T,U>(lhs: T, rhs: (T) -> U) -> U {
    return rhs(lhs)
}

// Unwrap the optional value on the left-hand side and apply the right-hand function
public func |>! <T,U>(lhs: T?, rhs: (T) -> U) -> U {
    return rhs(lhs!)
}

// If Optional value on left is nil, return nil; otherwise unwrap it and
// apply the right-hand function to it.
//
// (It would be nice if we could name this |>?, but the ? character
// is not allowed in custom operators.)
public func |>& <T,U>(lhs: T?, rhs: (T) -> U) -> U? {
    return lhs.map(rhs)
}

// Transform "x |>* (f, predicate)" to "f(x, predicate)"
public func |>* <A, B, C, T>(lhs: A, rhs: ((A, (B) -> C) -> T, (B) -> C)) -> T {
    return (rhs.0)(lhs, rhs.1)
}
