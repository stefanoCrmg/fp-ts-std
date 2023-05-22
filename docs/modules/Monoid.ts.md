---
title: Monoid.ts
nav_order: 20
parent: Modules
---

## Monoid overview

Utility functions to accommodate `fp-ts/Monoid`.

Added in v0.12.0

---

<h2 class="text-delta">Table of contents</h2>

- [2 Typeclass Methods](#2-typeclass-methods)
  - [memptyUnless](#memptyunless)
  - [memptyWhen](#memptywhen)
  - [toMonoid](#tomonoid)

---

# 2 Typeclass Methods

## memptyUnless

Conditionally returns the provided monoidal value or its identity. The dual
to `memptyWhen`. The lazy value is evaluated only if the condition passes.

**Signature**

```ts
export declare const memptyUnless: <A>(M: Monoid<A>) => (x: boolean) => (y: Lazy<A>) => A
```

```hs
memptyUnless :: Monoid a -> boolean -> Lazy a -> a
```

**Example**

```ts
import { constant } from 'fp-ts/function'
import { memptyUnless } from 'fp-ts-std/Monoid'
import * as O from 'fp-ts/Option'
import * as Str from 'fp-ts/string'

const f = memptyUnless(O.getMonoid(Str.Monoid))

assert.deepStrictEqual(f(true)(constant(O.some('x'))), O.some('x'))
assert.deepStrictEqual(f(true)(constant(O.none)), O.none)
assert.deepStrictEqual(f(false)(constant(O.some('x'))), O.none)
assert.deepStrictEqual(f(false)(constant(O.none)), O.none)
```

Added in v0.13.0

## memptyWhen

Conditionally returns the provided monoidal value or its identity. The dual
to `memptyUnless`. The lazy value is evaluated only if the condition passes.

**Signature**

```ts
export declare const memptyWhen: <A>(M: Monoid<A>) => (x: boolean) => (y: Lazy<A>) => A
```

```hs
memptyWhen :: Monoid a -> boolean -> Lazy a -> a
```

**Example**

```ts
import { constant } from 'fp-ts/function'
import { memptyWhen } from 'fp-ts-std/Monoid'
import * as O from 'fp-ts/Option'
import * as Str from 'fp-ts/string'

const f = memptyWhen(O.getMonoid(Str.Monoid))

assert.deepStrictEqual(f(true)(constant(O.some('x'))), O.none)
assert.deepStrictEqual(f(true)(constant(O.none)), O.none)
assert.deepStrictEqual(f(false)(constant(O.some('x'))), O.some('x'))
assert.deepStrictEqual(f(false)(constant(O.none)), O.none)
```

Added in v0.13.0

## toMonoid

Extracts the value from within a foldable, falling back to the monoidal
identity of said value.

**Signature**

```ts
export declare function toMonoid<F extends URIS4>(
  F: Foldable4<F>
): <A, S, R, E>(G: Monoid<A>) => (x: Kind4<F, S, R, E, A>) => A
export declare function toMonoid<F extends URIS3>(
  F: Foldable3<F>
): <A, R, E>(G: Monoid<A>) => (x: Kind3<F, R, E, A>) => A
export declare function toMonoid<F extends URIS3, E>(
  F: Foldable3C<F, E>
): <A, R>(G: Monoid<A>) => (x: Kind3<F, R, E, A>) => A
export declare function toMonoid<F extends URIS2>(F: Foldable2<F>): <A, E>(G: Monoid<A>) => (x: Kind2<F, E, A>) => A
export declare function toMonoid<F extends URIS2, E>(F: Foldable2C<F, E>): <A>(G: Monoid<A>) => (x: Kind2<F, E, A>) => A
export declare function toMonoid<F extends URIS>(F: Foldable1<F>): <A>(G: Monoid<A>) => (x: Kind<F, A>) => A
```

```hs
toMonoid :: f extends URIS4 => Foldable4 f -> Monoid a -> Kind4 f s r e a -> a
toMonoid :: f extends URIS3 => ((Foldable3 f) -> Monoid a -> Kind3 f r e a -> a)
toMonoid :: f extends URIS3 => ((Foldable3C f e) -> Monoid a -> Kind3 f r e a -> a)
toMonoid :: f extends URIS2 => ((Foldable2 f) -> Monoid a -> Kind2 f e a -> a)
toMonoid :: f extends URIS2 => ((Foldable2C f e) -> Monoid a -> Kind2 f e a -> a)
toMonoid :: f extends URIS => ((Foldable1 f) -> Monoid a -> Kind f a -> a)
```

**Example**

```ts
import { toMonoid } from 'fp-ts-std/Monoid'
import * as O from 'fp-ts/Option'
import * as Str from 'fp-ts/string'

const f = toMonoid(O.Foldable)(Str.Monoid)

assert.deepStrictEqual(f(O.some('x')), 'x')
assert.deepStrictEqual(f(O.none), '')
```

Added in v0.12.0
