# README

Using replicate.com

## Configuration

Add your replicate api key as `replicate_api_key` in rails credentials (rails credentials:edit)

## Sample credentials

Edit the credentials using `rails credentials:edit`

```
secret_key_base: <secret_key_base>

replicate_api_key: <api_key>
webhook_host: <webhook_host>
```

The values are:

- `replicate_api_key` - your API key from Replicate.com
- `webhook_host` - the webhook callback URL that Replicate calls when processing is done. I use `https://subdomain.ngrok.app` in development
