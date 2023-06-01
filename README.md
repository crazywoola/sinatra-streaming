# sinatra-streaming

Sinatra & Ohm

## Setup

```
cp .env.example .env
cp ./config/database.yml.example ./config/database.yml
cp ./config/redis.yml.example ./config/redis.yml
```

## Use Docker

```
docker compose up --build
```

## Dev

```
bundle install
./bin/dev
```

Hot Reload using [rerun](https://sinatrarb.com/faq.html#reloading)
