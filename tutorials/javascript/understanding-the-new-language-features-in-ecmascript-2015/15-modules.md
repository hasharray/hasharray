---
layout: page
title: Modules
---

Modules provide declarative syntax for module patterns, this syntax feels a lot
like CommonJS modules, but it has some minor semantic differences.

Primarily it handles default exports a little differently. In CommonJS the
default export is the actual export object itself, where-as with ECMAScript
6 modules the default export is just another named export that is supported by
syntax.

```javascript
export function isEqual(a, b) {
return a == b;
}

export default function assert(expression) {
return expression == true;
}
```

Named exports are imported via `{ exportName }`

```javascript
import { isEqual } from './assert';
```

The default export can be imported just by specifying any identifier

```javascript
import { isEqual } from './assert';
```

Since the default export is a named export, one could import it that way too.

```javascript
import { default } from './assert';
```

Imports may also be aliased

```javascript
import { isEqual as checkEqual } from './assert';
```

Wilcard imports are also available

```javascript
import * as assert from './assert';
```

Which are mirrored by wildcard exports

```javascript
export * from './assert';
```

