---
title: ReadonlyRecord.ts
nav_order: 34
parent: Modules
---

## ReadonlyRecord overview

This module targets readonly objects in the sense of maps. For readonly
objects in the sense of product types see the `ReadonlyStruct` module.

Added in v0.10.0

---

<h2 class="text-delta">Table of contents</h2>

- [3 Functions](#3-functions)
  - [invertAll](#invertall)
  - [invertLast](#invertlast)
  - [lookupV](#lookupv)
  - [omit](#omit)
  - [pick](#pick)
  - [reject](#reject)
  - [values](#values)

---

# 3 Functions

## invertAll

Invert a record, collecting values with duplicate keys in an array. Should
you only care about the last item or are not worried about the risk of
duplicate keys, see instead `invertLast`.

**Signature**

```ts
export declare const invertAll: <A>(
  f: (x: A) => string
) => (x: Readonly<Record<string, A>>) => RR.ReadonlyRecord<string, ReadonlyArray<string>>
```

**Example**

```ts
import { invertAll } from 'fp-ts-std/ReadonlyRecord'
import { fromNumber } from 'fp-ts-std/String'

assert.deepStrictEqual(invertAll(fromNumber)({ a: 1, b: 2, c: 2, d: 3 }), { '1': ['a'], '2': ['b', 'c'], '3': ['d'] })
```

Added in v0.10.0

## invertLast

Invert a record, keeping only the last value should the same key be
encountered more than once. If you'd like to keep the values that would be
lost, see instead `invertAll`.

**Signature**

```ts
export declare const invertLast: <A>(
  f: (x: A) => string
) => (x: Readonly<Record<string, A>>) => RR.ReadonlyRecord<string, string>
```

**Example**

```ts
import { invertLast } from 'fp-ts-std/ReadonlyRecord'
import { fromNumber } from 'fp-ts-std/String'

assert.deepStrictEqual(invertLast(fromNumber)({ a: 1, b: 2, c: 2, d: 3 }), { '1': 'a', '2': 'c', '3': 'd' })
```

Added in v0.10.0

## lookupV

Like `fp-ts/ReadonlyRecord::lookup` but flipped, which the "V" suffix
denotes.

**Signature**

```ts
export declare const lookupV: <A>(x: Readonly<Record<string, A>>) => (k: string) => Option<A>
```

```hs
lookupV :: Readonly (Record string a) -> string -> Option a
```

**Example**

```ts
import { lookupV } from 'fp-ts-std/ReadonlyRecord'
import * as A from 'fp-ts/Array'

const x = { a: 1, b: 'two', c: [true] }
const ks = ['a', 'c']

assert.deepStrictEqual(A.filterMap(lookupV(x))(ks), [1, [true]])
```

Added in v0.10.0

## omit

Omit a set of keys from a `ReadonlyRecord`. The value-level equivalent of
the `Omit` type. For omitting from records with typed keys, instead look at
the `ReadonlyStruct` module.

**Signature**

```ts
export declare const omit: (ks: Array<string>) => <A>(y: Record<string, A>) => Record<string, A>
```

```hs
omit :: Array string -> Record string a -> Record string a
```

**Example**

```ts
import { omit } from 'fp-ts-std/ReadonlyRecord'
import { pipe } from 'fp-ts/function'

const remaining = pipe({ a: 1, b: 'two', c: [true] }, omit(['b']))

assert.deepStrictEqual(remaining, { a: 1, c: [true] })
```

Added in v0.16.0

## pick

Pick a set of keys from a `ReadonlyRecord`. The value-level equivalent of
the `Pick` type. For picking records with typed keys, instead look at the
`ReadonlyStruct` module.

**Signature**

```ts
export declare const pick: (
  ks: ReadonlyArray<string>
) => <A>(y: Readonly<Record<string, A>>) => Readonly<Record<string, A>>
```

```hs
pick :: ReadonlyArray string -> Readonly (Record string a) -> Readonly (Record string a)
```

**Example**

```ts
import { pick } from 'fp-ts-std/ReadonlyRecord'
import { pipe } from 'fp-ts/function'

const picked = pipe({ a: 1, b: 'two', c: [true] }, pick(['a', 'c']))

assert.deepStrictEqual(picked, { a: 1, c: [true] })
```

Added in v0.16.0

## reject

Filters out key/value pairs in the record for which the predicate upon the
value holds. This can be thought of as the inverse of ordinary record
filtering.

**Signature**

```ts
export declare const reject: <A>(
  f: Predicate<A>
) => <B extends A>(x: Readonly<Record<string, B>>) => Readonly<Record<string, B>>
```

```hs
reject :: b extends a => Predicate a -> Readonly (Record string b) -> Readonly (Record string b)
```

**Example**

```ts
import { reject } from 'fp-ts-std/ReadonlyRecord'
import { Predicate } from 'fp-ts/Predicate'

const isEven: Predicate<number> = (n) => n % 2 === 0

assert.deepStrictEqual(reject(isEven)({ a: 1, b: 2, c: 3, d: 4 }), { a: 1, c: 3 })
```

Added in v0.10.0

## values

Get the values from a `Record`.

**Signature**

```ts
export declare const values: <A>(x: Readonly<Record<string, A>>) => readonly A[]
```

```hs
values :: Readonly (Record string a) -> Array a
```

**Example**

```ts
import { values } from 'fp-ts-std/ReadonlyRecord'

const x = { a: 1, b: 'two' }

assert.deepStrictEqual(values(x), [1, 'two'])
```

Added in v0.10.0
