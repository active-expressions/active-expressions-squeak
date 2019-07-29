# ActiveExpression/S [![Build Status][travis_b]][travis_url] [![Coverage Status][coveralls_b]][coveralls_url]

ActiveExpression/S aims to offer an implementation of [Active Expressions] in [Squeak/Smalltalk][Squeak].

## Installation Instructions

ActiveExpression/S is compatible with Squeak-5.2 and Squeak-trunk (check Travis for more information). First install the latest [Metacello], then you can use the following code to load ActiveExpression/S and all its prerequisites:

```
Metacello new
  baseline: 'ActiveExpressions';
  repository: 'github://stlutz/Squeak-ActiveExpressions/src';
  load.
```

## Usage

An ActiveExpression requires an expression as its description of state. Expressions in this implementation are represented by BlockClosures. Creating an ActiveExpression therefore only requires a block:
```smalltalk
aexp := ActiveExpression monitoring: ["expression"]
```
(Please note that an ActiveExpression's expression should not contain any side effects.) <br>
Programmers can now subscribe callbacks to the created ActiveExpression:
```smalltalk
aexp onChangeDo: ["callback"]
```
Whenever the ActiveExpression is updated/checked, the value of its expression at the previous update and the current value are compared. If the two values differ, all callbacks are invoked. There are different methods for when to update:

#### Convention
Update whenever the programmer manually causes an update through `ActiveExpression>>update`.
```smalltalk
aMorph := Morph new.
aexp := ActiveExpression monitoring: [aMorph position].
aexp onChangeDo: [Transcript show: aMorph position].
aMorph position: 100@100.
aexp update.
"'100@100' is written to the Transcript"
```

#### Monitoring Variables
Update whenever a variable (instance, temporary, global, class) is changed. <br>
(NOTE: Currently only changes to instance variables made through assignments can be caught and acted upon.)
```smalltalk
aMorph := Morph new.
aexp := MonitoringActiveExpression monitoring: [aMorph position].
aexp onChangeDo: [Transcript show: aMorph position].
aMorph position: 100@100. "~~> causes automatic update"
"'100@100' is written to the Transcript"
```

#### Polling
Update whenever a fixed duration has passed.
```smalltalk
This is not yet implemented.
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
Callbacks are BlockClosures with up to 2 arguments. The optional arguments reference the new and the old value of the ActiveExpression's expression. Upon invocation of the callback these arguments are passed automatically into the callback as follows:
```smalltalk
["callback with 0 args"]
[:newValue | "callback with 1 arg"]
[:oldValue :newValue | "callback with 2 args"]
```

#### Syntactic Sugar
ActiveExpressions can also be more easily created by directly passing `onChangeDo:` to a BlockClosure:
```smalltalk
aexp := ["expression"] onChangeDo: ["callback"].
```
Note though, that the resulting ActiveExpression will be of the class `ActiveExpression` and therefore will have to be update manually.

## Issues
At the moment there are several problems with this implementation of ActiveExpressions. Most of them come with the very invasive nature of the "monitoring variables" approach of detecting changes:
- When listening and reacting to all variable assignments, it is possible to accidentally try to use an object in an undefined state (e.g. during an atomic operation with 2 variable assignments). This might either create an error (which will simply be ignored, aborting the update) or update successfully. In case of the latter, callbacks will be triggered and potentially lead to work being done with this currently corrupted state.
- When updating an ActiveExpression, the comparison between the current value and the previous value is based on object identity. Value objects (like e.g. `Point` and `Rectangle`) have a tendency to change identity without being perceived by the programmer as having changed. These changes might be reacted upon by ActiveExpressions. The following expression for example will always invoke all callbacks upon updating: `ActiveExpression monitoring: [1@1]`.
- When trying to monitor all relevant instance variable assignments throughout the system, the methods in which these assignments occur are recompiled to contain intercepting code. While all following message sends might invoke these new methods, already invoked methods are not changed. This is not a conceptual problem, since it could be possible to rewrite all contexts referencing the old method to update to the rewritten ones.
- Changes to instance variables made through primitives cannot be intercepted unless it is known which primitives influence which variables. Most notably this prevents the monitoring of Collections, since any changes made to the collection's array will not be noticed. In theory it should be possible to fix this problem with collections by intercepting all calls to `Object>>at:put:`.

Some code examples for the above-mentioned problems can be found in the class `AExpIssues` found in the `ActiveExpressions-Examples` package. ([Link][Issues])

## History

This project was started as part of the [Software Architecture Group]'s seminar «Programming Languages: Design and Implementation» held at the [Hasso-Plattner Institute][HPI].

A more complete implementation of Active Expressions in JavaScript which is also referenced in the [original paper][Active Expressions] can be found [here][JavaScript Implementation].


<!-- References -->
[travis_b]: https://travis-ci.org/stlutz/Squeak-ActiveExpressions.svg?branch=master
[travis_url]: https://travis-ci.org/stlutz/Squeak-ActiveExpressions
[coveralls_b]: https://coveralls.io/repos/github/stlutz/Squeak-ActiveExpressions/badge.svg?branch=master
[coveralls_url]: https://coveralls.io/github/stlutz/Squeak-ActiveExpressions?branch=master

[Active Expressions]: http://programming-journal.org/2017/1/12/
[JavaScript Implementation]: https://github.com/active-expressions/active-expressions

[Squeak]: https://squeak.org
[Metacello]: https://github.com/Metacello/metacello

[Issues]: https://github.com/stlutz/Squeak-ActiveExpressions/tree/master/src/ActiveExpressions-Examples.package/AExpIssues.class

[Software Architecture Group]: https://www.hpi.uni-potsdam.de/swa
[HPI]: https://hpi.de
