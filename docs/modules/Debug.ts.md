---
title: Debug.ts
nav_order: 7
parent: Modules
---

## Debug overview

Helpers for debugging applications during development. These should be
assumed to be unsafe and shouldn't make their way into production code.

Added in v0.2.0

---

<h2 class="text-delta">Table of contents</h2>

- [3 Functions](#3-functions)
  - [trace](#trace)
  - [traceShowWithValue](#traceshowwithvalue)
  - [traceWithValue](#tracewithvalue)

---

# 3 Functions

## trace

Log the provided string to the console and immediately return the generic
argument. This is useful in the middle of `pipe`/`flow` chains.

The trace function should only be used for debugging. The function is not
referentially transparent: its type indicates that it is a pure function but
it has the side effect of outputting the trace message.

**Signature**

```ts
export declare const trace: (msg: string) => <A>(x: A) => A
```

```hs
trace :: string -> a -> a
```

**Example**

```ts
import { trace } from 'fp-ts-std/Debug'
import { flow } from 'fp-ts/function'

const double = (n: number): number => n * 2
const toString = (n: number): string => String(n)

// Will log: "my log message"
const doubledString: (n: number) => string = flow(double, trace('my log message'), toString)

// Actual function/pipeline behaviour is unaffected:
assert.strictEqual(doubledString(2), '4')
```

Added in v0.2.0

## traceShowWithValue

Like `traceWithValue`, but first processes the value via `Show`.

**Signature**

```ts
export declare const traceShowWithValue: <A>(S: Show<A>) => (msg: string) => (x: A) => A
```

```hs
traceShowWithValue :: Show a -> string -> a -> a
```

**Example**

```ts
import { traceShowWithValue } from 'fp-ts-std/Debug'
import { flow } from 'fp-ts/function'
import * as Num from 'fp-ts/number'

const double = (n: number): number => n * 2
const toString = (n: number): string => String(n)

// Will log: "my log message: <Shown value>"
const doubledString: (n: number) => string = flow(double, traceShowWithValue(Num.Show)('my log message: '), toString)

// Actual function/pipeline behaviour is unaffected:
assert.strictEqual(doubledString(2), '4')
```

Added in v0.16.0

## traceWithValue

Like `trace`, but logs the generic value too.

**Signature**

```ts
export declare const traceWithValue: (msg: string) => <A>(x: A) => A
```

```hs
traceWithValue :: string -> a -> a
```

**Example**

```ts
import { traceWithValue } from 'fp-ts-std/Debug'
import { flow } from 'fp-ts/function'

const double = (n: number): number => n * 2
const toString = (n: number): string => String(n)

// Will log: "my log message: <value>"
const doubledString: (n: number) => string = flow(double, traceWithValue('my log message: '), toString)

// Actual function/pipeline behaviour is unaffected:
assert.strictEqual(doubledString(2), '4')
```

Added in v0.2.0
