# ActiveExpression/S [![Build Status][travis_b]][travis_url] [![Coverage Status][coveralls_b]][coveralls_url]


ActiveExpression/S is an implementation of [active expressions][original paper] for [Squeak/Smalltalk][Squeak].

*This README is **under construction**. Some sections might not correctly reflect the current state of the project.*

## Installation Instructions
[Check Travis][travis_url] to see whether your version of Squeak is supported. Make sure to have the latest [Metacello] installed. Then you can execute the following code to load the project and all its prerequisites:

```
Metacello new
  baseline: 'ActiveExpressions';
  repository: 'github://stlutz/active-expressions/active-expressions-squeak/src';
  load.
```

## Usage
An ActiveExpression requires an expression as its description of state. Expressions in this implementation are represented by block closures. Creating an active expression therefore only requires a block:

```smalltalk
aexp := ActiveExpression on: ["expression"]
```

The expression **should not contain any side effects**. <br>
Programmers can now register callbacks on the created active expression:

```smalltalk
aexp onChangeDo: ["callback"]
```

Whenever the active expression is updated/checked, the value of its expression at the previous update and the current value are compared. If the two values differ, all callbacks are invoked.

The comparison between the current value and the previous value is based on object identity. Value objects (like e.g. `Point` and `Rectangle`) have a tendency to change identity without being perceived by the programmer as having changed. These changes will be reacted upon by callbacks. The expression `'800@600'` for example will always invoke all callbacks upon updating.

### Update Methods
There are multiple types of active expressions that differ in how and when they update.

#### Manual
Update whenever the programmer manually causes an update.

```smalltalk
aMorph := Morph new.
aexp := ManualActiveExpression on: [aMorph position].
aexp onChangeDo: [Transcript show: aMorph position].
aMorph position: 100@100.
aexp update.
"'100@100' is written to the Transcript"
```

#### Synchronous
Update synchronously whenever the value of the monitored expression changes.

```smalltalk
aMorph := Morph new.
aexp := SynchronousActiveExpression on: [aMorph position].
aexp onChangeDo: [Transcript show: aMorph position].
aMorph position: 100@100. "~~> causes automatic update"
"'100@100' is written to the Transcript"
```

The implementation relies on [variable tracking][VarTra]. That means the expression is simulated to find all variables accessed during its evaluation. This method, however, has various limitations:
  - When listening and reacting to all variable assignments, it is possible to accidentally try to use an object in an undefined state (e.g. during an atomic operation with 2 variable assignments). This might either create an error (which will simply be ignored, aborting the update) or update successfully. In case of the latter, callbacks will be triggered and potentially lead to work being done with this currently corrupted state.
  - Changes to variables made through primitives are not intercepted. Most notably this prevents the monitoring of Collections, since any changes made to the collection's array will not be noticed. In theory it should be possible to fix this problem by intercepting all calls to `Object>>at:put:`.

Some code examples for the above-mentioned problems can be found in the class `AExpIssues` found in the `ActiveExpressions-Examples` package. ([Link][Issues])

#### Polling
Update whenever a fixed duration has passed.

```smalltalk
self notYetImplemented
```

### Quick Reference

| Method | Description |
| --- | --- |
| `ActiveExpression>>lastValue` | Returns the last recorded result of ActiveExpression's expression. |
| `ActiveExpression>>currentValue` | Returns the current result of ActiveExpression's expression without recording it (or updating in general). |
| `ActiveExpression>>update` | Checks whether the current result of ActiveExpression's expression differs from the previously recorded one. If it does, all calbacks are invoked. |
| `ActiveExpression>>dispose` | Undoes all changes the ActiveExpression has made to the system. Removes all callbacks. The ActiveExpression should not be used afterwards. |
| `ActiveExpression>>onChangeDo:` | Adds a callback to the ActiveExpression. Expects a BlockClosure with 0 to 2 arguments.  |
| `ActiveExpression>>disable` | Disables all callbacks. Updates will now still update to the current result but not invoke any callbacks. |
| `ActiveExpression>>enable` | (Re-)Enables all callbacks. Callbacks are enabled by default. |

#### Callbacks
Callbacks are block closures with up to 2 arguments. The optional arguments reference the new and the old value of the expression. Upon invocation of the callback these arguments are passed automatically into the callback as follows:

```smalltalk
["callback with 0 args"]
[:newValue | "callback with 1 arg"]
[:oldValue :newValue | "callback with 2 args"]
```

#### Syntactic Sugar
Active expressions can also be more easily created by directly passing `onChangeDo:` to a BlockClosure:

```smalltalk
aexp := ["expression"] onChangeDo: ["callback"].
```

Note though, that the resulting active expression will be of the default type defined in `ActiveExpression class>>defaultType`.

## Acknowledgements
The original and more complete implementation of active expressions in JavaScript which was referenced in the [original paper] can be found [here][JavaScript Implementation].


<!-- References -->
[travis_b]: https://travis-ci.org/active-expressions/active-expressions-squeak.svg?branch=master
[travis_url]: https://travis-ci.org/active-expressions/active-expressions-squeak
[coveralls_b]: https://coveralls.io/repos/github/active-expressions/active-expressions-squeak/badge.svg?branch=master
[coveralls_url]: https://coveralls.io/github/active-expressions/active-expressions-squeak?branch=master

[original paper]: http://programming-journal.org/2017/1/12/
[JavaScript Implementation]: https://github.com/active-expressions/active-expressions

[Squeak]: https://squeak.org
[Metacello]: https://github.com/Metacello/metacello
[VarTra]: https://github.com/stlutz/VarTra

[Issues]: ./src/ActiveExpressions-Examples.package/AExpIssues.class/
