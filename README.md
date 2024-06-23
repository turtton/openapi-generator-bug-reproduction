# openapi-generator bug reproduction

This repository is a minimal environment for reproducing bugs encountered in openapi-generator(typescript-axios) 7.6.0

## Description

This problem occurs when oneOf is used to represent a tuple.

[`api.yaml`](./api.yaml)

```yaml
components:
  schemas:
    Id:
      type: integer
      format: int32
    CreatedAt:
      type: string
      format: date-time
    Cursor:
      oneOf:
        - $ref: '#/components/schemas/Id'
        - $ref: '#/components/schemas/CreatedAt'
```

[`generated76/api.ts`](./generated76/api.ts)
TypeDefinition

```ts
/**
 * @type Cursor
 * @export
 */
export type Cursor = number | string;
```

QueryProcess
```ts
if (cursor !== undefined) {
	for (const [key, value] of Object.entries(cursor)) { // Object.entries always returns empty array
		localVarQueryParameter[key] = value;
	}
}
```

This bug cursed since 7.1.0(see [`generated71/api.ts`](./generated71/api.ts))

7.0.0 generates
[`generated70/api.ts](./generated70/api.ts)

```ts
if (cursor !== undefined) {
	localVarQueryParameter['cursor'] = cursor;
}
```



