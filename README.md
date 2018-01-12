# Squeak Active Expressions [![Build Status][travis_b]][travis_url] [![Coverage Status][coveralls_b]][coveralls_url]

Squeak-ActiveExpressions aims to offer a Squeak implementation of [Active Expressions] - a simple state-based reactive concept.

The first implementation of Active Expressions was in [JavaScript][JavaScript Implementation].

## Installation Instructions

ActiveExpressions are compatible with Squeak-5.1 and Squeak-trunk (check Travis for more information). First install the latest [Metacello], then you can use the following code to load ActiveExpressions and all their prerequisites:

```
Metacello new
  baseline: 'ActiveExpressions';
  repository: 'github://stlutz/Squeak-ActiveExpressions/src';
  load.
```

## History

This project was started as part of the [Software Architecture Group]'s seminar «Programming Languages: Design and Implementation» held at the [Hasso-Plattner Institute][HPI].

[travis_b]: https://travis-ci.org/stlutz/Squeak-ActiveExpressions.svg?branch=master
[travis_url]: https://travis-ci.org/stlutz/Squeak-ActiveExpressions
[coveralls_b]: https://coveralls.io/repos/github/stlutz/Squeak-ActiveExpressions/badge.svg?branch=master
[coveralls_url]: https://coveralls.io/github/stlutz/Squeak-ActiveExpressions?branch=master

[Active Expressions]: http://programming-journal.org/2017/1/12/
[JavaScript Implementation]: https://github.com/active-expressions/active-expressions
[Metacello]: https://github.com/Metacello/metacello

[Software Architecture Group]: https://www.hpi.uni-potsdam.de/swa
[HPI]: https://hpi.de
