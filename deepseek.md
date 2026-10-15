# Deepseek

## Deepseek environment variables

```sh
echo $DEEPSEEK_API_KEY
```

## Deepseek chat

[API][100]

[100]: https://api-docs.deepseek.com/

```
curl https://api.deepseek.com/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${DEEPSEEK_API_KEY}" \
  -d '{
        "model": "deepseek-chat",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": "Hello!"}
        ],
        "stream": false
      }' | jq -C .
```

## aichat

[aichat][200]

[200]: https://github.com/sigoden/aichat

To configure aichat create a file in ~/.config/aichat/config.yaml like

```yaml
model: deepseek:deepseek-chat
clients:
  - type: openai-compatible
    name: deepseek
    api_base: https://api.deepseek.com
    api_key: xxx
```

```yaml
model: openai:gpt-4o
clients:
  # See https://platform.openai.com/docs/quickstart
  - type: openai
    api_base: https://api.openai.com/v1               # Optional
    api_key: xxx
    # organization_id: org-xxx                          # Optional
```

## Links

[Deepseek models][200]

[200]: https://api-docs.deepseek.com/quick_start/pricing
