---
title: Monad.ts
nav_order: 19
parent: Modules
---

## Monad overview

Utility functions to accommodate `fp-ts/Monad`.

Added in v0.15.0

---

<h2 class="text-delta">Table of contents</h2>

- [2 Typeclass Methods](#2-typeclass-methods)
  - [allPassM](#allpassm)
  - [andM](#andm)
  - [anyPassM](#anypassm)
  - [ifM](#ifm)
  - [nonePassM](#nonepassm)
  - [orM](#orm)
  - [unlessM](#unlessm)
  - [whenM](#whenm)

---

# 2 Typeclass Methods

## allPassM

Monadic `allPass`. Short-circuits.

**Signature**

```ts
export declare function allPassM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E, A>(f: Array<(x: A) => Kind4<M, S, R, E, boolean>>) => (x: A) => Kind4<M, S, R, E, boolean>
export declare function allPassM<M extends URIS3>(
  M: Monad3<M>
): <R, E, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function allPassM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function allPassM<M extends URIS2>(
  M: Monad2<M>
): <E, A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function allPassM<M extends URIS2, E>(
  M: Monad2C<M, E>
): <A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function allPassM<M extends URIS>(
  M: Monad1<M>
): <A>(f: Array<(x: A) => Kind<M, boolean>>) => (x: A) => Kind<M, boolean>
```

```hs
allPassM :: m extends URIS4 => Monad4 m -> Array (a -> (Kind4 m s r e boolean)) -> a -> Kind4 m s r e boolean
allPassM :: m extends URIS3 => ((Monad3 m) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
allPassM :: m extends URIS3 => ((Monad3C m e) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
allPassM :: m extends URIS2 => ((Monad2 m) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
allPassM :: m extends URIS2 => ((Monad2C m e) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
allPassM :: m extends URIS => ((Monad1 m) -> Array (a -> (Kind m boolean)) -> a -> Kind m boolean)
```

**Example**

```ts
import { constant } from 'fp-ts/function'
import { allPassM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = allPassM(IO.Monad)

assert.strictEqual(execute(f([constant(IO.of(true)), constant(IO.of(true))])('foo')), true)
assert.strictEqual(execute(f([constant(IO.of(true)), constant(IO.of(false))])('foo')), false)
```

Added in v0.15.0

## andM

Monadic &&. Short-circuits.

**Signature**

```ts
export declare function andM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E>(x: Kind4<M, S, R, E, boolean>) => (y: Kind4<M, S, R, E, boolean>) => Kind4<M, S, R, E, boolean>
export declare function andM<M extends URIS3>(
  M: Monad3<M>
): <R, E>(x: Kind3<M, R, E, boolean>) => (y: Kind3<M, R, E, boolean>) => Kind3<M, R, E, boolean>
export declare function andM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R>(x: Kind3<M, R, E, boolean>) => (y: Kind3<M, R, E, boolean>) => Kind3<M, R, E, boolean>
export declare function andM<M extends URIS2>(
  M: Monad2<M>
): <E>(x: Kind2<M, E, boolean>) => (y: Kind2<M, E, boolean>) => Kind2<M, E, boolean>
export declare function andM<M extends URIS2, E>(
  M: Monad2C<M, E>
): (x: Kind2<M, E, boolean>) => (y: Kind2<M, E, boolean>) => Kind2<M, E, boolean>
export declare function andM<M extends URIS>(
  M: Monad1<M>
): (x: Kind<M, boolean>) => (y: Kind<M, boolean>) => Kind<M, boolean>
```

```hs
andM :: m extends URIS4 => Monad4 m -> Kind4 m s r e boolean -> Kind4 m s r e boolean -> Kind4 m s r e boolean
andM :: m extends URIS3 => ((Monad3 m) -> Kind3 m r e boolean -> Kind3 m r e boolean -> Kind3 m r e boolean)
andM :: m extends URIS3 => ((Monad3C m e) -> Kind3 m r e boolean -> Kind3 m r e boolean -> Kind3 m r e boolean)
andM :: m extends URIS2 => ((Monad2 m) -> Kind2 m e boolean -> Kind2 m e boolean -> Kind2 m e boolean)
andM :: m extends URIS2 => ((Monad2C m e) -> Kind2 m e boolean -> Kind2 m e boolean -> Kind2 m e boolean)
andM :: m extends URIS => ((Monad1 m) -> Kind m boolean -> Kind m boolean -> Kind m boolean)
```

**Example**

```ts
import { andM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = andM(IO.Monad)(IO.of(true))

assert.strictEqual(execute(f(IO.of(true))), true)
assert.strictEqual(execute(f(IO.of(false))), false)
```

Added in v0.15.0

## anyPassM

Monadic `anyPass`. Short-circuits.

**Signature**

```ts
export declare function anyPassM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E, A>(f: Array<(x: A) => Kind4<M, S, R, E, boolean>>) => (x: A) => Kind4<M, S, R, E, boolean>
export declare function anyPassM<M extends URIS3>(
  M: Monad3<M>
): <R, E, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function anyPassM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function anyPassM<M extends URIS2>(
  M: Monad2<M>
): <E, A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function anyPassM<M extends URIS2, E>(
  M: Monad2C<M, E>
): <A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function anyPassM<M extends URIS>(
  M: Monad1<M>
): <A>(f: Array<(x: A) => Kind<M, boolean>>) => (x: A) => Kind<M, boolean>
```

```hs
anyPassM :: m extends URIS4 => Monad4 m -> Array (a -> (Kind4 m s r e boolean)) -> a -> Kind4 m s r e boolean
anyPassM :: m extends URIS3 => ((Monad3 m) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
anyPassM :: m extends URIS3 => ((Monad3C m e) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
anyPassM :: m extends URIS2 => ((Monad2 m) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
anyPassM :: m extends URIS2 => ((Monad2C m e) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
anyPassM :: m extends URIS => ((Monad1 m) -> Array (a -> (Kind m boolean)) -> a -> Kind m boolean)
```

**Example**

```ts
import { constant } from 'fp-ts/function'
import { anyPassM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = anyPassM(IO.Monad)

assert.strictEqual(execute(f([constant(IO.of(true)), constant(IO.of(false))])('foo')), true)
assert.strictEqual(execute(f([constant(IO.of(false)), constant(IO.of(false))])('foo')), false)
```

Added in v0.15.0

## ifM

Monadic if/then/else. Only executes the relevant action.

**Signature**

```ts
export declare function ifM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E>(
  p: Kind4<M, S, R, E, boolean>
) => <A>(x: Kind4<M, S, R, E, A>) => (y: Kind4<M, S, R, E, A>) => Kind4<M, S, R, E, A>
export declare function ifM<M extends URIS3>(
  M: Monad3<M>
): <R, E>(p: Kind3<M, R, E, boolean>) => <A>(x: Kind3<M, R, E, A>) => (y: Kind3<M, R, E, A>) => Kind3<M, R, E, A>
export declare function ifM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R>(p: Kind3<M, R, E, boolean>) => <A>(x: Kind3<M, R, E, A>) => (y: Kind3<M, R, E, A>) => Kind3<M, R, E, A>
export declare function ifM<M extends URIS2>(
  M: Monad2<M>
): <E>(p: Kind2<M, E, boolean>) => <A>(x: Kind2<M, E, A>) => (y: Kind2<M, E, A>) => Kind2<M, E, A>
export declare function ifM<M extends URIS2, E>(
  M: Monad2C<M, E>
): (p: Kind2<M, E, boolean>) => <A>(x: Kind2<M, E, A>) => (y: Kind2<M, E, A>) => Kind2<M, E, A>
export declare function ifM<M extends URIS>(
  M: Monad1<M>
): (p: Kind<M, boolean>) => <A>(x: Kind<M, A>) => (y: Kind<M, A>) => Kind<M, A>
```

```hs
ifM :: m extends URIS4 => Monad4 m -> Kind4 m s r e boolean -> Kind4 m s r e a -> Kind4 m s r e a -> Kind4 m s r e a
ifM :: m extends URIS3 => ((Monad3 m) -> Kind3 m r e boolean -> Kind3 m r e a -> Kind3 m r e a -> Kind3 m r e a)
ifM :: m extends URIS3 => ((Monad3C m e) -> Kind3 m r e boolean -> Kind3 m r e a -> Kind3 m r e a -> Kind3 m r e a)
ifM :: m extends URIS2 => ((Monad2 m) -> Kind2 m e boolean -> Kind2 m e a -> Kind2 m e a -> Kind2 m e a)
ifM :: m extends URIS2 => ((Monad2C m e) -> Kind2 m e boolean -> Kind2 m e a -> Kind2 m e a -> Kind2 m e a)
ifM :: m extends URIS => ((Monad1 m) -> Kind m boolean -> Kind m a -> Kind m a -> Kind m a)
```

**Example**

```ts
import { ifM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = ifM(IO.Monad)(IO.of(true))(IO.of('foo'))(IO.of('bar'))

assert.strictEqual(execute(f), 'foo')
```

Added in v0.15.0

## nonePassM

Monadic `nonePass`. Short-circuits.

**Signature**

```ts
export declare function nonePassM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E, A>(f: Array<(x: A) => Kind4<M, S, R, E, boolean>>) => (x: A) => Kind4<M, S, R, E, boolean>
export declare function nonePassM<M extends URIS3>(
  M: Monad3<M>
): <R, E, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function nonePassM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R, A>(f: Array<(x: A) => Kind3<M, R, E, boolean>>) => (x: A) => Kind3<M, R, E, boolean>
export declare function nonePassM<M extends URIS2>(
  M: Monad2<M>
): <E, A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function nonePassM<M extends URIS2, E>(
  M: Monad2C<M, E>
): <A>(f: Array<(x: A) => Kind2<M, E, boolean>>) => (x: A) => Kind2<M, E, boolean>
export declare function nonePassM<M extends URIS>(
  M: Monad1<M>
): <A>(f: Array<(x: A) => Kind<M, boolean>>) => (x: A) => Kind<M, boolean>
```

```hs
nonePassM :: m extends URIS4 => Monad4 m -> Array (a -> (Kind4 m s r e boolean)) -> a -> Kind4 m s r e boolean
nonePassM :: m extends URIS3 => ((Monad3 m) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
nonePassM :: m extends URIS3 => ((Monad3C m e) -> Array (a -> (Kind3 m r e boolean)) -> a -> Kind3 m r e boolean)
nonePassM :: m extends URIS2 => ((Monad2 m) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
nonePassM :: m extends URIS2 => ((Monad2C m e) -> Array (a -> (Kind2 m e boolean)) -> a -> Kind2 m e boolean)
nonePassM :: m extends URIS => ((Monad1 m) -> Array (a -> (Kind m boolean)) -> a -> Kind m boolean)
```

**Example**

```ts
import { constant } from 'fp-ts/function'
import { nonePassM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = nonePassM(IO.Monad)

assert.strictEqual(execute(f([constant(IO.of(false)), constant(IO.of(false))])('foo')), true)
assert.strictEqual(execute(f([constant(IO.of(false)), constant(IO.of(true))])('foo')), false)
```

Added in v0.15.0

## orM

Monadic ||. Short-circuits.

**Signature**

```ts
export declare function orM<M extends URIS4>(
  M: Monad4<M>
): <S, R, E>(x: Kind4<M, S, R, E, boolean>) => (y: Kind4<M, S, R, E, boolean>) => Kind4<M, S, R, E, boolean>
export declare function orM<M extends URIS3>(
  M: Monad3<M>
): <R, E>(x: Kind3<M, R, E, boolean>) => (y: Kind3<M, R, E, boolean>) => Kind3<M, R, E, boolean>
export declare function orM<M extends URIS3, E>(
  M: Monad3C<M, E>
): <R>(x: Kind3<M, R, E, boolean>) => (y: Kind3<M, R, E, boolean>) => Kind3<M, R, E, boolean>
export declare function orM<M extends URIS2>(
  M: Monad2<M>
): <E>(x: Kind2<M, E, boolean>) => (y: Kind2<M, E, boolean>) => Kind2<M, E, boolean>
export declare function orM<M extends URIS2, E>(
  M: Monad2C<M, E>
): (x: Kind2<M, E, boolean>) => (y: Kind2<M, E, boolean>) => Kind2<M, E, boolean>
export declare function orM<M extends URIS>(
  M: Monad1<M>
): (x: Kind<M, boolean>) => (y: Kind<M, boolean>) => Kind<M, boolean>
```

```hs
orM :: m extends URIS4 => Monad4 m -> Kind4 m s r e boolean -> Kind4 m s r e boolean -> Kind4 m s r e boolean
orM :: m extends URIS3 => ((Monad3 m) -> Kind3 m r e boolean -> Kind3 m r e boolean -> Kind3 m r e boolean)
orM :: m extends URIS3 => ((Monad3C m e) -> Kind3 m r e boolean -> Kind3 m r e boolean -> Kind3 m r e boolean)
orM :: m extends URIS2 => ((Monad2 m) -> Kind2 m e boolean -> Kind2 m e boolean -> Kind2 m e boolean)
orM :: m extends URIS2 => ((Monad2C m e) -> Kind2 m e boolean -> Kind2 m e boolean -> Kind2 m e boolean)
orM :: m extends URIS => ((Monad1 m) -> Kind m boolean -> Kind m boolean -> Kind m boolean)
```

**Example**

```ts
import { orM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import { execute } from 'fp-ts-std/IO'

const f = orM(IO.Monad)(IO.of(false))

assert.strictEqual(execute(f(IO.of(true))), true)
assert.strictEqual(execute(f(IO.of(false))), false)
```

Added in v0.15.0

## unlessM

The reverse of `whenM`.

**Signature**

```ts
export declare function unlessM<F extends URIS4>(
  M: Monad4<F>
): <S, R, E>(b: Kind4<F, S, R, E, boolean>) => (x: Kind4<F, S, R, E, void>) => Kind4<F, S, R, E, void>
export declare function unlessM<F extends URIS3>(
  M: Monad3<F>
): <R, E>(b: Kind3<F, R, E, boolean>) => (x: Kind3<F, R, E, void>) => Kind3<F, R, E, void>
export declare function unlessM<F extends URIS3, E>(
  M: Monad3C<F, E>
): <R>(b: Kind3<F, R, E, boolean>) => (x: Kind3<F, R, E, void>) => Kind3<F, R, E, void>
export declare function unlessM<F extends URIS2>(
  M: Monad2<F>
): <E>(b: Kind2<F, E, boolean>) => (x: Kind2<F, E, void>) => Kind2<F, E, void>
export declare function unlessM<F extends URIS2, E>(
  M: Monad2C<F, E>
): (b: Kind2<F, E, boolean>) => (x: Kind2<F, E, void>) => Kind2<F, E, void>
export declare function unlessM<F extends URIS>(
  M: Monad1<F>
): (b: Kind<F, boolean>) => (x: Kind<F, void>) => Kind<F, void>
```

```hs
unlessM :: f extends URIS4 => Monad4 f -> Kind4 f s r e boolean -> Kind4 f s r e void -> Kind4 f s r e void
unlessM :: f extends URIS3 => ((Monad3 f) -> Kind3 f r e boolean -> Kind3 f r e void -> Kind3 f r e void)
unlessM :: f extends URIS3 => ((Monad3C f e) -> Kind3 f r e boolean -> Kind3 f r e void -> Kind3 f r e void)
unlessM :: f extends URIS2 => ((Monad2 f) -> Kind2 f e boolean -> Kind2 f e void -> Kind2 f e void)
unlessM :: f extends URIS2 => ((Monad2C f e) -> Kind2 f e boolean -> Kind2 f e void -> Kind2 f e void)
unlessM :: f extends URIS => ((Monad1 f) -> Kind f boolean -> Kind f void -> Kind f void)
```

**Example**

```ts
import { pipe } from 'fp-ts/function'
import { unlessM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import * as IOE from 'fp-ts/IOEither'
import { log } from 'fp-ts/Console'

const isValid =
  (n: number): IO.IO<boolean> =>
  () =>
    Date.now() === 42

pipe(
  IOE.of(123),
  IOE.chainFirstIOK((n) => unlessM(IO.Monad)(isValid(n))(log(n)))
)
```

Added in v0.16.0

## whenM

Like applicative `when`, but the condition is monadic.

**Signature**

```ts
export declare function whenM<F extends URIS4>(
  M: Monad4<F>
): <S, R, E>(b: Kind4<F, S, R, E, boolean>) => (x: Kind4<F, S, R, E, void>) => Kind4<F, S, R, E, void>
export declare function whenM<F extends URIS3>(
  M: Monad3<F>
): <R, E>(b: Kind3<F, R, E, boolean>) => (x: Kind3<F, R, E, void>) => Kind3<F, R, E, void>
export declare function whenM<F extends URIS3, E>(
  M: Monad3C<F, E>
): <R>(b: Kind3<F, R, E, boolean>) => (x: Kind3<F, R, E, void>) => Kind3<F, R, E, void>
export declare function whenM<F extends URIS2>(
  M: Monad2<F>
): <E>(b: Kind2<F, E, boolean>) => (x: Kind2<F, E, void>) => Kind2<F, E, void>
export declare function whenM<F extends URIS2, E>(
  M: Monad2C<F, E>
): (b: Kind2<F, E, boolean>) => (x: Kind2<F, E, void>) => Kind2<F, E, void>
export declare function whenM<F extends URIS>(
  M: Monad1<F>
): (b: Kind<F, boolean>) => (x: Kind<F, void>) => Kind<F, void>
```

```hs
whenM :: f extends URIS4 => Monad4 f -> Kind4 f s r e boolean -> Kind4 f s r e void -> Kind4 f s r e void
whenM :: f extends URIS3 => ((Monad3 f) -> Kind3 f r e boolean -> Kind3 f r e void -> Kind3 f r e void)
whenM :: f extends URIS3 => ((Monad3C f e) -> Kind3 f r e boolean -> Kind3 f r e void -> Kind3 f r e void)
whenM :: f extends URIS2 => ((Monad2 f) -> Kind2 f e boolean -> Kind2 f e void -> Kind2 f e void)
whenM :: f extends URIS2 => ((Monad2C f e) -> Kind2 f e boolean -> Kind2 f e void -> Kind2 f e void)
whenM :: f extends URIS => ((Monad1 f) -> Kind f boolean -> Kind f void -> Kind f void)
```

**Example**

```ts
import { pipe } from 'fp-ts/function'
import { whenM } from 'fp-ts-std/Monad'
import * as IO from 'fp-ts/IO'
import * as IOE from 'fp-ts/IOEither'
import { log } from 'fp-ts/Console'

const isInvalid =
  (n: number): IO.IO<boolean> =>
  () =>
    Date.now() !== 42

pipe(
  IOE.of(123),
  IOE.chainFirstIOK((n) => whenM(IO.Monad)(isInvalid(n))(log(n)))
)
```

Added in v0.16.0
