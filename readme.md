# url_encode_string

Bash, POSIX-compliant (I think) script to URL-encode a string.

That's it, that's all it does.

## Usage

```yaml
name: URL Encode String Example

on: [push]

jobs:
  encode:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2

      - name: URL Encode String
        id: encode
        uses: bwhitehead0/url_encode_string@v1
        with:
          string: "Hello World!"

      - name: Show Encoded String
        run: echo "Encoded string: ${{ steps.encode.outputs.encoded_string }}"
```

### Inputs

| Input  | Description          | Required | Default |
|--------|----------------------|----------|---------|
| string | The string to encode | true     | N/A     |

### Outputs

| Output         | Description                |
|----------------|----------------------------|
| encoded_string | The URL-encoded string     |

If this action were called with `id: encode`, one could use the resulting URL-encoded string as `${{ steps.encode.outputs.encoded_string }}`