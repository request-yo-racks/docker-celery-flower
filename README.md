# docker-celery-flower
RYR Docker image for Flower (A Real-time Celery web-monitor)

## Usage

Using the default broker:
```bash
docker run -it --rm -p 5555:5555 requestyoracks/celery-flower:0.9.2
```

Using a specific broker:
```bash
docker run -it --rm -e "FLOWER_BROKER_URL=redis://192.168.99.100:30558/0" -p 5555:5555  requestyoracks/celery-flower:0.9.2
```

## Advanced configuration

Configuration settings can be defined using environment variables. The full list of options can be found here: https://flower.readthedocs.io/en/stable/config.html.

Prefix the Flower options by `FLOWER_` and the Celery ones by `CELERY` in order to use them.

For instance:
* `--basic_auth=user:password` becomes `FLOWER_BASIC_AUTH=user:password`.
* `--broker=redis://guest:guest@localhost:6379/0` becomes `CELERY_BROKER_URL=redis://guest:guest@localhost:6379/0`
